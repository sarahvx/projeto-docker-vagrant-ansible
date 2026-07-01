# Usa a imagem oficial do Nginx como base para criar o container de proxy.
FROM nginx:latest

# Instala ferramentas basicas de diagnostico dentro da imagem.
RUN apt-get update && apt-get install -y \
    iputils-ping \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Substitui a configuracao padrao do Nginx para encaminhar conexoes para o WordPress.
RUN cat << 'EOF' > /etc/nginx/nginx.conf
events {
    worker_connections 1024;
}

stream {
    upstream wordpress_servers {
        server webserver:80;
    }

    server {
        listen 8080;
        proxy_pass wordpress_servers;
    }
}
EOF
