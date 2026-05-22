---
name: research-analysis-modeling
description: |
  Use for research, business analysis, data analytics, financial and economic modeling, working with data sources, assumptions and proxis, estimating and guessing
---

# Skill purpose

Follow this basic principles while conducting research for business, economics, and operational modeling, forecasting, benchmarking, and other business-analysis information-gathering tasks.

Refer also `scientific-data-analysis` skill from Shortcut.AI.

# Modeling

A model represents a real-world process, developed to solve a specific business problem and support a decision

# Core principles

- Define the problem and success criteria
- Choose the right level of simplification: not too simple to miss required precision; not so complex that it becomes overkill
- Use MECE (Mutually Exclusive, Collectively Exhaustive): ensure categories do not overlap (exclusive) and cover all possibilities (exhaustive); eliminate double-counting and ensure no gaps in the analysis
- Mind GIGO (Garbage In, Garbage Out): model output quality is bounded by input quality
- Facts are time-sensitive: mind source publication date

# Model structure

1. Inputs:
   - Historical data: a digital representation of the real-world business process usually in the form of events records
   - Assumptions (by scenario): educated guesses about how the business process may behave in the future
2. Business logic: mathematical formulas based on the chosen methodology
3. Outputs

# Modeling process

1. Plan the model
   - Identify the problem the model is intended to solve and the decision it should support
   - Form hypotheses to test
   - Define criteria (e.g., thresholds)
   - Define scope (e.g., geography, segments, timeframes), requirements (e.g., precision), and constraints
   - Select a methodology/approach/framework; prefer simpler approaches that meet requirements
   - Design the model structure
   - Identify required data
   - Identify data sources

2. Build the model

   - Gather data
   - Prepare data
   - Assess input data quality
   - Build the business logic
   - Generate outputs

3. Use the model

   - Perform quality-control the outputs
   - Test the hypotheses
   - Answer the question
   - Provide options or recommendations for the decision
   - Communicate outcomes in an actionable format

## 1. Plan the model

Convert the business problem into research questions. Turn vague symptoms into testable hypotheses and measurable variables. Example pattern: “Sales not growing” → market growth? share loss? distribution? awareness? pricing? category saturation?

Avoid cherry-picking; explore opposing views

Search for and pick a simple and relevant playbook that meets requirements, and state the core identity/formula (e.g., `revenue = units × price`)

Pre-commitments to reduce drift:

- Define each key KPI/variable before extraction and calculation
- Define how missing variables will be estimated (primary → proxy → constructed → benchmark → last-resort)
- Define 2-5 numeric checks (reconciliation, identities, constraints, external anchors) and what you do if they fail
- Identify top assumptions; set low/base/high ranges; run one-at-a-time sensitivity + coherent scenario table

Skipping this step might result to choosing wrong approach and framework and incorrect solution.

## 2. Build the model

Ensure you understand all the items from the Plan step and align your further work accordingly

### 2.1 Gather data

For your data needs identify sources

For each source, assess:

- Authority: who produced it; incentives/conflicts
- Methodology: definitions, sampling, coverage, collection method
- Time: publication date, “as-of” date, period covered, revision history
- Granularity: geography, segment, currency, unit (nominal/real)
- Consistency: does it reconcile with other sources? if not, why?

Data sources by reputability (descending):

1. Data provided by the client (if credible and internally consistent)
2. Public audited financial reporting
3. Official government statistics
4. Specialized analytics agencies (e.g., Argus, Platts for commodities)
5. General research agencies and statistics aggregators
6. Business consulting firms
7. Public media (press releases, expert interviews)
8. Expert interviews conducted by a business analyst
9. Data collected by a business analyst via observation

Prefer primary sources

If you find an outlook, follow its references to the underlying primary sources

Assumptions by credibility (descending):

1. Forecasts from specialized analytics agencies (e.g., Argus)
2. Official government economic scenarios
3. Inertial forecasts based on market dynamics
4. Benchmarks (historical, cross-country) and proxies
5. Expert opinions
6. Forecasts from consulting firms
7. Forecasts from companies in the sector
8. Educated guesses based on proxy

While collecting data:

1. Use at least two independent sources and explain discrepancies (scope, units, timeframe, methodology, etc.)

2. Use triangulation:

   - Top-down (e.g., macro totals → segment shares)
   - Bottom-up (e.g., units × price × adoption)
   - Alternative parameter (e.g., spend per user × number of users)

3. State ranges (e.g., 5–10%) explicitly when applicable

4. Address potential biases in data, e.g.:

   - Client-provided data may contain manipulation if not properly audited
   - Audited reporting can still be managed; trends may differ between IFRS and local standards (e.g., GAAP, RAS/РСБУ)
   - Official statistics may reflect political incentives
   - Professional magazines may focus on newsbreaks, rather than statistical accuracy and objectivity
   - Generic aggregators may oversimplify or contain methodological errors
   - Experts may be too conservative or too optimistic
   - Consultants may cherry-pick to support commercial narratives
   - Company forecasts may be optimized for investors or customers

See also `web-search-scrape-crawl-parse` skill

Shallow execution of this step may result in missing important details and biased view.

### 2.2 Prepare data

Executing this step be disciplined.

#### 2.2.1 Metric specification (per variable)

Before calculating, write a short “metric spec” to prevent definitions drift

Metric spec fields:

- ID (like column name in database)
- Name (for humans)
- Definition (formula; numerator/denominator where relevant)
- Units + scale (e.g., $, kg, %, bps; raw, thousands, millions)
- Grain (entity / segment / geography / time period; fiscal vs calendar)
- Inclusion/exclusion rules (what is explicitly in and out)
- Sign conventions (e.g., costs positive vs negative)
- Required raw fields + source(s)
- Known caveats (restatements, estimates, gaps, one-offs)

Metric spec QC checks:

- Units are consistent (e.g., $/unit × units = $)
- Values in acceptable ranges (e.g., rates 0–1; totals ≥ parts; high ≥ low)
- “As-of” date and coverage match the question

#### 2.2.2 Assess data quality

This is a vital step as the GIGO principle always works.

##### 2.2.2.1 Technical criteria

1. Completeness: data covers:

   - The full period
   - All companies in the group/holding
   - All items in scope (e.g., SKUs, segments)
   - Other context-specific requirements

2. Accuracy: required analytical breakdowns are available in the extraction/report

3. Integrity/consistency: data points can be linked unambiguously via identifiers, e.g.:

   - Business unit
   - Company code (since company names may vary)
   - SKU code

4. Clarity of values: meanings of all variables and fields are clear

Based on this, estimate data reliability

##### 2.2.2.2 Business-sense criteria

1. Correctness: how precisely the data reflects real business events (amounts, quantities)
2. Timeliness: how promptly events are recorded in the database
3. Objectivity: independence from subjective judgment (e.g., experts, stakeholders, managers, business users)

Based on this, estimate data credibility: can users trust it?

#### 2.2.3 Assemble the model

1. Build dataset:

   - Keys: define a primary key for each table; verify uniqueness; investigate and eliminate duplicates
   - Joins: state join keys + expected cardinality (1:1, 1:many, many:many). After joining:
      - Row count check (unexpected blow-ups indicate many:many or duplicate keys)
      - Unmatched keys review (left-only/right-only)
   - Missingness: quantify missingness per field and per segment/time; decide rule (drop/impute/flag); record the decision
   - Continuity: for time series, check for gaps/overlaps and sudden jumps; tag structural breaks vs data issues
   - Outliers: define outlier rules using business logic (not only z-scores). Separate “data error” from “real event”
   - Hard constraints: non-negativity for physical volumes, valid category sets, monotonic relationships where required, etc.

2. Make figures comparable, align:

   - Units (including domain-specific units)
   - Scale (thousand/million/billion)
   - Currency
   - Timeframe (calendar vs fiscal year)
   - Accounting standard
   - Actual vs estimate vs forecast
   - Inclusion/exclusion rules
   - Nominal vs real prices
   - For ranges: choose average or median based on methodology/context

Log all conversions and state all coefficients used (e.g., FX rates, inflation assumptions)

3. Address outliers

4. Structure your workspace:

```
./YYYY-MM-DD <task name>:
   - 01_data:
      - 01_raw  # immutable raw data
      - 02_converted  # converted and typed raw data; split transactions, master data, and pivots
      - 03_primary  # cleansed, unpivoted, enriched, denormalized, reassembled, and optimized for analysis data
      - 04_models  # serialized models with links to scripts
      - 05_output  # csv/json pivots used in reports
   - 02_scripts:
      - <script_name_vX>, X = 01, 02, ...
   - 03_reports:
      - <report name>_summary.md  # executive summary with key results
      - <report name>_detailed.md  # detailed information supported the executive summary
```

5. Follow the “tidy data” principle:

   - Each observational unit forms a table
   - Each variable forms a column
   - Each observation forms a row
   - No data in column names (e.g., “Purchases 2025” is bad; “Purchase amount” / “Purchase count” with separate fields for “Units,” “Currency,” “Period,” “VAT included,” etc. is good)
   - Avoid losing important context-specific details, e.g., net/gross weight (tones), gross/net values, pork weights in Live Weight Equivalent (LWE) vs Carcass Weight Equivalent (CWE) vs Retail Weight Equivalent (RWE), IFRS vs GAAP vs RAS/РСБУ, with/without VAT. Anticipate what may matter later

### 2.4 Output format

In the task workspace folder save:

- Source registry (data inventory): one row per source, link (URL) and path to the saved file
- Extraction notes: what exactly was taken from each source (tables/fields)
- Conversion & normalization log: every transformation (FX, inflation, unit changes)
- Reconciliation table: same metric across sources + deltas + explanation
- Assumptions register: each assumption with ID, rationale, and sensitivity
- Sensitivity table: assumption × low/base/high → key output(s)
- Data dictionary: field definitions, units, and grain (time/geography/segment)
- Metric specs: one per KPI / key variable
- Integrity checks summary: pass/fail + notes
- Quality control checklist results: pass/fail + comments

## 3. Use the model

### 3.1 Output quality assessment

Output may be mathematically correct, but does not make any business sense. Check and challenge it. Compute key metrics (min/max/mean/median/spread, totals, CAGR) and compare against relevant macro indicators, benchmarks, and proxies. Understand and comment critical diffs. Challenge assumptions, conduct sensitivity tests.

### 3.2 Answer the question

Depending on the objective, outcomes should answer:

- What happened?
- Why did it happen? Which drivers?
- Why is it relevant/important?
- What could happen next?
- What can be done about it?

### 3.3 Write executive report

- Cite sources, provide links, and include the relevant period near each citation/link (at least the year)
- If estimating/guessing, show inputs and formulas, key assumptions, and reference benchmarks/proxies; Logic should be transparent and auditable
- Add notes for the user about how to interpret and apply the information
- Provide detail for the user to reproduce your steps
- Clearly separate what the source states from your inference

### 3.4 Follow auditability principle

- All intermediate and final version of results (figures) should be auditable (traceable, verifiable, reproducible) from their sources and assumptions through business logic to the results
- Save all found relevant sources as files (original and Markdowned)

Skipping this step may lead to results that cannot be reproduced and nullify entire analysis.

# Work done checklist

- [ ] The sources used are reliable: ...
- [ ] All data quality issues are addressed: ...
- [ ] The results are auditable: ...
- [ ] The results make business sense: ...
- [ ] All reports are the language guidelines compliant: ...
- [ ] Peer review is conducted: ...
- [ ] I followed the recommended workspace organization
- [ ] The workspace is cleaned up

Comment all unchecked marks

# Technical

- Your native modeling format is python for logic and parquet for data
- Use `references/excel.md` if users ask you for an excel file

# Personality Traits

In addition to ones listed in `AGENTS.md` you:
- are disciplined: strictly follow the guidelines provided
- are curious: investigate any discrepancies and deviations, unexpected and uncommon results
- have superior business acumen: all results make business sense in a broader context (e.g., company vs industry, industry vs country, country vs region vs world)
