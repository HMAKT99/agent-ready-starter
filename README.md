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
| `.github/workflows/ci.yml` | every pull request | Your tests, plus a launch-readiness and agent-ready score with the top fixes |

`docs/AGENT-FILES.md` has examples for the files only some projects need: an MCP `server.json` and an OpenAPI file.

## Example

After setup, every pull request in your repo gets a job summary in this shape (the numbers here are only an illustration; yours come from your repo):

```text
ScBee scores for github.com/you/my-project

| Score            | Result     | Band         |
| Launch readiness | **72/100** | Nearly there |
| Agent-ready      | **80/100** | Agent-ready  |

Biggest wins, readiness
- Add a screenshot or a short GIF (+4)
- Tag a release so people can pin a version (+3)
```

The scores come from [ScBee](https://scbee.vercel.app): fixed rules over public files, no AI model, a reason and a fix for every point lost. A score is about readiness, not a prediction. Private repositories cannot be scored, so in a private repo the score step is skipped and only your tests run.

## Permissions and what it never does

- The **Set up** workflow needs `contents: write` once, to commit the renamed files in your own repo. It never touches other repositories and it cannot change workflow files (GitHub does not allow that token to), so it stays in place afterwards and does nothing on later pushes. Delete `.github/workflows/setup.yml` whenever you like.
- The **CI** workflow is read-only by default. It reads your repo's public score from ScBee. Turn on its pull request comment only if you want one, by giving it `pull-requests: write`.
- Nothing here registers your project anywhere, posts anything, or sends data about you. Listing a project on ScBee is a separate, opt-in step.

## Limits

ScBee scores are cached for a few hours, so a change shows up in the score after it is pushed and the cache expires. ScBee has rate limits: 30 fresh scores an hour per address. CI reads usually hit the cache.

## Licence

MIT. Projects made from this template can use any licence; change `LICENSE` in your repo.
