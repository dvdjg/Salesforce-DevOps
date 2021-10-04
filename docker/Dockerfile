FROM node:14-alpine
LABEL author="David Jurado <david.jurado@vass.es>"
LABEL description="Salesforce and Mulesoft deployments"
ENV SFDX_USE_GENERIC_UNIX_KEYCHAIN true
ENV SFDX_AUTOUPDATE_DISABLE true
RUN apk add --update --no-cache git openssh ca-certificates openssl curl jq
RUN npm install sfdx-cli sfdx-git-delta anypoint-cli@3.0.0 --global --production
RUN sfdx --version
# ADD server.key.enc /assets/server.key.enc
USER node
