# church-safety-framework

Minimal, modular **church safety & security plans** in Markdown for **volunteer** teams (not paid guards). Built for copy-and-adapt use, with a bias for **de-escalation**, **self-defense only**, and **rapid handoff** to professional responders.

> See **`DISCLAIMER.md`** — this project provides general templates only (no legal/medical/security advice). Keep sensitive items in a **private fork**.

---

## Who this is for
- Churches that want **plain-English plans** without buying software.
- Small teams that need **Security**, **Medical**, and **Parking** basics now.
- Leaders who want **traceable edits** (Git history) and **shareable templates**.

---

## Repository layout

```
/                       # this README.md
├─ plans/               # export-ready plans (Markdown)
│  ├─ security-team.md
│  ├─ medical-team.md
│  └─ parking-team.md
├─ artifacts/           # maps, cone plans, pocket cards (public-safe only)
│  └─ README.md
├─ scripts/             # tiny export helpers
│  ├─ export.sh
│  └─ export.ps1
├─ exports/             # generated files (gitignored)
├─ references/          # (optional) PDFs you cite (FEMA/CISA/AHA)
├─ .gitignore
├─ .gitattributes
├─ LICENSE              # MIT (for code/scripts)
├─ LICENSE-CC-BY-4.0    # (optional) CC BY 4.0 for docs/templates
├─ DISCLAIMER.md
└─ SECURITY.md          # (optional) what NOT to commit
```

**Public-safe only** here. Put comms/keys/rosters/camera coverage in a **private fork**.

---

## Quick start

1. **Fill variables** in `plans/*.md` (e.g., `{{CHURCH_NAME}}`, `{{STATE}}`, `{{SERVICE_TIMES}}`).  
2. **Export** (Markdown + PDF if Pandoc is installed):
   - macOS/Linux:
     ```bash
     bash scripts/export.sh security-team
     bash scripts/export.sh medical-team
     bash scripts/export.sh parking-team
     ```
   - Windows (PowerShell):
     ```powershell
     pwsh scripts/export.ps1 -Plan security-team
     pwsh scripts/export.ps1 -Plan medical-team
     pwsh scripts/export.ps1 -Plan parking-team
     ```
   Outputs land in `exports/`.

3. **Share** the PDFs/MD with volunteers; keep iterating in Markdown.

> No Pandoc? You still get combined `.md` files in `exports/`.

---

## Plans included

| Plan | What it covers | Notes |
|---|---|---|
| `plans/security-team.md` | Roles, eligibility (volunteer), attire/equipment, **Use of Force (self-defense only)**, service timeline, incident procedures, coordination with Medical/Parking. | Optional addenda for **All-Armed** or **Mixed (Armed + Unarmed)** volunteer models. |
| `plans/medical-team.md` | CPR/AED requirement, Stop the Bleed recommendation, AED program standards, service timeline, **scene management**, documentation, EMS coordination. | Medical algorithms are **out of scope**—covered by accredited training. |
| `plans/parking-team.md` | Lot flow, pedestrian priority, cone maps, **EMS/fire lane** control, arrival/dismissal timelines, **Quick-Clearance** mindset for minor fender-benders (safety first). | Aligns with FHWA TIM concepts (adapted to private property). |

---

## Artifacts (maps, cone plans, pocket cards)

Use `artifacts/` for **public-safe** diagrams/printables. See `artifacts/README.md` for scope, naming, and classification tags (`_PUBLIC`, `_RESTRICTED`, `_CONTROLLED`).  
**Never commit:** camera coverage, key/lock details, comms frequencies, rosters/PII (private fork only).

---

## References (avoid link-rot)

Optionally store cited PDFs in `/references` (FEMA/CISA/AHA/FHWA/IACP) and link locally from plans.

---

## Versioning & exports

- Put a simple version line in each plan and bump when content changes (e.g., `version: 0.2.0`).
- Name exports predictably: `security-team.pdf`, or with context `security-team_Bartlett_2025-10-05.pdf`.
- Optional bundle: `church-safety-framework_v0.2.0_plans.zip` in `exports/`.

---

## Contribution & change control (public repo, approval required)

This is a **public template**. Clone it and adapt locally. We keep the default branch protected.

- **PRs require approval** from code owners (branch protection: *Require review from Code Owners*).
- We may disable Issues/Discussions to reduce noise.
- If you want to propose improvements, open a PR knowing reviews are required and may be declined.

**Minimal `CODEOWNERS` example** (put in `/.github/CODEOWNERS` or `/CODEOWNERS`):
```
*            @your-username
plans/       @your-username
artifacts/   @your-username
```

---

## Licensing

- **Code & scripts** (`/scripts`, any build tooling): **MIT** — see `LICENSE`.
- **Content & templates** (`/plans`, public-safe `/artifacts`): **CC BY 4.0** — see `LICENSE-CC-BY-4.0` (optional but recommended if you want attribution).

See `NOTICE` (optional) for attribution text to use when redistributing modified content.

---

## Disclaimer

This repository contains general best-practice templates for volunteer teams at houses of worship. It does **not** replace legal/medical advice or professional security services. Always adapt to your jurisdiction, insurer requirements, and local responder expectations. See **`DISCLAIMER.md`**.
