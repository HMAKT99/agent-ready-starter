# agent-ready-starter

TODO: one sentence on what this is.

## Build and test
- Install: TODO
- Test: TODO
- Run: TODO

## Conventions
- TODO: the rules a new contributor, or an agent, must follow

## The ScBee check
- `.github/workflows/ci.yml` runs the ScBee PR score action (`HMAKT99/scbee-action@v1`) on every pull request. It scores that pull request's own files for launch readiness and agent-readiness, by fixed rules with no AI model, compares them with the base branch, and keeps one comment on the pull request up to date.
- To see the published repository's score from a terminal: `npx scbee-cli score` in a checkout. It reads the public score of the default branch.
- Neither registers the project anywhere or posts outside the pull request. Listing a project on ScBee is a separate step its owner chooses.

## Do not
- TODO: files, folders or actions that are off limits
