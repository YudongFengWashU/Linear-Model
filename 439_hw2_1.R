datab3 = data.frame(
  X1 = c(350, 350, 250, 351, 225, 440, 231, 262, 89.7, 96.9, 350, 85.3, 171, 258, 140, 302, 500, 440, 350, 318, 231, 360, 400, 96.9, 140, 460, 133.6, 318, 351, 351, 360, 350),
  Y = c(18.90, 17.00, 20.00, 18.25, 20.07, 11.2, 22.12, 21.47, 34.70, 30.40, 16.50, 36.50, 21.50, 19.70, 20.30, 17.80, 14.39, 14.89, 17.80, 16.41, 23.54, 21.47, 16.59, 31.90, 29.40, 13.27, 23.90, 19.73, 13.90, 13.27, 13.77, 16.50)
)
plot(datab3)

datab3.mod1 = lm(Y ~ X1,data = datab3)
summary(datab3.mod1)
abline(coef(datab3.mod1),col="RED")

#b
anova(datab3.mod1)

#d
conf_in = predict(datab3.mod1, newdata = data.frame(X1 = 275), interval = "confidence",level = 0.95)
conf_in

#e
pred_in = predict(datab3.mod1, newdata = data.frame(X1 = 275), interval = "prediction",level = 0.95)
pred_in
