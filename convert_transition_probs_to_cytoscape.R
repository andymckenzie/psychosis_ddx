library(readxl)
library(bayesbio)

setwd("/Users/mckena01/Github/psychosis_ddx/")

#to visualize transition probabilities
trans_probs = read_excel("transition_probs_2016_meta_analysis.xlsx", sheet = 1)

#set 0s to minimum value
trans_probs[trans_probs == 0] = 0.01

trans_probs_df = as.data.frame(trans_probs)
rownames(trans_probs_df) = trans_probs_df$Baseline_Diagnosis
trans_probs_df = trans_probs_df[ , !colnames(trans_probs_df)
  %in% c("Baseline_Diagnosis", "Other_Mean")]
trans_probs_matrix = as.matrix(trans_probs_df)
trans_probs_long = as.data.frame.table(trans_probs_matrix)

# "Schizophrenia"
# "Schizoaffective"
# "Schizophreniform"
# "Bipolar with psychosis"
# "Psychosis NOS"
# "Brief psychotic disorder"
# "MDD with psychosis"
# "Substance psychosis"
# "Delusional disorder"

write.table(trans_probs_long, file = "cytoscape_edge_table.tsv", sep = "\t",
  col.names = T, quote = F, row.names = F)
