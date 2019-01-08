# R Advanced 
# Section 2 
getwd()
setwd("/Users/lorenzobartolini/Documents/R/R Advanced")
getwd()

#basic import fin<-read.csv("Future-500.csv")
fin<-read.csv("Future-500.csv", na.strings=c(""))
head(fin,20)
str(fin)
summary(fin)

#changing from integer to factor
fin$ID<-factor(fin$ID)
fin$Inception<-factor(fin$Inception)
str(fin)

#Factor variable trap (FVT)

a<-c("12","13","14","12","12")
a
b<-as.numeric(a)
b
typeof(b)

#converting into numerics for factors
z<- factor(c("12","13","14","12","12"))
z 
typeof(z)
y<-as.numeric(z)
y
typeof(y)
#to change that and get the vector z as numbers
x<-as.character(z)
typeof(z)
x<-as.numeric(as.character(z))
x

#FVT example - 
head(fin)
str(fin)

# 2:8 - sub and gsub function
#they look for patterns and look to replace instences, gsub replaces all where sub replaces first one
?sub
fin$Expenses<-gsub("Dollars","",fin$Expenses) #must use dollars and not $
head(fin)
fin$Expenses<-gsub(",","",fin$Expenses)
head(fin)
str(fin)
#now expenses is a chr not a factor anymore

fin$Revenue<-gsub("\\$","",fin$Revenue) #escape sequence for $: \\$
head(fin)
fin$Revenue<-gsub(",","",fin$Revenue)
head(fin)
fin$Growth<-gsub("%","",fin$Growth)
head(fin)
#now expenses, growth and revenue are chr, not factor, so they are easier to put into numbers

fin$Expenses<-as.numeric(fin$Expenses)
fin$Revenue<-as.numeric(fin$Revenue)
fin$Growth<-as.numeric(fin$Growth) #first step already happened
head(fin)
str(fin)

# 2:11 Locate missing data
head(fin,24)
complete.cases(fin) #is there an NA in any of the rows?
fin[!complete.cases(fin),] #only brings up the rows with an NA and shows them as matrix

#gotta fix the entire dataset from the beginning,at the core, look under basic import

# 2:12 - Filtering with non missing values
head(fin)
fin[fin$Revenue ==9746272,]
which(fin$Revenue ==9746272)
fin[which(fin$Revenue==9746272),]

head(fin)
fin[fin$Employees==45,]
fin[which(fin$Employees==45),]

# 2:13 - filtering using .na() for missing data
head(fin,24)

fin$Expenses == NA
fin[fin$Expenses==NA,]

a<-c(1,2,NA,45,NA)
is.na(a)

is.na(fin$Expenses)
fin[is.na(fin$Expenses),]

fin$State==NA
fin[fin$State==NA,]

is.na(fin$State)
fin[is.na(fin$State),]

# 2:14-Removing records with missing data
#Backup
fin_backup<-fin
fin[!complete.cases(fin),]
fin[is.na(fin$Industry),]
fin[!is.na(fin$Industry),]

fin<-fin[!is.na(fin$Industry),]
head(fin,24)

# 2:15 Resetting the dataframe index
rownames(fin)<-NULL
fin

# 2:16 Replacing Missing Data:Factual Analysis
fin[!complete.cases(fin),]
str(fin)
fin[is.na(fin$State),]
fin[is.na(fin$State) & fin$City=="New York","State"]<-"NY"
#check
fin[c(11,377),]
#For CA
fin[is.na(fin$State),]
fin[is.na(fin$State) & fin$City=="San Francisco", "State"]<-"CA"
#check for CA
fin[c(82,265),]

# 2:17-Replacing missing data-Median Imputation Method
fin[!complete.cases(fin),]

median(fin[,"Employees"],na.rm=TRUE)
med_empl_retail<-median(fin[fin$Industry=="Retail","Employees"],na.rm=TRUE)
med_empl_retail

fin[is.na(fin$Employees) & fin$Industry=="Retail","Employees"]<-med_empl_retail
#check
fin[3,]
#For company in financial services sector
med_empl_finance<-median(fin[fin$Industry=="Financial Services","Employees"],na.rm=TRUE)
med_empl_finance
fin[is.na(fin$Employees) & fin$Industry=="Financial Services","Employees"]<-med_empl_finance
#check
fin[330,]

left<-fin[!complete.cases(fin),]

# 2:18-Median Imputation Method (Part 2)
left
med_growth_constr<-median(fin[fin$Industry=="Construction","Growth"],na.rm=TRUE)
med_growth_constr
fin[is.na(fin$Growth) & fin$Industry=="Construction","Growth"]<-med_growth_constr
#check
left
#same for revenue 
med_revenue_constr<-median(fin[fin$Industry=="Construction","Revenue"],na.rm=TRUE)
med_revenue_constr
fin[is.na(fin$Revenue) & fin$Industry=="Construction","Revenue"]<-med_revenue_constr
left
#...and expenses
med_exp_constr<-median(fin[fin$Industry=="Construction","Expenses"],na.rm=TRUE)
med_exp_constr
fin[is.na(fin$Expenses) & fin$Industry=="Construction","Expenses"]<-med_exp_constr
#For IT services
fin[fin$Name=="Ganzlax","Expenses"]<-NA
left

# 2:20-Replacing data deriving values
#Revenue-Expe=Profit
#Expenses=Revenue-Profit
fin[is.na(fin$Profit),"Profit"]<-fin[is.na(fin$Profit),"Revenue"] - fin[is.na(fin$Profit),"Expenses"]
fin[c(8,42),]
left
fin[is.na(fin$Expenses),"Expenses"]<-fin[is.na(fin$Expenses),"Revenue"]-fin[is.na(fin$Expenses),"Profit"]
fin[c(15,20),]
left

# 2:21-Visualization
library(ggplot2)
p<-ggplot(data=fin)
p + geom_point(aes(x=Revenue,y=Expenses,
                   colour=Industry,size=Profit))
#Second chart adding trend
p+geom_point(aes(x=Revenue,y=Expenses,
                 colour=Industry)) + 
  geom_smooth(aes(x=Revenue,y=Expenses,
                  colour=Industry))
#More elegant way of doing it
d<-ggplot(data=fin,aes(x=Revenue,y=Expenses,
              color=Industry))
d+geom_point()+geom_smooth(fill=NA,size=1.2)

#Last chart - Boxplot
f<-ggplot(data=fin,aes(x=Industry,y=Growth,
                       color=Industry))
f+geom_boxplot(size=1)
#Extra
f+geom_jitter()+geom_boxplot(size=1,alpha=0.5,
                             outlier.color=NA)


