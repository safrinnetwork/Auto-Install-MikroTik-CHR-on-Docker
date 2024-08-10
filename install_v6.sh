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

# Define command to run the MikroTik CHR image
CMD ["qemu-system-x86_64", "-m", "256M", "-smp", "1", "-hda", "/chr-6.49.17.qcow2", "-nographic", "-nic", "user,hostfwd=tcp::8291-:8291,hostfwd=tcp::8728-:8728,hostfwd=tcp::8729-:8729,hostfwd=tcp::22-:22,hostfwd=tcp::80-:80,hostfwd=tcp::443-:443,hostfwd=tcp::21-:21"]
EOF

# Build Docker Image
sudo docker build -t mikrotik-chr-6 .

# Jalankan Container MikroTik CHR
sudo docker run --name mikrotik-chr-6 --restart unless-stopped -p 8291:8291 -p 8728:8728 -p 8729:8729 -p 2222:22 -p 80:80 -p 443:443 -p 21:21 mikrotik-chr-6

echo "MikroTik CHR telah berhasil diinstal dan dijalankan dalam Docker dengan nama mikrotik-chr-6."
