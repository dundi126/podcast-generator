FROM python:3.10-slim

# Install git
RUN apt-get update && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install dependencies
RUN pip install --no-cache-dir PyYAML==6.0.1

# Copy files
COPY feed.py .
COPY entrypoint.sh .

# Make entrypoint executable
RUN chmod +x entrypoint.sh

# Run the entrypoint
ENTRYPOINT ["./entrypoint.sh"]
