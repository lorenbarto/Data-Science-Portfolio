#LISTS
#3:25 import data
getwd()
setwd("C:\\Users\\loren\\Documents\\R\\R Advanced")
util<-read.csv("Machine-Utilization.csv")
head(util,12)
str(util)
summary(util)
#Derive utilization column
util$Utilization=1-util$Percent.Idle
head(util,12)

#3:26 Handling date times in R
#in the left column, we have no idea what the hour format is
tail(util)
util$PosixTime<-as.POSIXct(util$Timestamp, format="%d/%m/%Y %H:%M")
head(util,12)
summary(util)
#tip rearrange columns in a data frame
util$Timestamp<-NULL
util<-util[,c(4,1,2,3)]#each row as a number, we assign the order in which we want the number
head(util)

#3:27 List
summary(util)
RL1<-util[util$Machine=="RL1",]
summary(RL1)
RL1$Machine<-factor(RL1$Machine)
summary(RL1)
#construct list
#compute stats first
util_stats_rl1<-c(min(RL1$Utilization,na.rm=T),
                  mean(RL1$Utilization,na.rm=T),
                  max(RL1$Utilization,na.rm=T))
util_stats_rl1
#Has utilization fallen below 90%
util_under_90_flag<-length(which(RL1$Utilization<0.9))>0
util_under_90_flag
list_rl1<-list("RL1",util_stats_rl1, util_under_90_flag)
list_rl1

#328 Naming components of a list
list_rl1
names(list_rl1)
names(list_rl1)<-c("Machine","Stats","LowThreshold")
list_rl1
#Other way
rm(list_rl1)
list_rl1<-list(Machine="RL1",Stats=util_stats_rl1,LowThreshold=util_under_90_flag)
list_rl1

#329 Extracting components of a list
list_rl1
list_rl1[1]
list_rl1[[1]]
list_rl1$Machine

list_rl1[2]
typeof(list_rl1[2])
list_rl1[[2]]
typeof(list_rl1[[2]])

list_rl1$Stats
typeof(list_rl1$Stats)

#how to access the third element of the vector(max utilization)
list_rl1
list_rl1[[2]][3]
list_rl1$Stats[3]


#330 Adding and deleting components
list_rl1
list_rl1[4]<-"New Info"
list_rl1
#other way
#add vector: all hours were utilization is unknown
list_rl1$UnknownHours<-RL1[is.na(RL1$Utilization),"PosixTime"]
list_rl1
#Remove a component
list_rl1[4]<-NULL
list_rl1[66]<-NULL
list_rl1[5:65]<-NULL

#Add dataframe for this machine
list_rl1$Data<-RL1
list_rl1
summary(list_rl1)

#331 Subsetting a list
list_rl1
#how to access the first date in unknown hours
list_rl1$UnknownHours[1]
list_rl1[["UnknownHours"]][1]
#subsetting
list_rl1[1:3]
list_rl1[c(1,4)]
sublist_rl1<-list_rl1[c("Machine","Stats")]
sublist_rl1$Stats[2]
#Double square [[]] are not for subsetting
#list_rl1[[1:3]] #ERROR, cannot select a subset with [[]]

#332 Creating the plot
library(ggplot2)
p<-ggplot(data=util)
p+geom_line(aes(x=PosixTime, y=Utilization,
                colour=Machine), size=1.2) + 
  facet_grid(Machine~.) + geom_hline(yintercept = 0.9,linetype=3,
                                     colour="Gray", size=1.2)
myplot<-p+geom_line(aes(x=PosixTime, y=Utilization,
                        colour=Machine), size=1.2) + 
  facet_grid(Machine~.) + geom_hline(yintercept = 0.9,linetype=3,
                                     colour="Gray", size=1.2)
myplot
#adding it to the list
list_rl1$Plot<-myplot
list_rl1
summary(list_rl1)
str(list_rl1)





































  
  
  
  
  
  
  
  





