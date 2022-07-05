a<-c(1:10)
b<-c(4:12)

cat("a:",a,"\n")
cat("b:",b,"\n")
cat("Intersection: ",intersect(a,b),"\n")
cat("Union: ",union(a,b),"\n")
cat("set diff of a and b: ",setdiff(a,b),"\n")
cat("set diff of b and a: ",setdiff(b,a),"\n")
