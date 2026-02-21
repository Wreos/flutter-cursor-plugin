# Security Audit Checklist (Flutter/Dart)

Use this before release and during `/security-review`.

This checklist is mandatory for every code review flow.

## 1) Secrets and credentials

- Scan repo for hardcoded secrets and tokens.
- Verify no secrets are committed in history/config files.
- Ensure environment variables and secret stores are used for sensitive values.

## 2) Data handling

- Avoid logging PII or credentials.
- Verify secure local storage choices for sensitive data.
- Validate encryption/TLS assumptions for data in transit and at rest.

## 3) Mobile hardening

- Ensure debug settings are disabled in release builds.
- Review deep links/intent handling for input validation.
- Check Android/iOS configuration files for exposed sensitive metadata.

## 4) Dependency and supply chain

- Review dependencies for known vulnerabilities and stale versions.
- Lock toolchain/package versions in CI where possible.
- Verify provenance of newly introduced third-party packages.

## 5) Reporting and remediation

- Prioritize issues by impact and exploitability.
- Define immediate fixes for high/critical findings.
- Add regression checks to CI for recurring issues.

## 6) OWASP MASVS baseline (mobile)

- Cover at least: ARCH, STORAGE, CRYPTO, AUTH, NETWORK, PLATFORM, CODE.
- Document which MASVS areas were checked in the review result.

## Official references

- Flutter security overview: https://docs.flutter.dev/security
- OWASP MASVS: https://mas.owasp.org/MASVS/
- Google Play app security best practices: https://developer.android.com/privacy-and-security/security-best-practices
- Apple security resources: https://developer.apple.com/security/
