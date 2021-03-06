##Uygulama 1 #Correlation-Regression##
setwd("C:/Users/ol/Desktop")
getwd()
list.files()
data<-read.csv("dataset_tufe_vs_index.csv",header = T,sep = ",")
head(data,2)
cor(data[,2:4])

##p-value i�in Hmisc k�t�phanesini y�kl�yoruz ve �a��r�yoruz.##
require(Hmisc)

colnames(data)
rcorr(cbind(data[,2],data[,3],data[,4]))

plot(data$tcmb_istanbul_2el,data$tufe)

#regresyon modelini kuruyoruz.
model<-lm(data$tcmb_istanbul_2el~data$tufe)
r<-resid(model)

plot(r,data$tcmb_istanbul_2el)



model2<-lm(log(data$tcmb_istanbul_2el)~data$tufe)

r<-resid(model2)
summary(model2)
r<-resid(model2)

plot(r,log)
     
#lmtest paketi y�kleniyor ve paket �a��r�l�yor. Durbin watson i�in.#
require(lmtest)


#nlme paketini y�kl�yoruz ve paketi �a��r�yoruz.
require(nlme)

#gls kullan�yoruz
tcmb_istanbul<-data$tcmb_istanbul_2el
tufe<-data$tufe

model3<-gls(tcmb_istanbul~tufe,correlation = corAR1(form=~1))


#Timeseries

#Timeseries format� olu�turuyoruz.
tstufe<-ts(reidin,frequency = 12,start = c(2007,1))

#unit root i�in fUnitRoots paketini y�kl�yoruz ve k�t�phaneyi �a��r�yoruz.
require(fUnitRoots)

#adf testi yap�yoruz
adfTest(tsreidin)

#fark al�p dura�an yap�yoruz.
adfTest(diff(tsreidin,1))
diffreidin<-diff(tsreidin,1)
tsarima<-arima(diffreidin,order=c(2,0,0)
               
#tahmin yap�yoruz 
require(forecast)
forecast.Arima(tsarima,h=1)





