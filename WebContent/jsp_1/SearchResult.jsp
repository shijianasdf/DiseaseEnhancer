<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
	  <meta charset="utf-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <title>DiseaseEnhancer</title>
	  <!-- Tell the browser to be responsive to screen width -->
	  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- 	  <link rel="shortcut icon" href="images/favicon.ico"> -->
	  <!-- Bootstrap 3.3.7 -->
	  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	  <!-- Font Awesome -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	  <!-- Ionicons -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	  <!-- DataTables -->
	  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
      <link rel="stylesheet" href="plugins/datatables/extensions/TableTools/css/dataTables.tableTools.css">
	  <!-- jquery-ui -->
	  <link rel="stylesheet" href="css/jquery-ui-1.10.0.custom.css">
	  <!-- Theme style -->
	  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
	  <!-- AdminLTE Skins. Choose a skin from the css/skins
	       folder instead of downloading all of them to reduce the load. -->
	  <link rel="stylesheet" href="dist/css/skins/skin-blue-light.css">
	</head>
	<body class="hold-transition skin-blue-light sidebar-mini">
		<div class="wrapper">
			<header class="main-header">
			  <!-- Logo -->
				<a href="/DiseaseEnhancer" class="logo">
					 <!-- mini logo for sidebar mini 50x50 pixels -->
					<span class="logo-mini"><b>DEC</b></span>
					<!-- logo for regular state and mobile devices -->
					<span class="logo-lg"><b>DiseaseEnhancer</b></span>
				</a> 
				<!-- Header Navbar: style can be found in header.less -->
				<nav class="navbar navbar-static-top">
					  <!-- Sidebar toggle button-->
					<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
						<span class="sr-only">Toggle navigation</span>
					</a>
					<!-- Navbar Right Menu -->
				    <div class="navbar-custom-menu">
				    </div>
				 </nav>
			</header>
		    <!-- Left side column. contains the logo and sidebar -->
			<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
			<!-- sidebar menu: : style can be found in sidebar.less -->
			<ul class="sidebar-menu">
			  <li class="header">Disease Enhancer Catalog</li>
			  
			  
			  <li class="treeview">
			    <a href="/DiseaseEnhancer">
			      <i class="fa fa-home"></i><span>Home</span>
			   
			  </a>
			  
			</li>
			
			
			<li class="treeview">
			  <a href="JumpToAdvancedSearch">
			    <i class="fa fa-search"></i><span>Advanced Search</span>
			   
			  </a>
			  
			</li>
			<li class="treeview">
			   <a href="browseByPage?disease=all&queryPage=1">
			    <i class="fa fa-film"></i><span>Browse</span>
			   
			  </a>
			  
			</li>
			<li class="treeview">
			  <a href="JumpToHelp">
			    <i class="fa fa-book"></i> <span>Help</span>
			   
			  </a>
			  
			</li>
			<li class="treeview">
			  <a href="JumpToDownload">
			    <i class='fa fa-download '></i><span>Download</span>
			  </a>
			  
			</li>
			<li class="treeview">
			   <a href="JumpToSubmit">
			    <i class="fa fa-upload"></i><span>Submit</span>
			   
			  </a>
			  
			</li>
			 <li class="treeview">
				<a href="JumpToContact"><i class="fa fa-envelope"></i><span>Contact Us</span></a>
			  </li>
			  <li class="treeview">
			<a href="#">
			<!-- å¾æ  --> 
			<i class="fa fa-dashboard"></i>
			<span>External links</span>
			<!-- ä¸ä¸ª buttonï¼å±å¼åæ¶èµ·å¤çº§èåç¨ --> 
			<span class="pull-right-container">
			<i class="fa fa-angle-left pull-right"></i>
			</span>
			</a>
			<!-- å¤çº§èåçç¬¬äºçº§ --> 
			<ul class="treeview-menu">
				<li><a href="http://www.regulomedb.org/" target="_blank"><i class="fa fa-angle-right"></i>regulomedb</a></li>
				<li><a href="http://archive.broadinstitute.org/mammals/haploreg/haploreg.php" target="_blank"><i class="fa fa-angle-right"></i>haploreg</a></li>
				<li><a href="http://jjwanglab.org/gwas3d" target="_blank"><i class="fa fa-angle-right"></i>gwas3d</a></li>
				<li><a href="https://dcc.icgc.org/" target="_blank"><i class="fa fa-angle-right"></i>ICGC</a></li>
				<!-- <li><a href="http://mlg.hit.edu.cn/lncrna2target/" target="_blank"><i class="fa fa-circle-o"></i>LncRNA2Target</a></li> -->
				</ul>
			</li>
			  
			   
			   
			
			  
			 </ul>
			</section>
			<!-- /.sidebar -->
			</aside>
		  <!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
			  <!-- Content Header (Page header) -->
			  <section class="content-header">
			  </section>
			  <!-- Main content -->
			  <section class="content">    
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header with-border">
								<i class="fa fa-search"></i>
								<h3 class="box-title">Search</h3>
							</div>
						<div class="box-body">
							<form id="quick_search" method="post" action="Quick">
								<div class="input-group input-group-lg">
									<input id="autoComplete" type="text" class="form-control" autocomplete="off" name="query" placeholder="you are interested in <s:property value="query"/>" data-toggle="tooltip" data-placement="bottom" title="You can search for gene or disease or regions of interest"/>
									<span class="input-group-btn">
										<button class="btn btn-info btn-flat" type="submit">Search<i class="fa fa-search"></i></button>
									</span>
								</div>
								<div class="form-group">
									<div style="font-size:16px; margin-top:10px;">
										<b>Examples:</b>
										<a href="Quick?query=chr8:126998202-128990000">chr8:126998202-128990000</a>&nbsp;OR&nbsp;<a href="Quick?query=chr8">chr8</a>
										<span style="margin-left:26px;font-size:16px"><a href="Quick?query=CARLo-5">CARLo-5</a>&nbsp;OR&nbsp;<a href="Quick?query=MYC">MYC</a></span>
										<span style="margin-left:26px;font-size:16px"><a href="Quick?query=prostate cancer">Prostate cancer</a>&nbsp;OR&nbsp;<a href="Quick?query=breast cancer">Breast cancer</a></span>
									</div>	
								</div>
							</form>
						</div>
						</div>
					</div>
				</div>
			
			      <!-- Main row -->
			    <div class="row">
			    	 <div class="col-md-12">
			    	 	 <div id="loading" class="box box-primary" style="display:none;">
			    	 	 	<div class="box-header">
			             		<i class="fa fa-table"></i>
			            		<h3 class="box-title">Table Results</h3>
			          	  </div>
				          	<div class="box-body">
				          		<div >
				          			<img src="images/loading.gif"/>
				          		</div>
				          	</div>
			    	 	 </div>
			    	 </div>
			    </div>
			    <div class="row">
			      
			      <div id="firstTable" class="col-md-12">
			      	<div class="box box-primary">
			          <div class="box-header">
			            <i class="fa fa-table"></i>
			            <h3 class="box-title">Table Results</h3>
			          </div>
			          <!-- /.box-header -->
			          <div class="box-body">
			             <table id="example2" class="table table-bordered table-hover">
			              <thead>
			              <tr>
			                <th>ID</th>
			                <!--  <th>species</th> -->
			                <th>chr</th>
			                <th>start</th>
			                <th>end</th>
			                <th>Disease</th>
			                <th>Target Gene</th>
			                <th>More details</th>
			               
			               
			              </tr>
			              </thead>
			              <tbody>
			                
			                <s:iterator value="DE" id="id" status="st">
			                  <tr>
			                	  <td><s:property value="#id.getId()"/></td>
			                	  <!--<td><s:property value="#id.getSpecies()"/></td>   -->
			                	  <td><s:property value="#id.getEnhchr()"/></td>
			                	  <td><s:property value="#id.getEnhstart()"/></td>
			                	  <td><s:property value="#id.getEnhend()"/></td>
			                	  <td><s:property value="#id.getDiseasetype()"/></td>
			                	  <td><s:property value="#id.getTargetgene()"/></td>
			                	  <td><a style="cursor:pointer;">More details</a></td>
			                	  </tr>
			                </s:iterator>
			                
			              </tbody>
			              
			            </table> 
			          </div>
			          <!-- /.box-body -->
			        </div>
			      </div>
			    
			    </div>
			    <!-- /.row -->
			    <div id="Snv-box" class="row">
			    	<div class="col-md-12">
			    		<div id="Detailed" class="box box-primary" style="display:none;">
							<div class="box-header">
								<i class="fa fa-table"></i>
								<h3 class="box-title">Detailed Information</h3>
							</div>
							<div class="box-body">
			                    <div id="detailInformation" >
									 <table  class="table table-bordered table-hover">
	              						<thead>
								 		    <tr >
								 		    	<th>ID</th> <th>Variant Type</th> <th>Variant Name</th>  <th>Variant Location</th> <th>Target Gene</th> <th>Variant Mode</th> <th>Variant Consequence</th>  <th>PMID</th>                           
		                					</tr>
	              						</thead>
	              						<tbody>
	              						</tbody>
			              			 </table>
								</div>
							</div>
								
						</div>
			    	</div>
			    	<div class="col-md-12">
						<!-- 突变图 -->
						<div id="SNV" class="box box-primary" style="display:none;">
							<div class="box-header">
								<i class='fa fa-eye '></i>
								<h3 class="box-title">Single nucleotide variants around enhancers based on ICGC datasets</h3>
							</div>
								<div class="box-body"><div id="snvPlotContainer" ></div>
							</div>
						
						</div>
					</div>
			      </div>
			      
		      </section>
		      
		   <!-- /.content -->
		   </div>
		   <!-- /.content-wrapper -->
		
			<footer class="main-footer">
				<div class="pull-right hidden-xs"><b>Version</b>1.0.1</div>
				<!-- Copyright -->
				<strong>Copyright &copy; 2017 College of Bioinformatics Science and Technology, Harbin Medical University</strong> All rights reserved.
			</footer>
		</div>
		<!-- ./wrapper -->
		
		<!-- jQuery 2.2.3 -->
		<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
		<!-- jquery UI -->
		<script src="plugins/jQueryUI/jquery-ui.min.js"></script>
		<!-- Bootstrap 3.3.7 -->
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<!-- AdminLTE App -->
		<script src="dist/js/app.min.js"></script>
		<!-- DataTables -->
		<script src="plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script type="text/javascript" src="plugins/datatables/extensions/AutoFill/js/dataTables.autoFill.min.js"></script>
		<script src="plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="dist/js/demo.js"></script>
		<!-- gd3 library for mutation data -->
		<script src="plugins/gd3/bower_components/d3/d3.js"></script>
		<script src="plugins/gd3/gd3.js"></script>
		<!-- 封装 SNV plot -->
		<script src="plugins/A_exPackages/snvPlot.js"></script>
		<script>
		  $(document).ready(function(){
			//自动填充
				var xmlGeneInfo = ""; 
				var xmlCancerInfo = "";
				$.ajax({
			        url: "xml/geneSymbol.xml",
			        dataType: 'xml',
			        timeout: 2000,
			        async:false,
			        error: function()
			        {
			        	//alert() æ¹æ³ç¨äºæ¾ç¤ºå¸¦æä¸æ¡æå®æ¶æ¯åä¸ä¸ª OK æé®çè­¦åæ¡
			            alert("error load xml");
			        },
			        success: function(xml){
			        	//å¨xml/geneSymbol.xmlææ¡£ä¸­å¯»æ¾<geneSymbol> </geneSymbol>ä¸­ææ¬åå®¹ï¼ 
			        	xmlGeneInfo = $(xml).find("geneSymbol").text();
			        }
			    });
				$.ajax({
			        url: "xml/cancer.xml",
			        dataType: 'xml',
			        timeout: 2000,
			        async:false,
			        error: function()
			        {
			        	//alert() æ¹æ³ç¨äºæ¾ç¤ºå¸¦æä¸æ¡æå®æ¶æ¯åä¸ä¸ª OK æé®çè­¦åæ¡
			            alert("error load xml");
			        },
			        success: function(xml){
			        	//å¨xml/geneSymbol.xmlææ¡£ä¸­å¯»æ¾<geneSymbol> </geneSymbol>ä¸­ææ¬åå®¹ï¼ 
			        	xmlCancerInfo = $(xml).find("cancer").text();
			        }
			    });
				var resultArr1 = xmlGeneInfo.split(","); 
				var resultArr2 = xmlCancerInfo.split(",");
				var resultArr = resultArr1.concat(resultArr2);
				//ID query æ¯<form>è¡¨ååå®¹ï¼
				$( "#autoComplete" ).autocomplete({
					max:30, 
					minLength:2,
					scrollHeight: 200,
					matchContains: true,
					delay:0,
					source: resultArr,
				});
				
			    //同步跳转，点击按钮，图片展示出来
				$("button[type='submit']").click(function(){
					$("#firstTable").hide();
					$("#box-move").hide();
					$("#SNV").hide();
					$("#Detailed").hide();
					$("#loading").show();
				});
			      		
			  $("#example2 tbody tr td a").click(function(){
				  var id = $(this).text();
				  if(id=="More details")
				  id = $(this).parent().prev().prev().prev().prev().prev().prev().text();
				  $.ajax({
			      		url:"SearchDetail",
			      		type:"POST",
			      		data:{
			      			id:id,
			      		},
			      		dataType:"json", //传进来的并不是json，而是json字符串，可以用JSON.parse转换为js对象
			      		success:function(returnMsg){
			      			if(returnMsg.status == "success"){
			      				$("#detailInformation tbody").empty();
			      				var resulttable = JSON.parse(returnMsg.jsonresult);
			      				for(var i=0;i<resulttable.length;i++){
			      					$("#detailInformation tbody").append("<tr><td>"+resulttable[i].id+"</td><td>"+resulttable[i].vartype+"</td><td>"+resulttable[i].varname+"</td><td>"+resulttable[i].varchr+":"+resulttable[i].varstart+"-"+resulttable[i].varend+"</td><td>"+resulttable[i].targetgene+"</td><td>"+resulttable[i].muttype+"</td><td>"+resulttable[i].varcons+"</td><td><a href= 'https://www.ncbi.nlm.nih.gov/pubmed/" + resulttable[i].pmid + "' target='_blank'>"+resulttable[i].pmid+"</a></td></tr>");
			      				}
			      				$("#Detailed").show();
								window.location.href="#Detailed";
								if(returnMsg.snvresult == "" && returnMsg.categories == ""){
			      					$("#Detailed").show();
			      					$("#snvPlot").remove();
			      					$("#SNV").hide();
			      				}else{
			      					$("#Detailed").show();
			      					$("#snvPlot").remove();
			      					$("#SNV").show();
			          				$("#snvPlotContainer").html("<div id='snvPlot'></div>");
			          				snvPlot("snvPlot", jQuery.parseJSON(returnMsg.snvresult), JSON.parse(returnMsg.categories), plotWidth=1100, plotHeight=300)
			      				}
			      			}
			      		}
				      });	
			     });
			  $('#example2').DataTable({
				    "dom": 'T<"clear">lfrtip',
				    "oTableTools": {"sSwfPath": "plugins/datatables/extensions/TableTools/swf/copy_csv_xls.swf",//下载插件
				                    "aButtons": ["xls"]
				    }
		     }); 
			   
		  });
		</script>
	</body>
</html>
