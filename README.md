# Docker-compose for PHP application infrastructure

![TravisCI](https://travis-ci.org/d-ulyanov/multi-container-php-application.svg?branch=master)

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

## Run via docker-compose

Run stack via docker-compose:
```
docker compose up -d
```

Open [http://localhost/]() to see Apache response proxied by HaProxy

##### Scale out in compose mode:

```
docker-compose scale apache=2
```

## Run stack in Docker Swarm

Step 0. Init swarm
```
docker swarm init
```

Step 1. Prepare docker images
```
$ docker-compose build 
```

Step 2. Run stack
```
$ docker stack deploy --compose-file=docker-compose.yml my-php-app
```

Open [http://localhost/]() to see Apache response proxied by HaProxy.

PS. If you want to avoid time-lags when Filebeat can't send logs to Logstash,
because Logstash is running, but still initializing - add [wait-for-it.sh](https://github.com/vishnubob/wait-for-it) to containers.

## Logs in Kibana

If you're runnig your stack locally - open [http://localhost:5601/]()

Kibana's UI needs access to ElasticSearch, 
please add following row to your `/etc/hosts`:
```
127.0.0.1	elasticsearch
```

## Configure Kibana

1. Open "Discover" page and add index pattern `logstash-*`
2. Reopen "Discover" page to see Apache access & error logs

## Jenkins

Jenkins is accessible here: [http://localhost:8080]()

Password you can find in docker logs from Jenkins (admin:admin)
