#Final Exam Question 3
#Name: Caleb Harris
#Course: CS 2020-001
#----------

# 1)
# Load the dataset
data <- read.csv("Alzheimer.csv")

# Crosstabulation of drug administered and participants' gender
cross_tab <- table(data$DrugType, data$Gender)

# Chi-square test of independence
chi_sq_result <- chisq.test(cross_tab)

# Report the results
cat("Chi-square test results for drug administered and participants' gender:\n")
cat("-------------------------------------------------------------\n")
cat("Chi-square statistic:", chi_sq_result$statistic, "\n")
cat("p-value:", chi_sq_result$p.value, "\n")
cat("Degrees of freedom:", chi_sq_result$parameter, "\n")

# Interpret the results
alpha <- 0.05
if (chi_sq_result$p.value < alpha) {
  cat("Result: Reject the null hypothesis.\n")
  cat("Conclusion: There is a significant relationship between the drug administered and participants' gender.\n")
} else {
  cat("Result: Fail to reject the null hypothesis.\n")
  cat("Conclusion: There is no significant relationship between the drug administered and participants' gender.\n")
}

# 2)
# ANOVA for drug administered and drug's effectiveness scale
anova_result <- aov(EffectivenessScale ~ DrugType, data = data)

# Report the results
cat("ANOVA results for drug administered and drug's effectiveness scale:\n")
cat("-------------------------------------------------------------\n")
cat("F-statistic:", summary(anova_result)[[1]]$`F value`[1], "\n")
cat("p-value:", summary(anova_result)[[1]]$`Pr(>F)`[1], "\n")

# Interpret the results
alpha <- 0.05
if (summary(anova_result)[[1]]$`Pr(>F)`[1] < alpha) {
  cat("Result: Reject the null hypothesis.\n")
  cat("Conclusion: There is a significant relationship between the drug administered and the drug's effectiveness scale.\n")
} else {
  cat("Result: Fail to reject the null hypothesis.\n")
  cat("Conclusion: There is no significant relationship between the drug administered and the drug's effectiveness scale.\n")
}

# 3)
# Independent t-test for participants' gender and drug's effectiveness scale
male_effectiveness <- data$EffectivenessScale[data$Gender == "m"]
female_effectiveness <- data$EffectivenessScale[data$Gender == "f"]

t_test_result <- t.test(male_effectiveness, female_effectiveness)

# Report the results
cat("Independent t-test results for participants' gender and drug's effectiveness scale:\n")
cat("-------------------------------------------------------------\n")
cat("t-value:", t_test_result$statistic, "\n")
cat("p-value:", t_test_result$p.value, "\n")
cat("Degrees of freedom:", t_test_result$parameter, "\n")

# Interpret the results
alpha <- 0.05
if (t_test_result$p.value < alpha) {
  cat("Result: Reject the null hypothesis.\n")
  cat("Conclusion: There is a significant relationship between participants' gender and the drug's effectiveness scale.\n")
} else {
  cat("Result: Fail to reject the null hypothesis.\n")
  cat("Conclusion: There is no significant relationship between participants' gender and the drug's effectiveness scale.\n")
}

