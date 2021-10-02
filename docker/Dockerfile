FROM node:14-alpine
ENV SFDX_USE_GENERIC_UNIX_KEYCHAIN true
ENV SFDX_AUTOUPDATE_DISABLE true
RUN apk add --update --no-cache git openssh ca-certificates openssl curl jq vim
RUN npm install sfdx-cli --global --production
RUN sfdx --version
ADD server.key.enc server.key.enc
USER node
