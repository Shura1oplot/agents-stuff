---
name: scientific-data-analysis
description: Use when creating data dashboards, analytical reports, or any visualization that presents data-driven conclusions. Ensures statistical rigor and honest data presentation.
---

This skill ensures that data analysis and visualization follows scientific best practices. Apply these principles whenever building dashboards, reports, or visualizations that present data-driven insights.

## Core Principle: Honest Data Presentation

Every chart, metric, and conclusion must faithfully represent the underlying data. The goal is insight, not persuasion. If the data is ambiguous, say so. If the sample is small, show it. Never let design choices distort what the data actually says.

## Statistical Rigor

### Before Visualizing, Understand the Data
- **Examine distributions** before choosing aggregations. Means are misleading for skewed data — use medians or show the full distribution.
- **Check sample sizes**. Always display N (sample count) alongside any aggregate metric. A "95% satisfaction rate" from 20 responses is very different from 20,000.
- **Identify missing data**. Report the completeness of each column. Don't silently drop nulls — document how they're handled.
- **Look for outliers**. Decide whether to include, exclude, or flag them — and explain the choice.

### Aggregation Rules
- **Show the right summary statistic**: Use median for skewed distributions (income, latency, file sizes). Use mean only for roughly symmetric data.
- **Always pair aggregates with spread**: Show standard deviation, IQR, confidence intervals, or min/max alongside any mean/median.
- **Don't compare incomparable groups**: If groups have vastly different sizes, normalize or call out the imbalance.
- **Time series**: Use consistent intervals. Don't mix weekly and monthly buckets. Annotate any gaps in the data.

### When Making Claims
- **Correlation is not causation**: Label correlations as such. Never imply a causal relationship without evidence.
- **Show uncertainty**: Use confidence intervals, error bars, or ranges rather than single-point estimates.
- **Contextualize changes**: "Revenue increased 50%" is meaningless without a baseline. Show absolute values alongside percentages.
- **Beware of survivorship bias**: If you're only analyzing successful outcomes, say so.

## Chart Selection

Choose the chart type that most honestly represents the data relationship:

| Relationship | Best Chart | Avoid |
|---|---|---|
| Trend over time | Line chart (continuous), bar chart (discrete periods) | Pie chart |
| Part-to-whole | Stacked bar, treemap | Pie chart with >6 slices |
| Comparison across categories | Bar chart (horizontal for many categories) | 3D charts |
| Distribution | Histogram, box plot, violin plot | Bar chart of means only |
| Correlation between 2 variables | Scatter plot | Dual-axis line chart |
| Ranking | Horizontal bar chart, sorted | Unsorted bar chart |
| Geographic | Choropleth map | Bubble chart on map for discrete regions |

### Chart Integrity Rules
- **Start Y-axis at zero** for bar charts. Truncated axes exaggerate differences.
- **Use consistent scales** when placing charts side by side for comparison.
- **Don't use dual Y-axes** — they're almost always misleading. Use two separate charts instead.
- **Limit pie charts to 5-6 slices** maximum. Group small categories into "Other".
- **Sort bar charts** by value (not alphabetically) unless there's a natural order.
- **Label everything**: axes, units, time periods, data source. If someone can't understand the chart without the surrounding text, add more labels.

## Dashboard Layout Principles

### Information Hierarchy
1. **Lead with the answer**: Put the key insight or KPI at the top, large and prominent.
2. **Then show supporting evidence**: Charts and breakdowns that explain the top-line number.
3. **Then provide detail**: Tables, filters, and drill-downs for exploration.

### Context and Metadata
- **Always show the data date range** prominently — "Data from Jan 1 - Mar 31, 2026"
- **Show last-updated timestamp** if data refreshes
- **Cite the data source**: "Source: Internal sales database" or "Source: US Census Bureau"
- **Show sample size** (N=X) for any statistical measures
- **Add methodology notes** for derived metrics: "Churn rate = customers lost / customers at period start"

### Annotation and Insight
- **Annotate anomalies**: If there's a spike or drop, add a note explaining it (or flag it as unexplained)
- **Use narrative text**: A one-sentence insight above each chart ("Revenue grew 12% QoQ, driven primarily by Enterprise segment") is more valuable than the chart alone
- **Highlight what matters**: Use color, size, or callout boxes to draw attention to the most important findings
- **Flag data quality issues**: If a metric is based on incomplete data, label it clearly

## Common Pitfalls to Avoid

- **Cherry-picking time ranges** to show favorable trends
- **Using percentage change on small baselines** (a 200% increase from 1 to 3 is not impressive)
- **Ignoring seasonality** in year-over-year comparisons
- **Showing too many metrics** with no hierarchy — this overwhelms rather than informs
- **Using colors that imply judgment** (red/green) without intent — they carry meaning
- **Decimal precision theater**: Showing "42.7348%" implies a precision that likely doesn't exist. Round to match the data's actual precision.
