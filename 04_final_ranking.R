# Read previous results
cagr_data <- read.csv("outputs/cagr_results.csv")
dea_data <- read.csv("outputs/dea_efficiency_scores.csv")

# Make sure both have same number of rows
final_data <- data.frame(
  Bank = cagr_data$Bank,
  CAGR = cagr_data$CAGR,
  Efficiency = dea_data$Efficiency
)

# Normalization function
normalize <- function(x){
  (x - min(x)) / (max(x) - min(x))
}

# Apply normalization
final_data$CAGR_N <- normalize(final_data$CAGR)
final_data$Efficiency_N <- normalize(final_data$Efficiency)

# Final weighted score (40-40 model)
final_data$Final_Score <- 
  0.4 * final_data$CAGR_N +
  0.4 * final_data$Efficiency_N +
  0.2 * runif(nrow(final_data))  # technical proxy

# Ranking
final_data <- final_data[order(-final_data$Final_Score),]

# Save result
write.csv(final_data, "outputs/final_ranking.csv", row.names = FALSE)
