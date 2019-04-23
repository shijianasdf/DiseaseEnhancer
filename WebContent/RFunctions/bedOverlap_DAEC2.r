bed_overlap <- function(filepath,gene,disease){
	#用户上传文件路径
	#参数靶基因
	#参数变异
	#参数疾病
	
	#主表附表地址
	tablepath <-"D:/TomcatZip/apache-tomcat-7.0.70/webapps/DEC/RFunctions/diseaseEnh4BriefArr.txt"
	subtablepath <-"D:/TomcatZip/apache-tomcat-7.0.70/webapps/DEC/RFunctions/enhInfoArr.txt"
	
	#读入数据(三个表格)
	#主表 chr start end TargetGene VarSite DiseaseType ...   TargetGene可能是,分隔的字符串   DiseaseType可能是;分隔的疾病
	mainTable <- read.table(tablepath,sep="\t",header=T,stringsAsFactors=F)
	#附表
	subTable <- read.table(subtablepath,sep="\t",header=T,stringsAsFactors=F)
	         #flag <- (is.na(mainTable$chr) | is.na(mainTable$start) | is.na(mainTable$end))
	         #mainTable <- mainTable[!flag,]
	
	#附表 chr start end strand
	queryTable  <- read.table(filepath,sep="\t",header=T,stringsAsFactors=F)
	library(GenomicRanges)
	queryInput <- with(queryTable, GRanges(chr, IRanges(start,end))) #默认链信息为*
	#mainTable.Temp <- with(mainTable,GRanges(chr,IRanges(start,end)))
	mainTable.Temp <- with(mainTable,GRanges(chr,IRanges(start,end))) #默认链信息为*
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
	#与java接口 需要as.matrix并且转置
	#return(as.matrix(t(match_hit)))
	returnList[[1]] <- match_hit
	returnList[[2]] <- subTable
	return(returnList)
}