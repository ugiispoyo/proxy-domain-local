# 🚀 Proxy Local Domain

**Proxy Local Domain** memungkinkan Anda mengubah alamat `localhost` menjadi domain lokal dengan bantuan Docker.

### ✨ Contoh Penggunaan:
- `localhost:3000` ➡️ `https://app.local`
- `localhost:3001` ➡️ `https://hallo.local`

---

## 📖 Cara Penggunaan

1. **Instal Docker:**
   Pastikan Docker sudah terinstal di laptop anda. Jika belum, silakan unduh dan instal Docker dari [situs resmi Docker](https://www.docker.com/).

2. **Beri Izin Eksekusi pada Script:**
   Jalankan perintah berikut di terminal:
   ```bash
   chmod +x create-domain-local.sh

3. **Jalankan Script: Gunakan command berikut untuk membuat proxy lokal:**

    `./create-domain-local.sh localhost:3000 to app.local`

    `localhost:3000` ➡️ Ganti dengan aplikasi anda yang sedang berjalan. <br/>
    `app.local` ➡️ Tentukan domain lokal yang anda inginkan.

4. **Buka browser anda:**
    lalu ketikan `app.local`
    
<br/>
<br/>
💡 Catatan:
Pastikan aplikasi Anda sudah berjalan di port yang sesuai sebelum menjalankan script.
Domain lokal yang Anda buat akan otomatis tersedia dengan dukungan HTTPS.

