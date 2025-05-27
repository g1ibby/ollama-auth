# Docker Image for Ollama Service with Basic Auth using Caddy Server

This project provides a Docker image that runs the Ollama service with basic authentication using the Caddy server. The image is designed to be easy to use, with a simple command to get started. The basic authentication credentials can be set using environment variables when running the Docker container.

## Usage:

To use this Docker image, you can run the following command:
```
docker run -p 11435:80 -e CADDY_USERNAME=myusername -e CADDY_PASSWORD=mypassword ghcr.io/g1ibby/ollama-auth:latest 
```
This will start a new Docker container using the `ollama-auth` image, and map port 11435 on the host machine to port 80 on the container. The basic authentication credentials can be set using the `CADDY_USERNAME` and `CADDY_PASSWORD` environment variables.

## Building the Docker Image:

To build the Docker image yourself, you can use the following command:
```
docker build -t ollama-auth .
```
This will build the Docker image using the `Dockerfile` in the current directory, and tag it with the name `ollama-auth`.

## Docker Tag and Publish Image

```
docker tag ollama-auth radu103/ollama-auth
docker push  radu103/ollama-auth
```

## Running the Ollama Service:

The Ollama service is started automatically when the Docker container is launched. It will be available at `http://localhost:11435` on the host machine.
