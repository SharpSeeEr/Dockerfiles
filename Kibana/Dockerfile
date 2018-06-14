FROM microsoft/windowsservercore

# Build variable to allow passing in a specific version of Elasticsearch to download
ARG KIBANA_VERSION=6.3.0
ARG NODE_VERSION=10.4.1

# Download and extract 64-bit Node.js 
ADD ["https://nodejs.org/dist/latest-v10.x/node-v${NODE_VERSION}-win-x64.zip", "/"]

RUN powershell.exe -Command \
  $zipPath = 'node-v' + $Env:NODE_VERSION + '-win-x64.zip' ; \
  Expand-Archive -Path $zipPath -DestinationPath \ ; \
  Remove-Item -Path $zipPath; \
  Rename-Item -Path $fullversion -NewName kibana;

# Download and extract Kibana
ADD ["https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-windows-x86_64.zip", "/"]

# Extracting the archive can take a while unless this step is cached already
RUN powershell.exe -Command \
  $fullversion = '\kibana-' + $Env:KIBANA_VERSION + '-windows-x86'; \
  $zipPath = $fullversion + '.zip'; \
  Expand-Archive -Path $zipPath -DestinationPath \ -verbose; \
  Remove-Item -Path $zipPath; \
  Rename-Item -Path $fullversion -NewName kibana;

# ELASTIC_HOME is used by the runelasticsearch.cmd file to launch Elasticsearch.
ENV ELASTIC_HOME C:\\elasticsearch-${KIBANA_VERSION}
ENV ES_JAVA_OPTS -Xms512m -Xmx512m

COPY kibana.yml /kibana/config/
COPY kibana.bat /kibana/bin/

WORKDIR C:/kibana
CMD [".\\bin\\kibana.bat"]

EXPOSE 5601
