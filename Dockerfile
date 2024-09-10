FROM mcr.microsoft.com/mssql/server:2019-latest

ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=YourStrong@Password
ENV MSSQL_PID=Express

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY init.sql /usr/src/app/init.sql
COPY data /usr/src/app/data

CMD /opt/mssql/bin/sqlservr & sleep 30 && \
    /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "mssql1Ipw" -d master -i /usr/src/app/init.sql
