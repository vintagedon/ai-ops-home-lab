# Shell Script Header Template

> Template Version: 1.0
> Applies To: All `.sh` files
> Last Updated: 2026-03-22

---

## Template

```bash
#!/usr/bin/env bash
# =============================================================================
# Script Name  : script-name.sh
# Description  : [One-line description of what the script does]
# Repository   : [repository-name]
# Author       : VintageDon (https://github.com/vintagedon)
# Created      : YYYY-MM-DD
# Link         : https://github.com/[org]/[repository-name]
# =============================================================================
#
# DESCRIPTION
#   [2-4 sentences explaining the script's purpose, what it operates on,
#   and what outputs it produces. Include any important behavioral notes.]
#
# USAGE
#   ./script-name.sh [options]
#
# EXAMPLES
#   ./script-name.sh
#       [Description of what this invocation does]
#
#   ./script-name.sh --verbose
#       [Description of what this invocation does]
#
# =============================================================================

set -euo pipefail  # Exit on error, undefined vars, pipe failures

# =============================================================================
# Configuration
# =============================================================================

# [Configuration variables with inline comments]

# =============================================================================
# Functions
# =============================================================================

# [Function definitions if needed]

# =============================================================================
# Main
# =============================================================================

main() {
    # [Main script logic]
}

main "$@"
```

---

## Field Descriptions

| Field | Required | Description |
|-------|----------|-------------|
| Script Name | Yes | Filename for reference |
| Description | Yes | Single line, verb-led description |
| Repository | Yes | Repository name |
| Author | Yes | Name with GitHub profile link |
| Created | Yes | Creation date (YYYY-MM-DD) |
| Link | Yes | Full repository URL |
| DESCRIPTION block | Yes | Expanded multi-line explanation |
| USAGE block | Yes | Command syntax |
| EXAMPLES block | Yes | At least one usage example |

---

## Section Comments

Use banner comments to separate logical sections:

```bash
# =============================================================================
# Section Name
# =============================================================================
```

Standard sections (in order):

1. **Configuration** — Variables, paths, settings
2. **Functions** — Helper function definitions (if any)
3. **Main** — Entry point function

---

## Best Practices

```bash
# Always use strict mode
set -euo pipefail

# Use main() function pattern for cleaner structure
main() {
    # Script logic here
}

main "$@"

# Quote variables to prevent word splitting
echo "${variable}"

# Use lowercase for local variables, UPPERCASE for exports/constants
local data_path="/var/lib/data"
export DATA_ROOT="/var/lib/data"
```

---

## Notes

- Always use `#!/usr/bin/env bash` for portability
- `set -euo pipefail` catches common errors early
- Use `main()` function pattern even for simple scripts — it's easier to extend
- Keep Description line under 80 characters
- Use present tense, active voice ("Initializes..." not "This script initializes...")
