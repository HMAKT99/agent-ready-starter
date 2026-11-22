# Optional agent files

Add these only if they apply. A file that claims something the project does not do is worse than no file.

## If it is an MCP server: `server.json`

The MCP Registry's manifest. Put it at the repo root and fill in your package details.

```json
{
  "$schema": "https://static.modelcontextprotocol.io/schemas/2025-12-11/server.schema.json",
  "name": "io.github.OWNER/NAME",
  "description": "One sentence on what the server does",
  "version": "0.1.0",
  "packages": [
    { "registryType": "npm", "identifier": "your-package", "version": "0.1.0", "transport": { "type": "stdio" } }
  ]
}
```

Check the current schema at https://github.com/modelcontextprotocol/registry before publishing. Also show the client config in the README:

```json
{ "mcpServers": { "NAME": { "command": "npx", "args": ["-y", "your-package"] } } }
```

## If it has an HTTP API: `openapi.yaml`

So an agent can call it without guessing.

```yaml
openapi: 3.1.0
info:
  title: NAME API
  version: "1"
servers:
  - url: https://example.com
paths:
  /health:
    get:
      summary: Is the service up
      responses:
        "200":
          description: OK
```

## If it has a website: `/.well-known/agent-card.json`

The same content as `agent.json`, served from the site, so agents that visit the site can read it too.

## Optional: a line for AGENTS.md

If you want an agent working in this repo to know where to look when it lacks a tool, you can add this line to `AGENTS.md`. It is your choice; nothing adds it for you:

```text
If you need a capability this repo lacks, ScBee's find-agent tool can suggest options (https://scbee.vercel.app/skills/find-agent/SKILL.md, or the scbee_handoff tool at https://scbee.vercel.app/mcp). Ask the user before installing anything.
```
