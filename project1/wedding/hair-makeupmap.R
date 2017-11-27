library(ggplot2)
library(RgoogleMaps)
library(ggmap)
library(sp)

names<-c("1.에이바이봄","2.정샘물㈜","3.엔끌로에","4.로앤로우","5.순순도산점","6.끌림 갤러리점","7.오블리쥬",
         "8.누에베","9.크로체나인","10.제니하우스 청담힐","11.에이컨셉 청담 본점",
         "12.뷰티레이","13.뮤제네프 청담점","14.뮤제네프 신사점","15.에스휴","16.보보리스",
         "17.ALUU","18.이경민포레","19.2TTI","20.더페이스스튜디오","21.끌림도산점" )
names
url<-c("https://www.google.co.kr/maps/place/%EC%88%9C%EC%88%98%EC%B2%AD%EB%8B%B4%EC%A0%90/@37.5219858,127.0384704,17z/data=!4m5!3m4!1s0x0:0x610bf05093b42dea!8m2!3d37.5219866!4d127.0406601?hl=ko",
       "https://www.google.co.kr/maps/place/%EC%88%9C%EC%88%98%EC%B2%AD%EB%8B%B4%EC%A0%90/@37.5219858,127.0384704,17z/data=!4m5!3m4!1s0x0:0x610bf05093b42dea!8m2!3d37.5219866!4d127.0406601?hl=ko",
      "https://www.google.co.kr/maps/place/%EC%88%9C%EC%88%98%EC%B2%AD%EB%8B%B4%EC%A0%90/@37.5219858,127.0384704,17z/data=!4m5!3m4!1s0x0:0x610bf05093b42dea!8m2!3d37.5219866!4d127.0406601?hl=ko",
      "https://www.google.co.kr/maps/place/%EC%88%9C%EC%88%98%EC%B2%AD%EB%8B%B4%EC%A0%90/@37.5219858,127.0384704,17z/data=!4m5!3m4!1s0x0:0x610bf05093b42dea!8m2!3d37.5219866!4d127.0406601?hl=ko",
      "https://www.google.co.kr/maps/place/%EC%88%9C%EC%88%98%EC%B2%AD%EB%8B%B4%EC%A0%90/@37.5219858,127.0384704,17z/data=!4m5!3m4!1s0x0:0x610bf05093b42dea!8m2!3d37.5219866!4d127.0406601?hl=ko",
      "https://www.google.co.kr/maps/place/%EC%88%9C%EC%88%98%EC%B2%AD%EB%8B%B4%EC%A0%90/@37.5219858,127.0384704,17z/data=!4m5!3m4!1s0x0:0x610bf05093b42dea!8m2!3d37.5219866!4d127.0406601?hl=ko",
      "https://www.google.co.kr/maps/place/%EC%88%9C%EC%88%98%EC%B2%AD%EB%8B%B4%EC%A0%90/@37.5219858,127.0384704,17z/data=!4m5!3m4!1s0x0:0x610bf05093b42dea!8m2!3d37.5219866!4d127.0406601?hl=ko",
      "https://www.google.co.kr/maps/place/%EC%88%9C%EC%88%98%EC%B2%AD%EB%8B%B4%EC%A0%90/@37.5219858,127.0384704,17z/data=!4m5!3m4!1s0x0:0x610bf05093b42dea!8m2!3d37.5219866!4d127.0406601?hl=ko",
      "https://www.google.co.kr/maps/place/%EC%88%9C%EC%88%98%EC%B2%AD%EB%8B%B4%EC%A0%90/@37.5219858,127.0384704,17z/data=!4m5!3m4!1s0x0:0x610bf05093b42dea!8m2!3d37.5219866!4d127.0406601?hl=ko",
      "https://www.google.co.kr/maps/place/%EC%88%9C%EC%88%98%EC%B2%AD%EB%8B%B4%EC%A0%90/@37.5219858,127.0384704,17z/data=!4m5!3m4!1s0x0:0x610bf05093b42dea!8m2!3d37.5219866!4d127.0406601?hl=ko",
      "https://www.google.co.kr/maps/place/%EC%88%9C%EC%88%98%EC%B2%AD%EB%8B%B4%EC%A0%90/@37.5219858,127.0384704,17z/data=!4m5!3m4!1s0x0:0x610bf05093b42dea!8m2!3d37.5219866!4d127.0406601?hl=ko",
      "https://www.google.co.kr/maps/place/%EC%88%9C%EC%88%98%EC%B2%AD%EB%8B%B4%EC%A0%90/@37.5219858,127.0384704,17z/data=!4m5!3m4!1s0x0:0x610bf05093b42dea!8m2!3d37.5219866!4d127.0406601?hl=ko",
      "https://www.google.co.kr/maps/place/%EC%88%9C%EC%88%98%EC%B2%AD%EB%8B%B4%EC%A0%90/@37.5219858,127.0384704,17z/data=!4m5!3m4!1s0x0:0x610bf05093b42dea!8m2!3d37.5219866!4d127.0406601?hl=ko",
      "https://www.google.co.kr/maps/place/%EC%88%9C%EC%88%98%EC%B2%AD%EB%8B%B4%EC%A0%90/@37.5219858,127.0384704,17z/data=!4m5!3m4!1s0x0:0x610bf05093b42dea!8m2!3d37.5219866!4d127.0406601?hl=ko",
      "https://www.google.co.kr/maps/place/%EC%88%9C%EC%88%98%EC%B2%AD%EB%8B%B4%EC%A0%90/@37.5219858,127.0384704,17z/data=!4m5!3m4!1s0x0:0x610bf05093b42dea!8m2!3d37.5219866!4d127.0406601?hl=ko")
add<-c("서울특별시 강남구 청담동 91-3",
       "서울특별시 강남구 청담동 141-9",
       "서울특별시 강남구 청담동 도산대로81길 51",
       "서울특별시 강남구 선릉로 158길 13-8",
       "서울특별시 강남구 청담동 도산대로 435",
       "서울특별시 강남구 청담동 91-12",
       "서울특별시 강남구 도산대로 51길 12",
       "서울특별시 강남구 도산대로 45길 18-10",
       "서울특별시 강남구 신사동 도산대로37길 6",
       "서울특별시 강남구 청담동 16-1",
       "서울특별시 강남구 청담동 13-2",
       "서울특별시 서초구 잠원동 8-22",
       "서울특별시 강남구 청담동 81-9",
       "서울특별시 강남구 신사동 646-6",
       "서울특별시 강남구 청담동 선릉로 830",
       "서울특별시 강남구 신사동 631-23",
       "서울특별시 강남구 청담동 선릉로146길 15",
       "서울특별시 강남구 청담동 83-9",
       "서울특별시 강남구 신사동 643-6",
       "서울특별시 마포구 서교동 동교로 142-8",
       "서울특별시 강남구 논현동 91-7")
add

gc<-geocode(enc2utf8(add))
gc

df<-data.frame(name=names,lon=gc$lon,lat=gc$lat)
df

cen<-c(mean(df$lon),mean(df$lat))
cen

map<-get_googlemap(center=cen,
                   maptype="terrain",
                   zoom=14,
                   marker=gc)
ggmap(map,fullpage=TRUE)

gmap<-ggmap(map,fullpage=TRUE)

gmap+geom_text(data=df,
               aes(x=lon,y=lat),
               size=5,
               label=df$name)
gmap<-ggmap(map,fullpage=TRUE,legend="topright")
gmap+geom_text(data=df,
               aes(x=lon,y=lat,colour=factor(name)),
               size=8,
               label=levels(df$name),decresing=T) +
  scale_color_discrete(
    name='hair make shop'
  )
