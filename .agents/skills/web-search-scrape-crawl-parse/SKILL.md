---
name: web-search-scrape-crawl-parse
description: Advanced tools and guidelines for web searching, scraping, crawling (Google, Firecrawl, Tavily, curl, etc.); parse documents and HTML
---

Ordered lists are arranged by priority descending.

# Tools availability check

- FireCrawl: `firecrawl` cli tool or `FireCrawl` MCP
- Browser Use: `browser-use` cli tool or `Browser Use` MCP
- Cli tools: `curl`, `lit`
- Agent Browser: `agent-browser`
- Lightpanda Browser: `lightpanda`

Report any missing tools/MCPs.

# Skills

Use relevant skills, e.g., `firecrawl-*`.

# Web search

- Use the language of primary sources (например, информацию по российским компаниям ищи на русском языке)

## Tools

1. `firecrawl` (serper wrapper)
2. built-in search
3. Tavily (`tvly`)

Combine them for best result.

# Fetch and scrape

1. FireCrawl
2. Built-in fetch
3. `curl`
4. curl-impersonate (e.g., `curl-chrome146`)
5. Agent Browser
5. Browser Use

## Agent Browser

Connect to the host Chrome only; do not run Chrome in docker.

## Browser Use

If cli, use only cloud mode (`browser-use cloud`)

## Notes

- Some russian web sites (e.g., government portals, banks) could use a national certificate; disable TLS certificate check in this case
- For some Russian web sites (e.g., rzd.ru) there could be regional restrictions, use proxy (including residential)

# Parse/convert to Markdown

- HTML:
  1. Defuddle (`npx defuddle`, see [Defuddle on GitHub](https://github.com/kepano/defuddle))
  2. `markdownify` cli and python lib (not `python -m markdownify`)
  3. FireCrawl Fetch/scrape
  4. `lightpanda` if web page js-heavy

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
