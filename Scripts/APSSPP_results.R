#Reshape APSSPP_results data-set by Green_Eye

rm(list = ls())

library(readxl)
library(readr)
library(dplyr)



#Read files into R environment
SIS_Cod <- read_excel("C:/Users/cnhantumbo/Documents/KoboToolbox/ODK/SIS-Cod.xlsx")
APSSPP_results <- read_csv("C:/Users/cnhantumbo/Documents/KoboToolbox/ODK/Data/APSSPP_results.csv")
head(APSSPP_results)

#Select columns needed
APSSPP_results1 <- select(APSSPP_results, 'central_code',	'groupNivelSupervisao:QSupLevel',	'groupNivelSupervisao:supervisor',	'groupGeo:province',	
                       'groupGeo:district', 'groupGeo:QGeo',	'QSupCode' ,	'groupForm:groupGI:QGIPartner','groupForm:groupDS1:domainScore1',
                       'groupForm:groupDS2:domainScore2','groupForm:groupDS3:domainScore3','groupForm:groupDS4:domainScore4','groupForm:groupDS5:domainScore5',
                       'groupForm:groupDS6:domainScore6', 'groupForm:groupDS7:domainScore7', 'groupForm:groupDS8:domainScore8', 'groupForm:group13:groupDS13:domainScore13',
                       'groupForm:group13:groupDS14:domainScore14', 'groupForm:group13:groupDS15:domainScore15')
head(APSSPP_results1)

#Rename columns
#APSSPP_results2 <- APSSPP_results1 %>% rename("central_code"= "central_code" ,	"qSupLevel"= "groupNivelSupervisao:QSupLevel" ,	"supervisor"= "groupNivelSupervisao:supervisor",	"provinceCode"= "groupGeo:province",	
#                                        "district"= "groupGeo:district", "qGeo"= "groupGeo:QGeo", "qSupCode"="QSupCode" ,	"qGIPartner"="groupForm:groupGI:QGIPartner","domainScore1"= "groupForm:groupDS1:domainScore1",
#                                        "domainScore2"="groupForm:groupDS2:domainScore2", "domainScore3"="groupForm:groupDS3:domainScoreG3", "domainScore4"="groupForm:groupDS4:domainScoreG4" ,"domainScore5"="groupForm:groupDS5:domainScoreG5",
#                                        "domainScore7"= "groupForm:groupDS7:domainScore7")
#head(APSSPP_results2)

#convert a data frame column to numeric type...
APSSPP_results1$`groupGeo:province` = as.numeric(as.character(APSSPP_results1$`groupGeo:province`))
# Joint data frames
APSSPP_results2 <- inner_join(SIS_Cod, APSSPP_results1, by=c("SIS-Cod"="groupGeo:QGeo", "Prov-Cod" = "groupGeo:province", "Dist."= "groupGeo:district"))
head(APSSPP_results2)

#Write to disk
write.csv(APSSPP_results2, file = "Results/APSSPP_results.csv")                      





