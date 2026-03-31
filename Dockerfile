FROM python:3.11-slim

WORKDIR /app

# Instalăm dependențele necesare pentru API și serverul web
RUN pip install --no-cache-dir g4f[all] uvicorn

# Expunem portul
EXPOSE 8080

# Setăm variabilele de mediu
ENV G4F_PROVIDER=Yqcloud

# Pornim serverul folosind uvicorn direct pentru a evita eroarea de argumente
CMD ["uvicorn", "g4f.api:app", "--host", "0.0.0.0", "--port", "8080"]
