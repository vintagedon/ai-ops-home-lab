Certainly! Here’s the README with appropriate emojis added to each major heading:

---

# 🚀 GitOps with Portainer Stacks

## 📝 Overview

This repository contains Docker Compose stack configurations for various services, including MariaDB, PostgreSQL, Redis, MongoDB, and Neo4j. These configurations are designed to be managed using GitOps principles and deployed through Portainer.

By storing configurations in a Git repository hosted on our `gitea01` server, we leverage Portainer's ability to pull stacks from a Git repository and automatically update them when the repository is modified. This ensures that all service configurations are version-controlled, auditable, and easy to manage.

## 📋 Prerequisites

- **Gitea Server:** Configurations are stored in a Gitea repository on the `gitea01` server.
- **Portainer:** Ensure Portainer is set up and configured to pull stacks from a Git repository.
- **Host Volumes:** Host volumes are stored on an NVMe drive mounted on the VM, enhancing performance and simplifying backup processes.

## 📂 Repository Structure

```
gitops/
├── portainer-stacks/
│   ├── mariadb/
│   │   ├── docker-compose.yml
│   │   └── .env
│   ├── postgres/
│   │   ├── docker-compose.yml
│   │   └── .env
│   ├── redis/
│   │   ├── docker-compose.yml
│   │   └── .env
│   ├── mongodb/
│   │   ├── docker-compose.yml
│   │   └── .env
│   └── neo4j/
│       ├── docker-compose.yml
│       └── .env
```

Each service has its own directory containing a `docker-compose.yml` file and an optional `.env` file for environment variables.

## 🔧 Setting Up Portainer Stacks from Gitea

### 🛠️ Add the Git Repository to Portainer

1. **Navigate to Stacks:** Open Portainer and go to the **Stacks** section.
2. **Add New Stack:** Click on **Add stack**.
3. **Select Repository:** Choose **Repository** as the stack type.
4. **Enter Git URL:** Input the Git repository URL from Gitea (e.g., `http://gitea01.yourdomain.com/user/repo.git`).
5. **Authentication (Optional):** If necessary, provide the repository authentication details.
6. **Branch and Path:** Select the appropriate branch (e.g., `main`) and specify the path to the stack configuration (e.g., `gitops/portainer-stacks/mariadb/docker-compose.yml`).
7. **Enable Auto Update:** Activate **Auto update** to ensure the stack updates whenever the repository changes.

### 🚀 Deploy the Stack

1. **Review Stack Details:** Once the repository is added, Portainer will pull the stack configuration.
2. **Deploy:** Click **Deploy the stack** to start the service using the stored configuration.

### 🔄 Auto-Updating Stacks

With **Auto update** enabled, Portainer automatically refreshes the stack whenever the Git repository is updated. This approach supports continuous deployment, ensuring your services always run with the latest configuration.

## 📥 Extracting Default Configuration Files

### 📂 Why Use Host Volumes?

Host volumes are stored on an NVMe drive mounted on the VM, providing several advantages:

- **Increased Performance:** NVMe storage ensures fast read and write speeds, which is crucial for databases and high-performance services.
- **Simplified Backup:** All container data, including configuration files, is stored in a single directory on the host, facilitating straightforward backup and restoration.

### 🛠️ Step-by-Step Guide

#### 💾 MariaDB

To extract the default `50-server.cnf` for MariaDB:

```bash
mkdir -p /dockerdata/mariadb/config
docker run --rm mariadb:10.6 cat /etc/mysql/mariadb.conf.d/50-server.cnf > /dockerdata/mariadb/config/50-server.cnf
```

#### 💾 PostgreSQL

To extract the default `postgresql.conf` for PostgreSQL:

```bash
mkdir -p /dockerdata/postgres/config
docker run --rm postgres:16.4 cat /etc/postgresql/postgresql.conf > /dockerdata/postgres/config/postgresql.conf
```

#### 💾 Redis

To extract the default `redis.conf` for Redis:

```bash
mkdir -p /dockerdata/redis/config
docker run --rm redis:7.0 cat /usr/local/etc/redis/redis.conf > /dockerdata/redis/config/redis.conf
```

#### 💾 MongoDB

To extract the default `mongod.conf` for MongoDB:

```bash
mkdir -p /dockerdata/mongodb/config
docker run --rm mongo:4.4 cat /etc/mongod.conf > /dockerdata/mongodb/config/mongod.conf
```

#### 💾 Neo4j

To extract the default `neo4j.conf` for Neo4j:

```bash
mkdir -p /dockerdata/neo4j/config
docker run --rm neo4j:5.11 cat /var/lib/neo4j/conf/neo4j.conf > /dockerdata/neo4j/config/neo4j.conf
```

### 🛠️ Post-Extraction Configuration

Once you have extracted the configuration files, you can modify them directly on the host to meet your specific needs. These configurations will automatically apply the next time the respective Docker container starts.

## 🏆 Best Practices

- **Version Control:** Use Git to manage changes to your configurations. This approach provides an audit trail and simplifies rollback procedures.
- **Environment Variables:** Store sensitive information like passwords in `.env` files, avoiding the inclusion of such data in the repository.
- **Backup:** Regularly back up your host volume directory to ensure all your container data and configurations are secure.

---

This README is designed to align with your GitHub layout and writing standards, with emojis added to enhance readability and user engagement.