#Set the working directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Delete all previous objects
rm(list= ls())

#Load the packages
library("ggplot2")
library("plyr")
library("RColorBrewer")
library("reshape2")
library("tidyr")
library("vegan")


###############################################
##### Ecology
###############################################


#Import  data
jcreco = read.csv("data/jcr ecology 2018.csv", na = "Not Available",
                  skip = 1, header = T)

neco<-dim(jcreco)[1]
jcreco<-jcreco[1:(neco-2),]

#Inspect object
head(jcreco)
tail(jcreco)
colnames(jcreco)
str(jcreco)
dim(jcreco)
sum(is.na(jcreco))


#Summarise
jcreco.med <- summarise(jcreco, 
                        IFmedian = median(Journal.Impact.Factor, na.rm = T))
jcreco.med
eco.med = round(jcreco.med[1,1], digits = 2)
eco.med

jcreco.qua1 <- summarise(jcreco, 
                         IFqua1 = quantile(Journal.Impact.Factor, na.rm = T))
class(jcreco.qua1)
head(jcreco.qua1)
str(jcreco.qua1)
eco.qua1 = round(jcreco.qua1[2,1], digits = 2)
eco.qua1

jcreco.qua2 <- summarise(jcreco, 
                         IFqua2 = quantile(Journal.Impact.Factor, na.rm = T))
class(jcreco.qua2)
head(jcreco.qua2)
str(jcreco.qua2)
eco.qua2 = round(jcreco.qua2[4,1], digits = 2)
eco.qua2


#Plot the histogram of impact factor
p1 = ggplot(jcreco, aes(x=Journal.Impact.Factor)) +
  geom_histogram(binwidth=.5, alpha=.3, fill = "blue", position="identity") +
  xlab("Impact factor 2018: Ecology") + 
  ylab("Frequency") +
  theme(axis.text.x = element_text(colour="grey20",size=20,
                                   angle=0,hjust=.5,vjust=.5,face="plain"),
        axis.text.y = element_text(colour="grey20",size=20,
                                   angle=0,hjust=1,vjust=0,face="plain"),
        axis.title.x = element_text(colour="grey20",size=25,
                                    angle=0,hjust=.5,vjust=0,face="plain"),
        axis.title.y = element_text(colour="grey20",size=25,
                                    angle=90,hjust=.5,vjust=.5,face="plain")) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5),"cm")) +
  theme(axis.title.y=element_text(margin=margin(0,20,0,0)),
        axis.title.x=element_text(margin=margin(20,0,0,0))) +
  geom_vline(data=jcreco.med, aes(xintercept=eco.med),
             linetype="dashed", size=0.5, color = "blue") +
  geom_text(aes(eco.med, 26, label = eco.med, angle = 0, 
                hjust = -0.1, vjust = 0), size = 5, color = "blue") +
  geom_vline(data=jcreco.qua1, aes(xintercept=eco.qua1),
             linetype="dashed", size=0.5, color = "blue") +
  geom_text(aes(eco.qua1, 26, label = eco.qua1, angle = 0, 
                hjust = -0.1, vjust = 0), size = 3, color = "blue") +
  geom_vline(data=jcreco.qua1, aes(xintercept=eco.qua2),
             linetype="dashed", size=0.5, color = "blue") +
  geom_text(aes(eco.qua2, 26, label = eco.qua2, angle = 0,
                hjust = -0.1, vjust = 0), size = 3, color = "blue")

p1
png(filename= "ecology 2018.png", res= 300,  height= 16, width=26, unit="cm")
dev.off()


###############################################
##### Biodiversity
###############################################


#Recycle Ecology
head(jcreco)
tail(jcreco)


#Import data
jcroce = read.csv("data/jcr oceanography 2018.csv", na = "Not Available",
                  skip = 1, header = T)
noce<-dim(jcroce)[1]
jcroce<-jcroce[1:(noce-2),]

jcrpla = read.csv("data/jcr plant sciences 2018.csv", na = "Not Available",
                  skip = 1, header = T)
npla<-dim(jcrpla)[1]
jcrpla<-jcrpla[1:(npla-2),]

jcrzoo = read.csv("data/jcr zoology 2018.csv", na = "Not Available",
                  skip = 1, header = T)
nzoo<-dim(jcrzoo)[1]
jcrzoo<-jcrzoo[1:(nzoo-2),]


#Inspect objects
head(jcroce)
tail(jcroce)
colnames(jcroce)
str(jcroce)
dim(jcroce)
sum(is.na(jcroce))

head(jcrpla)
tail(jcrpla)
colnames(jcrpla)
str(jcrpla)
dim(jcrpla)
sum(is.na(jcrpla))

head(jcrzoo)
tail(jcrzoo)
colnames(jcrzoo)
str(jcrzoo)
dim(jcrzoo)
sum(is.na(jcrzoo))


#Merge objects to create Biodiversity
jcrbio <- rbind(jcreco, jcroce[1:nrow(jcroce),], 
                jcrpla[1:nrow(jcrpla),], jcrzoo[1:nrow(jcrzoo),])


#Inspect object
head(jcrbio)
tail(jcrbio)
dim(jcrbio)
names(jcrbio)
nrow(jcrbio)
length(jcrbio$Full.Journal.Title)
View(jcrbio)
sum(nrow(jcreco), nrow(jcroce), nrow(jcrpla), nrow(jcrzoo))


#Include the categories
jcrbio$Category <- c(replicate(nrow(jcreco), "Ecology"), 
                     replicate(nrow(jcroce), "Oceanography"), 
                     replicate(nrow(jcrpla), "PlantScience"), 
                     replicate(nrow(jcrzoo), "Zoology"))


#Summarise
jcrbio.med <- ddply(jcrbio, "Category", summarise, 
                    IFmedian = median(Journal.Impact.Factor, na.rm = T))
jcrbio.med

eco.med = round(jcrbio.med[1,2], digits = 2)
oce.med = round(jcrbio.med[2,2], digits = 2)
pla.med = round(jcrbio.med[3,2], digits = 2)
zoo.med = round(jcrbio.med[4,2], digits = 2)


#Plot the histogram of impact factor
p2 = ggplot(jcrbio, aes(x=Journal.Impact.Factor, fill=Category)) +
  geom_density(alpha=.3, position="identity", color = F) +
  xlab("Impact factor 2018: Biodiversidade Capes") + 
  ylab("Frequency") +
  theme(axis.text.x = element_text(colour="grey20",size=20,angle=0,
                                   hjust=.5,vjust=.5,face="plain"),
        axis.text.y = element_text(colour="grey20",size=20,angle=0,
                                   hjust=1,vjust=0,face="plain"),
        axis.title.x = element_text(colour="grey20",size=25,angle=0,
                                    hjust=.5,vjust=0,face="plain"),
        axis.title.y = element_text(colour="grey20",size=25,angle=90,
                                    hjust=.5,vjust=.5,face="plain")) +
  theme(plot.margin = unit(c(0.5,0.5,0.5,0.5),"cm")) +
  theme(axis.title.y=element_text(margin=margin(0,20,0,0)),
        axis.title.x=element_text(margin=margin(20,0,0,0))) +
  geom_vline(data=jcrbio.med, aes(xintercept=IFmedian,  colour=Category),
             linetype="dashed", size=0.5) +
  geom_text(aes(eco.med, 0.60, label = eco.med, angle = 0, 
                hjust = 0, vjust = 0), size = 3) +
  geom_text(aes(oce.med, 0.62, label = oce.med, angle = 0, 
                hjust = 0, vjust = 0), size = 3) +
  geom_text(aes(pla.med, 0.64, label = pla.med, angle = 0, 
                hjust = 0, vjust = 0), size = 3) +
  geom_text(aes(zoo.med, 0.66, label = zoo.med, angle = 0, 
                hjust = 0, vjust = 0), size = 3)

p2
png(filename= "biodiversity 2018.png", res= 300,  height= 16, width=26, unit="cm")
dev.off()