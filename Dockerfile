# Dockerfile
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y wget unzip qemu-utils qemu-user-static

# Download MikroTik CHR Image
RUN wget https://download.mikrotik.com/routeros/6.49.17/chr-6.49.17.img.zip

# Extract Image
RUN unzip chr-6.49.17.img.zip

# Convert Image to QCOW2 format
RUN qemu-img convert -f raw -O qcow2 chr-6.49.17.img chr-6.49.17.qcow2

# Define command to run the MikroTik CHR image
CMD ["qemu-system-x86_64", "-m", "512M", "-smp", "1", "-hda", "/chr-6.49.17.qcow2", "-nographic", "-nic", "user,hostfwd=tcp::8291-:8291,hostfwd=tcp::8728-:8728,hostfwd=tcp::8729-:8729,hostfwd=tcp::22-:22,hostfwd=tcp::80-:80,hostfwd=tcp::443-:443,hostfwd=tcp::21-:21,hostfwd=tcp::23-:23,hostfwd=udp::53-:53,hostfwd=tcp::53-:53,hostfwd=udp::123-:123,hostfwd=tcp::2210-:2210,hostfwd=tcp::179-:179,hostfwd=tcp::1194-:1194,hostfwd=udp::1194-:1194,hostfwd=udp::1701-:1701,hostfwd=tcp::1723-:1723,hostfwd=udp::500-:500,hostfwd=udp::4500-:4500,hostfwd=udp::1812-:1812,hostfwd=udp::1813-:1813"]
