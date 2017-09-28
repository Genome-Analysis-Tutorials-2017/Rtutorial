
### read file

# read csv file
csv_exam.df=read.csv("file/csv_exam.csv")
csv_exam.df

class(csv_exam.df) # class(): print data type
dim(csv_exam.df) # dim()


# read txt file
txt_exam.df=read.delim("file/txt_exam.txt")
txt_exam.df

txt_exam.df=read.delim("file/txt_exam_noheader.txt")
txt_exam.df

txt_exam.df=read.delim("file/txt_exam_noheader.txt", header = F)
txt_exam.df


# read xlsx file (required java)
#install.packages("xlsx") # install R package 
library(xlsx) # load R package

exam.df=read.xlsx("file/excel_exam.xlsx", sheetName = 1) 
exam.df



### write file

# write csv file
write.csv(csv_exam.df, file = "file/midterm.csv", row.names = F)
write.csv(csv_exam.df, file = "file/midterm.csv", row.names = T, quote = F)

# write txt file
write.table(txt_exam.df, file = "file/midterm.txt", sep="\t", quote = F, row.names = F)

# write xlsx
write.xlsx(exam.df, file = "file/midterm.xlsx", row.names = F)


### RData

save(txt_exam.df, file = "data/txt_exam.df.rda") # save .rda

rm(txt_exam.df) # rm(): remove variable in environment
txt_exam.df # error

data(txt_exam.df) # load .rda from "data" directory
txt_exam.df

load("data/txt_exam.df.rda") # load. rda 




