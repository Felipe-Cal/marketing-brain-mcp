FROM python:3.11-slim-bookworm

# Install uv for fast package management
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

# Set working directory
WORKDIR /app

# Copy configuration files
COPY pyproject.toml .
COPY README.md .

# Copy source code and data FIRST so they are available for the build
COPY server.py .
COPY data/ data/

# Now install the project (it won't fail to find the files now)
RUN uv pip install --system .

# Expose port
ENV PORT=8000
EXPOSE 8000

# Run the server in SSE mode, listening on all interfaces
CMD ["fastmcp", "run", "server.py", "--transport", "sse", "--port", "8000", "--host", "0.0.0.0"]
