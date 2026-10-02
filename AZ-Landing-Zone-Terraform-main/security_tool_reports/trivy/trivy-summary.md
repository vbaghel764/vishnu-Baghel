# Trivy Scan Summary

## Scan Information

| Property | Value |
|----------|-------|
| Tool | Trivy |
| Version | 0.73.0 |
| Scan Type | Terraform Misconfiguration Scan |
| Target | `environments/pre-prod` |
| Variable File | `environments/pre-prod/terraform.tfvars` |
| Command Executed | `trivy config environments/pre-prod --tf-vars environments/pre-prod/terraform.tfvars` |
| Report File | `trivy-report.json` |

## Scan Result

| Severity | Count |
|----------|------:|
| Critical | 1 |
| High | 2 |
| Medium | 2 |
| Low | 1 |
| Total Findings | 6 |

**Overall Status:** ⚠️ Security hardening required

## Findings Summary

| Check ID | Severity | Resource Category | Finding |
|----------|----------|-------------------|---------|
| `AZU-0013` | Critical | Azure Key Vault | Network ACL does not deny unmatched access by default |
| `AZU-0016` | Medium | Azure Key Vault | Purge protection is disabled |
| `AZU-0017` | Low | Key Vault Secrets | Secret expiration date is not configured |
| `AZU-0068` | Medium | Linux VM Networking | VM network interface was reported without NSG protection |
| `AZU-0039` | High | Frontend Linux VM | Password authentication is enabled |
| `AZU-0039` | High | Backend Linux VM | Password authentication is enabled |

## Findings by Category

### Azure Key Vault

The Key Vault requires additional network and recovery hardening:

- Network ACL default action is not configured as `Deny`.
- Purge protection is disabled.
- Public or unrestricted access may increase exposure.

### Key Vault Secrets

The administrator secrets do not have expiration dates configured.

Secret expiration supports credential lifecycle management and periodic rotation.

### Linux Virtual Machines

Both Linux virtual machines allow password authentication.

Password authentication is intentionally retained for this learning project. For production workloads, SSH key authentication should be used and password authentication should be disabled.

### Network Security Group Finding

Trivy reported that the VM network interfaces are not directly associated with an NSG.

In this project, NSGs are associated at the subnet level. Therefore, this finding should be manually reviewed and may be treated as a scanner limitation or contextual false positive if subnet-level protection is confirmed.

## Report Files

| File | Purpose |
|------|---------|
| `trivy-report.json` | Complete machine-readable Trivy scan report |
| `trivy-summary.md` | Human-readable summary of Trivy findings |

## Conclusion

Trivy scanned the Terraform Landing Zone configuration and detected **6 misconfigurations**:

- 1 Critical
- 2 High
- 2 Medium
- 1 Low

The primary recommendations relate to Azure Key Vault network security, purge protection, secret expiration, and Linux VM authentication.