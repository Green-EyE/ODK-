#Reshape MQ_HIV_results data-set by Green_Eye

rm(list = ls())

library(readxl)
library(readr)
library(dplyr)



#Read files into R environment
SIS_Cod <- read_excel("C:/Users/cnhantumbo/Documents/KoboToolbox/ODK/SIS-Cod.xlsx")
MQ_HIV_results <- read_csv("C:/Users/cnhantumbo/Documents/KoboToolbox/ODK/Data/MQ_HIV_results.csv")
head(MQ_HIV_results)

#Select columns needed
MQ_HIV_results1 <- select(MQ_HIV_results, 'central_code',	'groupNivelSupervisao:QSupLevel',	'groupNivelSupervisao:supervisor',	'groupGeo:province',	
                       'groupGeo:district', 'groupGeo:QGeo',	'QSupCode' ,	'groupForm:groupGI:QGIPartner','groupForm:groupDS2:domainScore2',
                       'groupForm:groupDS3:domainScore3','groupForm:groupDS4:domainScore4','groupForm:groupDS5:domainScore5', 'groupForm:groupDS6:domainScore6',
                       'groupForm:groupDS7:domainScore7')
head(MQ_HIV_results1)

#Rename columns
#APSSPP_results2 <- APSSPP_results1 %>% rename("central_code"= "central_code" ,	"qSupLevel"= "groupNivelSupervisao:QSupLevel" ,	"supervisor"= "groupNivelSupervisao:supervisor",	"provinceCode"= "groupGeo:province",	
#                                        "district"= "groupGeo:district", "qGeo"= "groupGeo:QGeo", "qSupCode"="QSupCode" ,	"qGIPartner"="groupForm:groupGI:QGIPartner","domainScore1"= "groupForm:groupDS1:domainScore1",
#                                        "domainScore2"="groupForm:groupDS2:domainScore2", "domainScore3"="groupForm:groupDS3:domainScoreG3", "domainScore4"="groupForm:groupDS4:domainScoreG4" ,"domainScore5"="groupForm:groupDS5:domainScoreG5",
#                                        "domainScore7"= "groupForm:groupDS7:domainScore7")
#head(APSSPP_results2)


#convert a data frame column to numeric type...
MQ_HIV_results1$`groupGeo:province` = as.numeric(as.character(MQ_HIV_results1$`groupGeo:province`))


# Joint data frames
MQ_HIV_results2 <- inner_join(SIS_Cod, MQ_HIV_results1, by=c("SIS-Cod"="groupGeo:QGeo", "Prov-Cod" = "groupGeo:province", "Dist."= "groupGeo:district"))
head(MQ_HIV_results2)

#Write to disk
write.csv(MQ_HIV_results2, file = "Results/MQ_HIV_results.csv")                      





