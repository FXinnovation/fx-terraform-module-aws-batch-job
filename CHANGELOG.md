# CHANGELOG

# 1.0.0

* (BREAKING) chore: pins `pre-commit-hooks` to `v4.0.1`.
* feat: add `pre-commit-afcmf` (`v0.1.2`).
* chore: pins `pre-commit-terraform` to `v1.50.0`.
* chore: pins `terraform` to `>= 0.14`.
* chore: pins `aws` provider to `>= 3.0`.
* chore: bumps `terraform` + providers versions in example:
  * pins `terraform` to `>= 0.14`.
  * pins `aws` provider to `>= 3.5`.
  * pins `random` provider to `>= 3.1`.
* refactor: example test cases:
  * rename example `datasources.tf` to `data.tf`.
  * use SSH for external module source.
  * lint code in example test case.
* refactor: lint code in root module.

# 0.2.0

* feat: add `var.execution_role_extras_policies` to manage execution role policies
* feat: `var.properties` now expect a map instead of jsonencode(map)
* chore: add tfsec to pre-commit

# 0.1.0

* feat: initial release
