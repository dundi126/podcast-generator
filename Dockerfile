FROM ubuntu:latest

# Install git (only what's needed)
RUN apt-get update && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install dependencies (pinned for stability)
RUN pip install --no-cache-dir PyYAML==6.0.1

# Copy files
COPY feed.py /usr/bin/feed.py 
COPY entrypoint.sh /entrypoint.sh

# Run the script
ENTRYPOINT ["./entrypoint.sh"]
