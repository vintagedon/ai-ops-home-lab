# Nginx Proxy Manager w/SQLite

This Docker Compose provides a basic working Ngnix proxy manager using sqllite.

https://nginxproxymanager.com/

# Project Structure

```
.
├── compose.yaml
└── README.md
```

# Deploy with Docker Compose

```
$ docker compose up -d
[+] Running 2/2
 ✔ Network nginx-proxy-manager-sqlite_default  Created 0.0s
 ✔ Container nginx-proxy-manager-sqlite-app-1  Started 0.0s

$ docker ps
CONTAINER ID   IMAGE                             COMMAND   CREATED         STATUS         PORTS                                           NAMES
1e1198103577   jc21/nginx-proxy-manager:latest   "/init"   4 seconds ago   Up 4 seconds   0.0.0.0:80-81->80-81/tcp, 0.0.0.0:443->443/tcp  nginx-proxy-manager-sqlite-app-1
```

## Expected Result

Docker ps command must return one Ngnix Proxy Manager instance with the proper port configurations.

```
$ docker ps
CONTAINER ID   IMAGE                             COMMAND   CREATED         STATUS         PORTS                                           NAMES
1e1198103577   jc21/nginx-proxy-manager:latest   "/init"   4 seconds ago   Up 4 seconds   0.0.0.0:80-81->80-81/tcp, 0.0.0.0:443->443/tcp  nginx-proxy-manager-sqlite-app-1
```

## Web Interface

Go to ```http://INSTALLATION_IP_ADDRESS:81``` to access the Ngnix Proxy Manager admin login.

![2024-01-01 15_12_46-ws01](https://github.com/vintagedon/infrastructure-scripting/assets/4473026/d10deeb1-1621-4d10-a558-dbf179668194)

# Remove with Docker Compose

```
$ docker compose down
```
