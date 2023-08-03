#Final Exam Question 1
#Name: Caleb Harris
#Course: CS 2020-001
#----------

# Given data (level of sugar in 25 drinks)
Drink_sugar <- c(9.976959, 10.012098, 9.963002, 9.998574, 10.002431, 10.036959,
                 10.014752, 9.985491, 10.026681, 9.981070, 10.011058, 9.958206,
                 10.047110, 9.931327, 9.980533, 9.982266, 9.956010, 9.992339,
                 9.957293, 9.907988, 9.983450, 10.018341, 9.979281, 9.931443,
                 10.019777)

# Perform one-sample t-test
test_result <- t.test(Drink_sugar, mu = 10)

# Report the results
cat("One-sample t-test results:\n")
cat("---------------------------\n")
cat("Sample Mean:", mean(Drink_sugar), "\n")
cat("Sample Size:", length(Drink_sugar), "\n")
cat("Degrees of Freedom:", test_result$parameter, "\n")
cat("t-value:", test_result$statistic, "\n")
cat("p-value:", test_result$p.value, "\n")

# Interpret the results
alpha <- 0.05
if (test_result$p.value < alpha) {
  cat("Result: Reject the null hypothesis (H0).\n")
  cat("Conclusion: There is a significant difference in the mean level of sugar in the drinks, and the machine is not adding 10 grams of sugar per drink.\n")
} else {
  cat("Result: Fail to reject the null hypothesis (H0).\n")
  cat("Conclusion: There is not enough evidence to suggest a significant difference in the mean level of sugar, and we cannot conclude that the machine is not adding 10 grams of sugar per drink.\n")
}
