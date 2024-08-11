# Auto Install MikroTik CHR di Docker
- ENG [GitHub Pages]([https://pages.github.com/] (https://github.com/safrinnetwork/Auto-Install-MikroTik-CHR-on-Docker/blob/main/README.eng.md)
- Ini adalah skrip otomatis yang dapat menjalankan image Mikrotik CHR di dalam container Docker pada VPS non-KVM.
# Build Image Lokal dengan Skrip Otomatis
### RouterOS 6
Curl
```
bash <(curl -s https://raw.githubusercontent.com/safrinnetwork/Auto-Install-MikroTik-CHR-on-Docker/main/install_v6.sh)
```
Wget
```
bash <(wget -qO- https://raw.githubusercontent.com/safrinnetwork/Auto-Install-MikroTik-CHR-on-Docker/main/install_v6.sh)
```

### RouterOS 7
Curl
```
bash <(curl -s https://raw.githubusercontent.com/safrinnetwork/Auto-Install-MikroTik-CHR-on-Docker/main/install_v7.sh)
```
Wget
```
bash <(wget -qO- https://raw.githubusercontent.com/safrinnetwork/Auto-Install-MikroTik-CHR-on-Docker/main/install_v7.sh)
```

# Image Docker Hub
### RouterOS 6
- Pull
```
docker pull safrinnetwork/mikrotik-chr-6
```
- Jalankan
```
sudo docker run --name mikrotik-chr-6 --restart unless-stopped -p 8291:8291 -p 8728:8728 -p 8729:8729 -p 2222:22 -p 8080:80 -p 443:443 -p 2121:21 safrinnetwork/mikrotik-chr-6:latest
```
### RouterOS 7
- Pull
```
docker pull safrinnetwork/mikrotik-chr-7
```
- Jalankan
```
sudo docker run --name mikrotik-chr-7 --restart unless-stopped -p 8291:8291 -p 8728:8728 -p 8729:8729 -p 2222:22 -p 8080:80 -p 443:443 -p 2121:21 safrinnetwork/mikrotik-chr-7:latest
```

# Mapping Port
- Winbox : 8291:8291  (Port Asli)
- Api : 8728:8728 (Port Asli)
- Api SSL : 8729:8729 (Port Asli)
- FTP : 2121:21 (Mapping ke 2121)
- SSH : 2222:22 (Mapping ke 2222)
- WWW : 8080:80 (Mapping ke 8080)
- WWW SSL : 443:443 (Port Asli)

### Menjalankan dengan custom mapping port
- Contoh RouterOS 6 Dengan Port Kustom
```
sudo docker run --name mikrotik-chr-6 --restart unless-stopped -p 7171:8291 -p 7272:8728 -p 7373:8729 -p 7474:22 -p 7575:80 -p 7676:443 -p 7777:21 -p 7878:23 safrinnetwork/mikrotik-chr-6:latest
```
- Contoh RouterOS 7 Dengan Port Kustom
```
sudo docker run --name mikrotik-chr-7 --restart unless-stopped -p 7171:8291 -p 7272:8728 -p 7373:8729 -p 7474:22 -p 7575:80 -p 7676:443 -p 7777:21 -p 7878:23 safrinnetwork/mikrotik-chr-7:latest
```
- Deskripsi Port Kustom
  - Winbox : 7373
  - Api : 7272
  - Api SSL : 7373
  - FTP : 7777
  - SSH : 7474
  - WWW : 7575
  - WWW SSL : 7676
  - Telnet : 7878

# Masalah
Jika container tidak berjalan otomatis ketika VPS Anda reboot, buatlah cron job.

### RouterOS 6
- Buka crontab
```
sudo crontab -e
```
- Tambahkan perintah ini
```
@reboot sudo docker start mikrotik-chr-6
```
### RouterOS 7
- Buka crontab
```
sudo crontab -e
```
- Tambahkan perintah ini
```
@reboot sudo docker start mikrotik-chr-7
```
