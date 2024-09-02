# MariaDB Configurations 🐬

## Table of Contents
- [MariaDB Configurations 🐬](#mariadb-configurations-)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [File Structure](#file-structure)
  - [50-server.cnf](#50-servercnf)
  - [Usage](#usage)
  - [Customization](#customization)

## Overview

This directory contains MariaDB configuration files for the AI Ops Home Lab project. These configurations are optimized for our lab environment and are designed to work with our specific setup of multiple database instances running on shared hardware.

## File Structure

```
configs/
└── applications/
    └── mariadb/
        ├── 50-server.cnf
        └── README.md (this file)
```

## 50-server.cnf

The `50-server.cnf` file is our main MariaDB configuration file. It's optimized for the following environment:

- **Host**: docker01
- **Environment**: Lab with 6 databases
- **Server specs**: 4 cores, 16GB RAM, NVMe drive

Key features of this configuration:

- Optimized for shared resources
- InnoDB settings tuned for NVMe storage
- Query cache disabled for better performance
- Binary logging disabled (suitable for lab environment)
- Moderate table and definition cache sizes

For detailed configuration options, please refer to the comments within the `50-server.cnf` file.

## Usage

To use this configuration:

1. Copy `50-server.cnf` to `/etc/mysql/mariadb.conf.d/` on your MariaDB server.
2. Restart the MariaDB service:
   ```
   sudo systemctl restart mariadb
   ```
3. Monitor performance and adjust settings as needed.

## Customization

While this configuration is optimized for our specific setup, you may need to adjust it based on your actual usage patterns. Key areas to consider for customization include:

- `max_connections`: Adjust based on your application's needs
- `innodb_buffer_pool_size`: May need to be increased or decreased based on available RAM
- `innodb_io_capacity` and `innodb_io_capacity_max`: Fine-tune based on your specific NVMe drive's capabilities

Always test changes in a non-production environment before applying them to your live system.

