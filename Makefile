setup: copy-examples copy-nginx-confd-examples self-ssl build-webproxy build-base-php

copy-examples:
	cp --update=none .env.example .env
	cp --update=none webproxy/nginx.conf.example webproxy/nginx.conf
	cp --update=none .envs/php-fpm.example.env .envs/php-fpm.env
	cp --update=none .envs/php-ini.example.env .envs/php-ini.env
	cp --update=none php/.env.example php/.env
	cp --update=none php/docker-compose.override.example.yml php/docker-compose.override.yml

copy-nginx-confd-examples:
	if [[ -f /etc/issue ]]; then
		# If the file exists, it's likely a Linux system
		find webproxy/conf.d/ -type f | grep -Po '([a-zA-Z0-9\-]+)(?=.conf.example)' | xargs -i cp --update=none webproxy/conf.d/{}.conf.example webproxy/conf.d/{}.conf
	elif [[ -f /System/Library/CoreServices/SystemVersion.plist ]]; then
		# If the macOS-specific SystemVersion.plist file exists, it's likely a macOS system
		find webproxy/conf.d -type f | grep -E '[a-zA-Z0-9-]+\.conf\.example$' | cut -d'.' -f1 | while read prefix; do cp --update=none "${prefix}.conf.example" "${prefix}.conf"; done
	fi

self-ssl:
	openssl req -x509 -newkey rsa\:4096 -sha256 -days 3650 -nodes -keyout .commons/certs/self-ssl.key -out .commons/certs/self-ssl.pem -subj "/CN=localhost" -addext "subjectAltName=DNS\:localhost,DNS\:*.localhost,IP\:127.0.0.1"

build-nginx:
	docker compose -f nginx/docker-compose.webproxy.yml build

build-base-php:
	docker compose -f php/docker-compose.php-base.yml build

copy-ms-envs:
	echo 'placeholder'
