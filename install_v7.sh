#!/bin/bash

# Update dan instal dependensi yang diperlukan
sudo apt update
sudo apt install -y wget unzip qemu-utils qemu-user-static

# Download MikroTik CHR Image
wget https://download.mikrotik.com/routeros/7.15.3/chr-7.15.3.img.zip

# Ekstrak Image
unzip chr-7.15.3.img.zip

# Konversi Image ke Format QCOW2
qemu-img convert -f raw -O qcow2 chr-7.15.3.img chr-7.15.3.qcow2

# Buat Dockerfile
cat <<EOF > Dockerfile
FROM ubuntu:22.04

# Install QEMU user-static for emulation
RUN apt-get update && apt-get install -y qemu-user-static qemu-system-x86

# Copy the CHR image
COPY chr-7.15.3.qcow2 /chr-7.15.3.qcow2

# Define command to run the MikroTik CHR image
CMD ["qemu-system-x86_64", "-m", "256M", "-smp", "1", "-hda", "/chr-7.15.3.qcow2", "-nographic", "-nic", "user,hostfwd=tcp::7101-:21,hostfwd=tcp::7102-:23,hostfwd=tcp::7103-:22,hostfwd=tcp::7104-:80,hostfwd=tcp::7105-:443,hostfwd=tcp::7106-:8291,hostfwd=tcp::7107-:8728,hostfwd=tcp::7108-:8729,hostfwd=tcp::7109-:1723,hostfwd=tcp::7110-:1701,hostfwd=tcp::7111-:1194"]
EOF

# Build Docker Image
sudo docker build -t mikrotik-chr-7 .

# Jalankan Container MikroTik CHR
sudo docker run --name mikrotik-chr-7 --restart unless-stopped \
-p 7101:22 \     # SSH
-p 7102:21 \     # FTP
-p 7103:23 \     # Telnet
-p 7104:80 \     # HTTP
-p 7105:443 \    # HTTPS
-p 7106:8291 \   # Winbox
-p 7107:8728 \   # MikroTik API
-p 7108:8729 \   # MikroTik API-SSL
-p 7109:1723 \   # PPTP
-p 7110:1701/udp \ # L2TP
-p 7111:1194/udp \ # OpenVPN
-p 7112:179 \    # BGP
-p 7113:2000 \   # MikroTik Bandwidth Test Server
-p 7114:1812/udp \ # Radius Authentication
-p 7115:1813/udp \ # Radius Accounting
-p 7116:2210 \   # The Dude Server
-p 7117:514/udp \ # Syslog
-p 7118:161/udp \ # SNMP
-p 7119:2055/udp \ # NetFlow
-p 7120:123/udp \ # NTP
-p 7121:53/udp \  # DNS
mikrotik-chr-7

echo "MikroTik CHR telah berhasil diinstal dan dijalankan dalam Docker dengan nama mikrotik-chr-7."
