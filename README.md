# 🐳 Docker & Docker Compose Installer for Ubuntu

This repository provides a simple Bash script to install **Docker Engine**, **Docker Compose**, and related components on any Ubuntu-based system.

---

## 📄 File

- [`install-docker.sh`](./install-docker.sh) – Fully automated installation script.
- [`uninstall-docker.sh`](./uninstall-docker.sh) – Fully automated uninstall script.

---

## 📦 What’s Included

- Docker Engine  
- Docker CLI  
- containerd  
- docker-buildx-plugin  
- docker-compose-plugin  
- Docker Compose (standalone binary)

---

## 🚀 How to Use (Terminal Instructions)

### 1. Download the script

```bash
curl -O https://raw.githubusercontent.com/srhafid/install-docker-ubuntu/main/install-docker.sh
sudo chmod +x install-docker.sh
sudo ./install-docker.sh
```

### 2. Or uninstall Docker and Docker-Compose

```bash
curl -O https://raw.githubusercontent.com/srhafid/install-docker-ubuntu/main/uninstall-docker.sh
sudo chmod +x uninstall-docker.sh
sudo uninstall-docker.sh
```