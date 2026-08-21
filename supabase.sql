-- 3er HR Tribe Summit 2026 · elección de talleres (Human First)
-- Proyecto Supabase: ADN-Lamosa (istfqqmuxcuhduakrojo)

create table if not exists public.summit_talleres (
  id            uuid primary key default gen_random_uuid(),
  creado_en     timestamptz not null default now(),
  enviado_en    timestamptz,
  nombre        text not null,
  correo        text not null,
  empresa       text,
  puesto        text,
  p1 text, p2 text, p3 text, p4 text, p5 text, p6 text,
  prioridades   jsonb not null default '[]'::jsonb,
  origen        text
);

create index if not exists summit_talleres_creado_idx on public.summit_talleres (creado_en);
create index if not exists summit_talleres_correo_idx on public.summit_talleres (lower(correo));

alter table public.summit_talleres enable row level security;

-- El formulario es público: anon inserta, nadie más lee sin sesión.
drop policy if exists "anon registra su eleccion" on public.summit_talleres;
create policy "anon registra su eleccion"
  on public.summit_talleres for insert to anon with check (true);

drop policy if exists "solo autenticados leen" on public.summit_talleres;
create policy "solo autenticados leen"
  on public.summit_talleres for select to authenticated using (true);

comment on table public.summit_talleres is
  'Elección de taller de los asistentes al 3er HR Tribe Summit 2026. La asignación se hace por orden de llegada (creado_en).';
