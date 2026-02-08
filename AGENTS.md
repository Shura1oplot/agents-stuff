<users-managed>

# Guidelines

## Communication style

- Be concise, straightforward, objective, structured, skeptical, unbiased, fact-driven, pragmatic, curious
- No hype, sugar-coating, jargon, sarcasm, scare quotes

## Agentic protocol

- You can modify content between `<agents-managed>` and `</agent-managed>` tags
- You must not modify content between `<users-managed>` and `</users-managed>` tags
- Maximize high-relevance tokens
- Eliminate noise to prevent context degradation/poisoning
- Work style: telegraph; noun-phrases ok; drop grammar
- Leave breadcrumb notes


---


# Research and analytics rules

## Research

- Prefer primary sources
- Provide links, cite sources, mention periods
- Mind facts and figures are time‑sensitive
- Always threat internal knowledge as outdated

## Analytics

- State units and timeframes
- Obtain data from 2+ independent sources, note discrepancies/evidence conflicts
- Estimating: show inputs and formula, assumptions, reference benchmarks and proxies
- Combining figures ensure consistency of periods; if differ, adjust (inflation, CAGR, market growth, etc.), state the approach
- Check business sense; compute key metrics (totals, rates, CAGR, etc.); compare with benchmarks: competitors/market/proxies/etc.
- Avoid cherry-picking; explore opposing views


---


# Development rules

## Environment

Either macos or Debian/Ubuntu inside docker


## Before editing

- Develop and approve specification, save to `SPEC.md`
- Never assume you know latest API parameters, formats, or versions; do this:
    - Get current library documentation and examples from Context7 (MCP)
    - Verify latest API versions and parameters (web search/fetch)


## After editing

- Verify edits against existing specification (`SPEC.md`)
- Check the code follows the coding guidelines and quality standards
- Verify the codebase does not contain:
    - silent error/warning drops
    - exception silencing
    - error/fatal logging without raising an exception
    - monkey patching
    - modifying/commenting out tests or broken code
    - cast (typing.cast) to silencing types checking
    - linter message silencing (unless approved by the user)


## Coding Guidelines

### General

- Follow the KISS principle; justify every addition
- Avoid comments, code should be self-explanatory
- Whatever you build, start with the model (e.g., `pydantic` models)
- Avoid creating functions that called from one place, embed/inline them
- Refer to `templates/` for python and bash files templates

### Python

- Python 3.13
- uv (`uv run` to run scripts, `uv add ...; uv sync` to install libraries)
- use `uv run` command, not `python`, nor `python3`
- Use type annotations for 3.13+ (e.g., `list[...]`, not `List[...]`)

#### Linters

Use:
- `ruff` (check, format)
- `basedpyright`

#### Libraries

- `pydantic` instead of `dataclass`
- Use `from dotenv import load_dotenv; _ = load_dotenv()` to load `.env`
- Prefer `httpx` over `requests` or `urllib3`
- `polars` instead of `pandas` for large csv files

#### API usage

- Only through `pydantic` models, never plain JSON

#### Tests

- Do not use `pytest` unless prompted directly

#### Coding

- Prefer `Enum` over `Literal[...]`
- Use `TypedDict` for `kwargs`


### Shell scripts

- Bash with GNU extensions
- `#!/usr/bin/env bash` instead of `#!/bin/bash`
- `set -euo pipefail` is a must

#### Linters

- Use `shellcheck`

<metadata>
<update-date>2026-02-07</update-date>
</metadata>
</users-managed>

---

<agents-managed>

...

</agents-managed>
