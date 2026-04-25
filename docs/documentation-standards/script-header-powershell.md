# PowerShell Script Header Template

> Template Version: 1.0
> Applies To: All `.ps1` files
> Last Updated: 2026-03-22

---

## Template

```powershell
<#
.SYNOPSIS
    [One-line description of what the script does]

.DESCRIPTION
    [2-4 sentences explaining the script's purpose, what it operates on,
    and what outputs it produces. Include any important behavioral notes.]

.NOTES
    Repository  : [repository-name]
    Author      : VintageDon (https://github.com/vintagedon)
    Created     : YYYY-MM-DD

.EXAMPLE
    .\script-name.ps1

    [Description of what this invocation does]

.EXAMPLE
    .\script-name.ps1 -Parameter Value

    [Description of what this invocation does]

.LINK
    https://github.com/[org]/[repository-name]
#>

# =============================================================================
# Configuration
# =============================================================================

# [Configuration variables with inline comments]

# =============================================================================
# Functions
# =============================================================================

# [Function definitions if needed]

# =============================================================================
# Execution
# =============================================================================

# [Main script logic]
```

---

## Field Descriptions

| Field | Required | Description |
|-------|----------|-------------|
| `.SYNOPSIS` | Yes | Single line, verb-led description |
| `.DESCRIPTION` | Yes | Expanded explanation of purpose and behavior |
| `.NOTES` | Yes | Static metadata (repository, author, dates) |
| `.EXAMPLE` | Yes | At least one usage example with description |
| `.LINK` | Yes | Repository URL |
| `.PARAMETER` | If applicable | Document any script parameters |

---

## Section Comments

Use banner comments to separate logical sections:

```powershell
# =============================================================================
# Section Name
# =============================================================================
```

Standard sections (in order):

1. **Configuration** — Variables, paths, settings
2. **Functions** — Helper function definitions (if any)
3. **Execution** — Main script logic

---

## Example: Minimal Script

```powershell
<#
.SYNOPSIS
    Validates configuration files across all subdirectories.

.DESCRIPTION
    Scans all subdirectories and validates that each config file
    is syntactically correct. Outputs a summary of validation results.

.NOTES
    Repository  : [repository-name]
    Author      : VintageDon (https://github.com/vintagedon)
    Created     : YYYY-MM-DD

.EXAMPLE
    .\validate-configs.ps1

    Validates all configuration files in the repository.

.LINK
    https://github.com/[org]/[repository-name]
#>

# =============================================================================
# Configuration
# =============================================================================

$RepoRoot = Split-Path -Parent $PSScriptRoot

# =============================================================================
# Execution
# =============================================================================

Get-ChildItem -Path $RepoRoot -Recurse -Filter "*.config" | ForEach-Object {
    Write-Host "Validating: $($_.FullName)"
    # Validation logic here
}
```

---

## Notes

- PowerShell comment-based help (`.SYNOPSIS`, `.DESCRIPTION`, etc.) enables `Get-Help script-name.ps1`
- Keep `.SYNOPSIS` under 80 characters
- Use present tense, active voice ("Validates..." not "This script validates...")
