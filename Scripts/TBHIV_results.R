#Reshape TBHIV data-set by PaundeJr

rm(list = ls())

library(readxl)
library(readr)
library(dplyr)



#Read files into R environment
SIS_Cod <- read_excel("~/Dashboard/SIS-Cod.xlsx")
C_T_results1 <- read_csv("~/Dashboard/excel/TBHIV_results.csv")
head(C_T_results1)

#Select columns needed
C_T_results2 <- select(C_T_results1, 'central_code',
                                      'groupNivelSupervisao:QSupLevel',
                                      'groupNivelSupervisao:supervisor',
                                      'groupGeo:province',
                                      'groupGeo:district',
                                      'groupGeo:QGeo',
                                      'QSupCode' ,
                                      'groupForm:groupGI:QGIPartner',
                                      'groupForm:groupDS1:domainScore1',
                                      'groupForm:group3:groupDS3:domainScore3',
                                      'groupForm:groupDS4:domainScore4',
                                      'groupForm:groupDS5:domainScore5',
                                      'groupForm:groupDS6:domainScore6')
head(C_T_results2)

#Rename columns
C_T_results3 <- C_T_results2 %>% rename("central_code"= "central_code" ,
                                        "qSupLevel"= "groupNivelSupervisao:QSupLevel" ,
                                        "supervisor"= "groupNivelSupervisao:supervisor",
                                        "provinceCode"= "groupGeo:province",	
                                        "district"= "groupGeo:district",
                                        "qGeo"= "groupGeo:QGeo",
                                        "qSupCode"="QSupCode",
                                        "qGIPartner"="groupForm:groupGI:QGIPartner",
                                        "Intro" = "groupForm:groupDS1:domainScore1",
                                        "Controle de Infeccoes Nosocomiais1" = "groupForm:group3:groupDS3:domainScore3",
                                        "Controle de Infeccoes Nosocomiais2" = "groupForm:groupDS4:domainScore4",
                                        "Medidas de Protecao Intra-hospitalares" = "groupForm:groupDS5:domainScore5",
                                        "Implementacao de abordagens de MQ no sector" = "groupForm:groupDS6:domainScore6")
head(C_T_results3)

# Joint data frames
C_T_results4 <- inner_join(SIS_Cod, C_T_results3, by=c("SIS-Cod"="qGeo", "Prov-Cod" = "provinceCode", "Dist."= "district"))
head(C_T_results4)

#Write to disk
write.csv(C_T_results4, file = "~/Dashboard/Results/TBHIV.csv")                       
  


