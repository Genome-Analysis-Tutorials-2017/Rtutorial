###################
#5. function: apply  
###################
# make a matrix
x=matrix(1:50, nrow=10, ncol=5) # 10 x 5 numeric matrix 
colnames(x)=rep(paste("sample", 1:5, sep=""))
rownames(x)=rep(paste("gene", 1:10, sep=""))
x

# mean value
apply(x, 1, mean)
rowMeans(x)

apply(x, 2, mean)
colMeans(x)

apply(x, 1, sum)
rowSums(x)

apply(x, 2, sum)
colSums(x)

apply(x, 1, min)
apply(x, 1, max)

apply(x, 2, min)
apply(x, 2, max)

summary(x)


####################
#make function  
####################
f = function(x) {
  return(x)
}

f(1)

f = function(x) {
  xx=x+50
  return(xx)
}

f(2751.986)
f(100)


#for example
x=matrix(1:25, nrow=5, ncol=5) # 5 x 5 numeric matrix 
colnames(x)=rep(paste("sample", 1:5, sep=""))
rownames(x)=rep(paste("gene", 1:5, sep=""))
x

stat_f = function(a) { 
  mean = mean(a)
  range = range(a)
  sd = sd(a)
  min = min(a) 
  max = max(a) 
  summary = c(mean=mean, range=range, sd=sd, min=min, max=max) 
  return(summary) 
}


stat_f(x[,2])
stat_f(x[4,])

res=apply(x, 2, stat_f)
res=apply(x, 1, stat_f)


####################
#6. if /ifelse   
####################
x=4
if (x>0) print(sqrt(x))

if (x<0) print(1+x) else print(x)
x=-0.2
x=0.5

ifelse(x<0, 1+x, x)

gender=c(rep("male", 30), rep("female", 20))
ifelse(gender=="male", 0, 1)


####################
#7.for loop   
####################
for (year in 2015:2020){
  print(paste("The year is", year))
}


x=c(1:10)
for (x in 1:10) {
  y = 2*x+3
  print(y)
}

