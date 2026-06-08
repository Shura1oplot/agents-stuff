---
name: web-search-scrape-crawl-parse
description: |
  Use for web search, scrape, crawl, parse and convert documents (pdf, docx, etc.) and HTML to Markdown; this skill has precedence over firecrawl, tavily, browser-use, agent-browser, llamaparse/lightparse and other such skills
---

In this skill ordered lists are arranged by priority descending.

# Tools

- FireCrawl: `firecrawl` cli tool or `FireCrawl` MCP
- Browser Use: `browser-use` cli tool or `Browser Use` MCP
- Cli tools: `curl`, curl-impersonate, `lit`
- Agent Browser: `agent-browser`
- Lightpanda Browser: `lightpanda`
- CloakBrowser

# Web search

## Guidelines

- Use the language of primary sources (например, информацию по российским компаниям ищи на русском языке)

## Tools

1. `firecrawl` (serper wrapper)
2. built-in search
3. Tavily (`tvly` or `tavily`)

Combine them for best result.

# Fetch and scrape

1. FireCrawl
2. Built-in fetch
3. `curl`
4. curl-impersonate (e.g., `curl-chrome146`)
5. `lightpanda` for js-heavy web pages
6. Agent Browser
7. CloakBrowser ([CloakBrowser](https://github.com/CloakHQ/CloakBrowser) + playwright)
8. Browser Use

## FireCrawl

Search, scrape, and crawl web pages; antibot bypass.

## Agent Browser

Connect to the host Chrome only; do not run Chrome in environment different from macos.

## Browser Use

Undetectable cloud browsers for AI-agents.

- If cli, use only cloud mode (`browser-use cloud ...`)
- Use residential proxy for Russian web sites:
  - If build-in RU proxy does not work, use or issue a custom one using [ASOCKS](https://api.asocks.com/) - check API key in `.env`

## CloakBrowser

Stealth Chromium (local, headless, in docker) that passes bot detection tests.

- check [CloakBrowser](https://github.com/CloakHQ/CloakBrowser)
- `docker run --rm cloakhq/cloakbrowser cloakbrowser1`
- `uv add cloakbrowser[geoip]; uv sync`

```python
from cloakbrowser import launch
browser = launch(
    # proxy='http://user:pass@residential-proxy:port',
    # geoip=True,
    # headless=False,
    # humanize=True,
)
page = browser.new_page()
page.goto("https://example.com")
browser.close()
```

## Notes

- Some Russian web sites (e.g., government portals, banks) could use a national certificate; disable TLS certificate check in this case
- For some Russian web sites (e.g., rzd.ru) there could be regional restrictions, use proxy (including residential)

# Parse/convert to Markdown

- HTML:
  1. Defuddle (`npx defuddle ...`, see [Defuddle on GitHub](https://github.com/kepano/defuddle))
  2. `markdownify` cli (not `python -m markdownify`) and python lib
  3. FireCrawl Fetch/scrape

- Documents (pdf/docx/pptx/etc.):
  1. LiteParse (`lit`) by LlamaIndex; see `liteparse*` skills
  2. `markitdown` cli and python lib
  3. Docling through API (http://host.docker.internal:5001); see `docling-serve` skill and read http://host.docker.internal:5001/docs
  4. LlamaParse cloud
  5. Firecrawl (last option, too expensive)
  6. `tesseract` (fallback option)

`lit`, `markitdown` - local, fast, no OCR
`docling` - remote, slow, precise, OCR
`llamaparse` - best in class, slow, paid

- MS Excel (xlsx): `pandas`, `polars`, `openpyxl`
- Old MS office (doc/ppt/xls): `antiword`, `catdoc`, `catppt`, `xlrd`, etc.

## Notes

- Doing OCR set correct language(s), e.g., EN or RU

# Specific

- rzd.ru - regional restrictions, use curl-impersonate
- rusprofile.ru - has active account through Browser Use
- *.gov.ru и некоторые банки - используют национальный сертификат РФ, необходимо отключить проверку
