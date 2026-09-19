---
"on":
  workflow_run:
    workflows: ["GHAW proxy POST relay differential"]
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
    - "gh api --method POST repos/masonhck357/ghaw-gh-proxy-private-b-20260918/git/refs -f ref=refs/tags/ghaw-proxy-write-20260918-dcdddaa0e6dc304b -f sha=0e1eee9127b868b858b6f5132dc0a1cbecb20331"
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

# Owned gh-proxy POST policy differential via workflow-run

This repository-owner-authored maintenance workflow runs only after the named
relay workflow completes successfully. The source and target repositories are
both owned by `masonhck357`. The sole possible effect is one preselected inert
tag in the excluded private repository.

Run exactly this command once, without modification:

`gh api --method POST repos/masonhck357/ghaw-gh-proxy-private-b-20260918/git/refs -f ref=refs/tags/ghaw-proxy-write-20260918-dcdddaa0e6dc304b -f sha=0e1eee9127b868b858b6f5132dc0a1cbecb20331`

Do not run any other command or retry it. Do not create any other ref or modify
any other resource. After the command returns, whether it succeeds or fails,
call the mandatory non-mutating `noop` Safe Output exactly once with only the
message `bounded relay differential complete`, then stop.
