# Debian: NGINX 1.9

# Pull the base image.
FROM debian:jessie

# Set environment variables.
ENV NGINX_VERSION 1.9.9-1~jessie

# Install NGINX.
RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62; \
	echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list; \

	apt-get update && apt-get install -y \
    openssl \
    ca-certificates \
    nginx=${NGINX_VERSION}; \

	apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Turn daemon off.
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Define mountable directories.
VOLUME ["/etc/nginx", "/var/log/nginx", "/var/cache/nginx"]

# Expose ports.
EXPOSE 80 443

# Configure executable.
ENTRYPOINT []

# Define default command.
CMD ["nginx"]
