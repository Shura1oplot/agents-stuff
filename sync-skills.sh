#!/usr/bin/env bash

set -euo pipefail

THIS_SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

SKILLS=(
    journalist-editor
    research-analysis-modeling
    scientific-data-analysis
    web-search-scrape-crawl-parse
)

AGENTS_SANDBOX_DIR=$THIS_SCRIPT_DIR/../agents-sandbox

if [[ ! -d $AGENTS_SANDBOX_DIR ]]; then
    # shellcheck disable=SC2016
    echo 'ERROR: `agents-sandbox` not found' >&2
    exit 1
fi

for skill in "${SKILLS[@]}"; do
    [[ -d $THIS_SCRIPT_DIR/.agents/skills/$skill ]] \
        && rm -rf "$THIS_SCRIPT_DIR/.agents/skills/$skill"
    cp -r "$AGENTS_SANDBOX_DIR/.agents/skills/$skill" \
        "$THIS_SCRIPT_DIR/.agents/skills/"
done
