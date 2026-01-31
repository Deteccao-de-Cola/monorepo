#!/bin/bash
systemctl stop mysql apache2 redis-server nginx 2>/dev/null || true
systemctl restart docker
sleep 3

(cd ./app-service && docker compose down -v --remove-orphans) 2>/dev/null || true
(cd ./detection-service && docker compose down -v --remove-orphans) 2>/dev/null || true
(cd ./client-service && docker compose down -v --remove-orphans) 2>/dev/null || true
(cd ./migrations && docker compose down -v --remove-orphans) 2>/dev/null || true
docker ps -aq | xargs docker rm -f 2>/dev/null || true
docker network rm tcc-cola-network 2>/dev/null || true
docker network prune -f
docker network create tcc-cola-network
(cd ./app-service && docker compose up -d)
(cd ./detection-service && docker compose up -d)
(cd ./client-service && docker compose up -d)
(cd ./migrations && docker compose up)

sleep 5
docker exec -it tcc-cola-back php artisan db:seed DatabaseProvaSeeder

watch docker ps