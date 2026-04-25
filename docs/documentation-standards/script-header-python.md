# Python Script Header Template

> Template Version: 1.0
> Applies To: All `.py` files
> Last Updated: 2026-03-22

---

## Template

```python
#!/usr/bin/env python3
"""
Script Name  : script_name.py
Description  : [One-line description of what the script does]
Repository   : [repository-name]
Author       : VintageDon (https://github.com/vintagedon)
Created      : YYYY-MM-DD
Link         : https://github.com/[org]/[repository-name]

Description
-----------
[2-4 sentences explaining the script's purpose, what it operates on,
and what outputs it produces. Include any important behavioral notes.]

Usage
-----
    python script_name.py [options]

Examples
--------
    python script_name.py
        [Description of what this invocation does]

    python script_name.py --verbose
        [Description of what this invocation does]
"""

# =============================================================================
# Imports
# =============================================================================

from pathlib import Path

# =============================================================================
# Configuration
# =============================================================================

# [Configuration constants with inline comments]

# =============================================================================
# Functions
# =============================================================================


def main() -> None:
    """Entry point for script execution."""
    pass


# =============================================================================
# Entry Point
# =============================================================================

if __name__ == "__main__":
    main()
```

---

## Field Descriptions

| Field | Required | Description |
|-------|----------|-------------|
| Script Name | Yes | Filename for reference (snake_case) |
| Description | Yes | Single line, verb-led description |
| Repository | Yes | Repository name |
| Author | Yes | Name with GitHub profile link |
| Created | Yes | Creation date (YYYY-MM-DD) |
| Link | Yes | Full repository URL |
| Description section | Yes | Expanded multi-line explanation |
| Usage section | Yes | Command syntax |
| Examples section | Yes | At least one usage example |

---

## Section Comments

Use banner comments to separate logical sections:

```python
# =============================================================================
# Section Name
# =============================================================================
```

Standard sections (in order):

1. **Imports** — Standard library, third-party, local imports (in that order)
2. **Configuration** — Constants, paths, settings
3. **Functions** — Function and class definitions
4. **Entry Point** — `if __name__ == "__main__":` block

---

## Docstring Style

Use NumPy-style docstrings for functions:

```python
def validate_file(
    file_path: Path,
    strict: bool = False
) -> dict:
    """
    Validate a configuration file.

    Parameters
    ----------
    file_path : Path
        Path to the file.
    strict : bool, optional
        Enable strict validation mode. Default is False.

    Returns
    -------
    dict
        Validation result with keys: 'valid', 'errors', 'warnings'.

    Raises
    ------
    FileNotFoundError
        If file does not exist.
    """
    pass
```

---

## Notes

- Use `#!/usr/bin/env python3` for portability
- Module docstring goes immediately after shebang
- Keep Description line under 80 characters
- Use present tense, active voice ("Validates..." not "This script validates...")
- Use `pathlib.Path` instead of string paths
- Use type hints for all function parameters and return values
- Follow PEP 8 style guide
