# Auto Install MikroTik CHR on Docker
This is an automated script that can run a Mikrotik CHR image inside a Docker container on a non-KVM VPS.
# Usage
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
### RouterOS 7
- Pull
```
docker pull safrinnetwork/mikrotik-chr-7
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

