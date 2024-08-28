# Auto Install MikroTik CHR di Docker
- [Readme EN](https://github.com/safrinnetwork/Auto-Install-MikroTik-CHR-on-Docker/blob/main/README.eng.md)
- Ini adalah skrip otomatis yang dapat menjalankan image Mikrotik CHR di dalam container Docker pada VPS non-KVM.

# Membangun Image Dengan Skrip Otomatis
### RouterOS 6
```
bash <(wget -qO- https://raw.githubusercontent.com/safrinnetwork/Auto-Install-MikroTik-CHR-on-Docker/main/RoS6/v6.sh)
```

### RouterOS 7
```
bash <(wget -qO- https://raw.githubusercontent.com/safrinnetwork/Auto-Install-MikroTik-CHR-on-Docker/main/RoS7/v7.sh)
```

# Pull Langsung Dari Repository Docker Hub
### RouterOS 6
Pull
```
docker pull safrinnetwork/ros6
```
Menjalankan Image Kedalam Container
```
sudo docker run --name ros6 --restart unless-stopped -p 8291:8291 -p 8728:8728 -p 8729:8729 -p 2222:22 -p 8080:80 -p 443:443 -p 2121:21 safrinnetwork/ros6:latest
```
Contoh Menjalankan Image Kedalam Container Dengan Pemetaan Port
```
docker run --name ros6 --restart unless-stopped \
    -p 7000:8291 \
    -p 7001:8728 \
    -p 7002:8729 \
    -p 7003:22 \
    -p 7004:80 \
    -p 7005:443 \
    -p 7006:21 \
    -p 7007:23 \
    -p 7008:53 \
    -p 7009:2210 \
    -p 7010:179 \
    -p 7011:1194 \
    -p 7012:1723 \
    -p 7013:53/udp \
    -p 7014:123/udp \
    -p 7015:1194/udp \
    -p 7016:1701/udp \
    -p 7017:500/udp \
    -p 7018:4500/udp \
    -p 7019:1812/udp \
    -p 7020:1813/udp \
    safrinnetwork/ros6:latest
```

### RouterOS 7
Pull
```
docker pull safrinnetwork/ros7
```
Menjalankan Image Kedalam Container
```
sudo docker run --name ros7 --restart unless-stopped -p 8291:8291 -p 8728:8728 -p 8729:8729 -p 2222:22 -p 8080:80 -p 443:443 -p 2121:21 safrinnetwork/ros7:latest
```
Contoh Menjalankan Image Kedalam Container Dengan Pemetaan Port
```
docker run --name ros7 --restart unless-stopped \
    -p 7000:8291 \
    -p 7001:8728 \
    -p 7002:8729 \
    -p 7003:22 \
    -p 7004:80 \
    -p 7005:443 \
    -p 7006:21 \
    -p 7007:23 \
    -p 7008:53 \
    -p 7009:2210 \
    -p 7010:179 \
    -p 7011:1194 \
    -p 7012:1723 \
    -p 7013:53/udp \
    -p 7014:123/udp \
    -p 7015:1194/udp \
    -p 7016:1701/udp \
    -p 7017:500/udp \
    -p 7018:4500/udp \
    -p 7019:1812/udp \
    -p 7020:1813/udp \
    safrinnetwork/ros7:latest
```

# Dockerfile
Jika anda ingin membangun image dengan Dockerfile anda bisa langsung melakukan cloning pada repository ini

Cloning Repository
```
git clone https://github.com/safrinnetwork/Auto-Install-MikroTik-CHR-on-Docker/
```
RouterOS 6
```
cd RoS6
```
```
docker build -t safrinnetwork/ros6 .
```
RouterOS 7
```
cd RoS7
```
```
docker build -t safrinnetwork/ros7 .
```
Kemudian anda bisa menjalankan container dengan image yang sudah dibuat dari Dockerfile dengan contoh perintah menjalankan image yang ada di repository ini

# Expose Port
| Service          | Protocol | Port |
|------------------|----------|------|
| Winbox           | TCP      | 8291 |
| HTTP             | TCP      | 80   |
| HTTPS            | TCP      | 443  |
| SSH              | TCP      | 22   |
| Telnet           | TCP      | 23   |
| FTP              | TCP      | 21   |
| DNS              | UDP/TCP  | 53   |
| NTP              | UDP      | 123  |
| API              | TCP      | 8728 |
| API-SSL          | TCP      | 8729 |
| The Dude Server  | TCP      | 2210 |
| BGP              | TCP      | 179  |
| MPLS             | TCP      | 8292 |
| OVPN             | TCP/UDP  | 1194 |
| L2TP             | UDP      | 1701 |
| PPTP             | TCP      | 1723 |
| IPSec            | UDP/TCP  | 500, 4500, 50, 51 |
| Radius           | UDP      | 1812 |
| Radius Accounting| UDP      | 1813 |

# Masalah
Jika container tidak berjalan otomatis ketika VPS Anda reboot, buatlah cron job.

### RouterOS 6
Buka crontab
```
sudo crontab -e
```
Tambahkan perintah ini
```
@reboot sudo docker start ros6
```
### RouterOS 7
Buka crontab
```
sudo crontab -e
```
Tambahkan perintah ini
```
@reboot sudo docker start ros7
```
### Masih bingung ?
Silahkan tonton video panduanya https://youtu.be/m6kKRtTjtzM
