<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	function registerUser() {
		var uname = $("#uname").val();
		var udeg = $("#udeg").val();
		var uemail = $("#uemail").val();
		var upass = $("#upass").val();
		$.ajax({
			type : "POST",
			url : "registeruser.action",
			data : "uname=" + uname + "&udeg=" + udeg + "&uemail=" + uemail
					+ "&upass=" + upass,
			success : function(data) {
				var ht = data.msg;
				$("#resp").html(ht);
			},
			error : function(data) {
				alert("Some error occured.");
			}
		});
	}
</script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><b>STRUTS CRUD</b></a>
			</div>
			<ul class="nav navbar-nav">
				<li>
					<a href="register.jsp"><b>Register</b></a>
				</li>
				<li>
					<a href="report.jsp"><b>Report</b></a>
				</li>

			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-5">
			<div class="row">
				<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" name="uname" id="uname" class="form-control input-sm" placeholder="Full Name">
					</div>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" name="udeg" id="udeg" class="form-control input-sm" placeholder="D�signation">
					</div>
				</div>
			</div>
			<div class="form-group">
				<input type="email"  name="uemail" id="uemail" class="form-control input-sm" placeholder="Email">
			</div>
			<div class="form-group">
				<input type="password" name="upass" id="upass" class="form-control input-sm" placeholder="Password">
			</div>
			<button onclick="registerUser();" type="button" class="btn btn-success btn-block">S'inscrire</button>
			<div class="text-center" id="resp" style="margin-top: 14px;"></div>
		</div>
	</div>
</body>
</html>