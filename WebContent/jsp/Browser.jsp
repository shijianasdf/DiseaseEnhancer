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
<!-- 	<link rel="shortcut icon" href="images/favicon.ico"> -->
	<!-- Bootstrap 3.3.7 -->
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="dist/css/AdminLTE.css">
	<link rel="stylesheet" href="dist/css/skins/skin-blue-light.css">
	<!-- DataTable -->
	<link rel="stylesheet" href="plugins/datatables/jquery.dataTables.css">
	<link rel="stylesheet" href="plugins/datatables/extensions/TableTools/css/dataTables.tableTools.min.css">
	<!-- 多选下拉菜单 -->
	<link rel="stylesheet" href="plugins/bootstrap-multiselect/dist/css/bootstrap-multiselect.css" type="text/css"/>
	<style type="text/css">
		.dropdown-menu {
			max-height: 250px;
			overflow-y: auto;
			overflow-x: hidden;
		}
		.linkTd{
			color:blue;
			cursor:pointer;
		}
	</style>
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	</head>
	<body class="hold-transition skin-blue-light sidebar-mini">
		<div class="wrapper">
			<!-- 上部导航栏 -->
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
			<!-- 页面的主要部分  -->
			<div class="content-wrapper">
				<section class="content">
					<!-- Result 部分开始 -->
					<div id="results" class="row">
						<section class="col-lg-12 connectedSortable">
							<div class="box box-primary">
								<div class="box-header"><i class="fa fa-table"></i><h3 class="box-title">Browse Results:</h3></div>
								<div class="box-body">
									<div class="form-group">
									   <div class="row">
										<div class="col-lg-4">
<!-- 											<div class="input-group"> -->
												<label>Disease:</label>
												<select id="querySpecies" name="species" class="form-control">
												<option value="all">all</option>
	<option value="Abdominal aortic aneurysm">Abdominal aortic aneurysm</option>
<option value="Acute lung injury">Acute lung injury</option>
<option value="Acute lymphoblastic leukemia">Acute lymphoblastic leukemia</option>
<option value="Acute myelocytic leukemia">Acute myelocytic leukemia</option>
<option value="Acute myeloid leukemia">Acute myeloid leukemia</option>
<option value="Adenylosuccinate lyase deficiency">Adenylosuccinate lyase deficiency</option>
<option value="Adolescent idiopathic scoliosis">Adolescent idiopathic scoliosis</option>
<option value="Adult-onset demyelinating leukodystrophy">Adult-onset demyelinating leukodystrophy</option>
<option value="Advanced liver disease">Advanced liver disease</option>
<option value="Age-related macular degeneration">Age-related macular degeneration</option>
<option value="Alcoholism">Alcoholism</option>
<option value="Alzheimer disease">Alzheimer disease</option>
<option value="Amyotrophic lateral sclerosis">Amyotrophic lateral sclerosis</option>
<option value="Aniridia">Aniridia</option>
<option value="Anorexia nervosa">Anorexia nervosa</option>
<option value="Antithrombin deficiency">Antithrombin deficiency</option>
<option value="Asthma">Asthma</option>
<option value="Atopic dermatitis">Atopic dermatitis</option>
<option value="Atrial fibrillation">Atrial fibrillation</option>
<option value="Attention-deficit/hyperactivity disorder">Attention-deficit/hyperactivity disorder</option>
<option value="Autism spectrum disorder">Autism spectrum disorder</option>
<option value="Autoimmune disease">Autoimmune disease</option>
<option value="Bipolar disorder">Bipolar disorder</option>
<option value="Bladder cancer">Bladder cancer</option>
<option value="Blepharophimosis syndrome">Blepharophimosis syndrome</option>
<option value="Blepharophimosisptosis-epicanthus inversus syndrome">Blepharophimosisptosis-epicanthus inversus syndrome</option>
<option value="Breast cancer">Breast cancer</option>
<option value="Bronchial asthma">Bronchial asthma</option>
<option value="Cardiac disorders">Cardiac disorders</option>
<option value="Cardiovascular disease">Cardiovascular disease</option>
<option value="Celiac disease">Celiac disease</option>
<option value="Charcot-marie-tooth disease">Charcot-marie-tooth disease</option>
<option value="Chronic granulomatous disease">Chronic granulomatous disease</option>
<option value="Chronic lymphocytic leukemia">Chronic lymphocytic leukemia</option>
<option value="Chronic obstructive pulmonary disease">Chronic obstructive pulmonary disease</option>
<option value="Classic hodgkin lymphoma">Classic hodgkin lymphoma</option>
<option value="Cleft lip">Cleft lip</option>
<option value="Cleft palate">Cleft palate</option>
<option value="Colorectal cancer">Colorectal cancer</option>
<option value="Combined pituitary hormone deficiency">Combined pituitary hormone deficiency</option>
<option value="Congenital amyelinating neuropathy">Congenital amyelinating neuropathy</option>
<option value="Coronary artery disease">Coronary artery disease</option>
<option value="Coronary heart disease">Coronary heart disease</option>
<option value="Cowden disease">Cowden disease</option>
<option value="Craniosynostosis">Craniosynostosis</option>
<option value="Crohn disease">Crohn disease</option>
<option value="Diabetes">Diabetes</option>
<option value="Diabetic nephropathy">Diabetic nephropathy</option>
<option value="Endometrial cancer">Endometrial cancer</option>
<option value="Endometriosis">Endometriosis</option>
<option value="Esophageal carcinoma">Esophageal carcinoma</option>
<option value="Ewing sarcoma">Ewing sarcoma</option>
<option value="Factor vii deficiency">Factor vii deficiency</option>
<option value="Falciparum malaria">Falciparum malaria</option>
<option value="Fetal hemoglobin level">Fetal hemoglobin level</option>
<option value="Fructose intolerance">Fructose intolerance</option>
<option value="Gastric cancer">Gastric cancer</option>
<option value="Glioma">Glioma</option>
<option value="Glycosylphosphatidylinositol deficiency">Glycosylphosphatidylinositol deficiency</option>
<option value="Haemophilia">Haemophilia</option>
<option value="Hcv-related liver disease">Hcv-related liver disease</option>
<option value="Head and neck squamous cell carcinoma">Head and neck squamous cell carcinoma</option>
<option value="Heart disease">Heart disease</option>
<option value="Heart failure">Heart failure</option>
<option value="Hemoglobinopathies">Hemoglobinopathies</option>
<option value="Hepatocellular carcinoma">Hepatocellular carcinoma</option>
<option value="Hereditary persistence of foetal haemoglobin">Hereditary persistence of foetal haemoglobin</option>
<option value="Hirschsprung disease">Hirschsprung disease</option>
<option value="Hiv">Hiv</option>
<option value="Holoprosencephaly spectrum">Holoprosencephaly spectrum</option>
<option value="Holt-oram syndrome">Holt-oram syndrome</option>
<option value="Hyperalphalipoproteinaemia">Hyperalphalipoproteinaemia</option>
<option value="Hypertension">Hypertension</option>
<option value="Idiopathic short stature">Idiopathic short stature</option>
<option value="Iga nephropathy">Iga nephropathy</option>
<option value="Isolated congenital heart defect">Isolated congenital heart defect</option>
<option value="Isolated pancreatic agenesis">Isolated pancreatic agenesis</option>
<option value="Late onset alzheimer's disease">Late onset alzheimer's disease</option>
<option value="Leprosy">Leprosy</option>
<option value="Leri-weill syndrome">Leri-weill syndrome</option>
<option value="Liebenberg syndrome">Liebenberg syndrome</option>
<option value="Limb malformation">Limb malformation</option>
<option value="Lung adenocarcinoma">Lung adenocarcinoma</option>
<option value="Lung cancer">Lung cancer</option>
<option value="Lupus">Lupus</option>
<option value="Lymphocyte-mediated immune disorders">Lymphocyte-mediated immune disorders</option>
<option value="Major depressive disorder">Major depressive disorder</option>
<option value="Malarial anaemia">Malarial anaemia</option>
<option value="Mannose-binding protein deficiency">Mannose-binding protein deficiency</option>
<option value="Medulloblastoma">Medulloblastoma</option>
<option value="Melanoma">Melanoma</option>
<option value="Monomac syndrome">Monomac syndrome</option>
<option value="Multiple myeloma">Multiple myeloma</option>
<option value="Multiple sclerosis">Multiple sclerosis</option>
<option value="Myasthenia gravis">Myasthenia gravis</option>
<option value="Myocardial infarction">Myocardial infarction</option>
<option value="Neural tube defects">Neural tube defects</option>
<option value="Neuroblastoma">Neuroblastoma</option>
<option value="Neuropsychiatric disorders">Neuropsychiatric disorders</option>
<option value="Non-small cell lung cancer">Non-small cell lung cancer</option>
<option value="Obesity">Obesity</option>
<option value="Obsessive-compulsive disorder">Obsessive-compulsive disorder</option>
<option value="Oesophagus and oesophageal adenocarcinoma">Oesophagus and oesophageal adenocarcinoma</option>
<option value="Optic nerve degeneration in glaucoma">Optic nerve degeneration in glaucoma</option>
<option value="Orofacial clefting">Orofacial clefting</option>
<option value="Ovarian cancer">Ovarian cancer</option>
<option value="Pancreatic agenesis">Pancreatic agenesis</option>
<option value="Pancreatic cancer">Pancreatic cancer</option>
<option value="Pancreatitis">Pancreatitis</option>
<option value="Papillary thyroid cancer">Papillary thyroid cancer</option>
<option value="Parkinson disease">Parkinson disease</option>
<option value="Pendred syndrome">Pendred syndrome</option>
<option value="Periodontal diseases">Periodontal diseases</option>
<option value="Pierre robin sequence">Pierre robin sequence</option>
<option value="Porphyria">Porphyria</option>
<option value="Preaxial polydactyly 2">Preaxial polydactyly 2</option>
<option value="Primary open-angle glaucoma">Primary open-angle glaucoma</option>
<option value="Primary sclerosing cholangitis">Primary sclerosing cholangitis</option>
<option value="Progressing stroke">Progressing stroke</option>
<option value="Prostate cancer">Prostate cancer</option>
<option value="Psychiatric diseases">Psychiatric diseases</option>
<option value="Pyruvate kinase deficiency">Pyruvate kinase deficiency</option>
<option value="Renal cancer">Renal cancer</option>
<option value="Rheumatoid arthritis">Rheumatoid arthritis</option>
<option value="Schizoaffective disorder">Schizoaffective disorder</option>
<option value="Schizophrenia">Schizophrenia</option>
<option value="Sideroblastic anaemia">Sideroblastic anaemia</option>
<option value="Silver-russell syndrome">Silver-russell syndrome</option>
<option value="Sudden infant death syndrome">Sudden infant death syndrome</option>
<option value="Syndactyly">Syndactyly</option>
<option value="Systemic lupus erythematosus">Systemic lupus erythematosus</option>
<option value="T cell acute lymphoblastic leukemia">T cell acute lymphoblastic leukemia</option>
<option value="Thalassaemia">Thalassaemia</option>
<option value="The syndrome of resistance to thyroid hormone">The syndrome of resistance to thyroid hormone</option>
<option value="Thrombocytopaenia 2">Thrombocytopaenia 2</option>
<option value="tuberculosis">tuberculosis</option>
<option value="Type-2 diabetes">Type-2 diabetes</option>
<option value="Tyrosine hydroxylase deficiency">Tyrosine hydroxylase deficiency</option>
<option value="Ulcerative colitis">Ulcerative colitis</option>
<option value="Uterine Corpus Endometrial Carcinoma">Uterine Corpus Endometrial Carcinoma</option>
<option value="Ventricular septal defect">Ventricular septal defect</option>
<option value="Wegener granulomatosis">Wegener granulomatosis</option>
<option value="X-linked deafness type 3">X-linked deafness type 3</option>

										</select>
<!-- 									</div> -->
									</div>
										<!--<div class="col-lg-6">
										<div class="box box-primary">
											<div class="box-header">
												
												<div class="col-lg-8"><p><i class="fa fa-map-marker"></i> Notes: A filter allowing users browse the associated enhancers in a certain disease. The defalt is all.</p></div>
												<div class="col-lg-2">
													<button id="download" type="button" class="btn btn-info" >Download</button>
											    </div>
											</div>
										</div>
										
											
											
										</div> -->
										<div class="col-lg-6 ">
											<p ><i class="fa fa-map-marker"></i> <b>Notes</b>: </br>Users can browse all the associated enhancers of an interested disease by selecting the disease name in the pull-down menu.</p>
											
										</div>
<div class="col-lg-2" style="margin-top:20px;">
	<button id="download" type="button" class="btn btn-info pull-right" >Export</button>
</div>
										</div>
									</div>
									<!-- result table
									<table id='testTable' class="table table-bordered table-striped dataTable no-footer dtr-inline">
									 -->
									<table id='testTable' class="dataTable">
									<thead><tr>
										<th>ID</th>
										<th>chr</th>
	                  <th>start</th>
	                  <th>end</th>
	                  <th>Target Gene</th>
	                  <th>Disease</th>
	
	                  <th>Details</th>
									</tr></thead>
									<tbody>
										<s:iterator value="result" id="idchild" status="status">
											<tr>
												<s:iterator value="#idchild" id="idchild1">
													<td><s:property value="#idchild1" escape="false"/></td>
												</s:iterator>
											</tr>
										</s:iterator>
									</tbody>
									</table>
									<div class="col-lg-6">
									<p>Showing <s:property value="displayStart"/> to <s:property value="displayEnd"/> of <s:property value="totalRows"/> entries</p>
									</div>
									<div class="col-lg-6">
									<p style="float:right;">
									Page: <s:property value="queryPage"/>/<s:property value="pageCounts"/>
									<a id="previousBtn"><i class="fa fa-chevron-left"></i></a>
									<a id="nextBtn"><i class="fa fa-chevron-right"></i></a>
									
									<!-- <br /> Jump to --> 
									<input type="text" id="jumpText" value="" />
									<input type="submit" id="jumpBtn" value="GO" />
									<!-- 
									<a id="lastBtn"><i class="fa fa-chevron-right"></i></a>
									<a id="firstBtn"><i class="fa fa-chevron-left"></i></a>
									 -->
									</p>
									</div>
								</div>
							</div>
						</section>
					</div>
					<!-- Result 部分结束 -->
					<div class="row">
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
					</div>
<div class="row">							
	<div class="col-md-12">							
	<!-- 突变图 -->
		<div id="SNV" class="box box-primary" style="display:none;">
			<div class="box-header">
				<i class='fa fa-eye'></i>
				<h3 class="box-title">Single nucleotide variants around enhancers based on ICGC datasets</h3>
			</div>
			<div class="box-body">                
				<div id="snvPlotContainer" ></div>
			</div>
		</div>
	</div>
</div>




						   <div>	
						
						</div>
				
				</section>
			</div>
			
			<!-- 页面的脚注部分  -->
			<footer class="main-footer">
				<div class="pull-right hidden-xs"><b>Version</b>1.0.1</div>
				<!-- Copyright -->
				<strong>Copyright &copy; 2017 College of Bioinformatics Science and Technology, Harbin Medical University</strong> All rights reserved.
			</footer>
		</div>
		
		<!-- 一般 JS 效果是在 HTML 元素加载完之后，才进行使用，所以一般 JS 都是写在 body 的最后 -->
		<!-- jQuery 2.2.3 -->
		<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
		<!-- jQuery UI 1.11.4 -->
		<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
		<script>
			$.widget.bridge('uibutton', $.ui.button);
		</script>
		<!-- Bootstrap 3.3.7 -->
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<!-- AdminLTE App -->
		<script src="dist/js/app.min.js"></script>
		<!-- DataTable -->
		<script type="text/javascript" src="plugins/datatables/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="plugins/datatables/extensions/AutoFill/js/dataTables.autoFill.min.js"></script>
		<script type="text/javascript" src="plugins/datatables/extensions/TableTools/js/dataTables.tableTools.js" charset="utf-8"></script>
		<script type="text/javascript" src="plugins/A_exPackages/dataTable.js"></script>
	
		<!-- gd3 library for mutation data -->
		<script src="plugins/gd3/bower_components/d3/d3.js"></script>
		<script src="plugins/gd3/gd3.js"></script>
		<!-- 封装 SNV plot -->
		<script src="plugins/A_exPackages/snvPlot.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			$("#testTable tbody tr td a").click(function(){
				  var id = $(this).text();
				  if(id=="More details")
				  id = $(this).parent().prev().prev().prev().prev().prev().prev().text();
		//prev().prev().prev().prev().text());
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
								if(resulttable[i].varchr != "NA"){
									var pmids = [];
									if(resulttable[i].pmid.indexOf(",") != -1)
										pmids = resulttable[i].pmid.split(", ");
									if(pmids.length == 0)
										$("#detailInformation tbody").append("<tr><td>"+resulttable[i].id+"</td><td>"+resulttable[i].vartype+"</td><td>"+resulttable[i].varname+"</td><td>"+resulttable[i].varchr+":"+resulttable[i].varstart+"-"+resulttable[i].varend+"</td><td>"+resulttable[i].targetgene+"</td><td>"+resulttable[i].muttype+"</td><td>"+resulttable[i].varcons+"</td><td><a href= 'https://www.ncbi.nlm.nih.gov/pubmed/" + resulttable[i].pmid + "' target='_blank'>"+resulttable[i].pmid+"</a></td></tr>");
									else{
										var s = "<tr><td>"+resulttable[i].id+"</td><td>"+resulttable[i].vartype+"</td><td>"+resulttable[i].varname+"</td><td>"+resulttable[i].varchr+":"+resulttable[i].varstart+"-"+resulttable[i].varend+"</td><td>"+resulttable[i].targetgene+"</td><td>"+resulttable[i].muttype+"</td><td>"+resulttable[i].varcons+"<td>";
										$.each(pmids,function(){
											s = s + "<a href='https://www.ncbi.nlm.nih.gov/pubmed/" + this +"' target='_blank'>"+this+"</a> "
										});
										s = s + "</td></tr>";
										$("#detailInformation tbody").append(s);
									}
									//$("#detailInformation tbody").append("<tr><td>"+resulttable[i].id+"</td><td>"+resulttable[i].vartype+"</td><td>"+resulttable[i].varname+"</td><td>"+resulttable[i].varchr+":"+resulttable[i].varstart+"-"+resulttable[i].varend+"</td><td>"+resulttable[i].targetgene+"</td><td>"+resulttable[i].muttype+"</td><td>"+resulttable[i].varcons+"</td><td><a href= 'https://www.ncbi.nlm.nih.gov/pubmed/" + resulttable[i].pmid + "' target='_blank'>"+resulttable[i].pmid+"</a></td></tr>");
								}else{
									var pmids = [];
									if(resulttable[i].pmid.indexOf(",") != -1)
										pmids = resulttable[i].pmid.split(", ");
									if(pmids.length == 0)
										$("#detailInformation tbody").append("<tr><td>"+resulttable[i].id+"</td><td>"+resulttable[i].vartype+"</td><td>"+resulttable[i].varname+"</td><td>"+resulttable[i].varchr+"</td><td>"+resulttable[i].targetgene+"</td><td>"+resulttable[i].muttype+"</td><td>"+resulttable[i].varcons+"</td><td><a href= 'https://www.ncbi.nlm.nih.gov/pubmed/" + resulttable[i].pmid + "' target='_blank'>"+resulttable[i].pmid+"</a></td></tr>");
									else{
										var s = "<tr><td>"+resulttable[i].id+"</td><td>"+resulttable[i].vartype+"</td><td>"+resulttable[i].varname+"</td><td>"+resulttable[i].varchr+"</td><td>"+resulttable[i].targetgene+"</td><td>"+resulttable[i].muttype+"</td><td>"+resulttable[i].varcons+"<td>";
										$.each(pmids,function(){
											s = s + "<a href='https://www.ncbi.nlm.nih.gov/pubmed/" + this +"' target='_blank'>"+this+"</a> "
										});
										s = s + "</td></tr>";
										$("#detailInformation tbody").append(s);
									}
			      					//$("#detailInformation tbody").append("<tr><td>"+resulttable[i].id+"</td><td>"+resulttable[i].vartype+"</td><td>"+resulttable[i].varname+"</td><td>"+resulttable[i].varchr+"</td><td>"+resulttable[i].targetgene+"</td><td>"+resulttable[i].muttype+"</td><td>"+resulttable[i].varcons+"</td><td><a href= 'https://www.ncbi.nlm.nih.gov/pubmed/" + resulttable[i].pmid + "' target='_blank'>"+resulttable[i].pmid+"</a></td></tr>");
								}

			      				}
			      				$("#Detailed").show();
								window.location.href="#Detailed";

							if(returnMsg.snvresult == "" && returnMsg.categories == ""){
	      					$("#Detailed").show();
	      					$("#snvPlot").remove();
						$("#SNV").show();
						$("#snvPlotContainer").html("<div id='snvPlot'></div>");
						$("#snvPlot").html("<p style=\"color:red\">Sorry,no mutaions in ICGC fall into this enhancer</p>");
	          				//snvPlot("snvPlot", jQuery.parseJSON(returnMsg.snvresult), JSON.parse(returnMsg.categories), plotWidth=1100, plotHeight=300)
	      					//$("#SNV").hide();
	      				}else{
	      					//alert("hell0");
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

		    	//$('#testTable').DataTable();

		    	
			//addColLinks("testTable", 8);
			//addColLinks(id, addLinkCol);
			$.getUrlParam = function (name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
				var r = window.location.search.substr(1).match(reg);
				if (r != null) return unescape(r[2]); return null;
			}
			var curSpecies = $.getUrlParam('disease');
			var curPage = parseInt($.getUrlParam('queryPage'));
			var nextPage = curPage+1;
			var prePage = curPage-1;
			if(curPage>1){
				$("#nextBtn").attr("href", "browseByPage?disease="+curSpecies+"&queryPage="+nextPage);
				$("#previousBtn").attr("href", "browseByPage?disease="+curSpecies+"&queryPage="+prePage);
			}else{
				$("#nextBtn").attr("href", "browseByPage?disease="+curSpecies+"&queryPage="+nextPage);
				$("#previousBtn").attr("href", "browseByPage?disease="+curSpecies+"&queryPage="+curPage);
			}
			$("#jumpBtn").click(function(){
				var jumpText = $("#jumpText").val();
				window.location.href="browseByPage?disease="+$.getUrlParam('disease')+"&queryPage="+jumpText;
			});
				
			//alert(curSpecies);
			$("#querySpecies").val(curSpecies);
			$("#querySpecies").change(function(){
				window.location.href="browseByPage?queryPage=1&disease="+$(this).val();
			});
// 			$('#testTable').DataTable({
// 				    paging: false,
// 				    searching: false,
// 				    ordering: false,
// 				    info: false,
// 		    	    "dom": 'T<"clear">lfrtip',
// 				    "oTableTools": {"sSwfPath": "plugins/datatables/extensions/TableTools/swf/copy_csv_xls.swf",//下载插件
// 				                    "aButtons": ["xls"]
// 				    }
// 		     }); 
			$("#download").bind("click",function(){
				window.location.href="Download";
			});
				
			
			
		});
		</script>
	</body>
</html>
