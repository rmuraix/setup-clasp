#!/bin/bash

# Install clasp 
if [ -z "${inputs.clasp-version}" ]; then
  npm install @google/clasp -g
else
  npm install @google/clasp@"${inputs.clasp-version}" -g
fi

# Create .clasprc.json
CLASPRC="$(cat <<EOF
    {
        "token": {
            "access_token": "${inputs.access-token}",
            "refresh_token": "${inputs.refresh-token}",
            "scope": "https://www.googleapis.com/auth/script.deployments https://www.googleapis.com/auth/script.webapp.deploy https://www.googleapis.com/auth/service.management https://www.googleapis.com/auth/logging.read https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/cloud-platform https://www.googleapis.com/auth/drive.metadata.readonly https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/script.projects openid https://www.googleapis.com/auth/drive.file",
            "token_type": "Bearer",
            "expiry_date": 1590000000000
        },
        "oauth2ClientSettings": {
            "clientId": "${inputs.client-id}",
            "clientSecret": "${inputs.client-secret}",
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
        "scriptId": "${inputs.script-id}",
        "rootDir": "${inputs.root-dir}"
    }
EOF
)"

echo "$CLASPJSON" > /.clasp.json