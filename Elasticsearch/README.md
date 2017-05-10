# Dockerfiles/Elasticsearch
Dockerfile for creating an image for running Elasticsearch in a Windows Server 2016 docker container.  

## Steps to create image
1. Download Java for Servers from http://www.oracle.com/technetwork/java/javase/downloads/server-jre8-downloads-2133154.html after accepting the license agreement.
1. Extract the tarball to a folder called "Java" in the same folder as the Dockerfile.
1. Modify the elasticsearch.yml settings file if needed to suit your environment.
1. Run the following command from the Elasticsearch directory in powershell: `docker build .`
