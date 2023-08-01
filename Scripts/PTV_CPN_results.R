#Reshape PTV_CPN_results data-set by Green_Eye

rm(list = ls())

library(readxl)
library(readr)
library(dplyr)



#Read files into R environment
SIS_Cod <- read_excel("C:/Users/oop5/OneDrive - CDC/M&E Team/ODK/ODK-MISAU-master/SIS-Cod.xlsx")
PTV_CPN_results1 <- read_csv("C:/Users/oop5/OneDrive - CDC/M&E Team/Dashboard/Site Quality Improvement Dashboard/Data/export_tools/PTV_CPN_results.csv")
head(PTV_CPN_results1)

#Select columns needed
PTV_CPN_results2 <- select(PTV_CPN_results1, 'central_code',	'groupNivelSupervisao:QSupLevel',	'groupNivelSupervisao:supervisor',	'groupGeo:province',	
                           'groupGeo:district', 'groupGeo:QGeo',	'QSupCode' ,	'groupForm:groupGI:QGIPartner','groupForm:groupDS2:domainScore2',
                           'groupForm:groupDS3:domainScore3','groupForm:groupDS4:domainScore4','groupForm:groupDS5:domainScore5','groupForm:groupDS6:domainScore6',
                           'groupForm:groupDS7:domainScore7','groupForm:groupDS8:domainScore8','groupForm:groupDS9:domainScore9','groupForm:groupDS10:domainScore10',
                           'groupForm:groupDS11:domainScore11','groupForm:groupDS12:domainScore12','groupForm:groupDS13:domainScore13','groupForm:groupDS14:domainScore14','groupForm:groupDS15:domainScore15','groupForm:groupDS16:domainScore16','groupForm:group17:domainScore17')
head(PTV_CPN_results2)

#Rename columns
#C_T_results3 <- C_T_results2 %>% rename("central_code"= "central_code" ,	"qSupLevel"= "groupNivelSupervisao:QSupLevel" ,	"supervisor"= "groupNivelSupervisao:supervisor",	"provinceCode"= "groupGeo:province",	
#                       "district"= "groupGeo:district", "qGeo"= "groupGeo:QGeo", "qSupCode"="QSupCode" ,	"qGIPartner"="groupForm:groupGI:QGIPartner","domainScore1"= "groupForm:groupDS1:domainScore1",
#                       "domainScore2"="groupForm:groupDS2:domainScore2", "domainScore3"="groupForm:groupDS3:domainScoreG3", "domainScore4"="groupForm:groupDS4:domainScoreG4" ,"domainScore5"="groupForm:groupDS5:domainScoreG5",
#                       "domainScore7"= "groupForm:groupDS7:domainScore7")
#head(C_T_results3)

#convert a data frame column to numeric type...
PTV_CPN_results$`groupGeo:province` = as.numeric(as.character(PTV_CPN_results2$`groupGeo:province`))

# Joint data frames
PTV_CPN_results3 <- inner_join(SIS_Cod, PTV_CPN_results2, by=c("SIS-Cod"="groupGeo:QGeo", "Prov-Cod" = "groupGeo:province", "Dist."= "groupGeo:district"))
head(PTV_CPN_results3)

#Write to disk
write.csv(PTV_CPN_results3, file = "C:/Users/oop5/OneDrive - CDC/M&E Team/ODK/ODK-MISAU-master/Results/PTV_CPN_results.csv")     
