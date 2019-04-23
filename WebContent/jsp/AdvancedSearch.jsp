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
<!-- 		<link rel="shortcut icon" href="images/favicon.ico"> -->
		<!-- Bootstrap 3.3.7 -->
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
		<!-- Font Awesome -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
		<!-- Ionicons -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
		<!-- DataTables -->
		<!-- 	<link rel="stylesheet" href="plugins/datatables/jquery.dataTables.css"> -->
		<link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
		<link rel="stylesheet" href="plugins/datatables/extensions/TableTools/css/dataTables.tableTools.min.css">
		<!-- Theme style -->
		<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
		<!-- AdminLTE Skins. Choose a skin from the css/skins
		       folder instead of downloading all of them to reduce the load.
		<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css"> -->
		<link rel="stylesheet" href="dist/css/skins/skin-blue-light.css">
		<link rel="stylesheet" href="css/jquery-ui-1.10.0.custom.css">
		<!-- 多选下拉菜单 -->
		<link rel="stylesheet" href="plugins/bootstrap-multiselect/dist/css/bootstrap-multiselect.css" type="text/css"/>	
		<!-- jQuery 2.2.3 -->
		<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
		<!-- jquery UI -->
		<script src="plugins/jQueryUI/jquery-ui.min.js"></script>
		<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
		<script>
			$.widget.bridge('uibutton', $.ui.button);
		</script>
		
		<!-- Bootstrap 3.3.7 -->
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<!-- AdminLTE App -->
		<script src="dist/js/app.min.js"></script>
		<!-- 多选下拉菜单 -->
		<script type="text/javascript" src="plugins/bootstrap-multiselect/dist/js/bootstrap-multiselect.js"></script>
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
				  <div class="navbar-custom-menu"></div>
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
		            <i class="fa fa-download"></i><span>Download</span>
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
		      <!-- Main row -->
		      
		        <!-- Left col -->
		        
		          <!-- TABLE: LATEST ORDERS -->
		          <div class="row">
		          	<div class="col-md-6">
		          		<div class="box box-primary" >
			          <div class="box-header with-border">
			              <i class="fa fa-search"></i>
			              <h3 class="box-title">Combined Search</h3>
			          </div>
			          <div class="box-body">
			           <!--  <form class="form-inline" role="form" action="Search" method="post" enctype ="multipart/form-data"> -->
                     
			           <form class="form-horizontal" role="form" action="Search" method="post" enctype ="multipart/form-data">
			                
			                <div class="form-group" style="margin-left:10px">
			                	<label for="inputPassword1">Enhancer Target Gene:</label>
			                    <textarea name="gene" type="text" class="form-control" id="inputPassword1" placeholder="MYC,HOTAIR" data-toggle="tooltip" data-placement="top" title="You can search for gene symbol like 'MYC,HOTAIR' divided by ','" style="width:80%;"></textarea>	
			                </div>
	
			                <div class="form-group" style="margin-left:10px">
			                    <label for="select1">Disease:</label>
			                    <select id="select1" name="disease" class="form-control" multiple="multiple" placeholder="To select multiple samples, hold ctrl button while click." data-toggle="tooltip" data-placement="top" >
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
				                <script>
					                $('#select1').multiselect({
				    					includeSelectAllOption: true,
				    					enableFiltering: true,
				    					maxHeight: 300,
				    	            });
				                </script>
			                </div>
			                
			                <div class="form-group" style="margin-left:10px">
			                    <label for="inputPassword4" >Genomic Region:</label>
			                    <input name="chromosome" type="text" class="form-control" id="inputPassword4" placeholder="chr8:126998202-128990000" data-toggle="tooltip" data-placement="bottom" title="You can search for genomic region like chr8:126998202-128990000" style="width:50%"/>
			                </div>
			                 
			              	<div class="box-footer">
			                	<button  type="button" class="btn btn-danger" onclick="$('#inputPassword1').val('MYC,HOTAIR,BTN3A2');$('#inputPassword4').val('chr8:126998202-128990000')">Demo</button>
			                	<button  type="button" class="btn btn-success" onclick="$('#inputPassword1').val('');$('#inputPassword4').val('');">Reset</button>
<!-- 			            pull-right   -->   	<button type="submit" class="btn btn-info pull-right" >submit</button>
			              	</div>
			              	
			              <!-- /.box-footer -->
			            </form>
 			           
			      
			            	
			           
			          </div>
		        </div>
		          	</div>
		          	<div class="col-md-6">
		          		<div class="box box-primary" >
			          <div class="box-header with-border">
			              <i class="fa fa-map-marker"></i>
			              <h3 class="box-title">Notes:</h3>
			          </div>
			          <div class="box-body">
			          <p><b>In "Combined Search" module</b>, users can search interested region-gene-disease associations with multiple filters.</p>
			           	  <p><b>Enhancer Target Gene</b>: Users can input one or multiple gene symbols to search the disease enhancers that regulated the genes. Searching multiple genes at once is supported. The input should be delimited by commas. The searching will be performed in fuzzy approach.</p>
<p><b>Disease</b>: Users can choose the interested disease, and multiple diseases could be selected at once. </p>
<p><b>Genomic Region</b>: Please input the interested genomic region to check whether some disease enhancers were located in this region. Only one region can be input at once, and the format should be like "chr8:126998202-128990000".</p>	
			      	  </div>
		             </div>
		          	</div>
		          </div>
		         
		         
		          <div class="row">
		          	<div class="col-md-6">
		          	    <div class="box box-primary" >
					          <div class="box-header with-border">
					              <i class="fa fa-search"></i>
					              <h3 class="box-title">Batch Search</h3>
					          </div>
			          <div class="box-body">
			           <!--  <form class="form-inline" role="form" action="Search" method="post" enctype ="multipart/form-data"> -->
                     
			           <form class="form-horizontal" role="form" action="BatchSearch" method="post" enctype ="multipart/form-data">
			                <div class="form-group" style="margin-left:10px">
			                    <label for="select2">Disease:</label>
			                    <select id="select2" name="disease2" class="form-control" multiple="multiple" placeholder="To select multiple samples, hold ctrl button while click." data-toggle="tooltip" data-placement="top" >
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
				                <script>
					                $('#select2').multiselect({
				    					includeSelectAllOption: true,
				    					enableFiltering: true,
				    					maxHeight: 300,
				    	            });
				                </script>
			                </div>
			                <div class="form-group" style="margin-left:10px;">
			                    <label for="bed_format" >Genomic Region:</label>
			                    <textarea name="chromosomes" type="text" class="form-control" id="bed_format" placeholder="chr8	126998202	128990000" data-toggle="tooltip" data-placement="top" title="You can search for genomic region like 'chr8 126998202 128990000' divided by TAB" style="width:80%;height:100px;"></textarea>
			                  	<label for="exampleInputFile" >OR upload your BED file:</label>
			                    <input type="file" name="upload" class="form-control" id="exampleInputFile" style="width:80%;">
			                    <div id="loading" style="display:none;">
			                    	<img src="images/loading.gif"/>
			                    </div>
			                    
			                 </div>
			                 <div class="box-footer">
			                	<button  type="button" class="btn btn-danger" onclick="$('#bed_format').val('chr21\t47819654\t47820374\nchr10\t43581812\t43582711\nchr3\t187602695\t187702695\nchr17\t26132301\t26139107\nchr3\t187443146\t187468463\nchr8\t128857956\t128964803\nchr3\t187800876\t187841876\nchr11\t31534353\t31542527\n')">Demo</button>
			                	<button  type="button" class="btn btn-success" onclick="$('#bed_format').val('')">Reset</button>
<!-- 			            pull-right   -->   	<button type="submit" class="btn btn-info pull-right" >submit</button>
			              	</div>
			            </form>
 			                
			      
			            	
			           
			          </div>
		        </div>
		          	</div>
		          	<div class="col-md-6">
		          		<div class="box box-primary" >
					          <div class="box-header with-border">
					              <i class="fa fa-map-marker"></i>
			              		  <h3 class="box-title">Notes:</h3>
					          </div>
			          	<div class="box-body">
                     			<h5 style="line-height:180%;"><b>In "Batch Search" module</b> , users can search the disease enhancers in specific regions by selecting <b>diseases</b> and inputting <b>Genomic regions</b> or uploading a <b>"BED3" format file</b>. The BED file should be in tab delimited format without header. Each line of the file must be a BED3 format record. Information about <a href="http://genome.ucsc.edu/FAQ/FAQformat.html#format1">UCSC BED format</a>.</h5>
								<h4>Input file format</h4>
								<table class="table table-hover">
									<tr><td>chr21</td><td>47819654</td><td>47820374</td></tr>
									<tr><td>chr10</td><td>43581812</td><td>43582711</td></tr>
									<tr><td>chr3</td><td>187602695</td><td>187702695</td></tr>
									<tr><td>chr17</td><td>26132301</td><td>26139107</td></tr>
									<tr><td>chr3</td><td>187443146</td><td>187468463</td></tr>
									<tr><td>---</td><td>---</td><td>---</td></tr>
								</table>
								<h5>The sever will return the corresponding records of disease-enhancer interaction.</h5>
								<h5>Each query for region search will spend about 10 seconds.</h5>
			          	</div>
		        	</div>
		          	</div>
		          </div>
		        
		        <!-- /.col -->
				
		      	
<!-- 		      	<div class="col-md-5"> -->
<!-- 		      		<div class="box box-primary"> -->
<!-- 			          <div class="box-header with-border"> -->
<!-- 			              <i class="fa fa-map-marker"></i> -->
<!-- 			              <h3 class="box-title">Notes:</h3> -->
<!-- 			          </div> -->
<!-- 			          <div class="box-body"> -->
<!-- 			               <h5 style="line-height:110%;"><b>Enhancer Target Gene: </b>For searching the enhancer associated with the diseases,You can select one or multiple target genes at the same time.</h5> -->
<!-- 						   <h5 style="line-height:110%;"><b>Disease: </b>For searching the enhancer associated with the diseases,You can select one or multiple disease at the same time.</h5> -->
<!-- 			               <h5 style="line-height:110%;"><b>Genomic Regions: </b>You can input only one region (e.g. chr8:126998202-128990000) or a BED3 file</h5> -->
<!-- 			          </div> -->
<!-- 		      	</div> -->
<!-- 		      </div> -->
<!-- 		      <div class="row"> -->
<!-- 		      	 <div class="col-md-12"> -->
<!-- 		      	 	 <div id="loading" class="box box-primary" style="display:none;"> -->
<!-- 		      	 	 	<div class="box-header"> -->
<!-- 		               		<i class="fa fa-table"></i> -->
<!-- 		              		<h3 class="box-title">Table Results</h3> -->
<!-- 		            	</div> -->
<!-- 		            	<div class="box-body"> -->
<!-- 		            		<div> -->
<!-- 		            			<img src="images/loading.gif"/> -->
<!-- 		            		</div> -->
<!-- 		            	</div> -->
<!-- 		      	 	 </div> -->
<!-- 		      	 </div> -->
<!-- 		      </div> -->
		      <div class="row">
		        <div class="col-md-12">
			        <div id="box-move" class="box box-primary" style="display:none;">
			            <div class="box-header">
			              <i class="fa fa-table"></i>
			              <h3 class="box-title">Table Results</h3>
			            </div>
			            <div class="box-body">
			              <table id="example1" class="table table-bordered table-hover">
				                <thead>
					                <tr>
					                  <th>ID</th>
					                  <th>chr</th>
					                  <th>start</th>
					                  <th>end</th>
					                  <th>Disease</th>
					                  <th>Target Gene</th>
					                  <th>More details</th>
					                </tr>
				                </thead>
				                <tbody>
				                </tbody>
			              </table>
			            </div>
			            <!-- /.box-body -->
			          </div>
		          <s:if test="%{status ==1}">
		          </s:if>
		          <s:else>
		          <s:if test="%{result.size>=1}">
		        	<div id="firstTable" class="box box-primary">
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
		                  <th>chr</th>
		                  <th>start</th>
		                  <th>end</th>
		                  <th>Disease</th>
		                  <th>Target Gene</th>
		                  <th>More details</th>
		                </tr>
		                </thead>
		                <tbody>
		                  <s:iterator value="result" id="id" status="st">
		                    <tr>
		                  	  <td><s:property value="#id.getId()"/></td>
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
		           
		          </div>
		          <script>
		          	var status = "<s:property value='status'/>";
		          	if(status = "success"){
		          		window.location.href = "#firstTable";
		          	}
		          </script>
		          </s:if>
		          <s:elseif test="%{resultTable.size==0}">
		           
		          	 <div class="alert alert-danger" role="alert" style="text-align:center;">
						   sorry,no results
					 </div>
					
		          </s:elseif>
		          </s:else>
		        </div>
		
		      </div>
		       <div id="Snv-box" class="row">
			        <div class="col-md-12">
			        	<div id="Detailed" class="box box-primary" style="display:none;">
									<div class="box-header">
										<i class="fa fa-table"></i>
										<h3 class="box-title">Detailed Information</h3>
									</div>
									<div class="box-body">
										<div id="detailInformation">
											 <table class="table table-bordered table-hover">
			               							<thead>
											 		    <tr>
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
									<i class='fa fa-eye '></i>
									<h3 class="box-title">Single nucleotide variants around enhancers based on ICGC datasets</h3>
								</div>
								<div class="box-body">
									<div id="snvPlotContainer"></div>
								</div>
						</div>
		      	</div>
		      	</div>
		      
		      <!-- /.row -->
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
		
		
		
		<script>
		 json2table2 = function(data, id){
			var jsonObj = data;
			if (typeof data === "string"){
				jsonObj = JSON.parse(data);
			}
			resultTable = "<tr>";
		
			for(var i=0;i<jsonObj.length;i++){
				tempRow = "";
				for(var j=0;j<jsonObj[i].length;j++){
					tempRow = tempRow+"<td>"+jsonObj[i][j]+"</td>";
				}
				resultTable = resultTable+tempRow+"<td><a style='cursor:pointer;'>More details</a></td></tr>";
			}
			$(id).append(resultTable);
		}; 
		    
		$(document).ready(function(){
// 				var xmlGeneInfo = ""; 
// 				$.ajax({
// 			        url: "xml/geneSymbol.xml",
// 			        dataType: 'xml',
// 			        timeout: 2000,
// 			        async:false,
// 			        error: function()
// 			        {
// 			        	//alert() æ¹æ³ç¨äºæ¾ç¤ºå¸¦æä¸æ¡æå®æ¶æ¯åä¸ä¸ª OK æé®çè­¦åæ¡
// 			            alert("error load xml");
// 			        },
// 			        success: function(xml){
// 			        	//å¨xml/geneSymbol.xmlææ¡£ä¸­å¯»æ¾<geneSymbol> </geneSymbol>ä¸­ææ¬åå®¹ï¼ 
// 			        	xmlGeneInfo = $(xml).find("geneSymbol").text();
// 			        }
// 			    });
				
// 				var resultArr = xmlGeneInfo.split(","); 
// 				//ID query æ¯<form>è¡¨ååå®¹ï¼
// 				$( "#inputPassword1" ).autocomplete({
// 					max:30, 
// 					minLength:2,
// 					scrollHeight: 200,
// 					matchContains: true,
// 					delay:0,
// 					source: resultArr,
// 				});
				
				
				//同步跳转，点击按钮，图片展示出来
				$("button[type='submit']").eq(1).click(function(){
					$("#firstTable").hide();
					$("#box-move").hide();
					$("#SNV").hide();
					$("#Detailed").hide();
					$("#loading").show();
				});
		    	
				//为example2表格赋予点击事件，然后调用表格插件
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

		    	    					//$("#detailInformation tbody").append("<tr><td>"+resulttable[i].id+"</td><td>"+resulttable[i].vartype+"</td><td>"+resulttable[i].varname+"</td><td>"+resulttable[i].varchr+":"+resulttable[i].varstart+"-"+resulttable[i].varend+"</td><td>"+resulttable[i].targetgene+"</td><td>"+resulttable[i].muttype+"</td><td>"+resulttable[i].varcons+"</td><td><a href= 'https://www.ncbi.nlm.nih.gov/pubmed/"+ resulttable[i].pmid + "' target='_blank'>"+resulttable[i].pmid+"</a></td></tr>");
		    	    				}
		    	    				$("#Detailed").show();
		                            window.location.href="#Detailed";
									if(returnMsg.snvresult == "" && returnMsg.categories == ""){
			      						$("#Detailed").show();
			      						$("#snvPlot").remove();
									$("#SNV").show();
									$("#snvPlotContainer").html("<div id='snvPlot'></div>");
									$("#snvPlot").html("<p style=\"color:red\">Sorry,no mutaions in ICGC fall into this enhancer</p>");
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
				  $('#example2').DataTable({
			    	    "dom": 'T<"clear">lfrtip',
					    "oTableTools": {"sSwfPath": "plugins/datatables/extensions/TableTools/swf/copy_csv_xls.swf",//下载插件
					                    "aButtons": ["xls"]
					    }
			      }); 
		
		    	var ajaxResultTable= '<s:property value="ajaxResultTable"/>';
		    	if(ajaxResultTable != ""){
		    		ajaxResultTable=ajaxResultTable.replace(/&quot;/g,'"');
		    		var table=JSON.parse(ajaxResultTable);
		    		json2table2(table,"#example1 tbody");
		    		$("#box-move").show();
		          	var status = "<s:property value='status'/>";
		          	if(status = "success"){
		          		window.location.href = "#example1";
		          	}
		         
		    		/*$("#example1 tbody tr").each(function(){
		    			var text = $(this).children().eq(0).text();
		    			$(this).children().eq(0).html("<a style='cursor:pointer'>"+text+"</a>");
		    		});*/
		    		$("#example1 tbody tr td a").click(function(){    //先赋予点击事件，再掉表格插件
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


								//if(resulttable[i].varchr == "NA"){
		          	    				//	$("#detailInformation tbody").append("<tr><td>"+resulttable[i].id+"</td><td>"+resulttable[i].vartype+"</td><td>"+resulttable[i].varname+"</td><td></td><td>"+resulttable[i].targetgene+"</td><td>"+resulttable[i].muttype+"</td><td>"+resulttable[i].varcons+"</td><td><a href= 'https://www.ncbi.nlm.nih.gov/pubmed/" + resulttable[i].pmid + "' target='_blank'>"+resulttable[i].pmid+"</a></td></tr>");
		      	    					//}else{
		          	    				//	$("#detailInformation tbody").append("<tr><td>"+resulttable[i].id+"</td><td>"+resulttable[i].vartype+"</td><td>"+resulttable[i].varname+"</td><td>"+resulttable[i].varchr+":"+resulttable[i].varstart+"-"+resulttable[i].varend+"</td><td>"+resulttable[i].targetgene+"</td><td>"+resulttable[i].muttype+"</td><td>"+resulttable[i].varcons+"</td><td><a href= 'https://www.ncbi.nlm.nih.gov/pubmed/" + resulttable[i].pmid + "' target='_blank'>"+resulttable[i].pmid+"</a></td></tr>");
		      	    					//}
		      	    				}
		      	    				$("#Detailed").show();
		                            		window.location.href="#Detailed";
		                            		if(returnMsg.snvresult == "" && returnMsg.categories == ""){
			      						$("#Detailed").show();
			      						$("#snvPlot").remove();
									$("#SNV").show();
									$("#snvPlotContainer").html("<div id='snvPlot'></div>");
									$("#snvPlot").html("<p style=\"color:red\">Sorry,no mutaions in ICGC fall into this enhancer</p>");
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
		    		  	$('#example1').DataTable({
				    	    "dom": 'T<"clear">lfrtip',
						    "oTableTools": {"sSwfPath": "plugins/datatables/extensions/TableTools/swf/copy_csv_xls.swf",//下载插件
						                    "aButtons": ["xls"]
						    }
				     	}); 
		    	  
		    	}	     
		    });
		    
		</script>
	
	</body>
</html>