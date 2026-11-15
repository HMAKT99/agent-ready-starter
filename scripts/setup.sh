#!/usr/bin/env bash
# Turns a copy of the agent-ready starter into your project's own files. Run once, by .github/workflows/setup.yml,
# with the new repository's owner/name. It only changes files in the current checkout.
set -euo pipefail
FULL="${1:?usage: setup.sh owner/repo}"
NAME="${FULL#*/}"
[[ "$FULL" =~ ^[A-Za-z0-9-]+/[A-Za-z0-9._-]+$ ]] || { echo "not an owner/repo: $FULL" >&2; exit 1; }
[ -d template ] || { echo "Already set up."; exit 0; }

# The root describes the template; template/ holds the new project's files. Keep the git data, the workflows and the licence.
shopt -s dotglob nullglob
for f in *; do
  case "$f" in .git|.github|LICENSE|template) ;; *) rm -r -- "$f" ;; esac
done
for f in template/*; do mv -- "$f" .; done
rmdir template

# Use the new name everywhere except lines that credit the template, and except workflow files
# (the workflow's token is not allowed to change them, and they do not name the repo).
while IFS= read -r f; do
  [ -f "$f" ] || continue
  sed -i.bak -e "/starter-credit/!s#HMAKT99/agent-ready-starter#${FULL}#g" -e "/starter-credit/!s#agent-ready-starter#${NAME}#g" "$f"
  rm -f -- "$f.bak"
done < <(find . -type f -not -path './.git/*' -not -path './.github/*')

[ -d skills/agent-ready-starter ] && [ "$NAME" != "agent-ready-starter" ] && mv skills/agent-ready-starter "skills/${NAME}"
echo "Set up as ${FULL}."
