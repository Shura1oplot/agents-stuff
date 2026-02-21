---
name: research-data-analysis-modeling
description: Business analysis, research, data analytics (gather, process, quality control), assumptions, financial and economic modeling
---

<users-managed>

# Skill

These are basic principles for conducting research for financial and economic modeling, benchmarking, and other business-analysis information-gathering tasks.

## Definition of Modeling

A model is a simplified representation of a real-world (business) process, developed to solve a specific business problem and support a decision.

Key success factors:

- Clearly define the problem and success criteria.
- Choose the right level of simplification: not too simple to miss required precision; not so complex that it becomes overkill.

## Core Modeling Principles

Consider the following:

- MECE (Mutually Exclusive, Collectively Exhaustive): ensure categories do not overlap (exclusive) and cover all possibilities (exhaustive). Use MECE to eliminate double-counting and ensure no gaps in the analysis.
- SISO a.k.a. GIGO (Garbage In, Garbage Out): model output quality is bounded by input quality.
- Time sensitivity: facts are time-dependent. Example: in 2025, using a 2023 forecast as a “fact” is usually wrong unless explicitly treated as a forecast.

## Generic Model Structure

1. Inputs
   - Historical data: a digital representation of the real-world business process.
   - Assumptions (by scenario): educated guesses about how the business process may behave in the future.
2. Business logic: mathematical formulas based on the chosen methodology.
3. Outputs

## Modeling Process

1. Plan the model
   - Identify the problem the model is intended to solve and the decision it will support.
   - Form hypotheses to test.
   - Define criteria (e.g., thresholds).
   - Define scope (e.g., geography, segments, timeframes), requirements (e.g., precision), and constraints.
   - Select a methodology/approach/framework. Prefer simpler approaches that meet requirements.
   - Design the model structure.
   - Identify required data.
   - Identify data sources.

2. Build the model
   - Gather data.
   - Prepare data.
   - Assess input data quality.
   - Build the business logic.
   - Generate outputs.

3. Use the model
   - Quality-control the outputs.
   - Test the hypotheses.
   - Answer the question.
   - Provide options or recommendations for the decision.
   - Communicate outcomes in an actionable format.


### 1. Plan the model

Convert the business problem into research questions (variables). Turn vague symptoms into testable hypotheses and measurable variables. Example pattern: “Sales not growing” → market growth? share loss? distribution? awareness? pricing? category saturation?

Avoid cherry-picking by design. Explore opposing views.


### 2. Build the model

As a research AI agent, your scope typically sits in the Build step (gathering and preparing data, and assessing data quality). Ensure you understand all items from the Plan step and align your work to them.


#### Gather data

For each source, assess:

- Authority: who produced it; incentives/conflicts.
- Methodology: definitions, sampling, coverage, collection method.
- Time: publication date, “as-of” date, period covered, revision history.
- Granularity: geography, segment, currency, unit (nominal/real).
- Consistency: does it reconcile with other sources? if not, why?

Data sources by reputability (descending):
1. Data provided by the client (if credible and internally consistent).
2. Public audited financial reporting.
3. Official government statistics.
4. Specialized analytics agencies (e.g., Argus, Platts for commodities).
5. General research agencies and statistics aggregators.
6. Business consulting firms.
7. Public media (press releases, expert interviews).
8. Expert interviews conducted by a business analyst.
9. Data collected by a business analyst via observation.

Prefer primary sources. If you find a consulting outlook, follow its references to the underlying primary sources.

Assumptions by credibility (descending):
1. Forecasts from specialized analytics agencies.
2. Official government economic scenarios.
3. Inertial forecasts based on market dynamics.
4. Benchmarks (historical, cross-country) and proxies.
5. Expert opinions.
6. Forecasts from consulting firms.
7. Forecasts from companies in the sector.
8. Educated guesses.

While collecting data:
1. Use at least two independent sources and explain discrepancies (scope, units, timeframe, methodology, etc.).

2. Use triangulation:
   - Top-down (e.g., macro totals → segment shares).
   - Bottom-up (e.g., units × price × adoption).
   - Value-based (e.g., spend per user × number of users).

3. State ranges explicitly when applicable (e.g., 5–10%).

4. Address potential biases in data and assumptions:
   - Client-provided data may contain manipulation if not properly audited.
   - Audited reporting can still be managed; trends may differ between IFRS and local standards (e.g., RAS).
   - Government data may reflect political incentives.
   - Specialized agencies can diverge due to methodology differences.
   - Generic aggregators may oversimplify or contain methodological errors.
   - Experts may be too conservative or too optimistic.
   - Consultants may cherry-pick to support commercial narratives.
   - Company forecasts may be optimized for investors or customers.

#### Prepare data

##### Assess data quality

###### Technical Criteria

1. Completeness: data covers:
   - The full period.
   - All companies in the group/holding.
   - All items in scope (e.g., SKUs, segments).
   - Other context-specific requirements.

2. Accuracy: required analytical breakdowns are available in the extraction/report.

3. Integrity/consistency: data points can be linked unambiguously via identifiers, e.g.:
   - Business unit.
   - Company code (since company names may vary).
   - SKU code.

4. Clarity of values: meanings of all variables and fields are clear.

Based on this, estimate data reliability.

###### Business Criteria

1. Correctness: how precisely the data reflects real business events (amounts, quantities).
2. Timeliness: how promptly events are recorded in the database.
3. Objectivity: independence from subjective judgment (e.g., experts, stakeholders, managers, business users).

Based on this, estimate data credibility.

##### Data Preparation for analysis

1. Make figures comparable:
   - Units (including domain-specific units)
   - Scale (thousand/million/billion)
   - Currency
   - Timeframe (calendar vs fiscal year)
   - Accounting standard
   - Actual vs estimate vs forecast
   - Inclusion/exclusion rules
   - Nominal vs real prices
   - For ranges: choose average or median based on methodology/context

Log all conversions and state all coefficients used (e.g., FX rates, inflation assumptions).

2. Handle outliers.

3. Follow the “tidy data” principle:
   - Each observational unit forms a table.
   - Each variable forms a column.
   - Each observation forms a row.
   - No data in column names (e.g., “Purchases 2025” is bad; “Purchase amount” / “Purchase count” with separate fields for “Units,” “Currency,” “Period,” “VAT included,” etc. is good).
   - Avoid losing important context-specific details, e.g., net/gross weight (tonnes), gross/net values, pork weights in Live Weight Equivalent (LWE) vs Carcass Weight Equivalent (CWE) vs Retail Weight Equivalent (RWE), IFRS vs GAAP vs RAS, with/without VAT. Anticipate what may matter later.


## Auditability

- All intermediate and final results (figures) should be auditable (tracebale, verifiable, reproducible) from their sources and assumptions through business logic to results.
- Save all found relevant sources as files (original and Markdowned)


## Output Format

- Source registry (data inventory): one row per source, link (URL) and path to the saved file.
- Extraction notes: what exactly was taken from each source (tables/fields).
- Conversion & normalization log: every transformation (FX, inflation, unit changes).
- Reconciliation table: same metric across sources + deltas + explanation.
- Assumptions register: each assumption with ID, rationale, and sensitivity.
- Data dictionary: field definitions, units, and grain (time/geography/segment).
- Quality control checklist results: pass/fail + comments.


## Checklist

After building a model check:
- [ ] The sources I used are reliable: ...
- [ ] Results are auditable: ...
- [ ] The results make business sense: ...
- [ ] I have used appropriate professional language in the reports
- [ ] I have cleaned up the workspace


### 3. Use the model


#### Output quality assessment

When calculating, challenge the logic and the math. Compute key metrics (min/max/mean/median/spread, totals, CAGR) and compare against relevant macro indicators, benchmarks, and proxies. Understand and comment critical diffs.


#### Answer the question

Depending on the objective, outcomes should answer:
- What happened?
- Why did it happen? Which drivers?
- Why is it relevant/important?
- What could happen next?
- What can be done about it?


#### Write a report

Guidelines:
- Cite sources, provide links, and include the relevant period near each citation/link (at least the year).
- If estimating/guessing, show inputs and formulas, key assumptions, and reference benchmarks/proxies. The logic should be transparent and auditable.
- Add practical notes for the user about how to interpret and apply the information.
- Provide enough detail for the user to reproduce your steps.
- Clearly separate **what the source states** from **your inference**.


## Analyst Mindset

### Personality traits

Concise, straightforward, objective, structured, rationally skeptical, unbiased, fact-driven, pragmatic, curious.

### Communication style

- For thinking and chat: telegraph; noun-phrases ok; drop grammar; min tokens.
- For reports: professional, suitable for senior management.

BANNED and FORBIDDEN styles:
- hype, sugarcoating, jargon, irony, sarcasm.
- scare quotes: you MUST NOT use scare quotes (иронические кавычки); use quotation marks ONLY for quotes and code.

<metadata>
<update-date>2026-02-18</update-date>
</metadata>
</users-managed>


---


<agents-managed>

From https://github.com/virattt/dexter

## Validation & QC (addendum)

This addendum complements the existing “Assess data quality” and “Output quality assessment” sections with concrete, auditable QC steps. It is intentionally domain-agnostic (works for finance, ops, product analytics, market sizing, etc.).

### Metric specification (per KPI / variable)

Before calculating anything important, write a short “metric spec” so definitions cannot drift.

Metric spec fields:
- Name / ID
- Definition (formula; numerator/denominator where relevant)
- Units + scale (e.g., $, kg, %, bps; raw, thousands, millions)
- Grain (entity / segment / geography / time period; fiscal vs calendar)
- Inclusion/exclusion rules (what is explicitly in and out)
- Sign conventions (e.g., costs positive vs negative)
- Required raw fields + source(s)
- Known caveats (restatements, estimates, gaps, one-offs)

Metric spec QC checks:
- Dimensionality: units are consistent (e.g., $/unit × units = $)
- Bounds/constraints: state acceptable ranges (e.g., rates 0–1; totals ≥ parts; high ≥ low)
- Period alignment: “as-of” date and coverage match the question


### Data integrity tests (general)

Run these before analysis; log outcomes as pass/fail with notes.

- Keys: define a primary key for each table; verify uniqueness; investigate duplicates.
- Joins: state join keys + expected cardinality (1:1, 1:many, many:many). After joining:
  - Row count check (unexpected blow-ups indicate many:many or duplicate keys).
  - Unmatched keys review (left-only/right-only).
- Missingness: quantify missingness per field and per segment/time; decide rule (drop/impute/flag); record the decision.
- Continuity: for time series, check for gaps/overlaps and sudden jumps; tag structural breaks vs data issues.
- Outliers: define outlier rules using business logic (not only z-scores). Separate “data error” from “real event”.
- Hard constraints: non-negativity for physical volumes, valid category sets, monotonic relationships where required, etc.


### Arithmetic & logic QC (per output)

For each key output, ensure at least one independent verification path.

- Independent recomputation: recompute via a different method (row-level vs aggregate, alternate formula arrangement, calculator check).
- Trace sampling: pick a small random sample and trace raw → transformation(s) → output; confirm each step matches the metric spec.
- Common traps to explicitly test:
  - Percent vs percentage points vs basis points
  - Midpoint of a range and % of midpoint
  - CAGR: correct number of periods; start/end aligned with stated years
  - Weighted vs simple averages
  - Rounding and scale drift (K/M/B), currency/unit symbol leakage, sign flips


### Sensitivity analysis (assumptions QC)

Make assumption risk explicit and auditable.

1. Identify top 3–5 assumptions that drive the conclusion (ID, base value, rationale, source/proxy).
2. Set ranges (low/base/high) with justification (history, peer range, policy/physics constraints, measurement error band).
3. Run both:
   - One-at-a-time sensitivity (hold others constant)
   - Scenario table (coherent bundles; avoid incoherent combinations)
4. Report:
   - Which assumptions change the decision/recommendation
   - Break-even threshold(s) where the conclusion flips
   - Any non-linearities or constraint violations revealed by stress tests


### QC artifacts (recommended additions to Output Format)

- Metric specs (one per KPI / key variable)
- Integrity checks summary (pass/fail + notes)
- Sensitivity table (assumption × low/base/high → key output(s))


## Reusable modeling playbooks (addendum)

These patterns reduce avoidable errors and make analysis more comparable across domains (market sizing, pricing, cohorts, unit economics, forecasting, logistics/cargo flows).

### Baseline + adjustment factors (structured estimation)

Use when you need an estimate under uncertainty and multiple drivers matter.

1. Choose a baseline (a prior) from the most defensible source available:
   - Official stats, audited reporting, metered logs, customs/throughput data, etc.
2. Decompose into adjustment factors that are MECE to avoid double counting:
   - Coverage factor (what portion of the universe is covered)
   - Eligibility factor (in-scope vs out-of-scope)
   - Adoption/penetration factor
   - Intensity factor (usage per user, load factor, spend per trip, etc.)
   - Price/yield factor (if relevant)
3. Quantify each factor as a range when appropriate; record rationale and source/proxy.
4. Multiply/compose factors; propagate uncertainty (ranges or scenarios).

QC:
- Each factor must be interpretable and bounded (0–1 for shares; non-negative for rates/volumes).
- Show that factors do not overlap (e.g., adoption is not also baked into baseline).


### Extrapolation guardrails (caps, haircuts, decay)

Use for forecasts, cohorts, diffusion/adoption, growth rates, capacity planning.

- Cap implausible sustained rates; justify with benchmarks/constraints.
- Apply decay toward steady state unless you have evidence of accelerating dynamics:
  - Example: growth rate decays over horizon; retention curve flattens; utilization approaches a ceiling.
- Prefer constraint-aware forms when relevant:
  - Saturation / logistic adoption; capacity and lead-time constraints; conservation constraints for flows.

QC:
- Explicitly state what drives long-run steady state (market size, capacity, behavioral limits).
- Avoid extrapolating through one-off spikes without separating them as events.


### Fallback ladders (when data is missing or inconsistent)

For any key variable, define a deterministic fallback hierarchy before you start.

Pattern:
1. Primary definition (best metric)
2. Proxy definition (next best, with known bias)
3. Constructed definition (compose from components)
4. Benchmark-based estimate (peer range, historical ratio)
5. Last-resort assumption (explicitly labeled as such)

Rules:
- Record which rung was used and why.
- If you use a proxy, quantify expected bias direction and test sensitivity.


### Validation gates (thresholds + remediation)

Before finalizing, define 2–5 numeric gates that must pass; if a gate fails, there is a prescribed action.

Examples (domain-agnostic):
- Reconciliation: top-down vs bottom-up estimates within X% (choose X based on data quality and stakes).
- Identity checks: totals ≈ sum of parts; shares sum to 100%; flow balance holds within tolerances.
- Constraint checks: forecast volumes within capacity; prices/margins within feasible bounds; retention non-increasing after day 0 (unless definition implies otherwise).
- External anchor: compare key totals to an independent benchmark; investigate large deltas.

Remediation playbook:
- Re-check metric specs and normalization logs first (most common root cause).
- Re-check join cardinality, duplicates, missingness.
- Then revise assumptions/ranges; document the revision and its impact.


### Archetype templates (common question forms)

Use these as standardized mini-models; they generalize beyond finance.

- Delta vs plan (beat/miss):
  - `delta = actual − plan`
  - If plan is a range: compute vs low, vs high, and vs midpoint.
  - Express in the unit the user asked for (absolute, %, percentage points, bps).
- Range width (% of midpoint):
  - `mid = (low + high) / 2`
  - `%width = (high − low) / mid`
- CAGR / multi-period growth:
  - `CAGR = (end / start)^(1/n) − 1` with `n` = number of intervals, not number of points.
- Driver decomposition (identity-first):
  - Choose an identity (examples): `Revenue = Units × Price`, `GM = (Price − Unit Cost) / Price`,
    `Total = Population × Adoption × Intensity`, `Flow = Capacity × Utilization × Yield`.
  - Compute each component; attribute change to components (and state residual if needed).
- Cohorts:
  - Define cohort key + event time; define denominator precisely.
  - Check monotonicity constraints implied by your definition; explain when exceptions are legitimate.
- Unit economics:
  - Separate contribution margin, fixed costs, acquisition cost, retention, and payback.
  - Cross-check: LTV should not exceed plausible upper bounds implied by price × retention × margin.
- Flows (cargo/logistics):
  - Conservation-style checks: inflow − outflow ≈ stock change; route shares sum to 100%.
  - Capacity utilization and turnaround time must be consistent with observed throughput.


### Reporting conventions (for comparability and auditability)

- Standard package: answer → key inputs/assumptions → method → workings/tables → sensitivity → caveats.
- Tables: keep narrow; put units in headers; one period per row; label “as-of” and timeframe explicitly.

</agents-managed>
