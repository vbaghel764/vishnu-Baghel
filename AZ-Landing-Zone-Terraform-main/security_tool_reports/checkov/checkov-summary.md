## Scan Information

| Property | Value |
|----------|-------|
| Tool | Checkov |
| Version | 3.3.0 |
| Framework | Terraform |
| Scan Type | Infrastructure Security and Compliance Scan |
| Command Executed | `checkov -d . -o json > security_tool_reports/checkov/checkov-report.json` |
| Report File | `checkov-report.json` |

## Scan Result

| Metric | Count |
|--------|------:|
| Resources Scanned | 34 |
| Passed Checks | 26 |
| Failed Checks | 18 |
| Skipped Checks | 0 |
| Parsing Errors | 0 |
| Unique Failed Policies | 11 |

**Overall Status:** ⚠️ Security improvements required