#########################
#2. basic in R 
#matrix (two dimension)
#########################

# example of a matirx
vec1=c(1:5)
vec2=c(6:10)
vec3=c(11:15)

mat1=cbind(vec1, vec2, vec3)
dim(mat1)
class(mat1)

rownames(mat1)=c("A", "B", "C", "D", "E")

mat2=rbind(vec1, vec2, vec3)
dim(mat2)

colnames(mat2)=c("A", "B", "C", "D", "E")
mat2



x=matrix(1:25, nrow=5, ncol=5) # 5 x 5 numeric matrix 
colnames(x)=rep(paste("sample", 1:5, sep="_"))
rownames(x)=rep(paste("gene", 1:5, sep="_"))

x[,4] # 4th column
x[2,] # 2nd row of matrix
x[3,] # 3rd row of matrix

x[2:5,1:4]


################
#3 basic in R 
# data frame
################
# example of a data frame
names = rep(c(paste("C", 1:5, sep=""), paste("R", 1:5, sep="")))
value = seq(5, 50, by=5)
batch=rep(paste("batch", 1:10, sep=""))

df=data.frame(names, value, batch)
dim(df)
head(df)
tail(df)

df[1,]
df[, 2:3]
df[,-3]


################
#4 basic in R 
# list
################
# example of a list with 3 components
x=seq(5) #numeric vector
y=c("one", "two") #chracter vector
z=matrix(1:10, nrow=2, ncol=5) #matrix

list.all=list(x, y, z)

list.all[[1]][1]
list.all[[2]]
list.all[[3]][1,3]

names(list.all)=c("A", "B", "C")
list.all$A
list.all$C



