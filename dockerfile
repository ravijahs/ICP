# Base image
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set environment variables for Java
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Create application directories
RUN mkdir -p /app/logs /app/conf/security /temp/backup

# Copy application files
COPY bin/ /app/bin/
COPY conf/security/dashboard.jks /app/conf/security/dashboard.jks

# Adjust file permissions
RUN chmod -R 755 /app && chmod +x /app/bin/dashboard.sh

# Expose the required port
EXPOSE 9743

# Entry point to run the application
ENTRYPOINT ["/bin/bash", "/app/bin/dashboard.sh"]
