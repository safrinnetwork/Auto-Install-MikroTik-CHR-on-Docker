# Auto-Install-MikroTik-CHR-on-Docker
This is an automated script that can run a Mikrotik CHR image inside a Docker container on a non-KVM VPS.
# Usage
RouterOS 6
```
bash <(curl -s https://raw.githubusercontent.com/safrinnetwork/Auto-Install-MikroTik-CHR-on-Docker/main/install_v6.sh)
```
Wget
```
bash <(wget -qO- https://raw.githubusercontent.com/safrinnetwork/Auto-Install-MikroTik-CHR-on-Docker/main/install_v6.sh)
```
RouterOS 7
```
bash <(curl -s https://raw.githubusercontent.com/safrinnetwork/Auto-Install-MikroTik-CHR-on-Docker/main/install_v7.sh)
```
Wget
```
bash <(wget -qO- https://raw.githubusercontent.com/safrinnetwork/Auto-Install-MikroTik-CHR-on-Docker/main/install_v7.sh)
```
# Docker Hub Image
Pull
RouterOS 6
```
Coming Soon
```
RouterOS 7
```
Coming Soon
```
# Issue
If the container does not run automatically when your VPS restarts, create a cron job.
```
(sudo crontab -l ; echo "@reboot /usr/bin/docker start mikrotik-chr") | sudo crontab -
```

