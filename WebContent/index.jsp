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
	  <!-- Theme style -->
	  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
	  <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
	  <link rel="stylesheet" href="dist/css/skins/skin-blue-light.css">
	  <!-- jquery-ui -->
	  <link rel="stylesheet" href="css/jquery-ui-1.10.0.custom.css">
	  <style type="text/css">
	  	hr.style2 { 
  border: 0; 
  height: 1px; 
  background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);
  background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);
  background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);
  background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); 
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
					<!-- <img src="IMAGE/Transcription_Factors.png"/>
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
						<!-- Ã¥ÂÂ¾Ã¦Â Â --> 
							<i class="fa fa-dashboard"></i>
							<span>External links</span>
							<!-- Ã¤Â¸ÂÃ¤Â¸Âª buttonÃ¯Â¼ÂÃ¥Â±ÂÃ¥Â¼ÂÃ¥ÂÂÃ¦ÂÂ¶Ã¨ÂµÂ·Ã¥Â¤ÂÃ§ÂºÂ§Ã¨ÂÂÃ¥ÂÂÃ§ÂÂ¨ --> 
							<span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span>
						</a>
						<!-- Ã¥Â¤ÂÃ§ÂºÂ§Ã¨ÂÂÃ¥ÂÂÃ§ÂÂÃ§Â¬Â¬Ã¤ÂºÂÃ§ÂºÂ§ --> 
						<ul class="treeview-menu">
							<li><a href="http://www.regulomedb.org/" target="_blank"><i class="fa fa-angle-right"></i>regulomedb</a></li>
							<li><a href="http://archive.broadinstitute.org/mammals/haploreg/haploreg.php" target="_blank"><i class="fa fa-angle-right"></i>haploreg</a></li>
							<li><a href="http://jjwanglab.org/gwas3d" target="_blank"><i class="fa fa-angle-right"></i>gwas3d</a></li>
							<li><a href="https://dcc.icgc.org/" target="_blank"><i class="fa fa-angle-right"></i>ICGC</a></li>
							<!-- <li><a href="http://mlg.hit.edu.cn/lncrna2target/" target="_blank"><i class="fa fa-circle-o"></i>LncRNA2Target</a></li> -->
						</ul>
					</li>
			        
			        
			    
			       
			      </ul>
			      <div style="margin-top:300px;">
			                <script type="text/javascript" src="//ra.revolvermaps.com/0/0/7.js?i=0fg8fdh7e72&amp;m=0c&amp;c=ff0000&amp;cr1=ffffff&amp;sx=0&amp;cw=ffffff&amp;cb=3c8dbc" async="async"></script>
			      </div>
			    </section>
			    <!-- /.sidebar -->
			  </aside>
			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<section class="content-header"></section>
				<!-- Main content -->
				<section class="content">    
					<!-- Main row -->
					<div class="row">
						<!-- Left col -->
						<section class="col-lg-12 connectedSortable">
							<!-- connectedSortable è®¾ç½®æå°é«åº¦ 100bp -->
							<div class="box box-primary">
								<div class="box-header with-border">
									<i class="ion ion-clipboard"></i>
									<h3 class="box-title">Welcome to Disease Enhancer Catalog!</h3>
								</div>
								<div class="box-body col-lg-12">
									<div style="margin-bottom:20px;">	
										<p style="font-size:18px;line-height:180%;">Genetic alterations/variants of enhancers make an essential contribution to disease progression. And more than 3 million of enhancers generated by international consortiums indicated that disease enhancers will open a brand new view of pathophysiology.</p>
										<p style="font-size:18px;line-height:180%;">DiseaseEnhancer provides a comprehensive map of manually curated disease enhancers, which includes <b>847</b> disease enhancers in <b>143</b> human diseases, involving <b>896</b> unique enhancer-gene interaction. We also manually collected their dysregulated target genes and mechanistic-related information, such as the associated variant types (including single nucleotide variant, somatic mutation, indel and copy number alteration) and affected transcription factor bindings. Additional genome data were also integrated into DiseaseEnhancer to help characterize disease enhancers.</p>
										<div class="box-header with-border">
											<i class="fa fa-search"></i>
											<h3 class="box-title">Quick Search</h3>
										</div>
										<div class="box-body col-lg-8">
											<form id="quick_search" method="post" action="Quick">
												<div class="input-group input-group-lg">
													<input id="autoComplete" type="text" class="form-control" autocomplete="off" name="query" placeholder="What are you interested in?" data-toggle="tooltip" data-placement="bottom" title="You can search for gene symbol or disease or regions of interest"/>
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
									<div class="row">
										<div class="col-md-7"><img src="IMAGE/main.png" style="width:100%;"/></div>
										<div class="col-md-5">
											<div class="box box-primary">
								<div class="box-header">
									<i class="fa fa-bar-chart-o"></i>
									<h3 class="box-title">Statistics</h3>
								</div>
								<div class="box-body">
								<h5>Number of diseases: 143 </h5>
									<!-- <h5>Release 1.0: June. 15, 2017 </h5> -->
								<hr class="style2">
								<h5>Number of enhancers: 847</h5>
								<hr class="style2">
								<h5>Number of target genes: 896</h5>
								<hr class="style2">
								<img alt="" style="width:100%;" src="IMAGE/mainPage_stat.png">
                               </div>
							 </div>
										</div>
									</div>									
								</div>
								<div class="box-footer clearfix no-border"></div>
							</div>
							</section>
						<!-- /.col -->
						<section class="col-lg-5 connectedSortable">
						</section>
					</div>
				</section>
			</div>
			<footer class="main-footer">
				<div class="pull-right hidden-xs"><b>Version</b>1.0.1</div>
				<strong>Copyright &copy; 2017 College of Bioinformatics Science and Technology, Harbin Medical University</strong> All rights reserved.
			</footer>
		</div>


		<!-- jQuery 2.2.3 -->
		<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
		<!-- jquery UI -->
		<script src="plugins/jQueryUI/jquery-ui.min.js"></script>
		<!-- Bootstrap 3.3.7 -->
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<!--highcharts -->
		<script src="plugins/highcharts/highcharts.js"></script>
		<script src="plugins/highcharts/highcharts-more.js"></script>
		<script src="plugins/highcharts/modules/exporting.js"></script>
		<!-- FastClick -->
		<!-- <script src="plugins/fastclick/fastclick.js"></script>-->
		<!-- AdminLTE App -->
		<script src="dist/js/app.min.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="dist/js/demo.js"></script>
		<script type="text/javascript">
			  		//jqueryçç¨æ³ åºç¡è¯­æ³æ¯ï¼$(selector).action()
			  		//é¡µé¢å è½½å®æåå¼å§è¿è¡do stuff when DOM is ready;æ¯ä¸ªè½½å¥æµè§å¨ç HTML ææ¡£é½ä¼æä¸º Document å¯¹è±¡;è¿æ¯ä¸ºäºé²æ­¢ææ¡£å¨å®å¨å è½½ï¼å°±ç»ªï¼ä¹åè¿è¡ jQuery ä»£ç 
			    	// (document)æææ¯è¯´ï¼è·åæ´ä¸ªç½é¡µææ¡£å¯¹è±¡ï¼ç±»ä¼¼çäºwindow.documentï¼ï¼$(document).readyææå°±æ¯è¯´ï¼è·åææ¡£å¯¹è±¡å°±ç»ªçæ¶åã
			    				//åèï¼http://www.cnblogs.com/king-sheng/archive/2012/01/06/2313980.html
			$(document).ready(function(){
				//å®ä¹åéï¼
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
			});
		</script>
	</body>
</html>
