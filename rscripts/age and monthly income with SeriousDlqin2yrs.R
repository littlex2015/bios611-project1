library(ggplot2)
library(dplyr)
library(hexbin)
library(grid)
grid.newpage()
data <- read.csv('source_data/cs-training.csv')
p <- ggplot(data, aes(age, MonthlyIncome)) +
  geom_point(aes(color=SeriousDlqin2yrs), alpha=0.4) +
  xlim(0,250) +
  ylim(0,250);

ggsave('images/monthlyincome vs age with SeriousDlqin2yrs.png',plot=p);


