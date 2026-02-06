FROM python:3.11-slim-bookworm

# Install uv for fast package management
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

# Set working directory
WORKDIR /app

# Copy configuration files
COPY pyproject.toml .
COPY README.md .

# Install dependencies
RUN uv pip install --system .

# Copy source code and data
COPY server.py .
COPY data/ data/

# Expose port (if using SSE, default for fastmcp is usually stdio but can be sse)
# docker run -e PORT=8000 ...
ENV PORT=8000

# Run the server
CMD ["fastmcp", "run", "server.py"]
