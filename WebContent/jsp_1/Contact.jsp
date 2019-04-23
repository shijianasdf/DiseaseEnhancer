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
		      
		
		    <!-- Main content -->
		    <section class="content">    
		      
		
		      <!-- Main row -->
		      <div class="row">
		        <!-- Left col -->
		        <div class="col-md-12">
		         <div class="box box-primary">
		<div class="box-header">
		<i class="fa fa-envelope"></i>
		<h3 class="box-title">Quick Email</h3>
		<!-- tools box -->
		</div>
		
		<div class="box-body">
		<form id="quick_email" action="" method="post">
		<div class="form-group">
		<div class="input-group">
		<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
		<input type="text" class="form-control" name="useremail" placeholder="Your Email">
		</div>
		</div>
		<div class="form-group">
		<input type="text" class="form-control" name="username" placeholder="Your name"/>
		</div>
		<div class="form-group">
		<input type="text" class="form-control" name="subject" placeholder="Subject"/>
		</div>
		<div class="form-group">
		<textarea class="textarea" class="form-control" name="message" id="message" placeholder="Please, type your message here..." style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
		</div>
		<div class="form-group">
		
		<button type="button" class="pull-right btn btn-primary" name="sendEmail" id="sendEmail">Send<i class="fa fa-arrow-circle-right"></i></button>
		<p>*Your information will not be used for any purpose.</p>
		</div>
		
		</form>
		</div>
		
		
		
		            
		</div>
		</div>
		  
		    
					
				  
		           
		           
		          
		        
		        <!-- /.col -->
				
		      </div>
		      <div id="returnMessage" role="alert" class="alert alert-success" style="display:none;">
		          		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		                
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
		<!-- FastClick -->
		<script src="plugins/fastclick/fastclick.js"></script>
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
			  $(function (){
				 $("button[type='button']").bind("click",function(){
					 var useremail = $("input[name='useremail']").val();
					 var username = $("input[name='username']").val();
					 var subject = $("input[name=\"subject\"]").val();
					 var message = $("textarea[name=\"message\"]").val();
					 if(useremail == "" || username ==""){
						 alert("you did not input email or your username");
					 }else{
						 isEmail(useremail);
						 $.ajax({
									url:"ContactAction",
									type:"POST",
			      	    			data:{
			      	    				useremail:useremail,
			      	    				username:username,
			      	    				subject:subject,
			      	    				message:message
			      	    			},
			      	    			dataType:"json", //传进来的并不是json，而是json字符串，可以用JSON.parse转换为js对象
			      	    			success:function(returnMsg){
							   			if(returnMsg.status=="success"){
							   				$(".alert.alert-success").append("Hello "+returnMsg.username+",I am very glad for your"+returnMsg.useremail);
							   				$("#returnMessage").show();
							   			}
			      	    			}
					 			});
				 	 }
				 });
			    
			  });
		</script>
	</body>
</html>
