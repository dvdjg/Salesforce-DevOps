FROM node:14-alpine
ENV SFDX_USE_GENERIC_UNIX_KEYCHAIN true
ENV SFDX_AUTOUPDATE_DISABLE true
RUN apk add --update --no-cache git openssh ca-certificates openssl curl jq
RUN npm install sfdx-cli sfdx-git-delta --global --production
RUN sfdx --version
# ADD server.key.enc /assets/server.key.enc
USER node
