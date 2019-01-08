#R Advanced - Section 4: Apply family of functions
#4:37-Import Data in R
getwd()
setwd("./R/R Advanced/Weather Data")
getwd()
#Read Data
Chicago<-read.csv("Chicago-F.csv",row.names = 1)
NewYork<-read.csv("NewYork-F.csv",row.names = 1)
Houston<-read.csv("Houston-F.csv",row.names = 1)
SanFrancisco<-read.csv("SanFrancisco-F.csv",row.names = 1)
#check data
Chicago
is.data.frame(Chicago)
#Transform into matrices
Chicago<-as.matrix(Chicago)
NewYork<-as.matrix(NewYork)
Houston<-as.matrix(Houston)
SanFrancisco<-as.matrix(SanFrancisco)
#check
is.matrix(NewYork)
#Create a list and assigning names already
Weather<-list(Chicago=Chicago, NewYork=NewYork, Houston=Houston,
              SanFrancisco=SanFrancisco)
Weather
#Let's try it out
Weather$NewYork
Weather[[2]]

#4:39
?apply
apply(Chicago,1,mean)
#analyze one city
Chicago
apply(Chicago,1,mean)
apply(Chicago,1,min)
#for practice,but makes no sense
apply(Chicago,2,max)
apply(Chicago,2,min)
#Compare the cities
apply(Chicago,1,mean)
apply(NewYork,1,mean)
apply(Houston,1,mean)
apply(SanFrancisco,1,mean)

#Almost completes deliverable 1, but there is a much more faster way 

#4:40-Recreating apply functions with loops
Chicago
#find the mean of every row via loops(1)
output<-NULL
for(i in 1:5){
  output[i]<-mean(Chicago[i,])
}
output
names(output)<-rownames(Chicago)
output
#via apply()(2)
apply(Chicago,1,mean)

#4:41 Using lapply()
?lapply() #returns a list as a function
Chicago
t(Chicago) #transpose rows and columns
#takes way too long to do the same for all of weather, so we use lapply

Weather
lapply(Weather,t)
mynewlist<-lapply(Weather,t)
mynewlist

#example 2
Chicago
rbind(Chicago,NewRow=1:12) #similarly, we would have to do it for every single list in the matrix

lapply(Weather,rbind,NewRow=1:12)
#Example3
?rowMeans #simply does the mean of each row
lapply(Weather,rowMeans)
    #<<-Almost deliverable 1, but not perfect yet
#Other functions associated with lapply
  #rowMeans,colMeans,rowSums,colSums

#4:42-Combining lapply() with []
Weather #extract avghigh_f for Jan for Chicago
Weather$Chicago[1,1]
Weather$Chicago["AvgHigh_F","Jan"]
Weather[["Chicago"]]["AvgHigh_F","Jan"]
Weather[[1]][1,1]
#We want to extract avgHigh_F for Jan for each city-lapply()
lapply(Weather,"[",1,1)
lapply(Weather,"[","AvgHigh_F","Jan") 
#All rows but only for March
lapply(Weather,"[",,3)
lapply(Weather,"[",,"Mar")

#4:43-Adding my own functions
lapply(Weather,rowMeans) #let's use our own function
lapply(Weather,function(x)x[1,1])
lapply(Weather,function(x)x[,3])
Weather #looking for difference between +and- avgs
lapply(Weather,function(z)z[1,]-z[2,]) #in percentage,rounded
lapply(Weather,function(z)round((z[1,]-z[2,])/z[2,],2))
#Gives us the % fluctuation between highest and lowest temperature
#Close to deliverable 2 but can be improved again

#4:44-Using sapply()
?sapply #User friendly version of lapply()
Weather
#Avghigh_F for July
lapply(Weather,"[",1,7)
sapply(Weather,"[",1.7) #Nice vector form
#AvgHigh_F for 4th quarter
lapply(Weather,"[",1,10:12)
sapply(Weather,"[",1,10:12) #Clean matrix form
# Deliverable 1
lapply(Weather,rowMeans)
sapply(Weather,rowMeans)
round(sapply(Weather,rowMeans),2) #Perfect deliverable 1

#Deliverabe 2
lapply(Weather,function(z) round((z[1,]-z[2,])/z[2,],2))
sapply(Weather,function(z) round((z[1,]-z[2,])/z[2,],2)) #Perfect deliverable 2

#Side note
sapply(Weather,rowMeans,simplify = FALSE) #returns the same as lapply

#4:45-Nesting apply() functions
Weather
lapply(Weather,rowMeans) #how do we get the max?
Chicago
apply(Chicago,1,max)
lapply(Weather,apply,1,max) #lapply iterates through each matrix of weather list,and applies the rest to each matix
lapply(Weather,function(x) apply(x,1,max))
#Make it nice and tidy
sapply(Weather,apply,1,max) #Deliverable 3
sapply(Weather,apply,1,min) #Deliverable 4

#4:46-which.max and which.min
#How do we create a matrix that tells us when was the highest/lowest temperature
#We want a matrix with the name of the month
?which.max
Chicago[1,]
which.max(Chicago[1,])
names(which.max(Chicago[1,]))
#Add 2 iterations:over each row for Chicago matrix
#And over the list in Weather (for each city)
apply(Chicago,1,function(x) names(which.max(x)))
#Now over each city
lapply(Weather,function(y)(apply(y,1,function(x) names(which.max(x)))))
#Finally, make it look nice and tidy
sapply(Weather,function(y)(apply(y,1,function(x) names(which.max(x)))))














