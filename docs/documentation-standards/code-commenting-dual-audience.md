# Dual-Audience Code Commenting Standard

## Philosophy

AI-assisted coding is standard practice. Code comments now serve two audiences: humans who need to understand intent, and agents who need to understand constraints. This isn't commenting theatre—annotate where it matters, not everywhere.

## Default: Human-First

Good human comments already serve agents well. Default to explaining:

- Intent — What is this trying to accomplish?
- Context — Why this approach over alternatives?
- Domain knowledge — What would a reader need to know?

```python
# van Dokkum et al. report ~30,000 seconds of HST integration. This check
# sums EXPTIME from all FLC files and compares to the claimed value.
#
# We use only the primary FLC source (HAP or original) to avoid double-
# counting, since both represent the same physical exposures.
```

This serves both audiences. An agent reading this understands what the code does and why.

## AI NOTEs: Hidden Constraints Only

Use `# AI NOTE:` when there's a non-obvious constraint that could cause subtle bugs. The test: *Would careful reading reveal this, or could an agent break something?*

```python
# AI NOTE: Do not sum both original_flc and hap_flc — they represent 
# the same physical exposures with different calibration. Double-counting
# is a validation-breaking bug.
```

```python
def check_result(name: str, status: str, ...) -> dict:
    """
    Create a standardized check result dictionary.
    ...
    """
    # AI NOTE: 'status' key is required — generate_markdown_report() and 
    # exit code logic depend on it. New status values require updating 
    # status_icons dict in generate_markdown_report().
```

### When AI NOTEs Add Value

| Situation | Example |
|-----------|---------|
| Modification boundaries | "If changing X, also update Y" |
| Hidden dependencies | "Runs after validate_hst_inventory; requires hap_flc list" |
| Required keys/contracts | "Return dict must always include 'status' key" |
| Non-obvious invariants | "Tolerance is percentage, not absolute value" |
| Cross-file coupling | "Schema must match validation_config.yaml" |

### When to Skip AI NOTEs

- Function behavior is obvious from signature and docstring
- Constraints are explicit in type hints or validation
- A careful reader would figure it out
- You're restating what the code already says

## Anti-Patterns

Commenting theatre — Mandatory markers on every function regardless of complexity.

Restating code — `# increment counter by 1` adds nothing for either audience.

Missing where it matters — No AI NOTE on a function with hidden cross-module dependencies.

Documentation substitute — Comments don't replace proper docstrings, READMEs, or architecture docs.

## Integration

This document lives in `docs/documentation-standards/` where automated review tools (Greptile, etc.) and coding agents can reference it. It's guidance for judgment calls, not a compliance checklist.
