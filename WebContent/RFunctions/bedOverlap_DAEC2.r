bed_overlap <- function(filepath,gene,disease){
	#�û��ϴ��ļ�·��
	#�����л���
	#��������
	#��������
	
	#�������ַ
	tablepath <-"D:/TomcatZip/apache-tomcat-7.0.70/webapps/DEC/RFunctions/diseaseEnh4BriefArr.txt"
	subtablepath <-"D:/TomcatZip/apache-tomcat-7.0.70/webapps/DEC/RFunctions/enhInfoArr.txt"
	
	#��������(�������)
	#���� chr start end TargetGene VarSite DiseaseType ...   TargetGene������,�ָ����ַ���   DiseaseType������;�ָ��ļ���
	mainTable <- read.table(tablepath,sep="\t",header=T,stringsAsFactors=F)
	#����
	subTable <- read.table(subtablepath,sep="\t",header=T,stringsAsFactors=F)
	         #flag <- (is.na(mainTable$chr) | is.na(mainTable$start) | is.na(mainTable$end))
	         #mainTable <- mainTable[!flag,]
	
	#���� chr start end strand
	queryTable  <- read.table(filepath,sep="\t",header=T,stringsAsFactors=F)
	library(GenomicRanges)
	queryInput <- with(queryTable, GRanges(chr, IRanges(start,end))) #Ĭ������ϢΪ*
	#mainTable.Temp <- with(mainTable,GRanges(chr,IRanges(start,end)))
	mainTable.Temp <- with(mainTable,GRanges(chr,IRanges(start,end))) #Ĭ������ϢΪ*
	overlaps <- findOverlaps(queryInput, mainTable.Temp)
	#match_hit <- mainTable[names(mainTable.Temp)[subjectHits(overlaps)], c(1, 21, 2, 29:31, 10, 25)]
	match_hit <- mainTable[subjectHits(overlaps),]
	match_hit <- unique(match_hit)
	diseases <- unlist(strsplit(disease,","))
	if(gene!="NULL"&disease!="NULL"){
	    match_hit <- match_hit[match_hit$DiseaseType %in% diseases,] 
		match_hit <- match_hit[grep(gene,match_hit$TargetGene),] 
	}
	if(gene!="NULL"&disease=="NULL"){
		match_hit <- match_hit[grep(gene,match_hit$TargetGene),]
	}
	if(gene=="NULL"&disease!="NULL"){
	    match_hit <- match_hit[match_hit$DiseaseType %in% diseases,]
	}
	if(gene=="NULL"&disease=="NULL"){
		match_hit <- match_hit
	}
	returnList <- list()
	subTable <- subTable[subTable$id %in% match_hit$id,]
	#��java�ӿ� ��Ҫas.matrix����ת��
	#return(as.matrix(t(match_hit)))
	returnList[[1]] <- match_hit
	returnList[[2]] <- subTable
	return(returnList)
}