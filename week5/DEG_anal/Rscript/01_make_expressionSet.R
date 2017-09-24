### 1. AssayData (FPKM)
fpkm=read.csv("file/HCCvsNT_FPKM.csv")

# 데이터 구조 및 내용 확인하는 습관 들이기
dim(fpkm) # 27313 21
head(fpkm)

# fpkm의 rowname을 gene.name 으로 지정
rownames(fpkm)=fpkm$gene.name
head(fpkm) # 확인

# 첫번째 열 (gene.name) 제거
fpkm=fpkm[,-1]
head(fpkm)


### 2. featureData
gtf=read.delim("file/gencode.v22.gtf")
dim(gtf)
head(gtf)

# rowname 지정
rownames(gtf)=gtf$gene.id
head(fpkm)
head(gtf)


# fpkm의 rowname과 order를 맞춰야 함
match(rownames(fpkm)[1:10], rownames(gtf)) # 기준을 앞으로!

row.od=match(rownames(fpkm), rownames(gtf)) # 순서를 row.od 로 지정
gtf=gtf[row.od,] # gtf 를 row.od 에 맞추어 재정렬
head(gtf)


### 3. phenoData
p_info=read.csv("file/patient_info.csv")
p_info

rownames(p_info)=p_info$sample.ID # rowname을 sample.ID로 지정

# fpkm의 colname과 order를 맞춰야 함
colnames(fpkm)
rownames(p_info)
match(colnames(fpkm), rownames(p_info)) # 순서가 일치함

col.od=match(colnames(fpkm), rownames(p_info)) # 만약 일치하지 않으면 match 사용
p_info=p_info[col.od,]


### make expressionSet
library(Biobase)
class(fpkm)
class(gtf)
class(p_info)

ExpressionSet(assayData = fpkm, featureData = gtf, phenoData = p_info) # error
?ExpressionSet
eset=ExpressionSet(assayData = as.matrix(fpkm), featureData = AnnotatedDataFrame(gtf), phenoData = AnnotatedDataFrame(p_info))
eset

save(eset, file = "data/eset.rda")


### Extract expressionSet data
data(eset)
eset

exprs(eset)
pData(eset)
fData(eset)

sampleNames(eset)
featureNames(eset)
varLabels(eset)
fvarLabels(eset)


