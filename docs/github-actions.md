# GitHub Actions (optional)

Workflow files live in `.github/workflows/` but were not pushed from the Cloud Agent because the environment token lacks the `workflow` scope.

To enable CI and automatic Pages deploys from `main`:

1. Regenerate or extend your GitHub PAT with the **workflow** scope (or push from GitHub Desktop / local `gh` with full scopes).
2. Push this repository (including `.github/workflows/`).
3. In the repo **Settings → Pages**, set source to **GitHub Actions** if you use `deploy-github-pages.yml`.

Until then, redeploy the web app with:

```bash
GITHUB_PAGES_REMOTE=https://github.com/<user>/trainer-portfolio.git ./scripts/deploy_github_pages.sh
```
