# scripts/

Tiny, zero-dependency exporters for the plans. They copy a single Markdown plan from `/plans` to `/exports`, and (if **Pandoc** is installed) also generate a PDF.

## Bash (macOS/Linux)

```bash
bash scripts/export.sh <plan> [-v <version>] [-o <outdir>]

# Examples
bash scripts/export.sh security-team
bash scripts/export.sh medical-team -v 0.2.0
bash scripts/export.sh parking-team -o exports
```

## PowerShell (Windows/macOS/Linux)

```powershell
pwsh scripts/export.ps1 -Plan <plan> [-Version <version>] [-OutDir <outdir>]

# Examples
pwsh scripts/export.ps1 -Plan security-team
pwsh scripts/export.ps1 -Plan medical-team -Version 0.2.0
pwsh scripts/export.ps1 -Plan parking-team -OutDir exports
```

### Notes
- Reads from: `plans/<plan>.md`
- Writes to:  `<outdir>/<plan>.md` (+ `<plan>.pdf` if Pandoc is installed)
- If a version is supplied, also writes to `<outdir>/releases/v<version>/` and updates `<outdir>/latest/`

### Optional Pandoc install
- macOS: `brew install pandoc`
- Windows: https://github.com/jgm/pandoc/releases
- Linux (Debian/Ubuntu): `sudo apt-get install pandoc` (or download latest release)
