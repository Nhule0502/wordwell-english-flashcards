# Enable cross-device sync

The app stays local-only until Supabase is configured. Supabase provides the database and email/password accounts; Google sign-in is not required.

## 1. Create the database

1. Create a Supabase project at [supabase.com](https://supabase.com).
2. Open the project's **SQL Editor**.
3. Paste and run the contents of `supabase-schema.sql`.

The schema enables row-level security so each signed-in user can only access their own vocabulary and study history.

## 2. Configure authentication

In Supabase, open **Authentication > URL Configuration** and set:

- **Site URL:** `https://nhule0502.github.io/wordwell-english-flashcards/`
- **Redirect URLs:** add the same URL

Keep email/password sign-up enabled. If email confirmation is enabled, users must confirm the email before signing in.

## 3. Configure the app

In `index.html`, replace these two placeholders near the start of the script:

```js
const SUPABASE_URL = 'YOUR_SUPABASE_URL';
const SUPABASE_PUBLISHABLE_KEY = 'YOUR_SUPABASE_PUBLISHABLE_KEY';
```

Find the values in **Project Settings > API**. Use the **Project URL** and the public **publishable** key (or legacy `anon` key). Never put a `service_role` key in this browser app; it bypasses row-level security.

Publish the updated `index.html` to the GitHub Pages repository after configuring it.

## 4. Use on other devices

Open the same Pages URL on each device and sign in with the same email and password. On the first sign-in, cards already saved in that browser are merged into the account. Later sign-ins load the account's cloud cards and study history. Use **Account > Sync now** to refresh an already-open app.

Until Supabase is configured, the app continues to save locally in each browser. Existing local cards are not removed by adding the cloud-sync feature.
