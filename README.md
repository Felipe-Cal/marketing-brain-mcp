# Jimdo Content Engine MCP Server

A lightweight MCP server that acts as the "Marketing Brain" for Jimdo's content automation workflow.

## Prerequisites

- Python 3.10+
- `uv` (recommended) or `pip`

## Installation

1. Create a virtual environment:
   ```bash
   uv venv
   source .venv/bin/activate
   ```

2. Install dependencies:
   ```bash
   uv pip install "fastmcp[cli]"
   # OR
   pip install "fastmcp[cli]"
   ```

## Usage

### 1. Developer Inspector (Recommended for Testing)
The easiest way to test the server is using the FastMCP inspector UI:

```bash
fastmcp dev server.py
```

This will run a local web server (usually at http://localhost:5173 / 3000) where you can interact with the tools appropriately.

### 2. Connect to an MCP Client (e.g., Claude Desktop)

To use this with Claude Desktop or other MCP clients, configure your client to run the server script using Python.

**Example `claude_desktop_config.json`:**
```json
{
  "mcpServers": {
    "jimdo-content": {
      "command": "/absolute/path/to/venv/bin/python",
      "args": ["/absolute/path/to/server.py"]
    }
  }
}
```
