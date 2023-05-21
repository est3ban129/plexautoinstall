#!/bin/bash

# Actualiza los paquetes de tu sistema
sudo apt-get update

# Instala el editor de texto NANO
sudo apt-get install -y nano

# Instala el programa SCREEN
sudo apt-get install -y screen

# Instala FUSE
sudo apt-get install -y fuse

# Descarga e instala el servidor de Plex Media Server
echo "Descargando e instalando Plex Media Server..."
wget https://downloads.plex.tv/plex-media-server-new/1.23.1.4571-6119e8eed/debian/plexmediaserver_1.23.1.4571-6119e8eed_amd64.deb
sudo dpkg -i plexmediaserver_1.23.1.4571-6119e8eed_amd64.deb
sudo systemctl enable plexmediaserver.service
sudo systemctl start plexmediaserver.service
echo "Plex Media Server instalado!"

# Solicita al usuario el token de Plex
read -p "Por favor, introduce tu token de Plex para reclamar el servidor: " plex_token

# Reclama el servidor de Plex
echo "Reclamando el servidor de Plex..."
curl -X POST -H "X-Plex-Token: $plex_token" 'http://localhost:32400/myplex/claim'
echo "Servidor de Plex reclamado!"

# Instala rclone
echo "Instalando rclone..."
curl https://rclone.org/install.sh | sudo bash
echo "rclone instalado!"

# Ejecuta la configuración de rclone manualmente
echo "Por favor, configura rclone siguiendo las instrucciones..."
rclone config

# Solicita al usuario el nombre de la configuración de rclone
read -p "Por favor, introduce el nombre de tu configuración de rclone: " rclone_config_name

# Crea un punto de montaje para Google Drive
mkdir -p ~/GoogleDrive

# Crea un servicio para rclone
echo "Creando un servicio para rclone..."
echo "[Unit]
Description=Rclone
After=network.target

[Service]
ExecStart=/usr/bin/rclone mount ${rclone_config_name}: ~/GoogleDrive --allow-other --allow-non-empty --vfs-cache-mode writes
Restart=on-abort
User=$(whoami)
Group=$(whoami)

[Install]
WantedBy=default.target" > /tmp/rclone.service
sudo mv /tmp/rclone.service /etc/systemd/system/rclone.service

# Habilita y inicia el servicio de rclone
sudo systemctl enable rclone.service
sudo systemctl start rclone.service
echo "Servicio de rclone creado e iniciado!"
