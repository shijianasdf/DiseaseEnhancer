create table enhancermutation(
id varchar(32),
title varchar(128), 
length varchar(32), 
start varchar(32), 
end varchar(32), 
ty varchar(32), 
locus varchar(32), 
dataset varchar(32),
sample varchar(32)) charset=utf8 engine=myisam;
load data local infile "/pub5/ftp/public/LnChrom/DEC/mutationTable.txt" into table enhancermutation fields terminated by "\t";



create table maindiseaseenhancer(
id varchar(32),
enhchr varchar(32), 
enhstart varchar(32), 
enhend varchar(32), 
targetgene varchar(512), 
diseasetype varchar(512)) charset=utf8 engine=myisam;
load data local infile "/pub5/ftp/public/LnChrom/DEC/diseaseEnh5.txt" into table maindiseaseenhancer fields terminated by "\t";


create table subdiseaseenhancer(
id varchar(64),
vartype varchar(64), 
varname varchar(64), 
varchr varchar(64), 
varstart varchar(64), 
varend varchar(64),
targetgene varchar(1024),
muttype varchar(64),
varcons varchar(512),
pmid varchar(32)) charset=utf8 engine=myisam;
load data local infile "/pub5/ftp/public/LnChrom/DEC/enhInfoArr.txt.new1" into table subdiseaseenhancer fields terminated by "\t";


