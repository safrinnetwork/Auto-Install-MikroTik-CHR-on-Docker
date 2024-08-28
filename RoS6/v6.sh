#!/bin/bash

# Update dan instal dependensi yang diperlukan
sudo apt update
sudo apt install -y wget unzip qemu-utils qemu-user-static

# Download MikroTik CHR Image
wget https://download.mikrotik.com/routeros/6.49.17/chr-6.49.17.img.zip

# Ekstrak Image
unzip chr-6.49.17.img.zip

# Konversi Image ke Format QCOW2
qemu-img convert -f raw -O qcow2 chr-6.49.17.img chr-6.49.17.qcow2

# Buat Dockerfile
cat <<EOF > Dockerfile
FROM ubuntu:22.04

# Install QEMU user-static for emulation
RUN apt-get update && apt-get install -y qemu-user-static qemu-system-x86

# Copy the CHR image
COPY chr-6.49.17.qcow2 /chr-6.49.17.qcow2

# Expose ports
EXPOSE 8291 80 443 22 23 21 53/udp 53/tcp 123/udp 8728 8729 2210 179 8292 1194/udp 1194/tcp 1701/udp 1723 500/udp 4500/udp 50/tcp 51/tcp 1812/udp 1813/udp

# Define command to run the MikroTik CHR image
CMD ["qemu-system-x86_64", "-m", "256M", "-smp", "1", "-hda", "/chr-6.49.17.qcow2", "-nographic", "-nic", "user,hostfwd=tcp::8291-:8291,hostfwd=tcp::80-:80,hostfwd=tcp::443-:443,hostfwd=tcp::22-:22,hostfwd=tcp::23-:23,hostfwd=tcp::21-:21,hostfwd=udp::53-:53,hostfwd=tcp::53-:53,hostfwd=udp::123-:123,hostfwd=tcp::8728-:8728,hostfwd=tcp::8729-:8729,hostfwd=tcp::2210-:2210,hostfwd=tcp::179-:179,hostfwd=tcp::8292-:8292,hostfwd=udp::1194-:1194,hostfwd=tcp::1194-:1194,hostfwd=udp::1701-:1701,hostfwd=tcp::1723-:1723,hostfwd=udp::500-:500,hostfwd=udp::4500-:4500,hostfwd=tcp::50-:50,hostfwd=tcp::51-:51,hostfwd=udp::1812-:1812,hostfwd=udp::1813-:1813"]
EOF

# Build Docker Image
sudo docker build -t mikrotik-chr-6 .

# Jalankan Container MikroTik CHR
sudo docker run --name mikrotik-chr-6 --restart unless-stopped \
    -p 7000:8291 \
    -p 7001:80 \
    -p 7002:443 \
    -p 7003:22 \
    -p 7004:23 \
    -p 7005:21 \
    -p 7006:53/udp \
    -p 7007:53/tcp \
    -p 7008:123/udp \
    -p 7009:8728 \
    -p 7010:8729 \
    -p 7011:2210 \
    -p 7012:179 \
    -p 7013:8292 \
    -p 7014:1194/udp \
    -p 7015:1194/tcp \
    -p 7016:1701/udp \
    -p 7017:1723 \
    -p 7018:500/udp \
    -p 7019:4500/udp \
    -p 7020:50/tcp \
    -p 7021:51/tcp \
    -p 7022:1812/udp \
    -p 7023:1813/udp \
    mikrotik-chr-6

echo "MikroTik CHR telah berhasil diinstal dan dijalankan dalam Docker dengan nama mikrotik-chr-6."