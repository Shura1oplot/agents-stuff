---
name: web-search-scrape-crawl-parse
description: Advanced tools and guidelines for web searching, scraping, crawling (Google, Firecrawl, Tavily, curl, httpx, etc.); parse documents and html
---

# Web search

- Use the language of primary sources (например, информацию по российским компаниям ищи на русском языке)
- You must check availability of the tools:
  - `firecrawl`, `curl` and `lit` - hard stop if not available or not working properly
  - other - log any issues

## Available tools

2. `firecrawl` cli tool (serper wrapper); see `firecrawl-*` skills
1. built-in search
3. Tavily (`tvly`); see `tavily-*` skills

Combine them for best result.

# Fetch/scrape

1. Firecrawl cli tool; see `firecrawl-*` skills
2. built-in fetch
3. `curl`, `httpx`
4. `agent-browser` (see `agent-browser` skill)
  - Connect to host Chrome, do not run it in docker
5. `browser-use` (cloud browser)

Notes:
- Some russian web sites may use a national certificate, disable TLS certificate check in this case

# Parse/convert to Markdown

- HTML:
  - `markdownify` cli and python lib (not `python -m markdownify`)
  - Firecrawl for fetch/scrape

- Documents (pdf/docx/pptx/etc.):
  - LiteParse (`lit`) by LlamaIndex; see `liteparse*` skills
  - `markitdown` cli and python lib
  - Docling through API (http://host.docker.internal:5001); see `docling-serve` skill and read http://host.docker.internal:5001/docs
  - LlamaParse cloud version; see `llamaparse*` skills
  - `tesseract`
  - Avoid using Firecrawl for pdf parsing (too expensive)

`lit`, `markitdown` - local, fast
`docling` - remote, slow, precise, OCR
`llamaparse` - best in class, slow, paid
`tesseract` - only fallback option

- Old MS office (doc/ppt/xls): `antiword`, `catdoc`, `catppt`, `xlrd`, etc.
- xlsx: `pandas`, `openpyxl`

## Notes

- Doing OCR set correct language(s) (e.g., RU)
