rm(list = ls()) #removes all variables previously stored
library(Hmisc) #consists of various statistical features

data <- read.csv("~/pratice/dataset/corona/archive/COVID19_line_list_data.csv")
describe(data)


#cleaning up the data 

data$dead_dummy <- as.integer(data$death != 0)

sum(data$dead_dummy) /  nrow(data)

dead = subset(data, dead_dummy == 1)
alive = subset(data, dead_dummy == 0)
mean(dead$age ,na.rm = TRUE)
mean(alive$age, na.rm = TRUE)

t.test(alive$age, dead$age,alternative = "two.sided", conf.level = 0.95)




# repeating the same for gender
male = subset(data, gender == "male")
female = subset(data, gender == "female")

mean(male$dead_dummy, na.rm = TRUE)
mean(female$dead_dummy, na.rm = TRUE)
t.test(male$dead_dummy, female$dead_dummy,alternative = "two.sided", conf.level = 0.95 )