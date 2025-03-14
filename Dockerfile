FROM sonarqube:latest

# Definir a versão do Dockerize
ENV DOCKERIZE_VERSION v0.9.2

# Atualizar o repositório e instalar wget e tar
RUN apt-get update \
    && apt-get install -y wget tar \
    && rm -rf /var/lib/apt/lists/*

# Baixar e instalar o dockerize
RUN wget -O dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
    && tar -C /usr/local/bin -xzf dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
    && rm dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz

# Expor a porta necessária pelo SonarQube
EXPOSE 9000

# Definir o entrypoint para iniciar com o dockerize e aguardar a conexão do DB antes de rodar o SonarQube
ENTRYPOINT [ "/usr/local/bin/dockerize", "-wait", "tcp://db:3306", "-timeout", "20s", "/opt/sonarqube/bin/run.sh" ]