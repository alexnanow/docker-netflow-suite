# docker-netflow-suite
Repositório de uma suite completa para análise de netflow em Docker.

Utiliza o Docker, Docker-compose, Grafana, Elastiflow e Elasticsearch.

Para instalar:
```
git clone github.com/alexnanow/docker-netflow-suite
mkdir /var/lib/elasticsearch /var/lib/grafana && chown -R 1000:1000 /var/lib/elasticsearch && chown -R 1000:1000 /var/lib/grafana
cd docker-netflow-suite
docker-compose up -d
```
Para entrar no grafana:
```
http://<ipdoservidor>:3000
```
O grafana já virá com algumas dashboards configuradas. Outras irei adicionar aos poucos no repositório