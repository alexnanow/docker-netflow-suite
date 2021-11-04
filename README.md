# docker-netflow-suite
Repositório de uma suite completa para análise de netflow em Docker.

Utiliza o Docker, Docker-compose, Grafana, Elastiflow e Elasticsearch.

Instalação do Docker e git:

```
apt update && apt install ca-certificates curl gnupg lsb-release git
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update && apt install docker-ce docker-ce-cli containerd.io
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

Verificar se o docker e docker-compose foi instalado:

```
docker version
docker-compose --version
```

Para instalar a suite:

1. Clonar o repositório via GIT. 

```
git clone https://github.com/alexnanow/docker-netflow-suite
```

Por estar em desenvolvimento, necessário baixar a branch develop:

```
git clone -b develop https://github.com/alexnanow/docker-netflow-suite.git
```

2. Criar as pastas de armazenamento das bases de dados do Elasticsearch e Grafana

```
mkdir /var/lib/elasticsearch /var/lib/grafana 
mkdir -p /etc/elastiflow/settings /etc/elastiflow/maxmind
```

3. Extrair os arquivos de GeoIP

Obs: Necessário copiar os arquivos das bases de GeoIP da Maxmind dentro da pasta /etc/elastiflow/maxmind. A base é a GeoIP Lite, que pode ser copiada da pasta elastiflow/maxmind. Necessário extrair os arquivos. Para mais instruções, verifique o [site do desenvolvedor.](https://docs.elastiflow.com)

```
cd docker-netflow-suite/elastiflow/maxmind
cp * /etc/elastiflow/maxmind/. && cd /etc/elastiflow/maxmind
tar xvzf GeoLite2-City* --strip-components 1
tar xvzf GeoLite2-ASN* --strip-components 1
rm *.tar.gz
```

4. Copiar os arquivos de configuração do elastiflow

```
cd docker-netflow-suite/elastiflow/settings
cp * /etc/elastiflow/settings/.
```

Os arquivos são referentes a configurações dos roteadores que irão enviar os flows. Para mais instruções, verifique o [site do desenvolvedor.](https://docs.elastiflow.com)

5. Aplicar permissão nas pastas dos bancos de dados

```
chown -R 1000:1000 /var/lib/elasticsearch
chown -R 472:472 /var/lib/grafana 
```

6. Entrar e executar o docker-compose para baixar e rodar os containers das aplicações

```
cd docker-netflow-suite
docker-compose up -d
```

Para entrar no grafana:

http://ipdoservidor:3000


Para modificar a community SNMP, basta entrar no arquivo .env e modificar o parâmetro COMMUNITY_SNMP. Importante manter a community entre aspas simples

Para modificar os requisitos de memória do Elasticsearch, basta entrar no arquivo .env e modificar o parâmetro ELK_MEMORY. Importante manter o valor entre aspas simples

Somente o Elastiflow precisa de modificação nas configurações para refletir o cenário atual. Basta editar o arquivo docker-compose.yml para modificar os parâmetros. Os parâmetros estão descritos no [site do desenvolvedor.](https://docs.elastiflow.com/docs/config_ref)