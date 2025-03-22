FROM python:3.12-slim-bullseye

# Install the Python package
COPY . /app
WORKDIR /app
RUN pip install --no-cache-dir .

# Expose the required port
EXPOSE 10200

# Set entrypoint to read secrets from files directly
ENTRYPOINT ["sh", "-c", "exec python -m wyoming_microsoft_tts --subscription-key $(cat /run/secrets/azure_token) --service-region $service_region --uri $uri --voice $voice"]
