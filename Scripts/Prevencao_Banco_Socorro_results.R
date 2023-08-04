#Reshape Prev_BS data-set by PaundeJr

rm(list = ls())

library(readxl)
library(readr)
library(dplyr)



#Read files into R environment
SIS_Cod <- read_excel("~/Dashboard/SIS-Cod.xlsx")
C_T_results1 <- read_csv("~/Dashboard/excel/Prevencao_Banco_Socorro_results.csv")
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
                                      'groupForm:group0:groupDS1:domainScore1',
                                      'groupForm:group0:groupDS2:domainScore2',
                                      'groupForm:group0:groupDS3:domainScore3',
                                      'groupForm:group0:groupDS4:domainScore4',
                                      'groupForm:group0:groupDS5:domainScore5',
                                      'groupForm:group0:groupDS6:domainScore6',
                                      'groupForm:group0:groupDS7:domainScore7',
                                      'groupForm:group0:groupDS8:domainScore8',
                                      'groupForm:group0:groupDS9:domainScore9',
                                      'groupForm:group0:groupDS10:domainScore10',
                                      'groupForm:group0:groupDS11:domainScore11',
                                      'groupForm:group0:groupDS12:domainScore12',
                                      'groupForm:group0:groupDS13:domainScore13',
                                      'groupForm:group0:groupDS14:domainScore14',
                                      'groupForm:group0:groupDS15:domainScore15',
                                      'groupForm:group0:groupDS16:domainScore16')
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
                                        "Oferta de Servicos" = "groupForm:group0:groupDS1:domainScore1",
                                        "Material de apoio, instrumentos de registo e consumi­veis1" = "groupForm:group0:groupDS2:domainScore2",
                                        "Conhecimento do material de apoio1" = "groupForm:group0:groupDS3:domainScore3",
                                        "Registo de informacao1" = "groupForm:group0:groupDS4:domainScore4",
                                        "Ligacao aos servicos de cuidados e tratamento" = "groupForm:group0:groupDS5:domainScore5",
                                        "Material de apoio" = "groupForm:group0:groupDS6:domainScore6",
                                        "Conhecimento dos materiais de apoio2" = "groupForm:group0:groupDS7:domainScore7",
                                        "Consumi­veis" = "groupForm:group0:groupDS8:domainScore8",
                                        "Material de apoio, instrumentos de registo e consumi­veis2" = "groupForm:group0:groupDS9:domainScore9", 
                                        "Conhecimento dos materiais de apoio3" = "groupForm:group0:groupDS10:domainScore10",
                                        "Material de apoio, instrumentos de registo" = "groupForm:group0:groupDS11:domainScore11",
                                        "Conhecimento do material de apoio4" = "groupForm:group0:groupDS12:domainScore12",
                                        "Oferta de servicos" = "groupForm:group0:groupDS13:domainScore13",
                                        "Material de apoio e instrumentos de registo" = "groupForm:group0:groupDS14:domainScore14",
                                        "Conhecimento do material de apoio5" = "groupForm:group0:groupDS15:domainScore15",
                                        "Registo de informacao2" = "groupForm:group0:groupDS16:domainScore16")
head(C_T_results3)

# Joint data frames
C_T_results4 <- inner_join(SIS_Cod, C_T_results3, by=c("SIS-Cod"="qGeo", "Prov-Cod" = "provinceCode", "Dist."= "district"))
head(C_T_results4)

#Write to disk
write.csv(C_T_results4, file = "~/Dashboard/Results/Prevencao_Banco_Socorro.csv")                       
                       
                  
 