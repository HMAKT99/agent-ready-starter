# Agent-ready starter

[![ScBee readiness](https://scbee.vercel.app/badge/github.com/HMAKT99/agent-ready-starter.svg)](https://scbee.vercel.app/github.com/HMAKT99/agent-ready-starter) [![Agent-ready](https://scbee.vercel.app/badge/agent-ready/github.com/HMAKT99/agent-ready-starter.svg)](https://scbee.vercel.app/github.com/HMAKT99/agent-ready-starter)

A GitHub template for a new project that people and AI agents can find, install and trust from the first commit: README sections that answer the first questions, `AGENTS.md`, `llms.txt`, an agent card, a security policy, a skill, and a readiness check on every pull request.

## Quick start

```bash
gh repo create my-project --template HMAKT99/agent-ready-starter --public --clone
```

Or press **Use this template** at the top of this page. Without GitHub's template feature, copy the files and run the setup yourself:

```bash
npx degit HMAKT99/agent-ready-starter my-project && cd my-project && bash scripts/setup.sh you/my-project
```

On the first push, the **Set up** workflow puts your repository's name into the files and swaps in the starter files from `template/`. It makes one commit, as `github-actions[bot]`, in your new repo only. Then open the repo in Claude Code (or any coding agent that reads skills) and say **"finish setup"**: the `finish-setup` skill walks through the TODOs with you.

## What you get

| File | Who reads it | Why |
|---|---|---|
| `README.md` | people first | One sentence on what it is, a one-line install, an example, and what it can and cannot touch |
| `AGENTS.md` | coding agents working in the repo | How to build, test and change it, and what is off limits |
| `llms.txt` | language models | A short description and links to the docs that matter |
| `agent.json` | other agents | An agent card: name, what it does, its skills |
| `SECURITY.md` | everyone | How to report a problem privately |
| `skills/<name>/SKILL.md` | coding agents using it | When and how to use the project, in plain steps |
| `.claude/skills/finish-setup/` | you, through your agent | Fills in the TODOs with you, then checks the result |
| `.github/workflows/ci.yml` | every pull request | Your tests, plus one comment with the pull request's launch-readiness and agent-ready scores, the change, and the top fixes |

`docs/AGENT-FILES.md` has examples for the files only some projects need: an MCP `server.json` and an OpenAPI file.

## Example

After setup, every pull request in your repo gets one comment in this shape, updated on each push (the numbers here are only an illustration; yours come from your files):

```text
ScBee: launch readiness 72/100 (+6 vs main)

| Score            | This PR | main | Change |
| Launch readiness | 72/100  | 66   | +6     |
| Agent-Ready      | 80/100  | 70   | +10    |

What this PR changed
- Usage example (Launch readiness): +5
- Agent instructions (Agent-Ready): +10

Top 3 fixes
1. Add a screenshot or a short GIF (+4, Launch readiness)
2. Tag a release so people can pin a version (+3, Launch readiness)
3. Add SECURITY.md saying how to report a problem privately (+3, Launch readiness)
```

It comes from the [ScBee PR score](https://github.com/HMAKT99/scbee-action) action: [ScBee](https://scbee.vercel.app)'s fixed rules over the files in the pull request, no AI model, a reason and a fix for every point lost. A score is about readiness, not a prediction. The check runs in your workflow and sends nothing to ScBee, so private repositories work too.

## Permissions and what it never does

- The **Set up** workflow needs `contents: write` once, to commit the renamed files in your own repo. It never touches other repositories and it cannot change workflow files (GitHub does not allow that token to), so it stays in place afterwards and does nothing on later pushes. Delete `.github/workflows/setup.yml` whenever you like.
- The **CI** workflow reads your files. Its ScBee job has `pull-requests: write`, used only to write one comment on the pull request it runs on; remove that line to keep the scores in the job summary. Pull requests from forks get the scores in the job summary, and the job never fails unless you set `fail-under`.
- Nothing here registers your project anywhere, posts anything outside your own pull requests, or sends data about you. Listing a project on ScBee is a separate, opt-in step.

## Limits

The pull request score is worked out in your workflow from your files, so it is current on every push, with no cache and no rate limit. The badges at the top read the public score from ScBee, which is cached for a few hours and has rate limits (30 fresh scores an hour per address).

## Licence

MIT. Projects made from this template can use any licence; change `LICENSE` in your repo.
