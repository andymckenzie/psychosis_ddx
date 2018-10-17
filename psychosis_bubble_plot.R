#Rscript to make a bubble plot
library(ggplot2)

setwd("/Users/mckena01/Github/psychosis_ddx/")

prob_levels = c(0.0001, 0.001, 0.01, 0.02, 0.05, 0.1, 0.3, 0.5, 1)

#see data at https://docs.google.com/spreadsheets/d/1WzqeEse3b63w5Wmff9GSWRadAlO5lOyrkYeHL2X4js0/edit?usp=sharing
pdata = read.delim(file = "Psychosis\ Calculator\ -\ Young_Person_v4.tsv", sep = "\t")

pplot = ggplot(pdata, aes(x=Diagnostic_Biomarker_Positive, y= Heritability,
  size=(Prob_Dx_Bipolar), label=Name))+
  #Prior_prob_young_onset_psychosis
  #Post_Test_Prob_Norm
  #Prob_Dx_Schizoaffectve
  #Prob_Dx_Bipolar
scale_x_continuous(name="Diagnostic Biomarker",
  labels = c("Minimal", "Supporting", "Diagnostic"),
  breaks = c(0, 0.5, 1), limits = c(-0.3, 1.3))+
scale_y_continuous(name = "Heritability", limits = c(-0.05, 0.85)) +
  geom_point(colour="lightgreen")+
theme(axis.text = element_text(size= 12, colour = "black"),
  axis.title = element_text(size = rel(1.25), colour = "black"),
  legend.background = element_rect(colour="black", fill = "white"),
  legend.key = element_rect(fill = "white"),
  panel.background = element_rect(colour = "black", fill = "white"),
  panel.grid.major.x= element_blank())+
geom_text (size = 4, vjust=-0.6) +
scale_size_continuous(name = "Probability", range=c(0.001, 25),
  breaks = prob_levels,
  labels = prob_levels, limits = c(0, 1))
