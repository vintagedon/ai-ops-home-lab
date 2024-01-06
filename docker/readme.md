# Docker Compose Files

A collection of docker compose files that are also GitOps compatible with (for example) Portainer.

| Docker Stack | Repository | Description | 
| :---------------------------- | :---------------------------------- | :---------- |
| influxdb | [influxdb](https://github.com/vintagedon/infrastructure-scripting/tree/main/docker-compose/influxdb) | Time Series Database used for metrics |
| nginx-proxy-manager / sqlite | [nginx-proxy-manager-sqlite](https://github.com/vintagedon/infrastructure-scripting/tree/main/docker-compose/nginx-proxy-manager-sqlite) | Reverse proxy w/SSL cert handling & wide SSL issuer support |
| SWAG (Secure Web Application Gateway | [swag](https://github.com/vintagedon/infrastructure-scripting/tree/main/docker-compose/swag) | Application gateway w/SSL cert handling via Let's Encrypt |
| WikiJS | [wikijs](https://github.com/vintagedon/infrastructure-scripting/tree/main/docker-compose/wikijs) | Modern, extensible Wiki |

# Usage

Every example has a root directory that includes the compose.yaml file that defines how the service components are configured. To execute each sample in a local environment, navigate to its root directory and run the following commands:

```
docker compose up -d
```

To learn more about the structure and expected output of each sample, see the README.md file for that sample. To stop and remove all containers associated with the sample application run:

```
docker compose down
```
