FROM microsoft/windowsservercore

COPY Java C:/Java
ENV JAVA_HOME C:\\Java\\jdk1.8.0_131

#VOLUME C:\\Elasticsearch\\logs
#VOLUME C:\\Elasticsearch\\data

#RUN md C:\Elasticsearch & md C:\Elasticsearch\logs & md C:\Elasticsearch\data
ADD ["https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.4.0.zip", "/"]
RUN ["powershell", "-command Expand-Archive", "-Path \\elasticsearch-5.4.0.zip", "-DestinationPath \\Elasticsearch"]
RUN ["powershell", "-command Remove-Item", "-Path \\elasticsearch-5.4.0.zip"]

COPY elasticsearch.yml /elasticsearch/elasticsearch-5.4.0/config/
#RUN md C:\Elasticsearch\logs & md C:\Elasticsearch\data

#CMD ["ping", "-t", "localhost"]
CMD ["C:/Elasticsearch/elasticsearch-5.4.0/bin/elasticsearch.bat"]

EXPOSE 9200 9300
