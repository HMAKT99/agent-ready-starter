#!/usr/bin/env bash
# Runs setup.sh on a throwaway copy of this repository and checks the result. Changes nothing here.
set -euo pipefail
here="$(cd "$(dirname "$0")/.." && pwd)"
work="$(mktemp -d)"
trap 'rm -r -- "$work"' EXIT
cp -R "$here/." "$work/"
cd "$work"
bash scripts/setup.sh "someone/cool-tool" >/dev/null

fail() { echo "FAIL: $*" >&2; exit 1; }
[ ! -d template ] || fail "template/ is still there"
[ ! -d scripts ] || fail "scripts/ is still there"
for f in README.md AGENTS.md llms.txt agent.json SECURITY.md LICENSE docs/AGENT-FILES.md .claude/skills/finish-setup/SKILL.md skills/cool-tool/SKILL.md .github/workflows/ci.yml .github/workflows/setup.yml; do
  [ -f "$f" ] || fail "missing $f"
done
grep -q "github.com/someone/cool-tool.svg" README.md || fail "README badge does not name the new repo"
grep -q "starter-credit" README.md || fail "the credit line is gone"
grep "starter-credit" README.md | grep -q "HMAKT99/agent-ready-starter" || fail "the credit line was renamed"
while IFS= read -r f; do
  grep "agent-ready-starter" "$f" | grep -qv "starter-credit" && fail "old name left in $f"
done < <(grep -rIl --exclude-dir=.git --exclude-dir=.github "agent-ready-starter" . || true)
grep -q "agent-ready-starter" .github/workflows/setup.yml || fail "workflow files must stay as they are"
python3 -c 'import json; json.load(open("agent.json"))' || fail "agent.json is not valid JSON"
bash "$here/scripts/setup.sh" someone/cool-tool | grep -q "Already set up" || fail "a second run should find nothing to do"
bash "$here/scripts/setup.sh" 'bad name' >/dev/null 2>&1 && fail "a bad name should be refused"
echo "setup.sh: all checks passed"
