#!/usr/bin/env bash

set -euo pipefail


npx --yes skills update --global --yes


npm --yes install --global agent-browser
npx --yes skills add --global vercel-labs/agent-browser --yes


curl -fsSL https://browser-use.com/cli/install.sh | bash
npx --yes skills add --global browser-use/browser-use --yes


npm --yes install --global firecrawl-cli
npx --yes skills add --global firecrawl/cli --yes


npm --yes install --global @llamaindex/liteparse
npm --yes install --global @llamaindex/llama-cloud
npx --yes skills add --global run-llama/llamaparse-agent-skills --yes


uv tool install tavily-cli
npx --yes skills add --global tavily-ai/skills --yes


npx --yes skills add --global \
    https://github.com/forrestchang/andrej-karpathy-skills \
    --skill karpathy-guidelines --yes


# uv tool install graphify
# graphifyy install --platform codex
# graphifyy install --platform claude


brew install lightpanda-io/browser/lightpanda
npx --yes skills add https://github.com/lightpanda-io/agent-skill \
    --skill Lightpanda --yes


uv tool install 'parallel-web-tools[cli]'
npx --yes skills add parallel-web/parallel-agent-skills \
    --all --yes


npm install -g @doist/todoist-cli
td skill install --force universal
