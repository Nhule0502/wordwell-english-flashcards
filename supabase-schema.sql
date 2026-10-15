create table if not exists public.flashcards (
  id uuid primary key,
  user_id uuid not null references auth.users (id) on delete cascade,
  word text not null check (char_length(word) between 1 and 80),
  type text not null check (type in ('noun', 'verb', 'adj', 'adv', 'idiom')),
  vi_examples text[] not null default '{}',
  en_examples text[] not null default '{}',
  created_date date not null default current_date,
  created_at timestamptz not null default now(),
  review_count integer not null default 0 check (review_count between 0 and 5),
  studied_dates date[] not null default '{}'
);

create index if not exists flashcards_user_created_idx
  on public.flashcards (user_id, created_date desc);

alter table public.flashcards enable row level security;

drop policy if exists "Users can read their own flashcards" on public.flashcards;
create policy "Users can read their own flashcards"
  on public.flashcards for select to authenticated
  using (auth.uid() = user_id);

drop policy if exists "Users can add their own flashcards" on public.flashcards;
create policy "Users can add their own flashcards"
  on public.flashcards for insert to authenticated
  with check (auth.uid() = user_id);

drop policy if exists "Users can update their own flashcards" on public.flashcards;
create policy "Users can update their own flashcards"
  on public.flashcards for update to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

drop policy if exists "Users can delete their own flashcards" on public.flashcards;
create policy "Users can delete their own flashcards"
  on public.flashcards for delete to authenticated
  using (auth.uid() = user_id);
