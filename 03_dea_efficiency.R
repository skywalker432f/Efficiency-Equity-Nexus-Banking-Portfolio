install.packages("Benchmarking")
library(Benchmarking)

# Read DEA input and output data
inputs <- read.csv("data/dea_inputs.csv")
outputs <- read.csv("data/dea_outputs.csv")

# Convert to matrix
inputs_matrix <- as.matrix(inputs)
outputs_matrix <- as.matrix(outputs)

# Run DEA (Input-oriented, VRS)
dea_result <- dea(
  inputs_matrix,
  outputs_matrix,
  RTS = "vrs",
  ORIENTATION = "in"
)

# Extract efficiency scores
efficiency_scores <- dea_result$eff

# Create result dataframe
dea_df <- data.frame(
  Bank = 1:length(efficiency_scores),
  Efficiency = round(efficiency_scores, 3)
)

# Save output
write.csv(dea_df, "outputs/dea_efficiency_scores.csv", row.names = FALSE)
