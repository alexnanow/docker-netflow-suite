# docker-netflow-suite
Repositório de uma suite completa para análise de netflow em Docker.

Utiliza o Docker, Docker-compose, Grafana, Elastiflow e Elasticsearch.

Para instalar:

1. Clonar o repositório via GIT. Necessário o git instalado

```
git clone https://github.com/alexnanow/docker-netflow-suite
```

2. Criar as pastas de armazenamento das bases de dados do Elasticsearch e Grafana

```
mkdir /var/lib/elasticsearch /var/lib/grafana 
mkdir -p /etc/elastiflow/settings /etc/elastiflow/maxmind
```

3. Extrair os arquivos de GeoIP

Obs: Necessário copiar os arquivos das bases de GeoIP da Maxmind dentro da pasta /etc/elastiflow/maxmind. A base é a GeoIP Lite, que pode ser copiada da pasta elastiflow/maxmind. Necessário extrair os arquivos.Para mais instruções, verifique o [site do desenvolvedor.](https://docs.elastiflow.com)

```
cd docker-netflow-suite/elastiflow/maxmind
cp * /etc/elastiflow/maxmind/. && cd /etc/elastiflow/maxmind
tar xvzf GeoLite2-City* --strip-components 1
tar xvzf GeoLite2-ASN* --strip-components 1
rm *.tar.gz
```

4. Aplicar permissão nas pastas dos bancos de dados

```
chown -R 1000:1000 /var/lib/elasticsearch
chown -R 472:472 /var/lib/grafana 
```

5. Entrar e executar o docker-compose para baixar e rodar os containers das aplicações

```
cd docker-netflow-suite
docker-compose up -d
```

Para entrar no grafana:

http://ipdoservidor:3000


Para modificar a community SNMP, basta entrar no arquivo .env e modificar o parâmetro COMMUNITY_SNMP. Importante manter a community entre aspas simples

Para modificar os requisitos de memória do Elasticsearch, basta entrar no arquivo .env e modificar o parâmetro ELK_MEMORY. Importante manter o valor entre aspas simples

Somente o Elastiflow precisa de modificação nas configurações para refletir o cenário atual. Basta editar o arquivo docker-compose.yml para modificar os parâmetros. Os parâmetros estão descritos no [site do desenvolvedor.](https://docs.elastiflow.com/docs/config_ref)