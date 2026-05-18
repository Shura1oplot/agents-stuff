# Excel

Follow this guidelines in case users ask for an Excel file

Produce at least two sheets: `Assumptions` and `Model`.

This guide assists agents to avoid current limitations in dealing with Excel:
- agents cannot evaluate formulas: any formula cell should have its hardcoded copy; users evaluate and check
- agents are weak in operating unnamed cells/ranges (e.g., `A1`, `B2`): use only named ones

## Assumptions Sheet

### Required Columns

1. Group
2. Parameter
3. Description
4. Type (`sourced`, `calculated`)
5. Units
6. Scenario
7. `Value (hard)` (numeric)
8. `Value` (formula)
9. ID (machine-friendly name)
10. Period (from what period the parameter has been obtained, if applicable)
11. Primary Source Date (publication date)
12. Primary Source Link
13. Citation (from the primary source)
14. Other Support Sources (list of URLs or file names)

### Rules

Type = `sourced`:
- `Value (hard)` is filled.
- `Value` is filled (hard copy of `Value (hard)`).
- Source-related fields are filled where applicable.

Type = `calculated`:
- `Value (hard)` is filled with the hardcoded result.
- `Value` is filled (formula).
- Source-related fields are empty.

`Value`: assign a name from `ID` to the cell `Value`; `Value (hard)` has no name and should not be a part of any formula

Formula:
- Each assumption row with an `ID` must have a defined name for `Value` in Name Manager
- Formulas must not contain hardcoded numeric constants (except 1, 10, 100...)
- All formula operands (variables/constants) must exist in the workbook as named ranges/cells (e.g., no references to `A1` or `B2`)

## Model Sheet

### Required Columns

1. Sections columns
2. Indicator (name for users)
3. Description
4. Type (`sourced`, `calculated`, `calculated_hard`)
5. Units
6. Classification columns, if applicable
7. Scenario
8. Values by year
9. ID (machine-friendly name)
10. Primary Source Date
11. Primary Source Link
12. Citation (from the primary source)
13. Other Support Sources

### Rules

Values by year:
- Use one column per period, e.g.,: `2022`, `2023`, `2024`, `2025E`, `2026F`
- `E` = estimated
- `F` = forecast
- The time delta between periods should be consistent (no YTD, 9m2026, etc.)

Type = `sourced`:
- Use for factual historical values or third-party estimated/forecast values
- Fill source-related fields

Type = `calculated`:
- Use formulas
- Source-related fields are empty
- Formula rows should reference named cells/ranges only
- Source-related fields are empty

For spilled formulas (referring to a named range with 2+ cells), enter the formula only in the first period cell

Type = `calculated_hard`:
- Duplicate each `calculated` row with a hardcoded version of the resulting values
- Do not assign an `ID` as hardcoded values should not be used in formulas
- Source-related fields are empty

Do not combine sourced and model-derived values in one row. Split them into separate rows:
- fully sourced row
- fully calculated row

If a full-year value is estimated from an incomplete year, place the base incomplete-period input in `Assumptions` and specify the period, for example `9m2025`

Example classification columns:
- Country; `China`, `Japan`, ...
- Direction: `import`, `export`, `transit`, ...
- Transport leg: `trucking`, `railway`, `air`, `maritime`, ...
