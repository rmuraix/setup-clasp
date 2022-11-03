# Setup Clasp

[![GitHub license](https://img.shields.io/github/license/rmuraix/setup-clasp)](./LICENSE)
[![DeepSource](https://deepsource.io/gh/rmuraix/setup-clasp.svg/?label=active+issues&token=i29VnWyNCDuJvYzBQcU5N8vx)](https://deepsource.io/gh/rmuraix/setup-clasp/?ref=repository-badge)  

Setup [google/clasp](https://github.com/google/clasp) on GitHub Actions.  
- Install Clasp  
- Create `~/.clasprc.json` and `.clasp.json`

## Example

```yaml
- uses: actions/checkout@v3
- uses: actions/setup-node@v3
  with:
    node-version: 16
- name: Setup Clasp
  uses: rmuraix/setup-clasp@v1
  with:
    clasp-version: 2.4.2
    access-token: ${{ secrets.ACCESS_TOKEN }}
    id-token: ${{ secrets.ID_TOKEN }}
    refresh-token: ${{ secrets.REFRESH_TOKEN }}
    client-id: ${{ secrets.CLIENT_ID }}
    client-secret: ${{ secrets.CLIENT_SECRET }}
    script-id: ${{ secrets.SCRIPT_ID }}
    root-dir: "./src"
- name: Push to Apps Script
  run: |
    clasp push -f
```

## Inputs

- `clasp-version` (Optional)
  - Version of Clasp. Default is latest version
- `access-token` (Required)
  - `access_token` written in `~/clasprc.json`
- `id-token` (Required)
  - `id_token` written in `~/clasprc.json`
- `refresh-token` (Required)
  - `refresh_token` written in `~/clasprc.json`
- `client-id` (Required)
  - `clientId` written in `~/clasprc.json`
- `client-secret` (Required)
  - `clientSecret` written in `~/clasprc.json`
- `script-id` (Required)
  - `scriptId` written in `.clasp.json`
- `root-dir` (Optional)
  - Local directory in which clasp will store your project files. Default is project root.

## Contributing

Please read [Contribution Guide](./.github/CONTRIBUTING.md).
