#!/bin/bash

# Install clasp 
if [ -z "${INPUT-CLASP-VERSION}" ]; then
  npm install @google/clasp -g
else
  npm install @google/clasp@"${INPUT-CLASP-VERSION}" -g
fi

# Create .clasprc.json
CLASPRC="$(cat <<EOF
    {
        "token": {
            "access_token": "${INPUT-ACCESS-TOKEN}",
            "refresh_token": "${INPUT-REFRESH-TOKEN}",
            "scope": "https://www.googleapis.com/auth/script.deployments https://www.googleapis.com/auth/script.webapp.deploy https://www.googleapis.com/auth/service.management https://www.googleapis.com/auth/logging.read https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/cloud-platform https://www.googleapis.com/auth/drive.metadata.readonly https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/script.projects openid https://www.googleapis.com/auth/drive.file",
            "token_type": "Bearer",
            "expiry_date": 1590000000000,
            "id_token": "${INPUT-ID-TOKEN}"
        },
        "oauth2ClientSettings": {
            "clientId": "${INPUT-CLIENT-ID}",
            "clientSecret": "${INPUT-CLIRNT-SECRET}",
            "redirectUri": "http://localhost"
        },
        "isLocalCreds": false
    }
EOF
)"

echo "$CLASPRC" > ~/.clasprc.json

# Create .clasp.json
CLASPJSON="$(cat <<EOF
    {
        "scriptId": "${INPUT-SCRIPT-ID}",
        "rootDir": "${INPUT-ROOT-DIR}"
    }
EOF
)"

echo "$CLASPJSON" > /.clasp.json