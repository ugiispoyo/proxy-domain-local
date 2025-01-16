#!/bin/bash

# Validasi argumen
if [ "$#" -ne 3 ]; then
    echo "Usage: $0"
    exit 1
fi

SOURCE=$1
TO=$3

# 1. Tambahkan domain ke /etc/hosts
echo "Menambahkan $TO ke /etc/hosts..."
if ! grep -q "$TO" /etc/hosts; then
    echo "127.0.0.1 $TO" | sudo tee -a /etc/hosts
    echo "$TO ditambahkan ke /etc/hosts"
else
    echo "$TO sudah ada di /etc/hosts"
fi

# 2. Generate sertifikat SSL dengan mkcert
echo "Membuat sertifikat untuk $TO..."
CERT_PATH="domains/$TO.pem"
KEY_PATH="domains/$TO-key.pem"
if [ ! -f "$CERT_PATH" ]; then
    mkcert -cert-file "$CERT_PATH" -key-file "$KEY_PATH" "$TO"
else
    echo "Sertifikat untuk $TO sudah ada"
fi

# 3. Buat file konfigurasi Nginx untuk domain
echo "Mengupdate konfigurasi Nginx..."
CONFIG_PATH="nginx/sites/$TO.conf"
cat > "$CONFIG_PATH" <<EOL
server {
    listen 80;
    server_name $TO;

    # Redirect HTTP ke HTTPS
    return 301 https://\$host\$request_uri;
}

server {
    listen 443 ssl;
    server_name $TO;

    ssl_certificate /etc/nginx/certs/$TO.pem;
    ssl_certificate_key /etc/nginx/certs/$TO-key.pem;

    location / {
        proxy_pass http://host.docker.internal:${SOURCE##*:};
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOL
echo "Konfigurasi Nginx dibuat untuk $TO"

# 4. Restart Docker Compose
echo "Restarting Docker Compose..."
docker-compose down
docker-compose up -d --build

echo "Domain $TO berhasil dibuat dan dikonfigurasi!"
