#Reshape Ped_SAAJ data-set by PaundeJr

rm(list = ls())

library(readxl)
library(readr)
library(dplyr)



#Read files into R environment
SIS_Cod <- read_excel("~/Dashboard/SIS-Cod.xlsx")
C_T_results1 <- read_csv("~/Dashboard/excel/Pediatria_SAAJ_results.csv")
head(C_T_results1)

#Select columns needed
C_T_results2 <- select(C_T_results1, 'central_code',
                                      'groupNivelSupervisao:QSupLevel',
                                      'groupNivelSupervisao:supervisor',
                                      'groupGeo:province',
                                      'groupGeo:district',
                                      'groupGeo:QGeo',
                                      'QSupCode',
                                      'groupForm:groupGI:QGIPartner',
                                      'groupForm:group1:groupDS1:domainScore1',
                                      'groupForm:group1:groupDS2:domainScore2',
                                      'groupForm:group1:groupDS3:domainScore3',
                                      'groupForm:group1:groupDS4:domainScore4',
                                      'groupForm:group1:groupDS5:domainScore5',
                                      'groupForm:group1:groupDS6:domainScore6',
                                      'groupForm:group1:groupDS7:domainScore7',
                                      'groupForm:group1:groupDS8:domainScore8',
                                      'groupForm:groupDS9:domainScore9',
                                      'groupForm:groupDS10:domainScore10',
                                      'groupForm:groupDS11:domainScore11',
                                      'groupForm:groupDS12:domainScore12',
                                      'groupForm:groupDS13:domainScore13',
                                      'groupForm:groupDS14:domainScore14',
                                      'groupForm:groupDS15:domainScore15')
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
                                        "Tipo de SAAJ" = "groupForm:group1:groupDS1:domainScore1",
                                        "Disponibiliddae de Material de apoio, instrumentos de registo e consumiveis (versao actualizada) para oferta de ATS" = "groupForm:group1:groupDS2:domainScore2",
                                        "Conhecimento do material de apoio para realizacao e registo do ATS" = "groupForm:group1:groupDS3:domainScore3",
                                        "Material de apoio para identificacao de populacao Chave" = "groupForm:group1:groupDS4:domainScore4",
                                        "Material de apoio, instrumentos de registo e consumi­veis pra implemnetacao da PrEP" = "groupForm:group1:groupDS5:domainScore5",
                                        "Oferta da Servicos da PrEP aos utentes elegiveis" = "groupForm:group1:groupDS6:domainScore6",
                                        "Rastreio, diagnotico das ITS e registo da informacao" = "groupForm:group1:groupDS7:domainScore7",
                                        "Organizacao ds servicos e do arquivo da PU do SAAJ" = "groupForm:group1:groupDS8:domainScore8",
                                        "Oferta do pacote de SSR e rastreio de HIV aos AJ" = "groupForm:groupDS9:domainScore9",
                                        "Seguimento clinico do AJVHIV em modelo de PU" = "groupForm:groupDS10:domainScore10",
                                        "Material de Apoio e Instrumentos de Registo para oferta do APSS e PP" = "groupForm:groupDS11:domainScore11",
                                        "Identificacao e Reintegracao de adolescentes e Jovens Faltosos e Abandonos" = "groupForm:groupDS12:domainScore12",
                                        "Actividades de apoio para adesao ao Tratamento" = "groupForm:groupDS13:domainScore13",
                                        "Monitoria e Avaliacao da abordagem de AJM na US e Comunidade" = "groupForm:groupDS14:domainScore14",
                                        "Monitoria e Avaliacao da abordagem de AJM na US e Comunidade2" =  "groupForm:groupDS15:domainScore15")
head(C_T_results3)

# Joint data frames
C_T_results4 <- inner_join(SIS_Cod, C_T_results3, by=c("SIS-Cod"="qGeo", "Prov-Cod" = "provinceCode", "Dist."= "district"))
head(C_T_results4)

#Write to disk
write.csv(C_T_results4, file = "~/Dashboard/Results/Pediatria_SAAJ.csv")                       
 
                       
                  
 