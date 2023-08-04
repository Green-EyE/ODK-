#Reshape PTV_CPN data-set by PaundeJr

rm(list = ls())

library(readxl)
library(readr)
library(dplyr)



#Read files into R environment
SIS_Cod <- read_excel("~/Dashboard/SIS-Cod.xlsx")
C_T_results1 <- read_csv("~/Dashboard/excel/PTV_CPN_results.csv")
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
                                      'groupForm:groupDS2:domainScore2',
                                      'groupForm:groupDS3:domainScore3',
                                      'groupForm:groupDS4:domainScore4',
                                      'groupForm:groupDS5:domainScore5',
                                      'groupForm:groupDS6:domainScore6',
                                      'groupForm:groupDS7:domainScore7',
                                      'groupForm:groupDS8:domainScore8',
                                      'groupForm:groupDS9:domainScore9',
                                      'groupForm:groupDS10:domainScore10',
                                      'groupForm:groupDS11:domainScore11',
                                      'groupForm:groupDS12:domainScore12',
                                      'groupForm:groupDS13:domainScore13',
                                      'groupForm:groupDS14:domainScore14',
                                      'groupForm:groupDS15:domainScore15',
                                      'groupForm:groupDS16:domainScore16')
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
                                        "Palestras" = "groupForm:groupDS2:domainScore2",
                                        "Aconselhamento e testagem em saude (ATS)1" = "groupForm:groupDS3:domainScore3",
                                        "Aconselhamento e testagem em saude (ATS)2" = "groupForm:groupDS4:domainScore4",
                                        "ITS" = "groupForm:groupDS5:domainScore5",
                                        "Populacao - chave" = "groupForm:groupDS6:domainScore6",
                                        "Profilaxia pre-exposicao (PrEP)" = "groupForm:groupDS7:domainScore7",
                                        "APSS e PP1" = "groupForm:groupDS8:domainScore8",
                                        "APSS e PP2" = "groupForm:groupDS9:domainScore9",
                                        "APSS e PP3" = "groupForm:groupDS10:domainScore10",
                                        "Disponibilidade de insumos e registos de laboratorio" = "groupForm:groupDS11:domainScore11",
                                        "Farmacia" = "groupForm:groupDS12:domainScore12",
                                        "Disponibilidade de guioes, materiais de apoio e POPs" = "groupForm:groupDS13:domainScore13",
                                        "Arquivo de fichas mestra" = "groupForm:groupDS14:domainScore14",
                                        "Implementacao da Paragem Unica da CPN" = "groupForm:groupDS15:domainScore15",
                                        "Implementacao de abordagens de MQ no sector" = "groupForm:groupDS16:domainScore16")
head(C_T_results3)

# Joint data frames
C_T_results4 <- inner_join(SIS_Cod, C_T_results3, by=c("SIS-Cod"="qGeo", "Prov-Cod" = "provinceCode", "Dist."= "district"))
head(C_T_results4)

#Write to disk
write.csv(C_T_results4, file = "~/Dashboard/Results/PTV_CPN.csv")                       
  


