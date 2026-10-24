-- Project Haven — Supabase telemetry schema (prototype)
-- Run this in the Supabase SQL editor after creating a free project.

-- One row per playtest session
create table if not exists ph_sessions (
  id uuid primary key default gen_random_uuid(),
  started_at timestamptz not null default now(),
  ended_at timestamptz,
  user_agent text,
  meta jsonb not null default '{}'::jsonb
);

-- One row per game event (draft picks, battle turns, results, UI actions)
create table if not exists ph_events (
  id bigint generated always as identity primary key,
  session_id uuid not null references ph_sessions(id) on delete cascade,
  ts timestamptz not null default now(),
  type text not null,               -- e.g. 'draft_pick', 'battle_start', 'turn', 'phase', 'battle_end', 'retry'
  payload jsonb not null default '{}'::jsonb
);
create index if not exists ph_events_session_idx on ph_events(session_id);
create index if not exists ph_events_type_idx on ph_events(type);

-- Prototype-open access: anyone with the anon key can insert.
-- Fine for playtesting; tighten before real players.
alter table ph_sessions enable row level security;
alter table ph_events enable row level security;

drop policy if exists "prototype insert sessions" on ph_sessions;
create policy "prototype insert sessions" on ph_sessions
  for insert to anon with check (true);

drop policy if exists "prototype insert events" on ph_events;
create policy "prototype insert events" on ph_events
  for insert to anon with check (true);

-- Read access for analysis (service role bypasses RLS anyway;
-- this lets the anon key read its own rows for the in-game Lab panel).
drop policy if exists "prototype read sessions" on ph_sessions;
create policy "prototype read sessions" on ph_sessions
  for select to anon using (true);

drop policy if exists "prototype read events" on ph_events;
create policy "prototype read events" on ph_events
  for select to anon using (true);
