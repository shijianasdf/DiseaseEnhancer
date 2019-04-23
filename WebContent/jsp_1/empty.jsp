<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>DiseaseEnhancer</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!--   <link rel="shortcut icon" href="images/favicon.ico"> -->
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="dist/css/skins/skin-blue-light.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
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
        <li class="header">Disease Associated Enhancer Catalog</li>
        
        
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
            <i class="fa fa-fw fa-bar-chart"></i><span>Browse</span>
           
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
						<!-- 图标 --> 
						<i class="fa fa-dashboard"></i>
						<span>External links</span>
						<!-- 一个 button，展开和收起多级菜单用 --> 
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
						</a>
						<!-- 多级菜单的第二级 --> 
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
        <div class="callout callout-danger">
          <h4>Warning!</h4>
          <p><s:property value="message"/></p>
        </div>
      </div>
      <!-- /.row -->
    </section>
    
  </div>


  <footer class="main-footer">
				
				<div class="pull-right hidden-xs"><b>Version</b>1.0.1</div>
				<!-- Copyright -->
				<strong>Copyright &copy; 2017 College of Bioinformatics Science and Technology, Harbin Medical University</strong> All rights reserved.
			</footer>

  
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
  <div><s:property value="message"/></div>
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
<!-- Sparkline -->
<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="plugins/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>
