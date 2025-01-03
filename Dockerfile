# Usar la imagen base de n8n
FROM n8nio/n8n:latest

# Cambiar a root para poder instalar paquetes del sistema
USER root

# Actualizar los repositorios e instalar Python3 y pip3 usando apk
RUN apk update && \
    apk add --no-cache python3 py3-pip

# Crear un enlace simbólico para python si es necesario
RUN ln -sf python3 /usr/bin/python

# Instalar FastAPI, uvicorn y python-docx, sobrescribiendo las restricciones de pip
RUN pip3 install --no-cache-dir fastapi uvicorn python-docx --break-system-packages

# Volver al usuario 'node' para mantener la compatibilidad con n8n
USER node

# Establecer el directorio de trabajo
WORKDIR /home/node

# Copiar los archivos necesarios al directorio de trabajo
COPY --chown=node:node main.py start.sh ./

# Dar permisos de ejecución a start.sh de forma automática
RUN chmod +x start.sh

# Definir el entrypoint para ejecutar el script que inicia n8n y FastAPI
ENTRYPOINT ["./start.sh"]

