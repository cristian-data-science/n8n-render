# Usar la imagen base de n8n
FROM n8nio/n8n:latest

# Instalar mammoth con npm
RUN npm install -g mammoth --unsafe-perm
