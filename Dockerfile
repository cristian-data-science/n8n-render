# Usar la imagen base de n8n
FROM n8nio/n8n:latest

# Cambiar al usuario root
USER root

# Instalar mammoth globalmente
RUN npm install -g mammoth

# Volver al usuario node
USER node
