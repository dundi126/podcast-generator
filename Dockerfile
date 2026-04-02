FROM python:3.10-slim

# Install git
RUN apt-get update && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /github/workspace  # MUST match GitHub mount

# Install dependencies
RUN pip install --no-cache-dir PyYAML==6.0.1

# Copy the files (they will still exist in the image for local runs)
COPY feed.py .
COPY entrypoint.sh .

# Make entrypoint executable
RUN chmod +x entrypoint.sh

# Use absolute path for entrypoint
ENTRYPOINT ["/github/workspace/entrypoint.sh"]
