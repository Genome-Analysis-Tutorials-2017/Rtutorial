data(eset)

# AssayData를 불러와 edat으로 지정
edat=exprs(eset)

### 분포 확인
hist(edat)
boxplot(edat)


### log2 scale로 줄이기 
# 최소값을 0으로 맞추기 위해 모든 수에 1을 더한 후 log2를 취함
range(edat)

edat=log2(edat+1)
hist(edat)
boxplot(edat)

exprs(eset)=edat # eset의 AssayData를 log2 변환한 값으로 바꿔줌





### 그룹별 평균 및 fold change 구하기
head(edat) # 1~10 : HCC, 11~20 : NT

# [행,열] 잊지마세요
hcc.edat=edat[,1:10]
nt.edat=edat[,11:20]

# 만약 sample 순서가 순차적이지 않다면? grep 이용!
grep("AJHCC", colnames(edat))
grep("AJNT", colnames(edat))

hcc.edat=edat[,grep("AJHCC", colnames(edat))] # colname에 AJHCC 문자열이 포함된 위치를 알려주시오
nt.edat=edat[,grep("AJNT", colnames(edat))] # colname에 AJNT 문자열이 포함된 위치를 알려주시오

head(hcc.edat)
head(nt.edat)

hcc.mean=rowMeans(hcc.edat)
nt.mean=rowMeans(nt.edat)
fc=hcc.mean - nt.mean # case (실험군) group을 앞으로 두세요

# eset의 featureData에 추가
fData(eset)=data.frame(fData(eset), hcc.mean, nt.mean, fc)


# fc 분포 확인
hist(fc)

# 2/-2 이상 차이나는 유전자는 몇개?
length(which(fc > 2)) # 133
length(which(fc <(-2))) # 216 음수는 괄호 한번더 씌우기! 


### 그룹간 t.test
head(pData(eset))
pdat=pData(eset)

t.test(edat[1,]~pdat$tissue.type)$p.value
p.value=apply(edat, 1, function(a) t.test(a~pdat$tissue.type)$p.value)

fData(eset)$p.value = p.value




### DEG만 뽑아서 deg.eset 만들어 저장

deg.idx=which(abs(fc) > 2 & p.value < 0.05)
length(deg.idx)

deg.eset=eset[deg.idx,] # ExpressionSet도 [행,열] 방식으로 선택 가능 !
deg.eset # 343

# fc 순서로 order하기
fdat=fData(deg.eset)
row.od=order(fdat$fc)

fdat=fdat[row.od,]
head(fdat)
tail(fdat)

deg.eset=deg.eset[row.od,]
save(deg.eset, file = "data/deg.eset.rda")





