FROM node:16-alpine
LABEL author="David Jurado <david.jurado@vass.es>"
LABEL description="Salesforce and Mulesoft deployments"

# ADD assets/mulesoft-maven-settings.xml /home/node/.m2/settings.xml

ENV SFDX_USE_GENERIC_UNIX_KEYCHAIN true
ENV SFDX_AUTOUPDATE_DISABLE true
RUN apk add --update --no-cache maven xvfb 
RUN apk add --update --no-cache git openssh ca-certificates openssl curl jq
# Remove @7.119.3 when issues fixed. https://github.com/forcedotcom/cli/issues/1208
RUN npm install -g sfdx-cli@7.119.3 sfdx-git-delta 
RUN npm install -g anypoint-cli@3.0.0
RUN sfdx --version
# ADD server.key.enc /assets/server.key.enc

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk

# Default to UTF-8 file.encoding
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    LANGUAGE=C.UTF-8

# Xvfb provide an in-memory X-session for tests that require a GUI
ENV DISPLAY=:99

USER node
