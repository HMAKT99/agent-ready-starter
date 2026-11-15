---
name: finish-setup
description: Finish setting up a repository made from the agent-ready starter. Finds every TODO the starter left, asks the owner for each answer, writes the answers in, and then checks the repo's public launch-readiness and agent-ready scores. Use when the owner says "finish setup", "fill in the TODOs" or "make this repo agent-ready".
---

# Finish setup

This repository was made from the agent-ready starter. It has the files people and agents look for, but the facts in them are still TODOs that only the owner can answer.

## Rules
- Never invent a fact about the project. If the owner does not know an answer yet, leave the TODO in place.
- Change files only in this working tree, and show the diff. Do not commit or push unless the owner asks.
- Never register the project anywhere, post anything, or open issues or pull requests.

## Steps

1. **Find the TODOs.** Search the repo for `TODO`, outside `.git`. Group them by file: README.md, AGENTS.md, llms.txt, agent.json, SECURITY.md, `skills/*/SKILL.md`, `.github/workflows/ci.yml`.
2. **Read the code first.** Look at the package or build files (package.json, pyproject.toml, Cargo.toml, go.mod, Makefile) to propose real install, test and run commands. Propose; do not assume.
3. **Ask the owner, one file at a time,** starting with the one sentence on what it is: it goes in the README, llms.txt, agent.json and AGENTS.md, so ask once and reuse it.
4. **Write the answers in.** Put install and usage in code blocks in the README. Keep agent.json valid JSON. In ci.yml, replace the placeholder test step with the real test command.
5. **Optional files.** If it is an MCP server, or has an HTTP API, offer the matching file from `docs/AGENT-FILES.md`. Skip what does not apply.
6. **Check the result.** After the owner pushes, the CI job shows the scores. To check now, read `https://scbee.vercel.app/api/score/github.com/OWNER/REPO` (public repositories only; it is cached for a few hours). Show the total, the band and the three fixes worth the most. It is a readiness score, not a prediction.
7. **Tidy up.** Offer to delete `.github/workflows/setup.yml` (it has done its job) and this skill folder.
