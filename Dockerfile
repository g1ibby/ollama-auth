FROM ubuntu:24.04

# Update and install wget to download caddy
RUN apt-get update && apt-get install -y wget curl bash

# Download and install ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Download and install caddy
RUN wget --no-check-certificate https://github.com/caddyserver/caddy/releases/download/v2.7.6/caddy_2.7.6_linux_amd64.tar.gz \
    && tar -xvf caddy_2.7.6_linux_amd64.tar.gz \
    && mv caddy /usr/bin/ \
    && chown root:root /usr/bin/caddy \
    && chmod 755 /usr/bin/caddy

# Copy the Caddyfile to the container
COPY Caddyfile /etc/caddy/Caddyfile

# Set the environment variable for the ollama host
ENV OLLAMA_HOST=0.0.0.0

# Expose the port that caddy will listen on
EXPOSE 80

# Set the working directory
WORKDIR /app

# Copy a script to start both ollama and caddy
COPY start_services.sh start_services.sh
RUN chmod +x start_services.sh

# Set the entrypoint to the script
CMD ["/bin/bash", "/app/start_services.sh"]
