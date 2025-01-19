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
RUN mkdir -p /app/logs /app/conf/security /temp/backup && \
    chmod -R 755 /app && \
    chown -R root:root /app

COPY bin/dashboard.sh /app/bin/dashboard.sh


# Copy the dashboard.jks file to the container
COPY conf/security/dashboard.jks /app/conf/security/

# Ensure correct permissions for the keystore
RUN chmod 600 /app/conf/security/dashboard.jks

# Verify keystore presence
RUN if [ -f /app/conf/security/dashboard.jks ]; then \
      echo "Keystore found"; \
    else \
      echo "Keystore missing! Please provide the correct file." && exit 1; \
    fi

# Copy application files
COPY . /app

# Set the working directory
WORKDIR /app

# Adjust file permissions for logs and make scripts executable
RUN chmod -R 777 /app/logs /temp && \
    chmod +x /app/bin/dashboard.sh

# Expose the required port
EXPOSE 9743

# Switch to a non-root user for security
RUN groupadd --gid 10014 choreo && \
    useradd --no-create-home --uid 10014 --gid choreo --shell /usr/sbin/nologin choreouser && \
    chown -R choreouser:choreo /app /temp

USER 10014

# Entry point to run the application
ENTRYPOINT ["/bin/bash", "/app/bin/dashboard.sh"]
