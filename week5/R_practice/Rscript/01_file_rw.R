
### read file

# read xlsx file
install.packages("xlsx") # install R package
library(xlsx) # load R package

exam.df=read.xlsx("file/excel_exam.xlsx", sheetName = 1) 
exam.df
class(exam.df) # class(): print data type
dim(exam.df) # dim()

# read xlsx file (no header)
exam.df=read.xlsx("file/excel_exam_novar.xlsx", sheetName = 1)
exam.df

exam.df=read.xlsx("file/excel_exam_novar.xlsx", sheetName = 1, header = F)
exam.df

colnames(exam.df) = c("id", "class", "math", "english", "science")
exam.df

# read csv file
csv_exam.df=read.csv("file/csv_exam.csv")

# read txt file
txt_exam.df=read.delim("file/txt_exam.txt")



### write file

# write xlsx
write.xlsx(exam.df, file = "file.midterm.xlsx", row.names = F)

# write csv file
write.csv(csv_exam.df, file = "file/midterm.csv", row.names = F)

# write txt file
write.table(txt_exam.df, file = "file/midterm.txt", sep="\t", quote = F, row.names = F)



### RData

save(txt_exam.df, file = "data/txt_exam.df.rda") # save .rda

rm(txt_exam.df) # rm(): remove variable in environment
txt_exam.df # error

data(txt_exam.df) # load .rda from "data" directory
txt_exam.df

load("data/txt_exam.df.rda") # load. rda 

# get(): load and print data
txt_exam2=get(data(txt_exam.df))
txt_exam2=get(load("data/txt_exam.df.rda"))



