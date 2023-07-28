#Reshape Pediatria_Avaliaçao_Cartao_Saúde___2_anos_results data-set by Green_Eye

rm(list = ls())

library(readxl)
library(readr)
library(dplyr)



#Read files into R environment
SIS_Cod <- read_excel("C:/Users/cnhantumbo/Documents/KoboToolbox/ODK/SIS-Cod.xlsx")
Pediatria_Avaliaçao_Cartao_Saúde___2_anos_results <- read_csv("C:/Users/cnhantumbo/Documents/KoboToolbox/ODK/Data/Pediatria_Avaliaçao_Cartao_Saúde___2_anos_results.csv")
head(Pediatria_Avaliaçao_Cartao_Saúde___2_anos_results)

#Select columns needed
Pediatria_Avaliaçao_Cartao_Saúde___2_anos_results1 <- select(Pediatria_Avaliaçao_Cartao_Saúde___2_anos_results, 'central_code',	'groupNivelSupervisao:QSupLevel',	'groupNivelSupervisao:supervisor',	'groupGeo:province',	
                          'groupGeo:district', 'groupGeo:QGeo',	'QSupCode' ,	'groupForm:groupGI:QGIPartner','groupForm:group_domain2:subgroupDomain2:domainScore2',
                          'groupForm:group_domain3:subgroupDomain3:domainScore3')
head(Pediatria_Avaliaçao_Cartao_Saúde___2_anos_results1)

#Rename columns
#APSSPP_results2 <- APSSPP_results1 %>% rename("central_code"= "central_code" ,	"qSupLevel"= "groupNivelSupervisao:QSupLevel" ,	"supervisor"= "groupNivelSupervisao:supervisor",	"provinceCode"= "groupGeo:province",	
#                                        "district"= "groupGeo:district", "qGeo"= "groupGeo:QGeo", "qSupCode"="QSupCode" ,	"qGIPartner"="groupForm:groupGI:QGIPartner","domainScore1"= "groupForm:groupDS1:domainScore1",
#                                        "domainScore2"="groupForm:groupDS2:domainScore2", "domainScore3"="groupForm:groupDS3:domainScoreG3", "domainScore4"="groupForm:groupDS4:domainScoreG4" ,"domainScore5"="groupForm:groupDS5:domainScoreG5",
#                                        "domainScore7"= "groupForm:groupDS7:domainScore7")
#head(APSSPP_results2)


#convert a data frame column to numeric type...
Pediatria_Avaliaçao_Cartao_Saúde___2_anos_results1$`groupGeo:province` = as.numeric(as.character(Pediatria_Avaliaçao_Cartao_Saúde___2_anos_results1$`groupGeo:province`))


# Joint data frames
Pediatria_Avaliaçao_Cartao_Saúde___2_anos_results2 <- inner_join(SIS_Cod, Pediatria_Avaliaçao_Cartao_Saúde___2_anos_results1, by=c("SIS-Cod"="groupGeo:QGeo", "Prov-Cod" = "groupGeo:province", "Dist."= "groupGeo:district"))
head(Pediatria_Avaliaçao_Cartao_Saúde___2_anos_results2)

#Write to disk
write.csv(Pediatria_Avaliaçao_Cartao_Saúde___2_anos_results2, file = "Results/Pediatria_Avaliaçao_Cartao_Saúde___2_anos_results.csv")                      





