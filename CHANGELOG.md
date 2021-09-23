1.0.0 / 2021-09-23
==================

* (BREAKING) chore: pins `random` provider to `3.x+`.
* (BREAKING) chore: pins `azurerm` provider to `2.x+`.
* feat: add `pre-commit-afcmf` (`v0.1.2`).
* refactor: default example:
  * add `versions.tf` file.
  * add `README.md` file.
  * lint code.
* refactor: use kind for Jenkins deployment.
* fix: build failure, add timeout on namespace resource in default example.
* fix: `LICENSE` file.

0.4.1 / 2021-08-19
==================

* feat: Allow to customize the cpu and memory request/limit in the deployment
* feat: Disable the automount of service account token

0.4.0 / 2021-08-16
==================

  * feat (BREAKING): Update kubernetes terraform provider to version 2.x
  * chore: bump pre-commit hooks

0.3.2 / 2020-10-14
==================

  * chore: Update pre-commit configuration
  * fix: Change resources of cloudwatch exporter

0.3.1 / 2020-03-09
==================

  * fix: Change readiness and liveness probes

0.3.0 / 2020-03-09
==================

  * fix: expr for alerts referenced wrong metric
  * feat: All prometheus_alert_group output and vars

0.2.0 / 2020-02-26
==================

  * fix: Add local labels to secret as well
  * fix: Typo in outputs
  * tech: Add outputs on example
  * feat: Add outputs and additionnal variables
  * feat: Added selector, service port as output.
  * feat: Add output for the namespace

0.1.2 / 2020-02-26
==================

  * tech: Add versions.tf for providers and terraform
  * fix: Set limits cpu to 50m

0.1.1 / 2020-02-20
==================

  * fix: Adjust resources for pods

0.1.0 / 2020-02-19
==================

  * Merge branch 'feature/PROM-667' of fxinnovation-public/terraform-module-kubernetes-cloudwatch-exporter into master
  * fix: typo in probes
  * Revert "feat: Removed liveness probe"
  * feat: Removed liveness probe
  * feat: initial version of the module
