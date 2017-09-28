################
#heatmap 
################
#install.packages("gplots")
library(gplots)

data(deg.eset)

dat=exprs(deg.eset)
gcen.dat=dat-rowMeans(dat)
head(gcen.dat)


breaks=seq(-3, 3, 0.01)
colorset=colorRampPalette(c("navyblue","white", "firebrick3"))(length(breaks)-1)
graphics.off()
heatmap.2(gcen.dat, Rowv=F, Colv=F, col=colorset, breaks=breaks, trace="none") 
heatmap.2(gcen.dat, Rowv=T, Colv=T, col=colorset, breaks=breaks, trace="none") 

args(heatmap.2)

# top 10 DEGs
idx=c(1:10,334:343)
labRow=fData(deg.eset)$symbol[idx]

heatmap.2(gcen.dat[idx,], Rowv=F, Colv=F, col=colorset, breaks=breaks, trace="none", margins = c(10,10), labRow=labRow) 
fData(deg.eset)[idx,]



################
#boxplot
################
#install.packages("ggplot2")
library(ggplot2)

gene="GPC3"
i=which(fData(deg.eset)$symbol == gene)

df=data.frame(expr=exprs(deg.eset)[i,], tissue.type=pData(deg.eset)$tissue.type)
head(df)
g=ggplot(data = df, aes(x=tissue.type, y = expr, fill = tissue.type)) + geom_boxplot(width=0.5) + geom_jitter(width=0.1)
g + theme_bw(20) + ylab("Expression Levels") + xlab("") + ylim(c(0,15))

?theme_bw
?geom_jitter


################
#barplot
################

df=data.frame(df, sample=sampleNames(deg.eset))
head(df)
g=ggplot(data = df, aes(x=sample, y = expr, fill = tissue.type)) + geom_bar(stat = "identity")
g + theme_bw(20) + theme(axis.text.x = element_text(angle = 90, hjust = 1))+ylab("Expression Levels") + xlab("") + ylim(c(0,15))



