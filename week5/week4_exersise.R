# Q1
name = c("a", "b", "c", "d", "e") # character vector
english = c(60, 85, 90, 100, 50) # numeric vector
math = c(50, 100, 76, 95, 60)

name
english
math


# Q2
# data.frame
midterm.df = data.frame(name, english, math)

midterm.df

# Q3
class = c(1, 1, 1, 2, 2)

class

# add class info
midterm.df = data.frame(midterm.df, class) # ver.1
midterm.df$class = class # ver.2 
midterm.df = cbind(midterm.df, class) # ver.3

midterm.df 

# Q4
# mean of english, math
mean(midterm.df$english)
mean(midterm.df$math)


# Q5
# mean of each student
score = midterm.df[,2:3]
score

mean = rowMeans(score)
mean

midterm.df$mean = mean
midterm.df


# Q6
# class 1
class1.df = midterm.df[midterm.df$class == 1,]

mean(class1.df$english)
mean(class1.df$math)

