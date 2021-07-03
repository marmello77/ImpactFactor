################################################################################
##### Impact factor analysis of the journals classified as "Ecology" (JCR)
##### and "Biodiversity" (CAPES).
##### Ecological Synthesis Lab: https://marcomellolab.wordpress.com.
##### Author: Marco Mello.
##### See README for further info:
##### https://github.com/marmello77/ImpactFactor/blob/master/README.md
################################################################################


################################################################################
##### Get ready
################################################################################


setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

rm(list= ls())

library(ggplot2)
library(plyr)
library(RColorBrewer)
library(reshape2)
library(tidyverse)


################################################################################
##### Ecology
################################################################################


# Importação de dados no formato usado até 2020:

#jcreco = read.csv("data/jcr ecology 2020.csv", na = "Not Available",
#skip = 1, header = T)
#neco<-dim(jcreco)[1]
#jcreco<-jcreco[1:(neco-2),]
#jcreco<-jcreco[,1:(ncol(jcreco)-1)]


# OBS: no formato adotado pelo JCR a partir de 2021, é preciso remover a última
# coluna vazia que vem no CSV. Isso pode ser feito manualmente ou através dos
# novos códigos abaixo.

# Método 1
#fl <- "data/jcr ecology 2020.csv"
#txt <- readLines(fl)
#txt <- txt[-1]
#txt <- sub(",$", "", txt)
#con <- textConnection(txt)
#df1 <- read.csv(con)
#close(con)
#head(df1)

#Método 2

jcreco <- read.table("data/jcr ecology 2020.csv", sep=",", 
                 skip=2, fill=T, header=T, row.names=NULL,
                 na.strings = "n/a")
names(jcreco)[-ncol(jcreco)] <- names(jcreco)[-1]
jcreco <- jcreco[,-ncol(jcreco)]
jcreco <- jcreco[1:(nrow(jcreco)-2),]
jcreco$Total.Citations <- as.integer(gsub(",", "", jcreco$Total.Citations))

head(jcreco)
tail(jcreco)
colnames(jcreco)
str(jcreco)
dim(jcreco)
sum(is.na(jcreco))

jcreco.med <- summarise(jcreco, 
                        IFmedian = median(X2020.JIF, na.rm = T))
jcreco.med
eco.med = round(jcreco.med[1,1], digits = 2)
eco.med

jcreco.qua1 <- summarise(jcreco, 
                         IFqua1 = quantile(X2020.JIF, na.rm = T))
class(jcreco.qua1)
head(jcreco.qua1)
str(jcreco.qua1)
eco.qua1 = round(jcreco.qua1[2,1], digits = 2)
eco.qua1

jcreco.qua2 <- summarise(jcreco, 
                         IFqua2 = quantile(X2020.JIF, na.rm = T))
class(jcreco.qua2)
head(jcreco.qua2)
str(jcreco.qua2)
eco.qua2 = round(jcreco.qua2[4,1], digits = 2)
eco.qua2

p1 <- ggplot(jcreco, aes(x=X2020.JIF)) +
  geom_density(color = F, fill = "red", alpha = 0.3, position = "identity") +
  xlab("Impact factor 2020: Ecology") + 
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
             linetype="dashed", size=0.5, color = "red") +
  geom_text(aes(eco.med, 0.29, label = eco.med, angle = 0, 
                hjust = -0.1, vjust = 0), size = 5, color = "red") +
  geom_vline(data=jcreco.qua1, aes(xintercept=eco.qua1),
             linetype="dashed", size=0.5, color = "red") +
  geom_text(aes(eco.qua1, 0.29, label = eco.qua1, angle = 0, 
                hjust = -0.1, vjust = 0), size = 3, color = "red") +
  geom_vline(data=jcreco.qua1, aes(xintercept=eco.qua2),
             linetype="dashed", size=0.5, color = "red") +
  geom_text(aes(eco.qua2, 0.29, label = eco.qua2, angle = 0,
                hjust = -0.1, vjust = 0), size = 3, color = "red")

p1
png(filename= "figures/ecology 2020.png", 
    res= 300,  height= 16, 
    width=26, unit="cm")
p1
dev.off()


################################################################################
##### Biodiversity
################################################################################


jcroce <- read.table("data/jcr oceanography 2020.csv", sep=",", 
                     skip=2, fill=T, header=T, row.names=NULL,
                     na.strings = "n/a")
names(jcroce)[-ncol(jcroce)] <- names(jcroce)[-1]
jcroce <- jcroce[,-ncol(jcroce)]
jcroce <- jcroce[1:(nrow(jcroce)-2),]
jcroce$Total.Citations <- as.integer(gsub(",", "", jcroce$Total.Citations))


jcrpla <- read.table("data/jcr plant sciences 2020.csv", sep=",", 
                     skip=2, fill=T, header=T, row.names=NULL,
                     na.strings = "n/a")
names(jcrpla)[-ncol(jcrpla)] <- names(jcrpla)[-1]
jcrpla <- jcrpla[,-ncol(jcrpla)]
jcrpla <- jcrpla[1:(nrow(jcrpla)-2),]
jcrpla$Total.Citations <- as.integer(gsub(",", "", jcrpla$Total.Citations))


jcrzoo <- read.table("data/jcr zoology 2020.csv", sep=",", 
                     skip=2, fill=T, header=T, row.names=NULL,
                     na.strings = "n/a")
names(jcrzoo)[-ncol(jcrzoo)] <- names(jcrzoo)[-1]
jcrzoo <- jcrzoo[,-ncol(jcrzoo)]
jcrzoo <- jcrzoo[1:(nrow(jcrzoo)-2),]
jcrzoo$Total.Citations <- as.integer(gsub(",", "", jcrzoo$Total.Citations))


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

jcrbio <- rbind(jcreco, jcroce[1:nrow(jcroce),], 
                jcrpla[1:nrow(jcrpla),], jcrzoo[1:nrow(jcrzoo),])

head(jcrbio)
tail(jcrbio)
dim(jcrbio)
names(jcrbio)
nrow(jcrbio)
length(jcrbio$Journal.name)
sum(nrow(jcreco), nrow(jcroce), nrow(jcrpla), nrow(jcrzoo))

jcrbio$Category <- c(replicate(nrow(jcreco), "Ecology"), 
                     replicate(nrow(jcroce), "Oceanography"), 
                     replicate(nrow(jcrpla), "PlantScience"), 
                     replicate(nrow(jcrzoo), "Zoology"))

jcrbio.med <- ddply(jcrbio, "Category", summarise, 
                    IFmedian = median(X2020.JIF, na.rm = T))
jcrbio.med

eco.med = round(jcrbio.med[1,2], digits = 2)
oce.med = round(jcrbio.med[2,2], digits = 2)
pla.med = round(jcrbio.med[3,2], digits = 2)
zoo.med = round(jcrbio.med[4,2], digits = 2)

p2 <- ggplot(jcrbio, aes(x=X2020.JIF, fill=Category)) +
  geom_density(alpha=.3, position="identity", color = F) +
  xlab("Impact factor 2020: Biodiversidade Capes") + 
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
png(filename= "figures/biodiversity 2020.png", 
    res= 300,  height= 16,
    width=26, unit="cm")
p2
dev.off()


################################### END ########################################
