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
	  <!-- Theme style -->
	  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
	  <!-- AdminLTE Skins. Choose a skin from the css/skins
	       folder instead of downloading all of them to reduce the load. -->
	  <link rel="stylesheet" href="dist/css/skins/skin-blue-light.css">
	  <style>
	  	 .box-body p{
	  	 	font-size:18px;
	  	 }
	  </style>
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
		      
		
		      <!-- Main row -->
		      <div class="row">
		        <!-- Left col -->
		        <div class="col-md-12">
		          <!-- TABLE: LATEST ORDERS -->
		          <div class="box box-primary" >
		            <div class="box-header with-border">
		              <i class="fa fa-book"></i> 
		              <h3 class="box-title">Help</h3>
		
		             
		            </div>
		            <!-- /.box-header -->
		            <div class="box-body">
		               <p>User can query the database through the search interface which contains <b>Quick Search</b> and <b>Advanced Search</b>.</p>
		               <p class="subTitle"><strong>1. Quick search</strong></p>
		               <div style="width:60%;"><img src="images/help/quick_search.png" style="margin-left:20px;width:90%;"/></div>
		               <p>On the homepage, users can search disease enhancers by inputting the genomic region, enhancer target gene or disease name of interest. In this page, only one term could be used, for combined or batch search, please go to Advanced Search.</p>
		                <br />
		                <p><strong>2. Advanced search</strong></p>
		                
		            	<p>Advanced search provides multiple options in two modules for customized search of the interested contents.</p> 
<p>In the "<em>Combined Search</em>" module, users can query the interested disease enhancers by combining different key words, including genomic region, enhancer target gene and disease(s).</p>
<div style="width:95%;margin:0 auto;"><img src="images/help/combined_search.png" style="margin-left:20px;width:50%;"/></div>
<p>In the "<em>Batch Search</em>" module, users can check whether some disease enhancers were located in the regions of interest by inputting genomic regions or uploading a "BED3" file. Specifically, the inputting regions and the BED file should be in tab delimited format without column names.</P>
<div style="width:95%;margin:0 auto;"><img src="images/help/Batch_search.png" style="margin-left:20px;width:50%;"/></div>
		                <br/>
		            	<p><strong>3. Search result</strong> </p>
		            	<p>DiseaseEnhancer will return the matched entries of disease enhancers in a brief, responsive table.</p>
		            	<div style="width:95%;margin:0 auto;"><img src="images/help/TableResult.png" style="margin-left:20px;width:90%;"/></div>
		            	<p><strong>In this table</strong>, Each entry has 7 basic items.</p>
		            	<p><strong>ID:</strong> Enhancer ID prefixed with "DE_", maintained by DiseaseEnhancer database.</p>
		            	<p><strong>chr, start, end:</strong> The region of enhancer in the GRCH37/hg19 assembly.</p>
		            	<p><strong>Target gene:</strong> The name of target gene.</p>
		            	<p><strong>Disease:</strong> The associated disease.</p>
		            	<p><strong>More details:</strong> Clickable links for accessing the detail informantion of each enhancer. After clicking the links, the details of the variants on the disease enhancer and their consequence will be displayed as a table at below. The mutations around the enhancer in cancers will be also shown.</p>
		                 <br/>            
		                <p><strong>4. Detail Information</strong></p>
		                <p>To further learn and explore the interested enhancer region, user can click "More details" in the result table to obtain the corresponding metadata.</p>
						<p>The metadata will be shown as a table with 8 columns:</p>
						<p><strong>ID:</strong> Enhancer ID prefixed with "DE_", maintained by DiseaseEnhancer database.</p>
						<p><strong>Variant type:</strong> The genetic alteration type, including Mutation, Indel, SNP, CNV and SV.</p>
						<p><strong>Variant name:</strong> The genetic alteration name for variants. The dbSNP ID are used for SNPs, meanwhile the genomic locations are used for other variants.</p>
						<p><strong>Variant location:</strong> The location of the genetic alteration in hg19 coordinate.</p>
						<p><strong>Target Gene:</strong> The target gene regulated by disease enhancer.</p>

						<p><strong>Variant mode:</strong> The description of the variant, such as, C>T for mutation and SNP, Amplification/Deletion for CNV and Duplication,Inversion,Translocation for SV.</p>
						<p><strong>Variant Consequence:</strong> The biological impact mediated by the variant, such as gain/loss of TF binding and the enhancer activity.</p>
						<p><strong>PMID:</strong> The pubmed ID of the reference.</p>
						<p>In addition, <b>SNVplot</b> of the enhancer based on ICGC dataset was also shown if available (For some enhancers, no somatic mutations occuried in the extended enhancer regions).</p>
		                <div style="width:95%;margin:0 auto;"><img src="images/help/DetailInformation.png" style="margin-left:20px;width:90%;"/></div>
		                <!--   <div style="width:95%;margin:0 auto;"><img src="images/help/SnvPlot.png" style="margin-left:20px;width:90%;"/></div>-->
		            </div>
		          </div>
		        </div>
		        <!-- /.col -->
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
		<!-- jQuery 2.2.3 -->
		<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
		<!-- Bootstrap 3.3.7 -->
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<!-- AdminLTE App -->
		<script src="dist/js/app.min.js"></script>
		<!-- DataTables -->
		<script src="plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="dist/js/demo.js"></script>
	</body>
</html>
