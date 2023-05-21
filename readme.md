# Script de instalación automatizada de Plex y rclone

Este script es un script de Bash que automatiza el proceso de instalación de Plex Media Server y rclone en un sistema Ubuntu. También configura rclone para montar una unidad de Google Drive y reclama el servidor de Plex con tu cuenta.

## Prerrequisitos

Para ejecutar este script correctamente, necesitarás:

1. Una instalación de Ubuntu. Este script probablemente también funcione en otras distribuciones de Linux que utilizan `apt` como gestor de paquetes.
2. Una cuenta de Google Drive con los archivos que te gustaría servir a través de Plex.
3. Una cuenta de Plex.
4. El token de reclamación de Plex, que puedes obtener en https://www.plex.tv/claim/.
5. Permisos de superusuario (root) en el sistema Ubuntu, ya que el script necesita instalar paquetes y crear un servicio del sistema.

## ¿Qué hace este script?

Este script realiza las siguientes acciones, en orden:

1. Actualiza los paquetes del sistema con `sudo apt-get update`.
2. Instala el editor de texto `nano` y el programa `screen` con `sudo apt-get install -y nano screen`.
3. Instala FUSE, que es necesario para montar la unidad de Google Drive con rclone.
4. Descarga el paquete Plex Media Server más reciente y lo instala.
5. Habilita y comienza el servicio Plex Media Server.
6. Pide al usuario su token de reclamación de Plex y reclama el servidor Plex con él.
7. Instala rclone, una herramienta que permite montar servicios de almacenamiento en la nube como unidades de disco local.
8. Pide al usuario que configure rclone manualmente para conectarlo con su Google Drive.
9. Crea un directorio `GoogleDrive` en el directorio de inicio del usuario para usar como punto de montaje.
10. Crea un servicio del sistema para rclone, lo que permitirá que rclone se ejecute al inicio del sistema y monte automáticamente la unidad de Google Drive.
11. Habilita y comienza el servicio rclone.

## Ejecución del script

Para ejecutar el script, debes copiarlo en un archivo con la extensión `.sh`, darle permisos de ejecución con `chmod +x nombre_del_script.sh` y luego ejecutarlo con `./nombre_del_script.sh`.

Por último, aunque este script simplifica el proceso de instalación de Plex y rclone, es crucial que comprendas lo que hace cada comando antes de ejecutarlo. Este script modifica la configuración de tu sistema y tiene el potencial de causar problemas si se usa incorrectamente. Si encuentras problemas o errores, te recomendamos que busques ayuda en la documentación de la herramienta que está fallando o en comunidades en línea como Stack Overflow.
