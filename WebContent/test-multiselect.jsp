<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>LnChrom</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<!-- Bootstrap 3.3.7 -->
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="dist/css/AdminLTE.css">
	<link rel="stylesheet" href="dist/css/skins/skin-black-light.css">
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
		<!-- 多选下拉菜单 -->
		<script type="text/javascript" src="plugins/bootstrap-multiselect/dist/js/bootstrap-multiselect.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="form-inline" role="form" id="adv_search">
<div class="form-group"><div class="col-lg-12"><div class="input-group">
								<label for="select1">Disease:</label>
			                    <select id="select1" name="disease" class="form-control" multiple="multiple" placeholder="To select multiple samples, hold ctrl button while click." data-toggle="tooltip" data-placement="top" >
									<option value='acetylation'>acetylation</option>
<option value='DNA methylation'>DNA methylation</option>
<option value='H2AK119ub'>H2AK119ub</option>
<option value='H2B ubiquitination'>H2B ubiquitination</option>
<option value='H3Ac'>H3Ac</option>
<option value='H3K18ac'>H3K18ac</option>
<option value='H3K27ac'>H3K27ac</option>
<option value='H3K27me3'>H3K27me3</option>
<option value='H3K36me2'>H3K36me2</option>
<option value='H3K36me3'>H3K36me3</option>
<option value='H3K4me2'>H3K4me2</option>
<option value='H3K4me3'>H3K4me3</option>
<option value='H3K9ac'>H3K9ac</option>
<option value='H3K9me2'>H3K9me2</option>
<option value='H3K9me3'>H3K9me3</option>
<option value='H3S10ph'>H3S10ph</option>
<option value='H4ac'>H4ac</option>
<option value='H4K20me3'>H4K20me3</option>
<option value='SUMOylation'>SUMOylation</option>
<option value='H3K27me1'>H3K27me1</option>	
			                </select>
			                </div></div></div>
			                </div>
				                <script>
				                $('#select1').multiselect({
				    				includeSelectAllOption: true,
				    				enableFiltering: true,
				    				maxHeight: 300
				                });
				                </script>
				                <script type="text/javascript">
		$(document).ready(function(){
			
			
		});
		</script>
</body>
</html>