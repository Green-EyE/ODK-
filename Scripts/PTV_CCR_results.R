#Reshape PTV_CCR data-set by PaundeJr

rm(list = ls())

library(readxl)
library(readr)
library(dplyr)



#Read files into R environment
SIS_Cod <- read_excel("~/Dashboard/SIS-Cod.xlsx")
C_T_results1 <- read_csv("~/Dashboard/excel/PTV_CCR_results.csv")
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
                                      'groupForm:groupDS14:domainScore14')
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
                                        "Diagnostico do HIV na crianca" = "groupForm:groupDS1:domainScore1",
                                        "ATS, insumos e materias de registo" = "groupForm:groupDS2:domainScore2",
                                        "Profilaxia pre-exposicao (PrEP)" = "groupForm:groupDS3:domainScore3",
                                        "ITS" = "groupForm:groupDS4:domainScore4",
                                        "APSS e PP1" = "groupForm:groupDS5:domainScore5",
                                        "APSS e PP2" = "groupForm:groupDS6:domainScore6",
                                        "APSS e PP3" = "groupForm:groupDS7:domainScore7",
                                        "Disponibilidade de insumos e registos de laboratorio" = "groupForm:groupDS8:domainScore8",
                                        "Farmacia" = "groupForm:groupDS9:domainScore9",
                                        "Disponibilidade de guioes e avaliacao de conhecimento e interpretacao de fluxogramas e POPs" = "groupForm:groupDS10:domainScore10",
                                        "MDS para lactante" = "groupForm:groupDS11:domainScore11",
                                        "Arquivo" = "groupForm:groupDS12:domainScore12",
                                        "Implementacao da Paragem Unica" = "groupForm:groupDS13:domainScore13",
                                        "Implementacao de abordagens de MQ no sector" = "groupForm:groupDS14:domainScore14")
head(C_T_results3)

# Joint data frames
C_T_results4 <- inner_join(SIS_Cod, C_T_results3, by=c("SIS-Cod"="qGeo", "Prov-Cod" = "provinceCode", "Dist."= "district"))
head(C_T_results4)

#Write to disk
write.csv(C_T_results4, file = "~/Dashboard/Results/PTV_CCR.csv")                       
  

