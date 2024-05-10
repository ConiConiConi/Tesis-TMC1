# Tesis-TMC1
Script utilizados para la obtención de los resultados

1-Número-Cabezas-POPC-5A-Residuos -> Contiene 3 archivos 

1.1- Se calcula el número de POPC a 5A de los residuos mediante el script 

    En el terminal -> $ vmd -e 01-Head-5A-Resi-Rel.tcl 

Entrega como resultado dos archivos de texto 01-Lista-POPC-Frame-ChainX.tx -> Que contiene le información del número de POPC

01-Informacion-POPC-Frame-ChainX.txt -> Indica cuantos POPC se encuentran a 5A de los residos por cada frame y cuales son 

1.2- Se calcula la frecuencia de los residuos que interactuan con los POPC

      En el terminal -> $ vmd -e 02-Count-HEAD-POPC.tcl  

Entrega como resultado un archivo de texto 02-Frecuencia-POPC-Frame-CadenaX.txt -> Cuenta el número de residos por cada frame que se encuentra a 5A de las cabezas de POPC

1.3- Un tercer script corresponde al estudio de los POPC en particular, en donde, se selecciona una cabeza de POPC y se cuenta cuantos y cuales son los residuos que se encuentran a 5A. 

      En el terminal -> $ vmd -e 03-Residue-5A-POPC.tcl

Entrega como resultado un archivo de texto 03-Frecuencia-POPC-X-ChainX.txt -> Cuenta el número de residos por cada frame que se encuentra a 5A de una cabeza de POPC en particular

