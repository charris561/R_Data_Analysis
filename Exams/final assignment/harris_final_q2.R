#Final Exam Question 2
#Name: Caleb Harris
#Course: CS 2020-001
#----------

# Given data
Daily_Sale_Before_Discount_Program <- c(49971.98, 49988.49, 50077.94, 50003.53, 50006.46, 50085.75, 50023.05)
Daily_Sale_After_Discount_Program <- c(50011.75, 50040.66, 50052.72, 50136.20, 50092.99, 50095.04, 50080.53)

# Perform paired two-sample t-test
test_result <- t.test(Daily_Sale_Before_Discount_Program, Daily_Sale_After_Discount_Program, paired = TRUE)

# Report the results
cat("Paired two-sample t-test results:\n")
cat("---------------------------------\n")
cat("Sample Size (Before):", length(Daily_Sale_Before_Discount_Program), "\n")
cat("Sample Size (After):", length(Daily_Sale_After_Discount_Program), "\n")
cat("Degrees of Freedom:", test_result$parameter, "\n")
cat("t-value:", test_result$statistic, "\n")
cat("p-value:", test_result$p.value, "\n")

# Interpret the results
alpha <- 0.05
if (test_result$p.value < alpha) {
  cat("Result: Reject the null hypothesis (H0).\n")
  cat("Conclusion: There is a statistically significant difference between the average sales before and after the discount program.\n")
} else {
  cat("Result: Fail to reject the null hypothesis (H0).\n")
  cat("Conclusion: There is not enough evidence to suggest a statistically significant difference between the average sales before and after the discount program.\n")
}
