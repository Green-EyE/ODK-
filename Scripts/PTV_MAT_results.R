#Reshape PTV_MAT_results data-set by Green_Eye

rm(list = ls())

library(readxl)
library(readr)
library(dplyr)



#Read files into R environment
SIS_Cod <- read_excel("C:/Users/oop5/OneDrive - CDC/M&E Team/ODK/ODK-MISAU-master/SIS-Cod.xlsx")
PTV_MAT_results1 <- read_csv("C:/Users/oop5/OneDrive - CDC/M&E Team/Dashboard/Site Quality Improvement Dashboard/Data/export_tools/PTV_MAT_results.csv")
head(PTV_MAT_results1)

#Select columns needed
PTV_MAT_results2 <- select(PTV_MAT_results1, 'central_code',	'groupNivelSupervisao:QSupLevel',	'groupNivelSupervisao:supervisor',	'groupGeo:province',	
                           'groupGeo:district', 'groupGeo:QGeo',	'QSupCode' ,	'groupForm:groupGI:QGIPartner','groupForm:groupDS1:domainScore1','groupForm:groupDS2:domainScore2',
                           'groupForm:groupDS3:domainScore3','groupForm:groupDS4:domainScore4','groupForm:groupDS6:domainScore6')
head(PTV_MAT_results2)

#Rename columns
#C_T_results3 <- C_T_results2 %>% rename("central_code"= "central_code" ,	"qSupLevel"= "groupNivelSupervisao:QSupLevel" ,	"supervisor"= "groupNivelSupervisao:supervisor",	"provinceCode"= "groupGeo:province",	
#                       "district"= "groupGeo:district", "qGeo"= "groupGeo:QGeo", "qSupCode"="QSupCode" ,	"qGIPartner"="groupForm:groupGI:QGIPartner","domainScore1"= "groupForm:groupDS1:domainScore1",
#                       "domainScore2"="groupForm:groupDS2:domainScore2", "domainScore3"="groupForm:groupDS3:domainScoreG3", "domainScore4"="groupForm:groupDS4:domainScoreG4" ,"domainScore5"="groupForm:groupDS5:domainScoreG5",
#                       "domainScore7"= "groupForm:groupDS7:domainScore7")
#head(C_T_results3)

#convert a data frame column to numeric type...
PTV_MAT_results$`groupGeo:province` = as.numeric(as.character(PTV_MAT_results2$`groupGeo:province`))

# Joint data frames
PTV_MAT_results3 <- inner_join(SIS_Cod, PTV_MAT_results2, by=c("SIS-Cod"="groupGeo:QGeo", "Prov-Cod" = "groupGeo:province", "Dist."= "groupGeo:district"))
head(PTV_MAT_results3)

#Write to disk
write.csv(PTV_MAT_results3, file = "C:/Users/oop5/OneDrive - CDC/M&E Team/ODK/ODK-MISAU-master/Results/PTV_MAT_results.csv")     
