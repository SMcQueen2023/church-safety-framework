# scripts/ — with global variables support

These exporters read **placeholders** like `{{CHURCH_NAME}}` in your plan files and replace them with values from a **global variables file** (`vars.env`) at export time. Your source files stay untouched.

You can keep any placeholders you don’t use; they’ll remain unchanged in the export.

## Usage

**Bash (macOS/Linux)**
```bash
bash scripts/export.sh security-team -f vars.env -v 0.2.0
```

**PowerShell (Windows/macOS/Linux)**
```powershell
pwsh scripts/export.ps1 -Plan security-team -VarsFile vars.env -Version 0.2.0
```

- Outputs: `exports/<plan>.md` (+ `.pdf` if Pandoc is installed)
- With a version: also copies to `exports/releases/v<version>/` and updates `exports/latest/`

## Notes
- Lines starting with `#` or blank lines in `vars.env` are ignored.
- Values are treated literally (no special regex needed). In Bash we build a small `sed` script; in PowerShell we use string `.Replace()`.
- If the variables file isn’t found, export proceeds without substitutions.