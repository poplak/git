setwd("F:/BIGDATA/wedding")
getwd()
##Word cloud 실습
install.packages("tm")
?tm
library(KoNLP) # 한글을 처리하는 패키지
library(wordcloud) # 워드 클라우드 출력 기능
library(RColorBrewer) # 보기좋은 다양한 유형의 색들에 대한 팔레트 제공
library(rvest)
library(tm)
library(readxl)

??readxl
search()


url_b <- "http://kin.naver.com/qna/detail.nhn?d1id=8&dirId=80101&docId=272623504&qb=6rKw7Zi87JeQIOuMgO2VnCDsg53qsIE=&enc=utf8&section=kin&rank=1&search_sort=0&spq="
url_b
all.reviews <- c()
for(page in 1:1000) {
  url <- paste(url_b, page, sep='',Encoding="euc-kr")
  htxt <- read_html(url)
  table <- html_nodes(htxt, '.type01')
  content <- html_nodes(table, '.elThumbnailResultArea')
  reviews <- html_text(content)
  if (length(reviews) == 0) {break}
  all.reviews <- c(all.reviews, reviews)
  print(page)
}

all.reviews
write.table(all.reviews, 'abwedd3.txt')

useSejongDic()
mergeUserDic(data.frame,”poplak”,”ncn”)

data1<-readLines("abwedd3.txt")
data1

data2<-sapply(data1,extractNoun,USE.NAMES = F)
data2

#
data3<-unlist(data1)
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

write(unlist(data3),"aboutwedd.txt")
data4<-read.table("aboutwedd.txt")
data4

nrow(data4)
wordcount<-table(data4)
wordcount


#정렬
wd<-head(sort(wordcount,decreasing = T),300)
wd
str(wd)
display.brewer.all()
palete<-brewer.pal(9,"Spectral")


#시각화
wordcloud(names(wd),
          freq = wd,
          scale=c(7,0),
          rot.per = 0.25,
          min.freq = 1,
          random.order = F,
          random.color = T,
          colors = palete)

#시각화2 (한글 안됨)
data4<-tm_map(data4,removePuntuation)
data4<-tm_map(data4,function(x)removeWords(x,stopwords()))
tdm<-TermDocumetMatrix(data4)
m<-as.matrix(tdm)
v<-sort(rowSums(m),decreasing = TRUE)
d<-data.frame(word=names(v),freq=v)
wordcloud(d$word,d$freq)


#시각화 3

pal<-brewer.pal(12,"Pairedrdcloud(names(wd),
                freq=wd,
                scale=c(5,0.3),
                min.freq=1, random.order=F,
                colors=pal)


#제목 넣기
legend(0,2,1, "About Wedding",
       cex=1,
       fill=NA,
       border=NA,
       text.col="b",
       text.font=8
       )

??palete
