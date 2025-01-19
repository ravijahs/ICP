# Base image
FROM ubuntu:20.04

# Install dependencies (JDK 17 and sudo)
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk sudo \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set environment variables for Java
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Create application directories
RUN mkdir -p /app/logs /app/security && \
    chmod -R 755 /app && \
    chown -R root:root /app

# Copy application files
COPY . /app

# Set the working directory
WORKDIR /app

# Copy a keystore file (optional: replace with your actual keystore file)
COPY keystore.jks /app/security/

# Adjust file permissions for logs
RUN chmod -R 777 /app/logs && \
    chmod +x /app/bin/dashboard.sh

# Expose the required port
EXPOSE 9743

# Switch to a non-root user for security (if desired)
RUN groupadd --gid 10014 choreo && \
    useradd --no-create-home --uid 10014 --gid choreo --shell /usr/sbin/nologin choreouser && \
    chown -R choreouser:choreo /app

USER 10014

# Entry point to run the application
ENTRYPOINT ["/bin/bash", "/app/bin/dashboard.sh"]
