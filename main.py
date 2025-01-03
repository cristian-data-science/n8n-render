from fastapi import FastAPI
from typing import Dict

app = FastAPI()

@app.get("/")
def hello() -> Dict[str, str]:
    return {"message": "Hola desde FastAPI (en el mismo contenedor de n8n)"}
