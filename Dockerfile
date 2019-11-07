FROM java:8-jdk

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV GLASSFISH_HOME /usr/local/glassfish4
ENV PATH $PATH:$JAVA_HOME/bin:$GLASSFISH_HOME/bin

RUN apt-get update && \
    apt-get install -y curl unzip zip inotify-tools && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L -o /tmp/glassfish-4.1.zip http://download.java.net/glassfish/4.1/release/glassfish-4.1.zip && \
    unzip /tmp/glassfish-4.1.zip -d /usr/local && \
    rm -f /tmp/glassfish-4.1.zip

EXPOSE 9090 4848 9191

WORKDIR /usr/local/glassfish4

# verbose causes the process to remain in the foreground so that docker can track it
CMD asadmin start-domain --verbose

ADD ./webapp/target/*.war /opt/glassfish5/glassfish/domains/domain1/applications/__internal/webapp
