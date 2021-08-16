
0.4.0 / 2021-08-16
==================

  * feat: (BREAKING CHANGE) Update kubernetes terraform provider to version 2.x
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
