---
"on":
  workflow_run:
    workflows: ["GHAW proxy GET relay control"]
    types: [completed]
    branches: [main]
    conclusion: success
  roles: all

permissions:
  contents: read
  actions: read
  issues: read
  pull-requests: read
  copilot-requests: none

if: github.event.workflow_run.event == 'issue_comment' && github.event.workflow_run.actor.login == 'masonghbb'
checkout: false

engine:
  id: copilot
  version: "1.0.80"
max-turns: 2
timeout-minutes: 10

tools:
  bash:
    - "gh api --method GET repos/masonhck357/ghaw-gh-proxy-private-b-20260918/git/ref/tags/ghaw-proxy-write-20260918-dcdddaa0e6dc304b --silent"
  cli-proxy: true
  github:
    mode: gh-proxy
    github-token: ${{ secrets.GH_AW_GITHUB_TOKEN }}
    read-only: true
    allowed-repos: ["masonhck357/ghaw-gh-proxy-write-personal-fixture-20260918"]
    min-integrity: none

safe-outputs:
  noop:
    report-as-issue: false
  threat-detection: false
---

# Owned gh-proxy GET policy control via workflow-run

This repository-owner-authored maintenance workflow runs only after the named
relay workflow completes successfully. The source and target repositories are
both owned by `masonhck357`. Check only whether the preselected inert tag exists;
do not read or reveal repository content.

Run exactly this command once, without modification:

`gh api --method GET repos/masonhck357/ghaw-gh-proxy-private-b-20260918/git/ref/tags/ghaw-proxy-write-20260918-dcdddaa0e6dc304b --silent`

Do not run any other command or retry it. After the command returns, whether it
succeeds or fails, call the mandatory non-mutating `noop` Safe Output exactly
once with only the message `bounded relay control complete`, then stop.
