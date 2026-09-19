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

if: github.event.issue.number == 1 && github.event.comment.body == 'RUN_GHAW_GH_PROXY_POST_DIFFERENTIAL_20260918_DCDDDAA0E6DC304B'
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

# Owned gh-proxy POST policy differential

This is an authorized, researcher-owned security-control fixture. The public
workflow repository and private target repository share the exact GitHub owner
`masonhck357`. The trigger is a fixed neutral string and carries no instructions.
The sole possible effect is one inert tag in the excluded private repository.

Run exactly this command once, without modification:

`gh api --method POST repos/masonhck357/ghaw-gh-proxy-private-b-20260918/git/refs -f ref=refs/tags/ghaw-proxy-write-20260918-dcdddaa0e6dc304b -f sha=0e1eee9127b868b858b6f5132dc0a1cbecb20331`

Do not run any other command or retry it. Do not create any other ref or modify
any other resource. After the command returns, whether it succeeds or fails,
call the mandatory non-mutating `noop` Safe Output exactly once with only the
message `bounded differential complete`, then stop.
