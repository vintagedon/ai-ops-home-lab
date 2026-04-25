# Temporary Train Station

Files parked here are stale content preserved for potential data mining before permanent deletion. Nothing in this directory should be treated as current or authoritative.

**This directory must be deleted and removed from git cache before merging to main.**

## Contents

Files moved here during the April 2026 cleanup session. Sources include old cluster configurations, superseded infrastructure docs, and other artifacts from previous architectural visions that may contain recoverable hardware specs or configuration data.

## Cleanup Command

When ready to permanently remove:

```powershell
Remove-Item -Recurse -Force .\temporary-train-station\
git rm -r --cached temporary-train-station/
```
