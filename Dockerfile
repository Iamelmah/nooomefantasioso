FROM python:3.11-slim-bullseye

# Imposta la working directory
WORKDIR /app

# Aggiorna pacchetti e installa git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Clona il repository
RUN git clone https://github.com/Iamelmah/nooomefantasioso

# Imposta la working directory nella cartella del repo
WORKDIR /app/nooomefantasioso

# Installa le dipendenze
RUN pip install --no-cache-dir -r requirements.txt

# Espone la porta dell'app
EXPOSE 7860

# Comando per avviare l'app
CMD ["uvicorn", "run:main_app", "--host", "0.0.0.0", "--port", "7860", "--workers", "4"]
