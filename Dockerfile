FROM python:3.11-slim

# Set work directory
WORKDIR /app

# Install dependencies
# Copy pyproject and requirement files first for caching
COPY pyproject.toml requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Install the package
RUN pip install --no-cache-dir .

# Expose port
EXPOSE 8000

# Default command
CMD ["uvicorn", "capsule_mcp.server:app", "--host", "0.0.0.0", "--port", "8000"]
