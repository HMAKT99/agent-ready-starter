# Agent-ready starter

A GitHub template repository. Its root describes the template itself; `template/` holds the files a new project starts with.

## How it works
- `.github/workflows/setup.yml` runs once in a repository created from this template: it replaces the files at the root with those in `template/`, writes the new repository's name into them, and commits.
- Lines containing `starter-credit` keep the link back to this template; everything else that says `HMAKT99/agent-ready-starter` or `agent-ready-starter` is renamed.

## Changing it
- Edit the starter files in `template/`, not the root copies, when the change is for new projects.
- Keep every TODO honest: a TODO must never contain words that would earn points from a checker before the owner has written the real answer.
- Test the setup script locally with `bash scripts/test-setup.sh` before pushing.

## Do not
- Do not add code that registers a project, posts, or calls any service at setup time.
- Do not give the setup workflow more than `contents: write`.
