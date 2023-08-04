#Reshape Prev_Enf_ADU data-set by PaundeJr

rm(list = ls())

library(readxl)
library(readr)
library(dplyr)



#Read files into R environment
SIS_Cod <- read_excel("~/Dashboard/SIS-Cod.xlsx")
C_T_results1 <- read_csv("~/Dashboard/excel/Prevencao_Enfermaria_Adulto_results.csv")
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
                                      'groupForm:groupDS2:domainScore2',
                                      'groupForm:groupDS4:domainScore4',
                                      'groupForm:groupDS5:domainScore5',
                                      'groupForm:groupDS6:domainScore6',
                                      'groupForm:groupDS7:domainScore7')
head(C_T_results2)

#Rename columns
C_T_results3 <- C_T_results2 %>% rename("central_code"= "central_code" ,
                                        "qSupLevel"= "groupNivelSupervisao:QSupLevel" ,
                                        "supervisor"= "groupNivelSupervisao:supervisor",
                                        "provinceCode"= "groupGeo:province",	
                                        "district"= "groupGeo:district",
                                        "qGeo"= "groupGeo:QGeo",
                                        "qSupCode"="QSupCode" ,
                                        "qGIPartner"="groupForm:groupGI:QGIPartner",
                                        "Oferta de servicos" = "groupForm:groupDS1:domainScore1",
                                        "Material de apoio, instrumentos de registo e consumi­veis" = "groupForm:groupDS2:domainScore2",
                                        "Conhecimento do material de apoio" = "groupForm:groupDS4:domainScore4",
                                        "Registo de informacao" = "groupForm:groupDS5:domainScore5",
                                        "Preenchimento mapa de consumo de testes" = "groupForm:groupDS6:domainScore6",
                                        "Ligacao aos servicos de cuidados e tratamento" = "groupForm:groupDS7:domainScore7")
head(C_T_results3)

# Joint data frames
C_T_results4 <- inner_join(SIS_Cod, C_T_results3, by=c("SIS-Cod"="qGeo", "Prov-Cod" = "provinceCode", "Dist."= "district"))
head(C_T_results4)

#Write to disk
write.csv(C_T_results4, file = "~/Dashboard/Results/Prevencao_Enfermaria_Adulto.csv")                       
  


  