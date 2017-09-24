########################
#1.basic in R 
# data type (vector)
########################
#numeric vector
x=c(1,2,3,4,5)
x=c(1:5)
x=seq(from=1, to=5, by=1)


#character vector
fruit=c("apple", "banana", "blueberry")
fruit


#logical vector
y=c(T,T,F,T)

x = -5:5
w = x < -2


#calculation  
x = c(1:5)
y = c(6:10)
z=x+y 
z=x-y
z=x*y
z=x/y 

x=seq(5)
mean(x)
sd(x)
range(x)
length(x)
sort(x, decreasing = TRUE)

x=seq(1,10, by=1)
x[1]
x[2]
x[2:5]
x[-3]
x[-c(3:8)]
x[-c(3,5,9)]

x[4]=15
x
x[5]=50
x

y=replace(x, x==2, 30)
y


#numeric vector
x=seq(2, 8, by=1)
y=seq(5, 10, by=1)

union(x,y)
intersect(x,y)
setdiff(x,y)
setdiff(y,x)
is.element(x,y)


#chracter vector
a=c("TP53", "APOE", "BRCA1", "BRCA2", "MDK1", "CTNNB1")
b=c("TP53", "MDK1", "ARID1A", "CTNNB1", "TLR2")

union(a,b)
intersect(a,b)
setdiff(a,b)
setdiff(b,a)
is.element(a,b)


x=rep(c("a", "b", "c", "d"), times=3)
unique(x)
match(x, c("d"))
which(x=="d")

y=paste(x[1],x[2])
y=paste(x[1],x[2], sep="-")
y=paste(x[1],x[2], sep=",")

y=paste(x, collapse=",")
y=paste(x, collapse="-")

grep("a", x)
grep("a|b", x)


