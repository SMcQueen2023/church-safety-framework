# {{CHURCH_NAME}} — Artifacts

This folder holds **supporting materials** for the Safety & Security plans: maps, diagrams, parking layouts, pocket cards, and printable signage. Keep it **public-safe**; move sensitive items to your **private fork**.

---

## What goes here (public-safe)
- **Floorplans (sanitized):** basic layout, exits/egress, AEDs, extinguishers (no door keys, alarm zones, or camera IPs).
- **Parking plans:** cone maps, overflow routing, pedestrian crossings, EMS/fire lane.
- **Routes:** EMS/fire approach, responder entry points, evacuation routes (no lock/badge details).
- **Signage:** printable PDFs (wayfinding, EMS lane, overflow).
- **Pocket cards:** role quick references (greeter/security/medical) that contain no PII.

**Do *not* put here (use your private fork):** camera coverage, DVR configs, door schedules, key/lock info, comms frequencies/call signs, staff rosters, phone lists, children’s area security details, insurance docs.

---
## Folder Structure
- **interior-diagrams:** basic layout, exits/egress, AEDs, extinguishers (no door keys, alarm zones, or camera IPs).
- **exterior-diagrams:** cone maps, overflow routing, pedestrian crossings, EMS/fire lane.
- **emergency-diagrams:** EMS/fire approach, responder entry points, evacuation routes (no lock/badge details), triage/medical care, family reunification.
- **parking:** Standard parking diagram for Sunday service and modified diagrams for other events as needed.

---

## Classification tags
Use one of these **in the filename** so people don’t have to open the file to know the sensitivity:

- `_PUBLIC` — safe for public sharing.
- `_RESTRICTED` — operationally sensitive; share on a need-to-know basis.
- `_CONTROLLED` — keep in **private** repo only.

**Examples**
- `floorplans/{{CAMPUS_SHORT}}_egress_aed_v1_PUBLIC.pdf`
- `routes/ems_route_entry_v2_PUBLIC.pdf`
- `utilities/shutoffs_map_v1_RESTRICTED.pdf` *(prefer private fork)*

---

## Naming & versioning
Use a consistent pattern so exports don’t get messy:

---
**Examples**
- `parking/cone-map_sunday-am_v1.2_PUBLIC.pdf`
- `pocket-cards/security_quick-ref_v1.0_PUBLIC.pdf`

When a diagram changes materially, bump **major**; minor for small tweaks.

---

## Quality bar (so artifacts are actually usable)
- **Legends & scale:** Every map needs a legend, clear labels, and readable fonts (≥10pt at print size).
- **Color + mono:** Provide a color PDF and a black-and-white friendly version if color carries meaning.
- **Accessibility:** Use high contrast; don’t rely on color alone for critical info.
- **Print-ready:** Export at **300 DPI** for printables; PDF preferred. Keep the editable source (SVG/AI) out of the repo or in private storage if it reveals internals.

---

## Minimal set (start here)
- `floorplans/{{CAMPUS_SHORT}}_egress_aed_v1_PUBLIC.pdf`
- `parking/cone-map_sunday-am_v1_PUBLIC.pdf`
- `routes/ems-route_entry-point_v1_PUBLIC.pdf`
- `signage/ems-lane_keep-clear_v1_PUBLIC.pdf`
- `pocket-cards/security_quick-ref_v1_PUBLIC.pdf`

---

## Privacy & safety guardrails
- **No PII** in artifacts. No phone lists, birthdays, medical info, or rosters.
- **Sanitize floorplans:** remove alarm zones, camera IDs, keypad locations, key lockers.
- **Children’s areas:** show exits and medical gear, but omit badge/lock details in public files.

---

## Change control
- Keep exports here (`artifacts/…`) and **source files** (AI, PSD, CAD) elsewhere or in a private repo.
- Reference artifact filenames and versions in your plan (e.g., “See `routes/ems-route_entry-point_v1_PUBLIC.pdf`”).
- When a plan changes because an artifact changed, bump the plan version and update the reference.

---

## Variables to set before publishing
{{CHURCH_NAME}}, {{CAMPUS_SHORT}}