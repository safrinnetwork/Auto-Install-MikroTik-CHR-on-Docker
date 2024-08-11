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
sudo docker run --name mikrotik-chr-6 --restart unless-stopped -p 8291:8291 -p 8728:8728 -p 8729:8729 -p 2222:22 -p 8080:80 -p 443:443 -p 2121:21 safrinnetwork/mikrotik-chr-6:latest
```
### RouterOS 7
- Pull
```
docker pull safrinnetwork/mikrotik-chr-7
```
- Run
```
sudo docker run --name mikrotik-chr-7 --restart unless-stopped -p 8291:8291 -p 8728:8728 -p 8729:8729 -p 2222:22 -p 8080:80 -p 443:443 -p 2121:21 safrinnetwork/mikrotik-chr-7:latest
```
# Port Mapping
- Winbox : 8291:8291  ( Original Port )
- Api : 8728:8728 ( Original Port )
- Api SSL : 8729:8729 ( Original Port )
- FTP : 2121:21 ( Mapping to 2121 )
- SSH : 2222:22 ( Mapping to 2222 )
- WWW : 8080:80 ( Mapping to 8080 )
- WWW SSL : 443:443 ( Original Port )
### Running with custom mapping port
- Example RouterOS 6 With Custom Port
```
sudo docker run --name mikrotik-chr-6 --restart unless-stopped -p 7171:8291 -p 7272:8728 -p 7373:8729 -p 7474:22 -p 7575:80 -p 7676:443 -p 7777:21 -p 7878:23 safrinnetwork/mikrotik-chr-6:latest
```
- Example RouterOS 7 With Custom Port
```
sudo docker run --name mikrotik-chr-7 --restart unless-stopped -p 7171:8291 -p 7272:8728 -p 7373:8729 -p 7474:22 -p 7575:80 -p 7676:443 -p 7777:21 -p 7878:23 safrinnetwork/mikrotik-chr-7:latest
```
- Description Custom Port
  - Winbox : 7373
  - Api : 7272
  - Api SSL : 7373
  - FTP : 7777
  - SSH : 7474
  - WWW : 7575
  - WWW SSL : 7676
  - Telnet : 7878
# Issue
If the container does not run automatically when your VPS restarts, create a cron job.
### RouterOS 6
- Open crontab
```
sudo crontab -e
```
- Put this command
```
@reboot sudo docker start mikrotik-chr-6
```
### RouterOS 7
- Open crontab
```
sudo crontab -e
```
- Put this command
```
@reboot sudo docker start mikrotik-chr-7
```

