FROM microsoft/nanoserver

# Build variable to allow passing in a specific version of Elasticsearch to download
ARG elasticsearchversion=5.4.0

COPY sources /
# Set the JAVA_HOME environment variable to match the version copied in
RUN for /d %i in (jdk*) do setx /m JAVA_HOME %~fi

# Download and extract Elasticsearch
ADD ["https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${elasticsearchversion}.zip", "/"]
RUN ["powershell", "-command Expand-Archive", "-Path \\elasticsearch-$($Env:elasticsearchversion).zip", "-DestinationPath \\"]
RUN ["powershell", "-command Remove-Item", "-Path \\elasticsearch-$($Env:elasticsearchversion).zip"]

# ELASTIC_HOME is used by the runelasticsearch.cmd file to launch Elasticsearch.
ENV ELASTIC_HOME C:\\elasticsearch-${elasticsearchversion}

COPY elasticsearch.yml ${ELASTIC_HOME}/config/

# Create a data volume and map it to the G: drive, allowing Java to call Path.toRealPath() successfully
VOLUME c:/data
RUN powershell Set-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices' -Name 'G:' -Value '\??\C:\data' -Type String

CMD ["C:/runelasticsearch.cmd"]

EXPOSE 9200 9300
