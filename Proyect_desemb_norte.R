rm(list=ls())

library(TSA)

current_path = rstudioapi::getActiveDocumentContext()$path 
#setwd(dirname(current_path ))

#setwd("C:/Users/mauricio.ibarra/Documents/IFOP/Proyectos/CTP/CBA_Camar?n nailon/CTP2021/Hito 3.- 1er Informe T?cnico (Estatus)/Proyecci?n desembarque")

#x<-read.table("Desembarque_norte.txt", header=F)

x<-read.csv("Desembarque_norte.csv", sep = ";")


xts<-ts(x$Desembarque, frequency = 1, start = 1961)

#Modelos

model10<-arima(xts,order=c(1,0,0))
model20<-arima(xts,order=c(2,0,0))
model30<-arima(xts,order=c(3,0,0))
model40<-arima(xts,order=c(4,0,0))
model50<-arima(xts,order=c(5,0,0))
model60<-arima(xts,order=c(6,0,0))
AIC(model10,model20,model30,model40,model50,model60)
#Best AR 4, AIC 570

m001<-arima(xts,order=c(0,0,1))
m002<-arima(xts,order=c(0,0,2))
m003<-arima(xts,order=c(0,0,3))
m004<-arima(xts,order=c(0,0,4))
m005<-arima(xts,order=c(0,0,5))
m006<-arima(xts,order=c(0,0,6))
AIC(m001,m002,m003,m004,m005,m006)
#Best MA6

m401<-arima(xts,order=c(4,0,1))
m402<-arima(xts,order=c(4,0,2))
m403<-arima(xts,order=c(4,0,3))
m404<-arima(xts,order=c(4,0,4))
m405<-arima(xts,order=c(4,0,5))
m406<-arima(xts,order=c(4,0,6))
AIC(m401,m402,m403,m404,m405,m406)

m012<-arima(xts,order=c(0,1,2))

AIC(m012)

select<-m012
#install.packages("forecast")

library(forecast)



# png(file="Proyeccion_norte.png", width = 1300, height = 600)

plot(forecast(select, h=1, level=c(90), cex.axis=1.3), ylim=c(0,6000), lty=1, 
     lwd=3, main="Proyección desembarque 2023",
     xlab="Año", ylab="Captura (t)", cex.axis=1.3,xaxt = 'n')
par(new=T)
plot(forecast(select, h=1, level=c(90)), ylim=c(0,6000), 
     xlim=c(1961, 2023), main="", cex.lab = 1.4)
#axis(1, at = 1961:2018, labels = 1961:2018)
par(new=T)
plot(62, 1137, col="red", h=1, pch= 16, xlim=c(0,62), ylim=c(0, 6000), axes = FALSE, ann = FALSE)


# dev.off()

