#Reshape Prevencao_Triagem_ADU_results data-set by Green_Eye

rm(list = ls())

library(readxl)
library(readr)
library(dplyr)



#Read files into R environment
SIS_Cod <- read_excel("C:/Users/oop5/OneDrive - CDC/M&E Team/ODK/ODK-MISAU-master/SIS-Cod.xlsx")
Prevencao_Triagem_ADU_results1 <- read_csv("C:/Users/oop5/OneDrive - CDC/M&E Team/Dashboard/Site Quality Improvement Dashboard/Data/export_tools/Prevencao_Triagem_ADU_results.csv")
head(Prevencao_Triagem_ADU_results1)

#Select columns needed
Prevencao_Triagem_ADU_results2 <- select(Prevencao_Triagem_ADU_results1, 'central_code',	'groupNivelSupervisao:QSupLevel',	'groupNivelSupervisao:supervisor',	'groupGeo:province',	
                                'groupGeo:district', 'groupGeo:QGeo',	'QSupCode' ,	'groupForm:groupGI:QGIPartner','groupForm:group0:groupDS1:domainScore1',
                                'groupForm:group0:groupDS2:domainScore2','groupForm:group0:groupDS3:domainScore3','groupForm:group0:groupDS4:domainScore4','groupForm:group0:groupDS5:domainScore5',
                                'groupForm:group0:groupDS6:domainScore6','groupForm:group0:groupDS7:domainScore7','groupForm:group0:groupDS8:domainScore8','groupForm:group0:groupDS9:domainScore9','groupForm:group0:groupDS10:domainScore10','groupForm:group0:groupDS11:domainScore11','groupForm:group0:groupDS12:domainScore12','groupForm:group0:groupDS13:domainScore13','groupForm:group0:groupDS14:domainScore14','groupForm:group0:groupDS15:domainScore15','groupForm:group0:groupDS16:domainScore16','groupForm:group0:groupDS17:domainScore17')
head(Prevencao_Triagem_ADU_results2)

#Rename columns
#C_T_results3 <- C_T_results2 %>% rename("central_code"= "central_code" ,	"qSupLevel"= "groupNivelSupervisao:QSupLevel" ,	"supervisor"= "groupNivelSupervisao:supervisor",	"provinceCode"= "groupGeo:province",	
#                       "district"= "groupGeo:district", "qGeo"= "groupGeo:QGeo", "qSupCode"="QSupCode" ,	"qGIPartner"="groupForm:groupGI:QGIPartner","domainScore1"= "groupForm:groupDS1:domainScore1",
#                       "domainScore2"="groupForm:groupDS2:domainScore2", "domainScore3"="groupForm:groupDS3:domainScoreG3", "domainScore4"="groupForm:groupDS4:domainScoreG4" ,"domainScore5"="groupForm:groupDS5:domainScoreG5",
#                       "domainScore7"= "groupForm:groupDS7:domainScore7")
#head(C_T_results3)

#convert a data frame column to numeric type...
Prevencao_Triagem_ADU_results$`groupGeo:province` = as.numeric(as.character(Prevencao_Triagem_ADU_results2$`groupGeo:province`))

# Joint data frames
Prevencao_Triagem_ADU_results3 <- inner_join(SIS_Cod, Prevencao_Triagem_ADU_results2, by=c("SIS-Cod"="groupGeo:QGeo", "Prov-Cod" = "groupGeo:province", "Dist."= "groupGeo:district"))
head(Prevencao_Triagem_ADU_results3)

#Write to disk
write.csv(Prevencao_Triagem_ADU_results3, file = "C:/Users/oop5/OneDrive - CDC/M&E Team/ODK/ODK-MISAU-master/Results/Prevencao_Triagem_ADU_results.csv")     
