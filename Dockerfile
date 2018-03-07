FROM ubuntu:16.04

# Possible env vars supported by mssql

#    ACCEPT_EULA   // Accept the SQL Server license agreement when set to any value (for example, 'Y').
#    MSSQL_LCID  Sets the language ID to use for SQL Server. For example 1036 is French.
#    MSSQL_COLLATION Sets the default collation for SQL Server. This overrides the default mapping of language id (LCID) to collation.
#    MSSQL_MEMORY_LIMIT_MB   Sets the maximum amount of memory (in MB) that SQL Server can use. By default it is 80% of the total physical memory.
#    MSSQL_TCP_PORT  Configure the TCP port that SQL Server listens on (default 1433).
#    MSSQL_IP_ADDRESS    Set the IP address. Currently, the IP address must be IPv4 style (0.0.0.0).
#    MSSQL_BACKUP_DIR    Set the Default backup directory location.
#    MSSQL_DATA_DIR  Change the directory where the new SQL Server database data files (.mdf) are created.
#    MSSQL_LOG_DIR   Change the directory where the new SQL Server database log (.ldf) files are created.
#    MSSQL_DUMP_DIR  Change the directory where SQL Server will deposit the memory dumps and other troubleshooting files by default.
#    MSSQL_ENABLE_HADR   Enable Availability Group. For example, '1' is enabled, and '0' is disabled
#    MSSQL_AGENT_ENABLED Enable SQL Server Agent. For example, 'true' is enabled and 'false' is disabled. By default, agent is disabled.
#    MSSQL_MASTER_DATA_FILE  Sets the location of the master database data file.
#    MSSQL_MASTER_LOG_FILE   Sets the location of the master database log file.
#    MSSQL_SA_PASSWORD  //  Configure the SA user password.
#    MSSQL_PID   // Set the SQL Server edition or product key. Possible values include: 
#                   Evaluation
#                   Developer
#                   Express
#                   Web
#                   Standard
#                   Enterprise
#                   A product key :: if specifying a product key, it must be in the form of #####-#####-#####-#####-#####, where '#' is a number or a letter.



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


# running mysql /opt/mssql/bin/sqlservr
