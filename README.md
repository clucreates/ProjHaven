# Project Haven

An original cooperative survival strategy game — currently a playable web prototype.

**The game:** draft 5 heroes from a roster of 12, then watch them auto-battle the Hollow King across four escalating phases. Cooperative-first design: collaboration against a universal threat, healthy competition underneath, zero pay-to-win.

## Play it

Open `index.html` in any modern browser. No build step, no dependencies.

## What's in the prototype

- **Draft screen** — pick 5 of 12 heroes (tank / damage / support), choose per-hero loadouts (2 ability + 2 ult variants each)
- **Scout report** — pre-battle intel on boss stances, phase order, and add composition
- **Auto-battle** — the Hollow King fights in rotating stances (Bulwark / Reaver / Oracle) with jobbed adds (Mend heals, Ward shields)
- **Manual layer** — tap-to-fire ultimates, tap-an-enemy focus fire, player-driven combo meter, auto-ult toggle
- **Boss personality** — taunts, telegraphed attacks, phase banners
- **Juice & sound** — screen shake, particles, slow-mo killing blow, procedural WebAudio (mutable)
- **Mutators** — Glass Court (+damage both ways), Creeping Ash (round chip damage)
- **Data Lab** — pick/win rates, defeat-by-phase analysis, JSON export

## Telemetry

The game streams playtest events to Supabase. Run `supabase-schema.sql` in the
Supabase SQL editor to create the `ph_sessions` / `ph_events` tables, then set
the project URL and publishable key where indicated in `index.html`.

## Status

Prototype. Art is placeholder, hero names/kits are drafts, balance is tuning in
progress. 100% original IP — no borrowed assets, code, or content.
