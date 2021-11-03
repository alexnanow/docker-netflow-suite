ARG VERSAO_FLOW

FROM elastiflow/flow-collector:${VERSAO_FLOW}

COPY wait-for-elk.sh /usr/local/bin/wait-for-elk.sh

RUN chmod +x /usr/local/bin/wait-for-elk.sh

RUN apt install -y curl

ENTRYPOINT ["sh", "/usr/local/bin/wait-for-elk.sh"]



