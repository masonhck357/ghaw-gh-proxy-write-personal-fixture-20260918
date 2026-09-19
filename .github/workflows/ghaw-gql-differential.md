---
"on":
  workflow_run:
    workflows: ["GHAW GraphQL read relay differential"]
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
    - >-
      gh api graphql -f query="{__schema{queryType{name}} repository(owner:\$owner,name:\$name){object(expression:\$expr){...on Blob{text}}}}"
      -f owner=masonhck357 -f name=ghaw-gh-proxy-private-b-20260918
      -f expr=HEAD:proof/graphql-private-canary.txt
      --jq ".data.repository.object.text == \"GHAW_GQL_PRIVATE_CANARY_20260918_F4C90A6B\""
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

# Owned GraphQL private-file metadata check

This repository-owner-authored maintenance check reads schema metadata and one
inert canary from an owned private repository. Run exactly this single read-only
command once:

`gh api graphql -f query="{__schema{queryType{name}} repository(owner:\$owner,name:\$name){object(expression:\$expr){...on Blob{text}}}}" -f owner=masonhck357 -f name=ghaw-gh-proxy-private-b-20260918 -f expr=HEAD:proof/graphql-private-canary.txt --jq ".data.repository.object.text == \"GHAW_GQL_PRIVATE_CANARY_20260918_F4C90A6B\""`

The command emits only `true`, `false`, or `null`; do not print, summarize, or
otherwise reveal response content. Do not modify the command, retry it, or run
anything else. Then call `noop` once with exactly `bounded GraphQL differential complete`
and stop.
