# redcap_rsvc
REDCap Regulatory &amp; Software Validation Committee (RSVC) - Automated validation feature test scripts

# Regulatory & Software Validation Committee (RSVC)

Welcome to the Regulatory and Software Validation Committee (RSVC) GitHub repository. This repository is dedicated to hosting automated validation test scripts for REDCap's core functionality, as developed and maintained by our automated testing subcommittee.

## About RSVC

The Regulatory and Software Validation Committee (RSVC) is a dedicated group committed to ensuring regulatory compliance with Good Clinical Practice (GCP) International Council for Harmonisation (ICH) E6(R2) and The United States Food and Drug Administration (FDA) Code of Federal Regulations (CFR) Title 21 Part 11 regulations while validating the core functionality of REDCap. Our committee compiles valuable resources, creates step-by-step feature tests, and provides a platform for collaboration and knowledge sharing.

## Automated Validation Test Scripts

Within this repository, you will find a collection of validation test scripts meticulously crafted by the Regulatory and Software Validation committee. These scripts are designed to assess and validate REDCap's core functionality comprehensively. Consortium partners and REDCap users can utilize these scripts to ensure the robustness and compliance of their REDCap installations.  These scripts are intended to be run using the [REDCap Cypress Developer Toolkit](https://github.com/aldefouw/redcap_cypress_docker/blob/main/README.md).

## Contribution

We welcome contributions and collaboration from the REDCap community and regulatory compliance enthusiasts. If you have expertise in regulatory compliance, validation, or REDCap, feel free to join our efforts by contributing to this repository.  The stable version of the scripts used to validate the last LTS package can be found in the `main` branch.  Pull requests should be made against the `staging` branch, as it contains the changes being actively developed for staging the next LTS package.  Anyone is welcome to take on any task in the `Unassigned` column of [our work queue](https://github.com/orgs/vanderbilt-redcap/projects/2).  If you do so, please move the task to the `In Progress` column and comment on it, or assign it to yourself if you have the appropriate access.  This indicates owernship and avoids duplicate effort.

## Managing Our Work Queue

[Our work queue](https://github.com/orgs/vanderbilt-redcap/projects/2) uses standard GitHub issues to track individual items that need to be addressed.  Issues are added by placing their test IDs (e.g. A.3.14.1300.) one per line in `features.csv` and running the `create_issues.sh`.

## More Information

For more information about the Regulatory & Software Validation Committee (RSVC) and our initiatives, including regulatory compliance resources and feature tests, please refer to our [main page](link-to-main-page).

Thank you for your interest in ensuring the quality and compliance of REDCap through manual validation test scripts. Together, we can enhance the reliability of REDCap for critical research and clinical projects.

## Reference

Baker TA, Bosler T, De Fouw ALC, Jones M, Harris PA, Cheng AC. Consortium-Driven Rapid Software Validation for Research Electronic Data Capture (REDCap). Journal of Clinical and Translational Science. Published online 2024:1-18. doi:10.1017/cts.2024.671
