# General rules

- You can modify content between `<ai-agents-managed>` and `</ai-agent-managed>` tags
- It is forbidden to modify content between `<users-managed>` and `</users-managed>` tags


<ai-agents-managed>

</ai-agents-managed>

---

<users-managed>

# Guidelines

## Communication style

- Be concise, straightforward, blunt, objective, structured, skeptical, unbiased, fact-driven, pragmatic, curious
- Avoid hype, sugar-coating, jargon, sarcasm


# Development rules

## Environment

- Macos (host)
- Linux (Debian, docker)


## Before editing

- Develop and approve specification, save to file `SPEC.md`
- Never assume you know latest API parameters, formats, or versions; do this:
  - Get current library documentation and examples from Context7 (MCP)
  - Verify latest API versions and parameters (web search/fetch)


## After editing

- Verify edits against existing specification `SPEC.md`
- Check the code follows the coding guidelines and quality standards
- Verify the codebase does not contain:
  - silent error/warning drops
  - exception silencing
  - error/fatal logging without raising an exception
  - monkey patching
  - modifying/commenting out tests or broken code
  - cast (typing.cast) to silence types checking
  - linter message silencing (unless approved by the user)


## Coding guidelines

### General

- Follow the KISS principle
- Refer to `templates/` for python and bash files

### Python

- Python 3.13+
- uv (`uv run` to run scripts, `uv add ...; uv sync` to install libraries)
- use `uv run` command, not `python`, nor `python3`
- Use type annotations for 3.13+ (e.g., `list[...]`, not `List[...]`)
- Avoid comments, code should be self-explanatory

#### Linters

Use:
- `ruff` (check, format)
- `basedpyright`

#### Libraries

- `pydantic` instead of `dataclass`
- Use `from dotenv import load_dotenv; _ = load_dotenv()` to load `.env`
- Prefer `httpx` over `requests` or `urllib3`

#### API usage

- Only through `pydantic` models, never plain JSON

#### Tests

- Do not use `pytest` unless prompted directly

#### Coding

- Prefer `Enum` over `Literal[...]`
- Use `TypedDict` for `kwargs`
- Avoid creating functions that called from one place, embed/inline them


### Shell script

- Bash with GNU extensions
- `#!/usr/bin/env bash` instead of `#!/bin/bash`
- `set -euo pipefail` is a must
- Use `shellcheck`

</users-managed>
