X = matrix(c(1,0,1,2,2,3,-1,1),4,2)
t(X)
y=matrix(c(4,4,5,3),4,1)
y
(solve(t(X) %*% X)) %*% t(X) %*% y


M = matrix(c(1,1,1),1,3)
N = matrix(c(1,1,1,1,1,1,1,1,1),3,3)
M
N
M %*% N
