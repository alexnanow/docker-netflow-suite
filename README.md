# docker-netflow-suite
Repositório de uma suite completa para análise de netflow em Docker.

Utiliza o Docker, Docker-compose, Grafana, Elastiflow e Elasticsearch.

Para instalar:

1. Clonar o repositório via GIT. Necessário o git instalado

```
git clone https://github.com/alexnanow/docker-netflow-suite
```

2. Criar as pastas de armazenamento das bases de dados do Elasticsearch e Grafana

```shell
mkdir /var/lib/elasticsearch /var/lib/grafana
```

3. Aplicar permissão nas pastas dos bancos de dados

```shell
chown -R 1000:1000 /var/lib/elasticsearch
chown -R 472:472 /var/lib/grafana 
```

4. Entrar e executar o docker-compose para baixar e rodar os containers das aplicações

```
cd docker-netflow-suite
docker-compose up -d
```

Para entrar no grafana:

http://<ipdoservidor>:3000


Para modificar a community SNMP, basta entrar no arquivo .env e modificar o parâmetro COMMUNITY_SNMP. Importante manter a community entre aspas simples

Somente o Elastiflow precisa de modificação nas configurações para refletir o cenário atual. Basta editar o arquivo docker-compose.yml para modificar os parâmetros. Os parâmetros estão descritos no [site do desenvolvedor.](https://docs.elastiflow.com/docs/config_ref)