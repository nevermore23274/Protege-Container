# Base image
FROM alpine:3.19.0

# Set noninteractive timezone configuration
ENV DEBIAN_FRONTEND=noninteractive 
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

# Set JAVA_HOME environment variable
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk

# Update package information and install dependencies
RUN apk add --update --no-cache bash openjdk11 maven git fontconfig ttf-dejavu && \
    rm -rf /var/cache/apk/*

# Create a non-root user
RUN addgroup -S protegeuser && adduser -S protegeuser -G protegeuser

# Clone Protege, build it (skips tests), remove unnecessary files
RUN git clone https://github.com/protegeproject/protege.git /root/protege && \
    cd /root/protege && \
    mvn clean package -DskipTests && \
    rm -rf /root/protege/protege-desktop/target/protege-5.6.3-{mac,win,platform-independent}* && \
    rm -f /root/protege/protege-desktop/target/protege-5.6.3-{mac,win,platform-independent}.zip && \
    ln -s $JAVA_HOME /root/protege/protege-desktop/target/protege-5.6.3-linux/Protege-5.6.3/jre

# Set the working directory to the Protege Linux distribution
WORKDIR /root/protege/protege-desktop/target/protege-5.6.3-linux/Protege-5.6.3

# Copy the runner script into the container and set permissions
#COPY protege_runner.sh ./
COPY ../protege_runner.sh ./
RUN chmod +x ./protege_runner.sh

# Set the entrypoint to run Protege
ENTRYPOINT ["./protege_runner.sh"]
