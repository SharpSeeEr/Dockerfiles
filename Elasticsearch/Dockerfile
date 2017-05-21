FROM microsoft/nanoserver
# openjdk:8-jdk-nanoserver

# Build variable to allow passing in a specific version of Elasticsearch to download
ARG ELASTICSEARCH_VERSION=5.4.0

COPY sources /
# Set the JAVA_HOME environment variable to match the version copied in
RUN for /d %i in (jdk*) do setx /m JAVA_HOME %~fi

# Download and extract Elasticsearch
SHELL ["powershell.exe", "-Command"]

ADD ["https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ELASTICSEARCH_VERSION}.zip", "/"]
RUN Expand-Archive -Path \elasticsearch-$($Env:ELASTICSEARCH_VERSION).zip -DestinationPath \ ; \
    Remove-Item -Path \elasticsearch-$($Env:ELASTICSEARCH_VERSION).zip ;

# ELASTIC_HOME is used by the runelasticsearch.cmd file to launch Elasticsearch.
ENV ELASTIC_HOME C:\\elasticsearch-${ELASTICSEARCH_VERSION}

COPY elasticsearch.yml ${ELASTIC_HOME}/config/

# Create a data volume and map it to the G: drive, allowing Java to call Path.toRealPath() successfully
VOLUME c:/data
RUN Set-Variable -Name 'regpath' -Value 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices' ; \
    Set-ItemProperty -path $regpath -Name 'G:' -Value '\??\C:\data' -Type String ;

COPY RunElasticSearch.cmd /
CMD ["C:/RunElasticSearch.cmd"]

EXPOSE 9200 9300
