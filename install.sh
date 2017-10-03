#bin/bash

#install dependencies
sudo apt-get install unzip zlibc zlib1g build-essential zlib1g-dev libpcre3 libpcre3-dev libssl-dev libxslt1-dev libxml2-dev libgd2-xpm-dev libgeoip-dev libgoogle-perftools-dev libperl-dev curl

#nginx version
NGINX_VERSION=1.12.1

#openssl version
OPENSSL_VERSION=1.0.2l

#Directories
CURRENT_DIR=$(pwd)
OPENSSL_DIR=$(pwd)/openssl-${OPENSSL_VERSION}

#Save the nginx version
curl -O http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
#Extracting nginx 
tar -xvf nginx-${NGINX_VERSION}.tar.gz
#Save the openssl version
curl -O https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz
#Extracting openssl
tar -xvf openssl-${OPENSSL_VERSION}.tar.gz

#Entering inside the nginx folder
cd nginx-${NGINX_VERSION}
#Configuring 
./configure  \
--prefix=/etc/nginx \
--with-http_ssl_module \
--with-http_v2_module \
--with-openssl=${OPENSSL_DIR} \
--with-cc-opt="-Wno-deprecated-declarations"

# Compiling everything on 64 bits systems
KERNEL_BITS=64 make install

#Cleaning sources
cd ${CURRENT_DIR}
rm *.tar.gz
rm -rf nginx-${NGINX_VERSION} ${OPENSSL_DIR}

