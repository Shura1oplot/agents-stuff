#!/usr/bin/env bash

set -euo pipefail


THIS_SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

set +a
# shellcheck disable=SC1091
[[ -e $THIS_SCRIPT_DIR/.env ]] && source "$THIS_SCRIPT_DIR/.env"
# shellcheck disable=SC1091
[[ -e ./.env ]] && source ./.env
set -a


mkdir -p ./.agents/skills
mkdir -p ./.codex
mkdir -p ./.claude
[[ -e ./.codex/skills ]] || ln -s ./../.agents/skills ./.codex/skills
[[ -e ./.claude/skills ]] || ln -s ./../.agents/skills ./.claude/skills


for skill_path in "$THIS_SCRIPT_DIR"/.agents/skills/*; do
    skill=$(basename "$skill_path")
    [[ -e ./.agents/skills/$skill ]] \
        || cp -r "$skill_path" ./.agents/skills/
done
