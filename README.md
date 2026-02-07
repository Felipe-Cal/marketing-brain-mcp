# Marketing Brain MCP Server

A lightweight Model Context Protocol (MCP) server that acts as a "Marketing Brain," providing standardized brand guidelines and content templates.

## Features

- **Brand Voice Source of Truth**: Exposes the core brand guidelines (Voice, Audience, Constraints) through a simple tool.
- **Content Templates**: Provides structured templates for common marketing assets (Blog, Email, Social).
- **Extensible Design**: Uses a file-based system. Add or edit Markdown files in the `data/` directory to update strategies or add new ones without changing the code.
- **SSE Support**: Ready for cloud deployment via Server-Sent Events (SSE).

## Tools

### `get_content_strategy`
Returns the brand guidelines combined with a specific asset template.
- **Input**: `asset_type` (str) - e.g., `blog`, `email`, `social`.

## Project Structure

- `server.py`: The FastMCP server application.
- `data/brand_guidelines.md`: The global brand identity.
- `data/templates/`: Folder containing individual template files (one `.md` file per template).

---

## Installation & Usage

### 1. Cloud Deployment (Remote)

The server is optimized for deployment on platforms like **Railway** or **Render**. 

Once deployed, you can connect your MCP client (like Claude Desktop) using the SSE endpoint:
```json
{
  "mcpServers": {
    "marketing-brain": {
      "url": "https://marketing-brain-mcp.railway.app/sse"
    }
  }
}
```

### 2. Local Development

#### Prerequisites
- Python 3.10+
- `pip install fastmcp`

#### Running Locally (Stdio)
For local testing in your AI assistant:
```bash
fastmcp run server.py
```

#### Development Inspector
To test the tools in a web interface:
```bash
fastmcp dev server.py
```

### 3. Smithery
You can also install this server using the [Smithery](https://smithery.ai) CLI:
```bash
npx -y @smithery/cli install github.com/Felipe-Cal/marketing-brain-mcp --client claude
```

## License
MIT
