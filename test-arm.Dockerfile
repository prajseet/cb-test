
# Customer Replica Dockerfile for CodeBuild ARM Networking Replication Test
# This uses the EXACT package list from the customer's lambda.Dockerfile

FROM public.ecr.aws/docker/library/ubuntu:noble

# Set environment to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Add timestamp markers for timing analysis
RUN echo "=== Dockerfile Build Started ===" && date

# Update package lists and install ALL packages in a single RUN command
# THIS IS WHERE THE LATENCY OCCURS - This is the customer's exact command
RUN echo "=== Starting apt-get update and package installation ===" && \
    date && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    --no-install-recommends \
    dumb-init \
    build-essential \
    tzdata \
    xvfb \
    wget \
    unzip \
    ca-certificates \
    fonts-liberation \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango1.0-dev \
    libx11-6 \
    libxcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxrandr2 \
    ffmpeg \
    libatk1.0-0 \
    libcairo-gobject2 \
    libcairo2 \
    libdbus-1-3 \
    libdbus-glib-1-2 \
    libfontconfig1 \
    libfreetype6 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libpangoft2-1.0-0 \
    libx11-6 \
    libx11-xcb1 \
    libxcb-shm0 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrender1 \
    libxt6 \
    gstreamer1.0-libav \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libbrotli1 \
    libcairo2 \
    libegl1 \
    libepoxy0 \
    libfontconfig1 \
    libfreetype6 \
    libgdk-pixbuf2.0-0 \
    libgl1 \
    libgles2 \
    libglib2.0-0 \
    libgstreamer-gl1.0-0 \
    libgstreamer1.0-0 \
    libgtk-3-0 \
    libharfbuzz-icu0 \
    libharfbuzz0b \
    libhyphen0 \
    libnotify4 \
    libopenjp2-7 \
    libopus0 \
    libpango-1.0-0 \
    libpng16-16 \
    libsecret-1-0 \
    libwayland-client0 \
    libwayland-egl1 \
    libwayland-server0 \
    libwebpdemux2 \
    libwoff1 \
    libx11-6 \
    libxcomposite1 \
    libxdamage1 \
    libxkbcommon0 \
    libxml2 \
    libxslt1.1 \
    curl \
    librsvg2-dev \
    libjpeg-dev \
    libgif-dev \
    libcairo2-dev && \
    echo "=== apt-get update and package installation completed ===" && \
    date

# Clean up apt cache to reduce image size
RUN echo "=== Cleaning up ===" && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "=== Cleanup completed ===" && \
    date

# Set working directory
WORKDIR /app

# Install Python packages (if needed by customer)
# Uncomment and adjust based on customer's actual requirements
# RUN echo "=== Installing Python packages ===" && \
#     date && \
#     pip3 install --no-cache-dir \
#         boto3 \
#         requests \
#         beautifulsoup4 \
#         selenium \
#         pandas \
#         numpy && \
#     echo "=== Python packages installed ===" && \
#     date

# Copy application code (placeholder - customer would have actual code)
# COPY . /app

# Set entrypoint
CMD ["/bin/bash"]

# Final timestamp
RUN echo "=== Dockerfile Build Completed ===" && date


