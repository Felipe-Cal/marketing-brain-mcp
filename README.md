# Marketing Brain MCP Server

A lightweight MCP server content engine. It serves brand guidelines and templates to your AI usage.

## Features

- **Brand Source of Truth**: Centralized brand voice and negative constraints.
- **Centralized Templates**: Standardized structures for Blog posts, Emails, and Social media.
- **Extensible**: Add new markdown files to `data/templates/` to instantly support new asset types.

## Installation / Usage

### Option 1: Cloud (Easiest for Teams)
If deployed to a cloud provider (like Railway/Render):
1.  Add the SSE URL to your MCP client (e.g., `https://your-app.up.railway.app/sse`).

### Option 2: Smithery
Using the [Smithery](https://smithery.ai) CLI:
```bash
npx -y @smithery/cli install github.com/Felipe-Cal/marketing-brain-mcp --client claude
```

### Option 3: Local Development
1. Clone the repo.
2. Install dependencies: `pip install .`
3. Run locally: `fastmcp run server.py`
