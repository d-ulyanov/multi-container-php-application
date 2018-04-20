# Docker-compose for PHP application infrastructure

Here you can find PHP application with monitoring and logging.

Infrastructure consist of following services:

- HA Proxy (as load balancer for the Apache)
- Apache as a web server
    - forwards .php requests to PHP-FPM
    - Apache logs forwards to Logstash using Filebeat
- PHP-FPM (with PHP 7.1)
- Redis (for PHP sessions)
- Jenkins (deletes indexes older than 30 days from Elasticsearch)
- Elasticsearch (stores Apache logs)
- Kibana (for logs visualisation)
- Logstash - logs forwarder to ES

## Run

Run stack via docker-compose:
```
docker compose up -d
```

Run stack in swarm:
```
docker stack deploy --compose-file=docker-compose.yml my-php-app
```
