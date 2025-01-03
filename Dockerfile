# Usar la imagen base de n8n
FROM n8nio/n8n:latest

# Cambiamos a root para poder instalar paquetes del sistema
USER root

# Actualizar los repositorios e instalar Python3 y pip3 usando apk
RUN apk update && \
    apk add --no-cache python3 py3-pip

# Crear un enlace simbólico para python si es necesario
RUN ln -sf python3 /usr/bin/python

# Instalar FastAPI, uvicorn y python-docx
RUN pip3 install --no-cache-dir fastapi uvicorn python-docx

# Volvemos al usuario 'node' para no romper la compatibilidad con n8n
USER node

# Establecer el directorio de trabajo
WORKDIR /home/node

# Copiar los archivos necesarios al directorio de trabajo
COPY --chown=node:node main.py start.sh ./

# Dar permisos de ejecución a start.sh de forma automática
RUN chmod +x start.sh

# Definir el entrypoint para ejecutar el script que inicia n8n y FastAPI
ENTRYPOINT ["./start.sh"]
