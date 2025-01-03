#!/bin/bash

# Iniciar n8n en segundo plano (background)
n8n start &

# Iniciar FastAPI (uvicorn) en primer plano
uvicorn main:app --host 0.0.0.0 --port 8001
