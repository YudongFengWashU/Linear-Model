library(faraway)
data(divusa)
attach(divusa)
lm1 <- lm(divorce ~ unemployed + femlab + marriage + birth + military)
summary(lm1)
model.matrix(lm1)[,-1]
X <- model.matrix(lm1)[,-1]
eigen(t(X)%*%X)$values
lamda_1 = max(eigen(t(X)%*%X)$values)
lamda_p = min(eigen(t(X)%*%X)$values)
con_num = (lamda_1/lamda_p)^0.5
con_num
#square root of (largest eigen value of X'X / smallest one), if it is greater than 30, there is collinearity
vif(X)
#all VIFs are less than 10, so there is not an good evidence that collinearity causes non-significance.
lm2 <- lm(divorce ~ femlab + marriage + birth)
summary(lm2)
X1 <- model.matrix(lm2)[,-1]
eigen(t(X1)%*%X1)
lamda_11 = max(eigen(t(X1)%*%X1)$values)
lamda_p1 = min(eigen(t(X1)%*%X1)$values)
con_num1 = (lamda_11/lamda_p1)^0.5
con_num1
vif(X1)
#Removal of insignificant predicators reduce the condition number and VIF of the rest predictors
detach(divusa)
