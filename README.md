# MTDK: Movable Type Developers Kit

MT開発環境構築をdockerで手軽にやりたい

## Setup a build environment

### Requirements

- Movable Type 7
- Docker 17 ce or later
- Docker Compose 1.16 or later

### Setup

```
git clone https://github.com/takeyuweb/MTDK.git myproject
cd myproject
docker-compose build
```

## Run Servers

```
docker-compose up
mv /path/to/MT-7.0/* data/mt
cp mt-config.cgi.sample data/mt/mt-config.cgi
```

## URL

### Movable Type

http://localhost:8080/mt/

### MailCatcher

http://localhost:8081

### phpMyAdmin

http://localhost:8082


## Path

| Name | Path |
| ---- | ---- |
| Document Root | /data/files |
| Movable Type | /data/mt |

## Tips

### run-periodic-tasks

```
docker-compose run -w /data/mt -u www-data httpd perl tools/run-periodic-tasks
```

### 起動中のコンテナのシェルに入る

```
CONTAINER_ID=$(docker ps | grep `docker-compose ps | awk '{print $1}' | grep _httpd_ | head -n 1` | awk '{print $1}')
docker exec -i -t -u www-data $CONTAINER_ID /bin/bash
```
