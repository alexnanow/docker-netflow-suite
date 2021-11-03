# docker-netflow-suite
Repositório de uma suite completa para análise de netflow em Docker.

Utiliza o Docker, Docker-compose, Grafana, Elastiflow e Elasticsearch.

Para instalar:

1. Clonar o repositório via GIT. Necessário o git instalado
```
git clone github.com/alexnanow/docker-netflow-suite
```

2. Criar as pastas de armazenamento das bases de dados do Elasticsearch e Grafana
```
mkdir /var/lib/elasticsearch /var/lib/grafana
```

3. Aplicar permissão nas pastas dos bancos de dados

```
chown -R 1000:1000 /var/lib/elasticsearch
chown -R 472:472 /var/lib/grafana 
```

4. Entrar e executar o docker-compose para baixar e rodar os containers das aplicações
```
cd docker-netflow-suite
docker-compose up -d
```

Para entrar no grafana:
```
http://<ipdoservidor>:3000
```
O grafana já virá com algumas dashboards configuradas. Outras irei adicionar aos poucos no repositório