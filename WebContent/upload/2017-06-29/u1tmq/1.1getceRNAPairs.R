###################################################################################################
#函数说明
#函数名   potential.ceRNA.F   
#功能    使用超几何检验的方法从miRNA靶向关系中预测潜在的ceRNA关系对

#参数    
       #targetPairs1,targetPairs2 类型：数据框；表示两组miRNA的靶向关系，第一列是miRNA，第二列是miRNA的靶标
       #betweenORself  "between" 或者"self" 表ceRNA关系是在两种分子之间找还是在同种分子之间寻找。
                        #当targetPairs1或者targetPairs2为空时，betweenORself必须设置为self
       #mincommeMIR      ceRNA对共享的miRNA的最小个数
       #threshold.Pvalue=0.05  ceRNA对共享miRNA的显著性P值（超几何检验）
       #threshold.FDR=0.05    FDR阈值

#输出结果
#     返回一个list  ，包含预测ceRNA对（8列的数据框，前两列是ceRNA关系）和 ceRNA共享的miRNAs（一个list，顺序和ceRNA对的数目对应，并以ceRNA的 ID号命名）
###############################################################################



potential.ceRNA.F <- function(targetPairs1 =NULL,targetPairs2 =NULL,betweenORself=c("between","self"),mincommeMIR=3,threshold.Pvalue=0.05,threshold.FDR=0.05){
  #规范miRNA靶向关系的数据格式
  if(!is.null(targetPairs1)){
    targetPairs1[,1] <- as.character(targetPairs1[,1])
    targetPairs1[,2] <- as.character(targetPairs1[,2])
    colnames(targetPairs1) <- c("miRNA","ceRNA")
    targetPairs1 <- unique.data.frame(targetPairs1[,1:2])
  }
  if(!is.null(targetPairs2)){
    targetPairs2[,1] <- as.character(targetPairs2[,1])
    targetPairs2[,2] <- as.character(targetPairs2[,2])
    colnames(targetPairs2) <- c("miRNA","ceRNA")
    targetPairs2 <- unique.data.frame(targetPairs2[,1:2])
  }
  #导入reshape2,进行矩阵操作 （acast、melt两个函数的使用 ）
  library("reshape2")
  if(all(c(is.null(targetPairs1),is.null(targetPairs2)))){
    stop("targetPairs1 and targetPairs1 should be set!!")
  }
  if(any(c(is.null(targetPairs1),is.null(targetPairs2))) || betweenORself=="self"){
    #同类型分子之间的ceRNA关系的寻找
    #合并调控关系，构建miRNA-target的靶向关系矩阵
    
    targetPairs <- rbind(targetPairs1,targetPairs2)
    targetPairs <- cbind(targetPairs,value=1)
    ceRNA.target.Matrix <- acast(targetPairs,formula = ceRNA~miRNA,value.var = "value",fill = 0)
    
    #提取唯一的ceRNA分子，和miRNA
    ceRNA <- rownames(ceRNA.target.Matrix)
    miRNA <- colnames(ceRNA.target.Matrix)
    #计算中的miRNA数目，用于超几何检验
    N <- length(miRNA) 
    #计算每个靶分子的互作miRNA数，用于超几何检验
    tar.mi <- rowSums(ceRNA.target.Matrix)
    
    #矩阵运算，计算两两靶分子的共享miRNA的数目，得到ceRNA矩阵
    ceRNA.pairs.Matrix <- ceRNA.target.Matrix%*%t(ceRNA.target.Matrix)
    message("matrix operations finished!!!!!")
    
    #溶解矩阵，提取具有共享miRNA的潜在ceRNA关系对
    ceRNA.pairs.Matrix[!lower.tri(ceRNA.pairs.Matrix)] <- NA
    ceRNA.pairs.Matrix[which(ceRNA.pairs.Matrix <= mincommeMIR)] <- NA
    comm.num <- melt(ceRNA.pairs.Matrix,na.rm=T,factorsAsStrings = F)
    comm.num[,1] <- as.character(comm.num[,1])
    comm.num[,2] <- as.character(comm.num[,2])
    
    res=cbind(comm.num,tar.mi[comm.num[,1]],tar.mi[comm.num[,2]])
    #超几何检验计算潜在ceRNA的显著性P值
    p <- phyper(res[,3]-1,res[,4],N-res[,4],res[,5],lower.tail = F)
    res <- cbind(res,p)
    #FDR 校正
    FDR <- p.adjust(p = res[,6],n = nrow(res))
    res <- cbind(res,FDR)
    
    #结果筛选与整理
    colnames(res) <- c("ceRNA1","ceRNA2","num.commeMir","num.ceRNA1.tar","num.ceRNA2.tar","P.value","FDR")
    ind1 <- which(res$num.commeMir >= mincommeMIR)
    ind2 <- which(res$P.value <= threshold.Pvalue)
    ind3 <- which(res$FDR <= threshold.FDR)
    ind <- intersect(ind1,intersect(ind2,ind3))
    res <- res[ind,]
    #设置ceRNA ID ，用于识别唯一的ceRNA关系
    ID <- paste(res[,1],res[,2],sep="+")
    res <- cbind(res,ID=ID)
    res$ID <- as.character(res$ID)
    #提取每对ceRNA关系共享的miRNAs列表
    ceRNApairs <- as.matrix(res[,1:2])
    comme.miRNA.list <- apply(ceRNApairs,1,FUN=function(x) miRNA[which(ceRNA.target.Matrix[x[1],]*ceRNA.target.Matrix[x[2],] !=0)] )
    names(comme.miRNA.list) <- ID
    
    
  }
  else if(all(c(!is.null(targetPairs1),!is.null(targetPairs2))) & betweenORself == "between"){
     #两种类型分子之间的ceRNA关系的寻找  
    
     #构造两组miRNA-target 靶向关系矩阵
    targetPairs1 <- cbind(targetPairs1,value=1)
    targetPairs2 <- cbind(targetPairs2,value=1)
    
    ceRNA1.target.Matrix <- acast(targetPairs1,formula = ceRNA~miRNA,value.var = "value",fill = 0)
    
    ceRNA2.target.Matrix <- acast(targetPairs2,formula = ceRNA~miRNA,value.var = "value",fill = 0)
    
    ceRNA1 <- rownames(ceRNA1.target.Matrix)
    
    ceRNA2 <- rownames(ceRNA2.target.Matrix)
    
    #计算每一个靶分子互作的miRNA数目
    tar.mi1 <- rowSums(ceRNA1.target.Matrix)
    tar.mi2 <- rowSums(ceRNA2.target.Matrix)
    #提取所有的miRNA
    miRNA <- unique(c(colnames(ceRNA1.target.Matrix),colnames(ceRNA2.target.Matrix)))
    N <- length(miRNA)
    #提取两组靶向关系中共有的miRNA，用于矩阵的统一（矩阵运算时，两个矩阵的列数要相同）
    comme.miRNAs <- intersect(colnames(ceRNA1.target.Matrix),colnames(ceRNA2.target.Matrix))
    ceRNA1.target.Matrix <- ceRNA1.target.Matrix[,comme.miRNAs]
    ceRNA2.target.Matrix <- ceRNA2.target.Matrix[,comme.miRNAs]
    
    #矩阵预算，获得ceRNA矩阵
    ceRNA.pairs.Matrix <- ceRNA1.target.Matrix %*% t(ceRNA2.target.Matrix)
    message("matrix operations finished!!!!!")
    
    #提取共享miRNA的靶关系对作为潜在的ceRNA对
    ceRNA.pairs.Matrix[which(ceRNA.pairs.Matrix < mincommeMIR)] <- NA
    comm.num <- melt(ceRNA.pairs.Matrix,na.rm=T,factorsAsStrings = F)
    comm.num[,1] <- as.character(comm.num[,1])
    comm.num[,2] <- as.character(comm.num[,2])
    res=cbind(comm.num,tar.mi1[comm.num[,1]],tar.mi2[comm.num[,2]])
    #超几何检验计算P值
    p <- phyper(res[,3]-1,res[,4],N-res[,4],res[,5],lower.tail = F)
    res <- cbind(res,p)
    FDR <- p.adjust(p = res[,6],n = nrow(res))
    res <- cbind(res,FDR)
    
    #筛选结果
    colnames(res) <- c("ceRNA1","ceRNA2","num.commeMir","num.ceRNA1.tar","num.ceRNA2.tar","P.value","FDR")
    ind1 <- which(res$num.commeMir >= mincommeMIR)
    ind2 <- which(res$P.value <= threshold.Pvalue)
    ind3 <- which(res$FDR <= threshold.FDR)
    ind <- intersect(ind1,intersect(ind2,ind3))
    res <- res[ind,]
    
    #设置ceRNA ID号
    ID <- paste(res[,1],res[,2],sep="+")
    res <- cbind(res,ID=ID)
    res$ID <- as.character(res$ID)
    #提取ceRNA对共享的miRNA
    ceRNApairs <- as.matrix(res[,1:2])
    
    comme.miRNA.list <- apply(ceRNApairs,1,FUN=function(x) comme.miRNAs[which(ceRNA1.target.Matrix[x[1],]*ceRNA2.target.Matrix[x[2],] !=0)] )
    names(comme.miRNA.list) <- ID
    
  }
  
  return(list(ceRNA.pairs=res,comme.miRNAs = comme.miRNA.list))
}

time0=Sys.time()
test <- potential.ceRNA.F(targetPairs1=mir_gene[,1:2],targetPairs2=lnc_miRNA[,1:2],mincommeMIR=4,betweenORself="between",threshold.FDR=0.5)
time1=Sys.time()
time0
time1


time0=Sys.time()
test <- potential.ceRNA.F(targetPairs1=miRNA_mRNA.2,targetPairs2=circ_miRNA[,1:2],mincommeMIR=1,betweenORself="between",threshold.FDR=0.5)
time1=Sys.time()
time0
time1


