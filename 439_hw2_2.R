mydata = data.frame(
  X_AmtSpt = c(50.1, 74.1, 19.3, 22.9, 82.4, 40.1, 185.9, 26.9, 20.4, 166.2, 27, 45.6, 154.9, 5, 49.7, 26.9, 5.7, 7.6, 9.2, 32.4, 6.1),
  Y_RI = c(32.1, 99.6, 11.7, 21.9, 60.8, 78.6, 92.4, 50.7, 21.4, 40.1, 40.8, 10.4, 88.9, 12, 29.2, 38, 10, 12.3, 23.4, 71.1, 4.4)
  
)
plot(mydata)

mydata.mod1 = lm(Y_RI ~ X_AmtSpt, data = mydata)
summary(mydata.mod1)
abline(coef(mydata.mod1), col="RED")

#c
summary(mydata$X_AmtSpt)
newx = seq(5.0,185.9, by=0.05)
con_in = predict(mydata.mod1, newdata = data.frame(X_AmtSpt=newx), interval = "confidence", level = 0.95)
lines(newx, con_in[,2],col="BLUE",lty=2)
lines(newx, con_in[,3],col="BLUE",lty=2)
con_in

pred_in = predict(mydata.mod1, newdata = data.frame(X_AmtSpt=newx), interval = "prediction",level = 0.95)
lines(newx, pred_in[,2],col="orange",lty=2)
lines(newx, pred_in[,3],col="orange",lty=2)
pred_in

#d
con_in_MCI = predict(mydata.mod1,newdata = data.frame(X_AmtSpt=26.9),interval = "confidence",level = 0.95)
con_in_MCI

pred_in_MCI = predict(mydata.mod1,newdata = data.frame(X_AmtSpt=26.9),interval = "prediction",level = 0.95)
pred_in_MCI

