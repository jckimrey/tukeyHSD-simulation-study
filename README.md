# Simulation Study of the TukeyHSD Test

This project uses Monte Carlo simulation to explore the statistical properties of the Tukey Honest Significant Difference (TukeyHSD) test as a post-hoc procedure following ANOVA.

## Objectives
- ✅ Assess whether TukeyHSD maintains control of the **Type I error rate** near 0.05 under the global null.
- ✅ Compare the **statistical power** of TukeyHSD vs. the omnibus ANOVA F-test for detecting group differences of varying effect sizes.

## Methodology
- Simulates datasets with 4, 5, or 6 groups
- Applies both ANOVA and TukeyHSD for 10,000 replicates per condition
- Compares outcomes across different effect sizes (0, 0.25, 0.5, 1.0)

## Files
- `simulation-study-code.Rmd`: R Markdown source code with all analysis and plots
- `simulation-study-content.pdf`: Rendered PDF report
- `tukey_sim_results.RData`: Precomputed results used for efficiency
- `tukey_simulation.R`: R script file used for simulated data

## Key Results
- ✅ Type I error well-controlled (~0.05) across all group counts
- ✅ Power increases with effect size for both tests
- 🔍 TukeyHSD and ANOVA perform similarly across scenarios

## Author
John Kimrey  
March 2025
# tukeyHSD-simulation-study
