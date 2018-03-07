FROM ubuntu:16.04

ENV ACCEPT_EULA=Y

RUN apt-get update \
    && apt-get install -y \
        curl \
        software-properties-common \
        apt-transport-https \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && add-apt-repository "$(curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2017.list)" \
    && add-apt-repository "$(curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list)" \
    && apt-get update \
    && apt-get install -y \
        mssql-server \
        mssql-tools \
        unixodbc-dev 



