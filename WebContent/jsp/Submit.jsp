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
		      <!--  <h1>
		        	DEC
		        <small>disease enhancer catalog</small>
		      </h1> -->
		     
		    </section>
		
		    <!-- Main content -->
		    <section class="content">    
		      
		
		      <!-- Main row -->
		      <div class="row">
		        <!-- Left col -->
		        <div class="col-md-12">
		          <!-- TABLE: LATEST ORDERS -->
		          <div class="box box-primary">
		          	<div class="box-header with-border">
		          	 	<i class="fa fa-upload"></i>
		          		<h3 class="box-title">Submit New Data</h3>
		          	</div>
		          	
		          	<div class="box-body">
		          	<p style="font-size:18px;"><strong>DiseaseEnhancer</strong> encourages researchers to submit records of disease enhancers to understand the  pathopoiesis. Once the submitted records approved by us, they will be public available in the coming release. Welcome to submit information on disease enhancers to DiseaseEnhancer.</p>
		          	<div id="returnMessage" role="alert" class="alert alert-success" style="display:none;">
		          		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>		                
		            </div>	
		          		
		          	<form  class="form-horizontal" role="form" action="" method="post">
		          			
		          		<div style="float:left;margin-left:100px;margin-top:20px;">	
		          			<div class="form-group" style="margin-left:20px">
		                  		<label for="inputPassword1" class="col-sm-3 control-label">Species:</label>
		                  		<div class="col-sm-9">
		                    	<input name="species" type="text" class="form-control" id="inputPassword1" placeholder="Homo sapiens">
		                		</div>
		                	</div>
		                	
		                	<div class="form-group" style="margin-left:20px">
		                  		<label for="inputPassword2" class="col-sm-3 control-label">Enhancer Region:</label>
		                  		<div class="col-sm-9">
		                    	<input name="enhancerregion" type="text" class="form-control" id="inputPassword2" placeholder="chr12:53944202-53949200">
		                		</div>
		                	</div>
		                	
		                	<div class="form-group" style="margin-left:20px">
		                  		<label for="inputPassword3" class="col-sm-3 control-label">Target Gene:</label>
		                  		<div class="col-sm-9">
		                    	<input name="targetgene" type="text" class="form-control" id="inputPassword3" placeholder="HOTAIR">
		                		</div>
		                	</div>
		                	
		                	<div class="form-group" style="margin-left:20px">
		                  		<label for="inputPassword4" class="col-sm-3 control-label">Disease:</label>
		                  		<div class="col-sm-9">
		                    	<input name="disease" type="text" class="form-control" id="inputPassword4" placeholder="breast cancer">
		                		</div>
		                	</div>
		                	
		                	<div class="form-group" style="margin-left:20px">
		                  		<label for="inputPassword5" class="col-sm-3 control-label">Variant Type:</label>
		                  		<div class="col-sm-9">
		                    	<input name="vartype" type="text" class="form-control" id="inputPassword5" placeholder="SNP">
		                		</div>
		                	</div>
		                	
		                	<div class="form-group" style="margin-left:20px">
		                  		<label for="inputPassword6" class="col-sm-3 control-label">Variant Name:</label>
		                  		<div class="col-sm-9">
		                    	<input name="varname" type="text" class="form-control" id="inputPassword6" placeholder="rs10086908">
		                		</div>
		                	</div>
		                	
		                	<div class="form-group" style="margin-left:20px">
		                  		<label for="inputPassword7" class="col-sm-3 control-label">Variant Location:</label>
		                  		<div class="col-sm-9">
		                    	<input name="varsite" type="text" class="form-control" id="inputPassword7" placeholder="chr6:126999692-126999692">
		                		</div>
		                	</div>
		                	
		                	<div class="form-group" style="margin-left:20px">
		                  		<label for="inputPassword8" class="col-sm-3 control-label">Variant Mode:</label>
		                  		<div class="col-sm-9">
		                    	<input name="muttype" type="text" class="form-control" id="inputPassword8" placeholder="T>C">
		                		</div>
		                	</div>
		                	
		                	<div class="form-group" style="margin-left:20px">
		                  		<label for="inputPassword9" class="col-sm-3 control-label">Variant Consequence:</label>
		                  		<div class="col-sm-9">
		                    	<input name="varcons" type="text" class="form-control" id="inputPassword9" placeholder="Increasing of enhancer activity">
		                		</div>
		                	</div>
		                	
		                	<!--  <div class="form-group" style="margin-left:20px">
		                  		<label for="inputPassword10" class="col-sm-3 control-label">Assembly:</label>
		                  		<div class="col-sm-9">
		                    	<input name="assembly" type="text" class="form-control" id="inputPassword10" placeholder="hg19">
		                		</div>
		                	</div>  -->
		                	
		                	<div class="form-group" style="margin-left:20px">
		                  		<label for="inputPassword11" class="col-sm-3 control-label">PMID:</label>
		                  		<div class="col-sm-9">
		                    	<input name="pmid" type="text" class="form-control" id="inputPassword11" placeholder="pmid">
		                		</div>
		                	</div>
		                	
		                	<!--  <div class="form-group" style="margin-left:20px">
		                  		<label for="inputPassword13" class="col-sm-3 control-label">Journal:</label>
		                  		<div class="col-sm-9">
		                    	<input name="journal" type="text" class="form-control" id="inputPassword13" placeholder="nature">
		                		</div>
		                	</div>
		                	<div class="form-group" style="margin-left:20px">
		                  		<label for="inputPassword14" class="col-sm-3 control-label">Year:</label>
		                  		<div class="col-sm-9">
		                    	<input name="year" type="text" class="form-control" id="inputPassword14" placeholder="2010">
		                		</div>
		                	</div>  -->
		                	 </div>
		                	 <div style="float:left;margin-left:200px;margin-top:20px;">
		                	         <div class="form-group" style="margin-left:20px">
		                  		<label for="inputPassword15" class="col-sm-3 control-label">Name:</label>
		                  		<div class="col-sm-9">
		                    	<input name="name" type="text" class="form-control" id="inputPassword15" placeholder="name">
		                		</div>
		                	</div>
		                	     <div class="form-group" style="margin-left:20px">
		                  		<label for="inputPassword16" class="col-sm-3 control-label">Email:</label>
		                  		<div class="col-sm-9">
		                    		<input name="email" type="text" class="form-control" id="inputPassword16" placeholder="email">
		                		</div>
		                	</div>
		                	 <div class="form-group" style="margin-left:20px">
		                  		<label for="inputPassword17" class="col-sm-3 control-label">Suggestion:</label>
		                  		<div class="col-sm-9">
		                    		<textarea style="height:200px;" name="suggestion" type="text" class="form-control" id="inputPassword17" placeholder="suggestion..."></textarea>
		                		</div>
		                	</div>
		                	 </div>
		                	 
		                	 <div style="clear:both;"></div>
		                	 <div class="box-footer">
		                		
		                		<button type="button" class="btn btn-info pull-right">submit</button>
		              		 </div>
		          		</form>
		          		
		          		
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
		<script>
			function isEmail(strEmail){ 
				if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1)
				return true;
				else
				alert("the email format is wrong");
			}
			function isContains(str, substr){
			    return str.indexOf(substr) >= 0;
			}
			$(document).ready(function(){
				$("button[type='button']").bind("click",function(){
					var species = $("#inputPassword1").val();
					var enhancerregion = $("#inputPassword2").val();
					var targetgene = $("#inputPassword3").val();
					var disease = $("#inputPassword4").val();
					var vartype = $("#inputPassword5").val();
					var varname = $("#inputPassword6").val();
					var varsite = $("#inputPassword7").val();
					var muttype = $("#inputPassword8").val();
					var varcons = $("#inputPassword9").val();
					var pmid = $("#inputPassword11").val();
					var name = $("#inputPassword15").val();
					var email = $("#inputPassword16").val();
					var suggestion = $("#inputPassword17").val();
					if(species == "" || disease == "" || targetgene == "" || vartype == "" || varsite == "" || muttype == "" || varcons == "" || pmid == "" || name == "" || email == "" ){
						alert("you have something not input");
					}
					if(!isContains(enhancerregion,":") || !isContains(enhancerregion,"-") || !isContains(varsite,":") || !isContains(varsite,"-")){
						alert("your enhancerregion or varsite is not the correct format");
					}else{
						isEmail(email);
						$.ajax({
							url:"submit",
							type:"POST",
				  			data:{
				  				species:species,
				  				enhancerregion:enhancerregion,
				  				targetgene:targetgene,
				  				disease:disease,
				  				vartype:vartype,
				  				varname:varname,
				  				varsite:varsite,
				  				muttype:muttype,
				  				varcons:varcons,
				  				pmid:pmid,
				  				name:name,
				  				email:email,
				  				suggestion:suggestion
				  			},
				  			dataType:"json", //传进来的并不是json，而是json字符串，可以用JSON.parse转换为js对象
				  			success:function(returnMsg){
					   			if(returnMsg.status=="success"){
					   				$(".alert.alert-success").append("Hello "+returnMsg.name+",Thank you for your submit");
					   				$("#returnMessage").show();
					   			}else{
					   				$(".alert.alert-success").append("sorry system busy");
					   				$("#returnMessage").show();
					   			}
				  			}
						});
					}
					
				});
				
			})
		  
		</script>
	</body>
</html>
