#!/bin/env Rscript

###############################################
# Function: get_anova_stats_for               #
###############################################
# Get Anova stats for vector of values and a vector of their corresponding groups
get_anova_stats_for <- function(vals,grps) {

  # Do a one-way Anova
  anova_results <- oneway.test(vals ~ grps)

  # Extract F statistic
  Fstat <- anova_results$statistic

  # Extract P value
  pvalue <- anova_results$p.value

  # Return named results
  return(
    c(
      anova_stat=Fstat,
      anova_pvalue=pvalue
    )
  )
}

###############################################
# Function: get_tukey_stats_for               #
###############################################
get_tukey_stats <- function(vals,grps) {
  aov_model <- aov(vals ~ grps)
  results_tukey <- as.data.frame(TukeyHSD(aov_model)[1])
  results_tukey$names <- row.names(results_tukey)
  group_names <- paste0("Tukey_pval_",results_tukey$names)
  pvals <- results_tukey$grps.p.adj
  names(pvals) <- group_names
  return(pvals)
}


