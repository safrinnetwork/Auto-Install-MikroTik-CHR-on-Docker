# Auto Install MikroTik CHR on Docker
This is an automated script that can run a Mikrotik CHR image inside a Docker container on a non-KVM VPS.
# Local Image Build With Auto Script
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
# Docker Hub Image
### RouterOS 6
- Pull
```
docker pull safrinnetwork/mikrotik-chr-6
```
- Run
```
sudo docker run --name mikrotik-chr-6 --restart unless-stopped -p 8291:8291 -p 8728:8728 -p 8729:8729 -p 2222:22 -p 80:80 -p 443:443 -p 21:21 safrinnetwork/mikrotik-chr-6:latest
```
### RouterOS 7
- Pull
```
docker pull safrinnetwork/mikrotik-chr-7
```
- Run
```
sudo docker run --name mikrotik-chr-7 --restart unless-stopped -p 8291:8291 -p 8728:8728 -p 8729:8729 -p 2222:22 -p 80:80 -p 443:443 -p 21:21 safrinnetwork/mikrotik-chr-7:latest
```
# Issue
If the container does not run automatically when your VPS restarts, create a cron job.
### RouterOS 6
```
(sudo crontab -l ; echo "@reboot /usr/bin/docker start mikrotik-chr-6") | sudo crontab -
```
### RouterOS 7
```
(sudo crontab -l ; echo "@reboot /usr/bin/docker start mikrotik-chr-7") | sudo crontab -
```

