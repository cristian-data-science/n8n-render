# Usar la imagen base de n8n
FROM n8nio/n8n:latest

# Cambiamos a root para poder instalar paquetes del sistema
USER root

# Instalamos Python y pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Instalamos FastAPI, uvicorn y python-docx (u otro paquete para extraer texto de docx/doc)
RUN pip3 install fastapi uvicorn python-docx

# Volvemos al usuario 'node' para no romper la compatibilidad con n8n
USER node

# Copiamos los archivos necesarios a la carpeta de trabajo (por defecto /home/node)
COPY --chown=node:node main.py /home/node/
COPY --chown=node:node start.sh /home/node/

# Damos permisos de ejecución a start.sh
RUN chmod +x /home/node/start.sh

# Definimos el entrypoint. Ejecutará el script que arranca n8n y FastAPI
ENTRYPOINT ["/home/node/start.sh"]
