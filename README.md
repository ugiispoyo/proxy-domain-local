# 🚀 Proxy Local Domain

**Proxy Local Domain** memungkinkan Anda mengubah alamat `localhost` menjadi domain lokal dengan bantuan Docker.

### ✨ Contoh Penggunaan:
- `localhost:3000` ➡️ `https://app.local`
- `localhost:3001` ➡️ `https://hallo.local`

---

## 📖 Cara Penggunaan

1. **Instal Docker:**
   Pastikan Docker sudah terinstal di laptop anda. Jika belum, silakan unduh dan instal Docker dari [situs resmi Docker](https://www.docker.com/).

2. **Install mkcert**
    Pastikan `homebrew` sudah terinstall
    <br>
    a. install mkcert `brew install mkcert` <br/>
    b. install CA Root Lokal `mkcert -install`


3. **Beri Izin Eksekusi pada Script:**
   Jalankan perintah berikut di terminal:
   ```bash
   chmod +x create-domain-local.sh

4. **Jalankan Script: Gunakan command berikut untuk membuat proxy lokal:**

    `./create-domain-local.sh localhost:3000 to app.local`

    `localhost:3000` ➡️ Ganti dengan aplikasi anda yang sedang berjalan. <br/>
    `app.local` ➡️ Tentukan domain lokal yang anda inginkan.

5. **Buka browser anda:**
    lalu ketikan `app.local`
    
<br/>
<br/>
💡 Catatan:

1. Pastikan local anda belum terinstall web server seperti `nginx, apache atau web server apapun` atau app apapun yg mengarah ke port `80`
2. Pastikan aplikasi Anda sudah berjalan di port yang sesuai sebelum menjalankan script. Domain lokal yang Anda buat akan otomatis tersedia dengan dukungan HTTPS.
3. Untuk `macOS`

### Happy Coding 😊
