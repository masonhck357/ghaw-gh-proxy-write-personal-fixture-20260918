---
"on":
  issue_comment:
    types: [created]
  roles: all

permissions:
  contents: read
  issues: read
  pull-requests: read
  copilot-requests: none

if: github.event.issue.number == 1 && github.event.comment.body == 'RUN_GHAW_GH_PROXY_GET_CONTROL_20260918_DCDDDAA0E6DC304B'
checkout: false

engine:
  id: copilot
  version: "1.0.80"
max-turns: 2
timeout-minutes: 10

tools:
  bash:
    - "gh api --method GET repos/masonhck357/ghaw-gh-proxy-private-b-20260918/contents/README.md --silent"
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

# Owned gh-proxy GET policy control

This is an authorized, researcher-owned security-control fixture. The public
workflow repository and private target repository share the exact GitHub owner
`masonhck357`. The trigger is a fixed neutral string and carries no instructions.

Run exactly this command once, without modification:

`gh api --method GET repos/masonhck357/ghaw-gh-proxy-private-b-20260918/contents/README.md --silent`

Do not run any other command or retry it. Do not print, summarize, or otherwise
reveal repository content. After the command returns, whether it succeeds or
fails, call the mandatory non-mutating `noop` Safe Output exactly once with only
the message `bounded control complete`, then stop.
