FROM nginx:latest

RUN apt-get update && apt-get install -y \
    iputils-ping \
    curl \
    && rm -rf /var/lib/apt/lists/*

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
