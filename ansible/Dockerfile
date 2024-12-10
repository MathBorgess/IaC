# FROM ubuntu:18.04
FROM ubuntu:24.04

RUN apt-get update && apt-get install vim ssh ansible -y \
    && echo 'root:admin' | chpasswd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config \
    && sed -i 's/#PubkeyAuthentication/PubkeyAuthentication/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication/PasswordAuthentication/' /etc/ssh/sshd_config \
    && systemctl enable ssh