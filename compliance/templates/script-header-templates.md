<!--
---
title: "Standardized Script Headers Reference Guide"
description: "Copy-paste reference for consistent file headers across bash scripts, Python scripts, Docker Compose files, and environment templates"
author: "VintageDon - https://github.com/vintagedon"
source_repository: "https://github.com/Proxmox-Astronomy-Lab/proxmox-astronomy-lab"
ai_contributor: "Claude Sonnet 4.5 (anthropic/claude-sonnet-4-5-20250929)"
date: "2025-11-01"
version: "1.0"
status: "Published"
tags:
- type: kb-article
- domain: infrastructure
- tech: bash, python, docker
- project: proxmox-astronomy-lab
related_documents:
- "[Repository README](../README.md)"
- "[Contributing Guidelines](../CONTRIBUTING.md)"
---
-->

# 📄 Standardized Script Headers Reference Guide

This article provides copy-paste templates for consistent file headers across the Proxmox Astronomy Lab codebase. It serves as a quick reference for maintainers ensuring standardized commenting practices across bash scripts, Python scripts, Docker Compose files, and environment templates.

# 🎯 1. Introduction

This section establishes the context and purpose for standardized script headers within the repository.

## 1.1 Purpose

This article provides standardized comment block templates for all script and configuration files in the Proxmox Astronomy Lab repository. These templates ensure consistent metadata, usage documentation, and maintainability across the codebase.

## 1.2 Scope

This subsection defines what file types are covered and what falls outside this guide's coverage.

| In Scope | Out of Scope |
|--------------|------------------|
| Bash script headers (.sh files) | Markdown documentation headers (covered in doc templates) |
| Python script headers (.py files) | Ansible playbook headers (separate standard) |
| Docker Compose file headers (docker-compose.yaml) | Kubernetes manifest headers (separate standard) |
| Environment file headers (.env, example.env) | Application-specific config files (varies by app) |

This guide focuses exclusively on executable scripts and infrastructure configuration files requiring standardized comment blocks.

## 1.3 Target Audience

This subsection identifies who should use this reference guide.

Primary Audience: Repository contributors, infrastructure maintainers, automation developers  
Required Background: Basic understanding of shell scripting, Python, and container orchestration

# 📝 2. Script Header Templates

This section provides copy-paste templates for each file type with explanations of required elements.

## 2.1 Bash Script Headers

Standard header template for all bash scripts in the repository.

```bash
#!/usr/bin/env bash

################################################################################
# Script Name: script-name.sh
# Description: Brief description of what this script does and its primary purpose
# 
# Author: VintageDon - https://github.com/vintagedon
# Repository: https://github.com/Proxmox-Astronomy-Lab/proxmox-astronomy-lab
# License: MIT
# Version: 1.0
# Date: YYYY-MM-DD
#
# Usage: 
#   ./script-name.sh [options]
#
# Options:
#   -h, --help        Show this help message
#   -v, --verbose     Enable verbose output
#   -d, --dry-run     Show what would be done without executing
#
# Examples:
#   ./script-name.sh --verbose
#   ./script-name.sh --dry-run
#
# Expected Output:
#   - Status messages during execution
#   - Success/failure confirmation
#   - Error messages to stderr if failures occur
#
# Exit Codes:
#   0 - Success
#   1 - General error
#   2 - Invalid arguments
#
# Requirements:
#   - bash 4.0 or higher
#   - Required commands: jq, curl (list any external dependencies)
#
# Notes:
#   - Add any important warnings or operational notes here
#   - Document any environment variables this script expects
################################################################################

# Uncomment for strict error handling (recommended for production scripts)
# set -euo pipefail

# Script constants
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly SCRIPT_NAME="$(basename "${BASH_SOURCE[0]}")"

# Main script logic begins here
```

Template Elements:

- Shebang: Uses `#!/usr/bin/env bash` for portability across systems
- Metadata Block: Repository attribution, license, version tracking
- Usage Section: Command syntax and available options
- Examples: Real-world usage patterns for common scenarios
- Expected Output: What users should see when script runs successfully
- Exit Codes: Standard status codes for scripting integration
- Requirements: Dependencies and prerequisites
- Notes: Operational warnings, environment variables, or special considerations

When to Modify:

- Add options as script functionality grows
- Update examples to reflect actual use cases
- Document environment variables if script depends on them
- Expand exit codes if script has multiple failure modes

## 2.2 Python Script Headers

Standard header template for Python scripts and modules.

```python
#!/usr/bin/env python3

"""
Module Name: module_name.py

Brief description of what this module/script does and its primary purpose.

Author: VintageDon - https://github.com/vintagedon
Repository: https://github.com/Proxmox-Astronomy-Lab/proxmox-astronomy-lab
License: MIT
Version: 1.0
Date: YYYY-MM-DD

Usage:
    python3 module_name.py [options]
    
    As a module:
    from module_name import function_name

Options:
    -h, --help          Show this help message
    -v, --verbose       Enable verbose output
    -c, --config FILE   Specify configuration file

Examples:
    # Basic usage
    python3 module_name.py --verbose
    
    # With configuration file
    python3 module_name.py --config /path/to/config.yaml
    
    # As imported module
    from module_name import process_data
    result = process_data(input_data)

Expected Output:
    - Progress indicators during processing
    - Success/failure status messages
    - Structured output (JSON/CSV) if applicable
    - Errors logged to stderr

Exit Codes:
    0 - Success
    1 - General error
    2 - Invalid arguments
    3 - Configuration error

Requirements:
    - Python 3.8 or higher
    - Required packages: requests, pyyaml, pandas (list dependencies)
    - Optional packages: pytest (for testing)

Environment Variables:
    API_KEY         - Required API authentication token
    CONFIG_PATH     - Optional path to configuration directory
    LOG_LEVEL       - Optional logging level (DEBUG/INFO/WARNING/ERROR)

Notes:
    - This script requires network access for API calls
    - Large datasets may require significant memory
    - See requirements.txt for exact dependency versions
"""

import sys
import argparse
import logging
from pathlib import Path
from typing import Optional, List, Dict, Any

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Constants
VERSION = "1.0"
DEFAULT_CONFIG_PATH = Path.home() / ".config" / "proxmox-astronomy-lab"

# Main script logic begins here
```

Template Elements:

- Shebang: Uses `#!/usr/bin/env python3` for executable scripts (omit for library modules)
- Docstring: Triple-quoted documentation block with comprehensive metadata
- Metadata Block: Same attribution pattern as bash scripts
- Usage Section: Command-line and programmatic usage patterns
- Examples: Both CLI and import usage examples
- Expected Output: What users/callers should expect
- Exit Codes: Return status for CLI usage
- Requirements: Python version and package dependencies
- Environment Variables: External configuration expectations
- Notes: Operational considerations and resource requirements

When to Modify:

- Add type hints to function signatures (recommended for all functions)
- Document class docstrings following same pattern
- Expand examples for complex APIs
- Note breaking changes in version updates

Python-Specific Standards:

- Import organization: stdlib → third-party → local (separated by blank lines)
- Constants in UPPER_CASE after imports
- Logger configuration for all scripts
- Type hints for function signatures (Optional, List, Dict, etc.)

## 2.3 Docker Compose File Headers

Standard header template for docker-compose.yaml files.

```yaml
################################################################################
# Docker Compose Configuration
# 
# Service: Service or application stack name
# Description: Brief description of what this compose stack provides
#
# Author: VintageDon - https://github.com/vintagedon
# Repository: https://github.com/Proxmox-Astronomy-Lab/proxmox-astronomy-lab
# License: MIT
# Version: 1.0
# Date: YYYY-MM-DD
#
# Usage:
#   docker compose up -d                    # Start all services
#   docker compose down                     # Stop all services
#   docker compose logs -f [service]        # View logs
#   docker compose ps                       # List running services
#
# Services Defined:
#   - service1: Brief description of service1 purpose
#   - service2: Brief description of service2 purpose
#   - service3: Brief description of service3 purpose
#
# Networks:
#   - network_name: Purpose and VLAN/subnet information if applicable
#
# Volumes:
#   - volume_name: Data persistence purpose and backup considerations
#
# Environment Variables Required:
#   See .env.example or example.env for required variables
#
# Ports Exposed:
#   - 8080:80   - Service1 web interface
#   - 5432:5432 - Service2 database port
#
# Prerequisites:
#   - Docker Engine 20.10+
#   - Docker Compose V2
#   - Configured .env file (copy from example.env)
#   - Required volumes/directories created
#
# Health Checks:
#   All services include health checks with:
#   - Interval: 30s
#   - Timeout: 10s
#   - Retries: 3
#
# Backup Considerations:
#   - volume_name: Daily backup recommended (contains persistent data)
#   - Configuration files in ./config/ directory
#
# Security Notes:
#   - All services run as non-root users
#   - Secrets managed via Docker secrets (see secrets section)
#   - Network isolation enforced (see networks section)
#
# Notes:
#   - Modify resource limits based on available system resources
#   - Update image tags regularly for security patches
#   - See documentation for service-specific configuration
################################################################################

version: '3.8'

services:
  # Service definitions begin here
```

Template Elements:

- Service Description: What application stack this compose file deploys
- Metadata Block: Standard repository attribution
- Usage Section: Common docker compose commands for this stack
- Services Defined: List of services with brief purposes
- Networks: Network configuration and isolation strategy
- Volumes: Data persistence locations and backup requirements
- Environment Variables: Reference to .env file requirements
- Ports Exposed: External access points and their purposes
- Prerequisites: Docker version requirements and setup steps
- Health Checks: Monitoring configuration summary
- Backup Considerations: Data persistence and recovery planning
- Security Notes: Security hardening measures implemented
- Notes: Operational warnings and customization guidance

When to Modify:

- Update service list as stack composition changes
- Document inter-service dependencies
- Add performance tuning notes for resource-constrained environments
- Note version-specific breaking changes

## 2.4 Environment File Headers

Standard header template for example.env and .env.template files.

```bash
################################################################################
# Environment Configuration Template
#
# File: example.env (or .env.template)
# Description: Environment variables for [service/application name]
#
# Author: VintageDon - https://github.com/vintagedon
# Repository: https://github.com/Proxmox-Astronomy-Lab/proxmox-astronomy-lab
# License: MIT
# Version: 1.0
# Date: YYYY-MM-DD
#
# Usage:
#   1. Copy this file: cp example.env .env
#   2. Edit .env with your specific values
#   3. Never commit .env to version control (already in .gitignore)
#
# Required Variables:
#   Variables marked [REQUIRED] must be set for application to function
#
# Optional Variables:
#   Variables marked [OPTIONAL] have defaults or can be omitted
#
# Security:
#   - Keep .env files secure (contains sensitive credentials)
#   - Use strong passwords and rotate regularly
#   - Never share .env files or commit them to repositories
#   - Consider using Docker secrets for production deployments
#
# Notes:
#   - Boolean values: true/false (lowercase)
#   - Paths: Use absolute paths or paths relative to docker-compose.yaml
#   - Ports: Ensure no conflicts with other services on host
#   - Generate secure random values for SECRET_KEY variables
################################################################################

#------------------------------------------------------------------------------
# Application Configuration
#------------------------------------------------------------------------------

# Application mode [REQUIRED]
# Options: development, production
# Default: development
APP_MODE=development

# Application secret key [REQUIRED]
# Generate with: openssl rand -hex 32
# WARNING: Change this in production!
SECRET_KEY=your-secret-key-here

# Application port [REQUIRED]
# Default: 8080
APP_PORT=8080

#------------------------------------------------------------------------------
# Database Configuration
#------------------------------------------------------------------------------

# Database type [REQUIRED]
# Options: postgresql, mysql, sqlite
DB_TYPE=postgresql

# Database connection [REQUIRED]
DB_HOST=localhost
DB_PORT=5432
DB_NAME=database_name
DB_USER=database_user
DB_PASSWORD=changeme_secure_password

# Database pool settings [OPTIONAL]
# Adjust based on expected load
DB_POOL_MIN=2
DB_POOL_MAX=10

#------------------------------------------------------------------------------
# Authentication & Security
#------------------------------------------------------------------------------

# JWT secret [REQUIRED]
# Generate with: openssl rand -base64 32
JWT_SECRET=your-jwt-secret-here

# Session timeout in seconds [OPTIONAL]
# Default: 3600 (1 hour)
SESSION_TIMEOUT=3600

# Enable HTTPS [OPTIONAL]
# Default: false (true for production)
ENABLE_HTTPS=false

#------------------------------------------------------------------------------
# External Services
#------------------------------------------------------------------------------

# API endpoint [OPTIONAL]
# Leave empty to use default
API_ENDPOINT=https://api.example.com

# API authentication [REQUIRED if using external API]
API_KEY=your-api-key-here
API_SECRET=your-api-secret-here

#------------------------------------------------------------------------------
# Logging & Monitoring
#------------------------------------------------------------------------------

# Log level [OPTIONAL]
# Options: DEBUG, INFO, WARNING, ERROR, CRITICAL
# Default: INFO
LOG_LEVEL=INFO

# Log file path [OPTIONAL]
# Leave empty to log to stdout only
LOG_FILE=/var/log/app/application.log

#------------------------------------------------------------------------------
# Feature Flags
#------------------------------------------------------------------------------

# Enable experimental features [OPTIONAL]
# Default: false
ENABLE_EXPERIMENTAL=false

# Enable metrics collection [OPTIONAL]
# Default: true
ENABLE_METRICS=true

#------------------------------------------------------------------------------
# End of Configuration
#------------------------------------------------------------------------------
# Add additional sections as needed following the same pattern:
# - Section header with descriptive comment block
# - Variable with inline comment explaining purpose
# - Note requirements ([REQUIRED]/[OPTIONAL]) and defaults
################################################################################
```

Template Elements:

- File Purpose: Identifies this as an environment template
- Metadata Block: Standard repository attribution
- Usage Section: How to create working .env from template
- Required/Optional Marking: Clear indication of mandatory variables
- Security Section: Warnings about credential handling
- Notes: Value format expectations and generation commands
- Sectioned Variables: Logical grouping with comment blocks
- Inline Documentation: Each variable explained with purpose, options, defaults
- Value Generation: Commands for generating secure random values where needed

When to Modify:

- Add new sections for new service integrations
- Document value formats and validation rules
- Include example values (non-sensitive) where helpful
- Note environment-specific overrides (dev vs production)

Environment File Best Practices:

- Group related variables in sections
- Mark [REQUIRED] vs [OPTIONAL] clearly
- Provide defaults in comments
- Include value generation commands for secrets
- Use descriptive variable names (DB_HOST not just HOST)
- Add validation rules in comments (e.g., "must be integer 1-65535")

# 🔗 3. Related Resources

This section provides connections to related documentation and external standards.

## 3.1 Internal Resources

| Resource Type | Title | Relationship | Link |
|-------------------|-----------|------------------|----------|
| Repository | Main README | Repository overview | [README.md](../README.md) |
| Guide | Contributing Guidelines | Contribution standards | [CONTRIBUTING.md](../CONTRIBUTING.md) |
| Template | General KB Article | Documentation template | [kb-template-general.md](../templates/kb-template-general.md) |

## 3.2 External Resources

- [Bash Style Guide (Google)](https://google.github.io/styleguide/shellguide.html) - Shell scripting best practices
- [PEP 8 - Python Style Guide](https://pep8.org/) - Python code style standards
- [Docker Compose Specification](https://docs.docker.com/compose/compose-file/) - Official compose file reference
- [The Twelve-Factor App](https://12factor.net/config) - Configuration management principles
- [MIT License](https://opensource.org/licenses/MIT) - License text and usage

# 📜 4. Documentation Metadata

This section provides information about article creation and revision history.

## 4.1 Change Log

| Version | Date | Changes | Author | Pipeline | Review Status |
|------------|---------|-------------|------------|--------------|-------------------|
| 1.0 | 2025-11-01 | Initial reference guide creation | VintageDon | Claude Sonnet 4.5 | Published |
