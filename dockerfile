FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    openjdk-17-jdk sudo \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && echo "Installed JDK and cleaned up"

ENV JAVA_HOME=/usr
ENV PATH=$JAVA_HOME/bin:$PATH

RUN groupadd --gid 10014 choreo && \
    useradd --no-create-home --uid 10014 --gid choreo --shell /usr/sbin/nologin choreouser \
    && echo "User choreouser created"

COPY . /app
WORKDIR /app
RUN echo "Files copied to /app"

USER 10014

EXPOSE 9743
ENTRYPOINT ["/bin/bash", "/app/bin/dashboard.sh"]
