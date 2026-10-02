# Gitleaks Scan Summary

## Scan Information

| Property | Value |
|----------|-------|
| Tool | Gitleaks |
| Version | 8.30.1 |
| Scan Type | Secret Detection Scan |
| Target | Current Terraform Project Directory |
| Command Executed | `gitleaks dir . --report-format json --report-path security_tool_reports/gitleaks/gitleaks-report.json --verbose` |
| Report File | `gitleaks-report.json` |

## Scan Result

| Metric | Count |
|--------|------:|
| Total Findings | 2 |
| Confirmed Secrets | 0 |
| False Positives | 2 |

**Overall Status:** ✅ No confirmed secrets detected

## Findings Summary

| Rule ID | File | Line | Status |
|---------|------|-----:|--------|
| `generic-api-key` | `environments/pre-prod/main.tf` | 76 | False Positive |
| `generic-api-key` | `environments/pre-prod/main.tf` | 88 | False Positive |

## Analysis

Gitleaks reported two findings while scanning the Terraform project.

After manual review, both findings were identified as Terraform variable references:

- `keyvault27 = var.keyvault27`
- `keyvaultsecret27 = var.keyvaultsecret27`

These are variable references and **do not contain actual passwords, API keys, tokens, connection strings, or any sensitive credentials**.

Therefore, both findings have been classified as **false positives**.

## Secret Management

No additional hardcoded secrets were detected by Gitleaks.

The administrator usernames and passwords are already designed to be stored in **Azure Key Vault** using the `azurerm_key_vault_secret` module.

The Linux Virtual Machine module retrieves these credentials from Azure Key Vault instead of directly consuming hardcoded values.

## Git Repository Note

Git history was not scanned because the current project directory is **not initialized as a Git repository**.

Only the current working directory was scanned.

## Report Files

| File | Purpose |
|------|---------|
| `gitleaks-report.json` | Machine-readable secret scan report |
| `gitleaks-summary.md` | Human-readable scan summary |

## Conclusion

Gitleaks successfully scanned the Terraform Landing Zone project and reported **2 potential findings**.

Both findings were verified as **false positives**, and **no real hardcoded secrets were detected** in the scanned Terraform configuration.