FROM python:3.11-slim

# 1. Instalăm ffmpeg pentru a scăpa de RuntimeWarning și alte dependențe de sistem
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 2. Upgrade la pip și instalare g4f cu suport de server (uvicorn inclus)
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir "g4f[all]" uvicorn flask

# 3. Setăm variabilele de mediu
ENV G4F_PROVIDER=Yqcloud
ENV PORT=8080

EXPOSE 8080

# 4. Comanda de start CORECTATĂ pentru noile versiuni g4f
# În versiunile noi, aplicația se află de obicei în g4f.api.run:app sau g4f.api:app
# Dacă "g4f.api:app" eșuează, folosim metoda de rulare internă a g4f:
CMD ["python", "-m", "g4f.api.run", "--host", "0.0.0.0", "--port", "8080"]
