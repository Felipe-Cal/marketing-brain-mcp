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

# Expose port
ENV PORT=8000
EXPOSE 8000

# Run the server in SSE mode, listening on all interfaces
CMD fastmcp run server.py --transport sse --port $PORT --host 0.0.0.0
