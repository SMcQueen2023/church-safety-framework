# church-safety-framework

A professionally organized, **modular framework** for building and maintaining church **safety & security plans** with Git. Written in Markdown, exportable to PDF, and designed for **volunteer teams** (not paid guards). The framework emphasizes **de‑escalation**, **self‑defense only**, and **rapid hand‑off** to professional responders.

> **Read first — `DISCLAIMER.md`:** These materials are templates, **not** legal/medical/security advice. You are responsible for compliance with law, insurer requirements, and coordination with local responders. Keep sensitive items in a **private fork**.

---

## Why this exists

Most churches need clear, standardized plans but don’t have budget for bespoke systems. This repo gives you:
- **Well‑thought‑out plans** (Security, Medical, Parking) grounded in reputable guidance (FEMA/CISA/AHA/FHWA/PERF/NIJ).
- **Two Security models**: *All‑Armed* and *Mixed (Armed + Unarmed)*, each with a full **Use of Force** section.
- **Traceability** with Git (who changed what, when, and why).
- **Fast export** to share print‑ready PDFs/MD with volunteers.
- **Global variables** so you set org names, times, and points of contact **once**.

This repository is intentionally simple and production‑minded: if it isn’t needed to publish, it isn’t here.

---

## Repository layout (as shipped)

```
/                          # this README.md
├─ artifacts/              # public-safe diagrams & printables
│  ├─ emergency-diagrams/
│  ├─ exterior-diagrams/
│  ├─ interior-diagrams/
│  └─ parking/
│     └─ README.md
├─ exports/                # generated outputs (gitignored)
│  ├─ latest/
│  └─ releases/
├─ plans/                  # export-ready plan content (Markdown)
│  ├─ medical-team.md
│  ├─ parking-team.md
│  ├─ security-team-all-armed.md
│  └─ security-team-armed-mixed.md
├─ scripts/                # export helpers + docs
│  ├─ export.sh
│  ├─ export.ps1
│  ├─ README.md
│  └─ vars.env             # global variables used at export time
├─ CODEOWNERS              # (optional) requires approval on PRs
├─ SECURITY.md             # what NOT to commit
├─ DISCLAIMER.md           # legal terms & usage boundaries
├─ LICENSE                 # MIT (code/scripts)
├─ LICENSE-CC-BY-4.0       # CC BY 4.0 (docs/templates)
├─ NOTICE                  # attribution helper for CC BY content
├─ .gitignore
└─ .gitattributes
```

**Public‑safe only** here. Do **not** commit: camera coverage, DVR settings, alarm/door/lock details, comms frequencies/call‑signs, staff/child rosters or any PII, insurance policies. Put operationally sensitive materials in a **private fork** or secure storage.

---

## Requirements

- **Git** (basic usage: clone, commit, pull).
- **Pandoc** *(only required for PDFs; Markdown exports work without it)*  
  - macOS: `brew install pandoc`  
  - Windows: download from <https://github.com/jgm/pandoc/releases>  
  - Debian/Ubuntu: `sudo apt-get install pandoc`
- A Markdown editor and a PDF viewer.

---

## How the framework works

1. **Edit the plan Markdown** in `/plans`. Content is written like real operational plans—clear sections, timelines, responsibilities, and references.
2. **Set variables once** in `vars.env` (e.g., `{{CHURCH_NAME}}`, `{{STATE}}`, `{{RESPONDER_ENTRY_POINT}}`). During export, placeholders are replaced automatically; sources stay untouched.
3. **Export** using the scripts in `/scripts` to produce `.md` and (if Pandoc is installed) `.pdf` into `/exports`.
4. **Distribute** the files to volunteers and partners. Keep your edits in Git for auditability.

This keeps source clean, exports reproducible, and your reviewers focused on plan text—not formatting.

---

## Configure global variables (`vars.env`)

Define variables once and reuse across all plans. Format: `KEY=VALUE` (one per line). Blank lines and `# comments` are ignored.

```env
# Organization
CHURCH_NAME=Test Church
CAMPUS_NAME=Test Campus
CAMPUS_SHORT=Main
STATE=TN
EFFECTIVE_DATE=2025-10-01
REVIEW_CYCLE=6 months

# Times & schedule
SERVICE_TIMES=Sundays 10:00 AM CST
PREP_MIN=30
SERVICE_LENGTH=90
DISMISS_MIN=20
DEBRIEF_MIN=10
BRIEF_MINUTES=30

# Leads & titles
SECURITY_LEAD_NAME=John Doe
SECURITY_LEAD_TITLE=Security Team Lead
MEDICAL_LEAD_NAME=Jane Doe
PARKING_LEAD_NAME=Jack Smith
EXECUTIVE_PASTOR_TITLE=Executive Pastor
INSURER_NAME=Your Insurer Name

# Routes & entries
RESPONDER_ENTRY_POINT=North Lobby Doors
EMS_ENTRY_POINT=North Lobby Doors
EMS_ROUTE=Elm St to North Lot
AED_LOCATIONS_MAP_URL=https://example.com/aed-map

# Security program
ARMED_REQUAL_FREQ=12 months
CALIBER_POLICY=9mm or larger (program-approved)
CARRY_CONDITION_POLICY=Condition 1 (holstered, chambered)
ARMED_ROSTER_REVIEW_FREQ=6 months

# Mixed/medical ergonomics
MIN_STAND_TIME=60

# Parking specifics
ACCESS_GATE_KEYS=North gate keys with Parking Lead
PRIMARY_LOT_THRESHOLD=85
OVERFLOW_AREA=South Overflow Lot

# Program cadence
DRILL_FREQ=Quarterly
AED_CHECK_FREQ=Weekly
INCIDENT_NOTE_TIME=Same day
AAR_WINDOW=Within 7 days
```

> If a placeholder in a plan has no matching key in `vars.env`, it will remain visible in the exported Markdown—useful for spotting gaps before publishing.

---

## Export commands

> You can always export to **Markdown**. PDFs require **Pandoc**.

### macOS / Linux (Bash)
```bash
# one-time: make the script executable
chmod +x scripts/export.sh

# export a single plan with substitutions
bash scripts/export.sh security-team-all-armed -f vars.env

# export all plans and version them
bash scripts/export.sh security-team-all-armed  -f vars.env -v 0.2.0
bash scripts/export.sh security-team-armed-mixed -f vars.env -v 0.2.0
bash scripts/export.sh medical-team             -f vars.env -v 0.2.0
bash scripts/export.sh parking-team             -f vars.env -v 0.2.0
```

### Windows (PowerShell)
```powershell
pwsh scripts/export.ps1 -Plan security-team-all-armed   -VarsFile vars.env -Version 0.2.0
pwsh scripts/export.ps1 -Plan security-team-armed-mixed -VarsFile vars.env -Version 0.2.0
pwsh scripts/export.ps1 -Plan medical-team              -VarsFile vars.env -Version 0.2.0
pwsh scripts/export.ps1 -Plan parking-team              -VarsFile vars.env -Version 0.2.0
```

**Where files go**
- Markdown: `exports/<plan>.md`
- PDF (with Pandoc): `exports/<plan>.pdf`
- With a `-v/‑Version` flag: copies also land under `exports/releases/v<version>/…` and are mirrored in `exports/latest/`.

**Common issues**
- “**pandoc not found; skipped PDF…**” → Install Pandoc or add it to PATH.
- Placeholders still visible → Verify `-f vars.env`/`-VarsFile vars.env` and check for key name mismatches.

---

## Plans included (at a glance)

| File | Audience | Highlights |
|---|---|---|
| `plans/security-team-all-armed.md` | Security volunteers (all members armed) | Full **Use of Force** policy, eligibility & re‑qualification, on‑shift rules, LE arrival protocol, documentation & reviews. |
| `plans/security-team-armed-mixed.md` | Security volunteers (mixed armed/unarmed) | Clear split between **common**, **unarmed**, and **armed‑only** standards; full **Use of Force**; coordination rules to prevent role conflict. |
| `plans/medical-team.md` | Medical volunteers | CPR/AED required, Stop the Bleed recommended, AED program standards, service timeline, scene safety, documentation & AARs. |
| `plans/parking-team.md` | Parking volunteers | Pedestrian priority, EMS/fire‑lane control, arrival/dismissal timelines, minor incident quick‑clear mindset, LE/EMS routing. |

Each file is written to be **export‑ready**—no build system, just Markdown → PDF.

---

## Artifacts (diagrams, signage, pocket cards)

Use `/artifacts` for **public‑safe** supporting materials that plans reference. Keep the source (CAD/AI/PSD) elsewhere or in a private repo if it exposes internals. See `artifacts/README.md` for structure, naming/versioning, and classification tags: `_PUBLIC`, `_RESTRICTED`, `_CONTROLLED`.

**Do not commit** operationally sensitive content (camera coverage, key/lock details, comms, rosters/PII). Use a **private fork**.

---

## Governance & change control

This is a **public template**. Clone it and adapt locally. If you submit changes here:
- **PRs require approval** from code owners (branch protection: *Require review from Code Owners*).
- `CODEOWNERS` controls who must review changes to specific paths.
- Issues/Discussions may be limited to keep noise down.

Minimal example for `CODEOWNERS`:
```
*            @your-username
plans/       @your-username
artifacts/   @your-username
```

For your church’s internal fork, consider the same protection so plan changes are reviewed before publishing.

---

## Licensing

- **Code & scripts** (`/scripts`, any tooling): **MIT** — see `LICENSE`.
- **Content & templates** (`/plans`, public‑safe `/artifacts`): **CC BY 4.0** — see `LICENSE‑CC‑BY‑4.0`.  
- See `NOTICE` for a short attribution line you can include when redistributing modified content.

> If your church requires a different license posture, adjust and update this section accordingly.

---

## Legal & proper usage reminders

- These materials are **informational templates** only (see `DISCLAIMER.md`). They are **not** legal/medical/security advice and do **not** create a client relationship.
- You are responsible for **verifying compliance** with **your** laws, regulations, codes, and insurer requirements.
- Coordinate **in advance** with local **EMS/Fire/LE** regarding roles, access routes, and notification protocols.
- For any armed program, review **state law** and insurer conditions; ensure training and **periodic re‑qualification** are documented.
- Treat exports as **public‑safe** handouts. Anything sensitive belongs in a **private fork** or secure storage.

---

## Versioning & releases (optional but recommended)

- Add a simple `version:` line to the header of each plan and bump with material changes.
- Use the export `-v/‑Version` flag to populate `exports/releases/vX.Y.Z/` and `exports/latest/`.
- Keep changelog notes in PRs/issues for auditability and after‑action traceability.

---

## Support policy

This is a template project. **No support or customizations** are provided. Clone or use as a template, adapt locally, and review with counsel/insurer before adopting.

> If you improve the general templates (not your private details), you’re welcome to open a PR. Reviews are at the maintainers’ discretion.
