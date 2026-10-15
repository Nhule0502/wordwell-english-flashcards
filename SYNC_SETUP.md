# Cross-device sync

The Supabase database, row-level security policies, and GitHub Pages auth URLs are configured for this app. Supabase uses email/password accounts; Google sign-in is not required.

## Use the same cards on another device

1. Open [Wordwell](https://nhule0502.github.io/wordwell-english-flashcards/).
2. Select **Sign in to sync**, then **Create an account**.
3. Register with an email and password. If Supabase asks you to confirm your email, follow its confirmation link, then sign in.
4. On each other device, open the same app and sign in with the same account.

On first sign-in, cards already saved in that browser are merged into the account. Later sign-ins load the account's vocabulary and study history. **Account > Sync now** refreshes an open session.

Until someone signs in, cards remain saved locally in that browser. The Supabase publishable key in `index.html` is intended for browser use; never replace it with a `service_role` or secret key. Row-level security ensures each user can access only their own cards.

## Database schema

`supabase-schema.sql` creates the flashcards table, review-history fields, and per-user row-level security policies. Run it in the Supabase SQL Editor only when setting up a fresh project or intentionally applying schema updates.
