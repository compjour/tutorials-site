library(ggplot2)
library(dplyr)
data_filepath <- "./datasets/chicago-nmaps.csv"
output_filepath <- "./images/hellochicago.png"
dat <- read.csv(data_filepath, as.is = T)
dat <- mutate(dat, date = as.Date(date), year = substring(date, 1, 4))
ggplot(dat, aes(date, temp)) + geom_point(color="orange")
# save it
ggsave(output_filepath)

