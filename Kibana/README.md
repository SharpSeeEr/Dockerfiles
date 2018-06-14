# Dockerfiles/Kibana

Dockerfile for creating an image for running Kibana in a Windows Server 2016 docker container.  

## Steps to create image

```powershell
docker build .
```

The Dockerfile accepts an argument `--build-arg KIBANA_VERSION=5.4.0` which currently defaults to `5.4.0`.
  
## Run it

Assuming you have Elasticsearch running in a container named "elasticsearch":

```powershell
docker run --rm --link elasticsearch -p 5601:5601 <imagename>
```

