#Reshape ped_ccs data-set by PaundeJr

rm(list = ls())

library(readxl)
library(readr)
library(dplyr)



#Read files into R environment
SIS_Cod <- read_excel("~/Dashboard/SIS-Cod.xlsx")
C_T_results1 <- read_csv("~/Dashboard/excel/Pediatria_Consulta_da_Crianca_Sadia_results.csv")
head(C_T_results1)

#Select columns needed
C_T_results2 <- select(C_T_results1, 'central_code',	'groupNivelSupervisao:QSupLevel',	'groupNivelSupervisao:supervisor',	'groupGeo:province',	
                       'groupGeo:district', 'groupGeo:QGeo',	'QSupCode' ,	'groupForm:groupGI:QGIPartner','groupForm:groupDS1:domainScore1',
                       'groupForm:groupDS2:domainScore2','groupForm:groupDS3:domainScore3','groupForm:groupDS5:domainScore5')
head(C_T_results2)

#Rename columns
C_T_results3 <- C_T_results2 %>% rename("central_code"= "central_code" ,	"qSupLevel"= "groupNivelSupervisao:QSupLevel" ,	"supervisor"= "groupNivelSupervisao:supervisor",	"provinceCode"= "groupGeo:province",	
                       "district"= "groupGeo:district", "qGeo"= "groupGeo:QGeo", "qSupCode"="QSupCode" ,	"qGIPartner"="groupForm:groupGI:QGIPartner","Oferta do ATS no sector"= "groupForm:groupDS1:domainScore1",
                       "Registo do resultado da testagem e ligacao aos CT"="groupForm:groupDS2:domainScore2", "Organizacao dos servicos de CCS"="groupForm:groupDS3:domainScore3",
                        "Avaliacao do preenchimento do Livro de registo de CCS"="groupForm:groupDS5:domainScore5" )
head(C_T_results3)

# Joint data frames
C_T_results4 <- inner_join(SIS_Cod, C_T_results3, by=c("SIS-Cod"="qGeo", "Prov-Cod" = "provinceCode", "Dist."= "district"))
head(C_T_results4)

#Write to disk
write.csv(C_T_results4, file = "~/Dashboard/Results/Pediatria_CCS.csv")                       
                       
                        

                       
                  
 