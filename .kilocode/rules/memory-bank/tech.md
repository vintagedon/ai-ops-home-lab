# [PROJECT/AREA/SCOPE NAME] Technology Stack

<!-- 
Purpose: Technologies, tools, setup instructions, and technical constraints
Audience: AI agents needing to understand the technical environment
Update Frequency: When technologies are added/removed or setup changes
-->

## Technology Stack

<!-- Core technologies, frameworks, languages, or tools used -->

### Primary Technologies
- **[Technology 1]:** [Version] - [Purpose/role]
- **[Technology 2]:** [Version] - [Purpose/role]
- **[Technology 3]:** [Version] - [Purpose/role]

<!-- Example: "Python: 3.11+ - Core scripting and automation" -->

### Supporting Technologies
- **[Technology 1]:** [Version] - [Purpose/role]
- **[Technology 2]:** [Version] - [Purpose/role]
- **[Technology 3]:** [Version] - [Purpose/role]

<!-- 
Adapt to scope:
- Projects/Repos: Programming languages, frameworks, libraries
- Life Areas: Applications, tools, platforms used for organization
-->

## Dependencies

<!-- External dependencies, libraries, services required -->

### Required Dependencies
```
[dependency-1]==[version]  # [Purpose]
[dependency-2]==[version]  # [Purpose]
[dependency-3]>=[version]  # [Purpose]
```

### Optional Dependencies
```
[dependency-1]==[version]  # [Purpose, when needed]
[dependency-2]==[version]  # [Purpose, when needed]
```

<!-- For life areas, this might be "Required Tools" like Obsidian, specific plugins, etc. -->

## Development Environment

<!-- How to set up the environment to work on this -->

### Prerequisites
- [Prerequisite 1 with version requirements]
- [Prerequisite 2 with version requirements]
- [Prerequisite 3 with version requirements]

### Setup Instructions

```bash
# Clone/access
[command to get the project/area]

# Install dependencies
[command to install dependencies]

# Configure
[command to configure environment]

# Verify setup
[command to verify everything works]
```

### Environment Variables / Configuration

```bash
[VAR_NAME]=value  # [Description of what this configures]
[VAR_NAME]=value  # [Description of what this configures]
```

<!-- Or for life areas: "Configuration files" or "Setup requirements" -->

## Infrastructure

<!-- Where this runs, hosting, services, or organizational infrastructure -->

### Hosting / Runtime Environment
- **Platform:** [Where this runs - cloud, local, VM, etc.]
- **Resources:** [Memory, CPU, storage requirements]
- **Access:** [How to access, URLs, connection details]

<!-- Example: "Runs on agents01 VM (192.168.100.11) with 4GB RAM allocated" -->

### External Services
- **[Service 1]:** [Purpose, authentication method, usage]
- **[Service 2]:** [Purpose, authentication method, usage]

<!-- Example: "GitHub: Repository hosting, SSH key authentication" -->

## Technical Constraints

<!-- Limitations, requirements, or technical boundaries -->

### Performance Requirements
- [Constraint 1 - latency, throughput, etc.]
- [Constraint 2 - latency, throughput, etc.]

### Security Constraints
- [Security requirement or limitation]
- [Security requirement or limitation]

<!-- Example: "All data encrypted at rest with Bitlocker, E2E sync via Obsidian Sync" -->

### Compatibility Requirements
- [Platform compatibility]
- [Version requirements]
- [Integration constraints]

## Development Workflow

<!-- How to work on this technically -->

### Version Control
- **Repository:** [Git URL or location]
- **Branching Strategy:** [How branches are used]
- **Commit Conventions:** [How to write commit messages]

### Testing
- **Test Framework:** [What's used for testing]
- **Test Coverage:** [Current coverage, goals]
- **Running Tests:** `[command to run tests]`

### Build and Deployment

```bash
# Build
[command to build]

# Test
[command to test]

# Deploy
[command to deploy]
```

## Automation and Tooling

<!-- Scripts, automation, CI/CD, or workflow tooling -->

### Available Scripts
- `[script-name]` - [What it does]
- `[script-name]` - [What it does]
- `[script-name]` - [What it does]

### CI/CD
- **Platform:** [GitHub Actions, Jenkins, etc.]
- **Triggers:** [When automation runs]
- **Pipelines:** [What automated processes exist]

### Development Tools
- **[Tool 1]:** [Purpose, how used]
- **[Tool 2]:** [Purpose, how used]

<!-- Example: "Obsidian: Primary interface for vault management" -->

## Troubleshooting

<!-- Common issues and solutions -->

### Common Issues

#### [Issue 1]
**Problem:** [Description of the issue]  
**Solution:** [How to resolve]

#### [Issue 2]
**Problem:** [Description of the issue]  
**Solution:** [How to resolve]

### Debug Commands

```bash
# Check [something]
[command]

# Verify [something]
[command]

# Reset [something]
[command]
```

## Technical Documentation

<!-- Links to relevant technical documentation -->

- **[Technology/Tool]:** [Link to docs]
- **[Technology/Tool]:** [Link to docs]
- **Internal Runbooks:** [Path to operational procedures]

<!--
SCOPE ADAPTATIONS:

Projects/Repos: Focus on programming languages, frameworks, build systems
Life Areas: Focus on applications, tools, platforms used for organization
Both: Setup instructions, technical constraints, workflow tooling

This file should answer "What technologies are involved?" and "How do I set this up?"
Keep setup instructions current - stale setup docs are worse than no docs.
-->
