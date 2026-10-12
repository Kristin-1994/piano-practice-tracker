-- Run once in Supabase: SQL Editor > New query > Run
create table if not exists public.piano_records (
  id text primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  practice_date date not null,
  practice_type text not null,
  minutes integer not null check (minutes > 0),
  notes text not null default '',
  created_at timestamptz not null default now(),
  deleted_at timestamptz
);

alter table public.piano_records enable row level security;

drop policy if exists "Users can read their piano records" on public.piano_records;
create policy "Users can read their piano records"
  on public.piano_records for select to authenticated using (auth.uid() = user_id);
drop policy if exists "Users can add their piano records" on public.piano_records;
create policy "Users can add their piano records"
  on public.piano_records for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "Users can update their piano records" on public.piano_records;
create policy "Users can update their piano records"
  on public.piano_records for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);

grant select, insert, update on public.piano_records to authenticated;
