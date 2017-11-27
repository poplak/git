setwd("F:/BIGDATA/wedding")
getwd
install.packages("KoNLP")
install.packages("wordcloud")
install.packages("stringr")
library(KoNLP)
library(wordcloud)
library(stringr)
library(RColorBrewer) # 보기좋은 다양한 유형의 색들에 대한 팔레트 제공
library(rvest)
search()

useSejongDic()
mergeUserDic(data.frame(readLines("결혼.txt"),"ncn"))
data1<-readLines("결혼.txt")
data1

data2<-sapply(data1,extractNoun,USE.NAMES = F)
data2

#
data3<-unlist(data2)
data3

#불필요한 단어 삭제
data3<-gsub("\\d+","",data3)
data3
data3<-gsub("씨발","",data3)
data3<-gsub("^ㅋ","",data3)
data3<-gsub("ㅋㅋ","",data3)
data3<-gsub("^ㅋ^ㅋ^ㅋ","",data3)
data3<-Filter(function(x){nchar(x)>=2},data3)
data3

write(unlist(data3),"결혼.txt")
data4<-read.table("결혼.txt")
data4

nrow(data4)
wordcount<-table(data4)
wordcount


#정렬
wd<-head(sort(wordcount,decreasing = T),30)
wd
str(wd)
palete<-brewer.pal(9,"Set3")


#시각화
wordcloud(names(wd),
          freq = wd,
          rot.per = 0.25,
          min.freq = 1,
          random.order = F,
          random.color = T,
          colors = palete)

#제목 넣기
legend(0.3,1, "30대의 결혼 생각",
       cex=1,
       fill=NA,
       border=NA,
       bg="white",
       text.col="blue",
       text.font=4,
       box.col="red")
