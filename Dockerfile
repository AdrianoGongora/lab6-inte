FROM mcr.microsoft.com/mssql/server:2019-latest

# Establecer variables de entorno necesarias
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=mssql1Ipw
ENV MSSQL_PID=Express

# Instalar mssql-tools y otros paquetes necesarios
USER root
RUN apt-get update && apt-get install -y curl apt-transport-https gnupg && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev && \
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Asegurarse de que el directorio y los permisos sean correctos
RUN mkdir -p /var/opt/mssql/app
WORKDIR /var/opt/mssql/app
RUN chown -R mssql /var/opt/mssql/app

USER mssql

# Comando para iniciar SQL Server y mantenerlo en ejecución
CMD /opt/mssql/bin/sqlservr
