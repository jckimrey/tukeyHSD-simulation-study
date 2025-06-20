# Set up scenarios
n_iter <- 10000
n_groups_set <- c(4, 5, 6)
effect_sizes <- c(0, 0.25, 0.5, 1)  # Need to include 0 for Type I error

# Pre-allocate results
results <- expand.grid(n_groups = n_groups_set, effect = effect_sizes)
results$tukey <- NA
results$anova <- NA

# Simulation function
run_sim <- function(n_groups, n_per_group, group_means, n_iter) {
  tukey_sig <- numeric(n_iter)
  anova_sig <- numeric(n_iter)
  for (i in 1:n_iter) {
    data <- data.frame(
      group = factor(rep(1:n_groups, each = n_per_group)),
      value = unlist(lapply(group_means, function(mu) rnorm(n_per_group, mu, 1)))
    )
    fit <- aov(value ~ group, data = data)
    anova_p <- summary(fit)[[1]][["Pr(>F)"]][1]
    anova_sig[i] <- (anova_p < 0.05)
    tukey_p <- TukeyHSD(fit)$group[,4]
    tukey_sig[i] <- any(tukey_p < 0.05)
  }
  c(tukey = mean(tukey_sig), anova = mean(anova_sig))
}

# Run all scenarios
for (i in 1:nrow(results)) {
  n_groups <- results$n_groups[i]
  effect <- results$effect[i]
  group_means <- c(rep(0, n_groups-1), effect)
  stats <- run_sim(n_groups, 20, group_means, n_iter)
  results$tukey[i] <- stats["tukey"]
  results$anova[i] <- stats["anova"]
  print(paste("Done:", n_groups, "groups; effect", effect))
}

# Save results
save(results, file = "tukey_sim_results.RData")

