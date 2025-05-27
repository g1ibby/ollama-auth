# Ollama with API Key Authentication

A secure Docker image that runs the Ollama service with API key authentication using Caddy as a reverse proxy. This setup provides multiple authentication methods while keeping your Ollama instance secure.

## Quick Start

### Using Docker
```bash
docker run -d \
  -p 11435:80 \
  -e OLLAMA_API_KEY=your-secret-api-key \
  -v ollama_data:/root/.ollama \
  ghcr.io/g1ibby/ollama-auth:latest
```

### Using Docker Compose
```bash
curl -O https://raw.githubusercontent.com/g1ibby/ollama-auth/main/docker-compose.yml
# Edit docker-compose.yml to set your API key
docker-compose up -d
```

## Authentication Methods

The service supports three authentication methods. Choose the one that best fits your client:

### 1. Bearer Token (Recommended)
```bash
curl -H "Authorization: Bearer your-secret-api-key" \
  http://localhost:11435/api/tags
```

### 2. Query Parameter
```bash
curl "http://localhost:11435/api/tags?api-key=your-secret-api-key"
```

### 3. Header-Based
```bash
curl -H "X-API-Key: your-secret-api-key" \
  http://localhost:11435/api/tags
```

## Configuration

### Environment Variables

| Variable | Required | Description | Default |
|----------|----------|-------------|---------|
| `OLLAMA_API_KEY` | ✅ | API key for authentication | - |
| `OLLAMA_HOST` | ❌ | Ollama bind address | `0.0.0.0` |

### Volume Mounts

- `/root/.ollama` - Ollama models and configuration data

## Using with Ollama Clients

### OpenWebUI
Set the API base URL to `http://localhost:11435` and configure authentication headers in your client.

### Ollama CLI
```bash
export OLLAMA_HOST=http://localhost:11435
# Add API key to your requests
```

### Python Client
```python
import requests

headers = {"Authorization": "Bearer your-secret-api-key"}
response = requests.get("http://localhost:11435/api/tags", headers=headers)
```

## Security Considerations

- 🔑 **Strong API Keys** - Use long, randomly generated API keys
- 🌐 **Network Security** - Consider using HTTPS in production with a reverse proxy
- 🔄 **Key Rotation** - Regularly rotate your API keys
- 📊 **Monitoring** - Monitor access logs for suspicious activity

## Troubleshooting

### Container won't start
- Ensure `OLLAMA_API_KEY` environment variable is set
- Check Docker logs: `docker logs <container-name>`

### Authentication fails
- Verify your API key matches the `OLLAMA_API_KEY` environment variable
- Ensure you're using the correct authentication method
- Check that the API key doesn't contain special characters that need escaping

### Models not persisting
- Ensure you're mounting a volume to `/root/.ollama`
- Check volume permissions and available disk space

## Contributing

Contributions are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
