# Init Docker Nginx PHP

Adds docker to your PHP project.


## Usage

1. Using terminal, go to your PHP project directory

2. Run below command

```sh
( curl -sSLf https://raw.githubusercontent.com/a-h-abid/init-docker-nginx-php/refs/heads/master/bin/install.sh -o - || echo 'return 1' ) | sh -s
```

This will copy a `docker` directory & a `.dockerignore` file in your project root.

3. Using terminal, go to your PHP project and then inside docker directory. There run: `./setup.sh`.
   This will generate a self-signed certificate and also create files from .example ones.

Optionally, if you want to add Opentelemetry module for your nginx, run: `./setup.sh nginx_add_otel`. To remove, run: `./setup.sh nginx_remove_otel`

4. You can adjust the files inside the docker directory as you need to make it work for your PHP project. You may change the PHP or NGINX config, update Dockerfile, modify the .env, docker-compose YAML files etc. Onces done, go next step.

5. Do Docker Build: `docker compose build`. Make sure you have **Docker Buildkit** enabled.

6. Do Docker Up: `docker compose up -d`
