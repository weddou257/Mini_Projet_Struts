<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
// function for fetching user information from database
	function report() {		
		$.ajax({			
			type:"GET",
			url:"report.action",
			success: function(result){
				var tblData="";
				$.each(result.beanList, function() {					
					tblData += "<tr><td>" + this.uname + "</td>" + 
					"<td>" + this.uemail + "</td>" + 
					"<td>" + this.upass + "</td>" + 
					"<td>" + this.udeg + "</td>" +
					"<td>"+
					"<button onclick='fetchOldRecord(this);' class='btn btn-sm btn-info' data-toggle='modal' data-target='#updateModal'>Update</button>"+
					"<button onclick='deleteUser(this);' class='btn btn-sm btn-danger'>Delete</button>"+
					"</td></tr>" ;
				});
				$("#tbody").html(tblData);
			},
			error: function(result){
				alert("Some error occured.");
			}
		});
	}
	
	// function for fecthing old information into the form
	function fetchOldRecord(that){		
		   $("#uname").val($(that).parent().prev().prev().prev().prev().text());
		   $("#uemail").val($(that).parent().prev().prev().prev().text());
		   $("#upass").val("");
		   $("#udeg").val($(that).parent().prev().text());
		   $("#hiddenuemail").val($(that).parent().prev().prev().prev().text());
       	}
	
	// function for updating new information into database
	function updateNewRecord() {
		$.ajax({
			type:"POST",
			url:"updateuser.action",
			data:"uname="+$("#uname").val()+"&uemail="+$("#uemail").val()+"&upass="+$("#upass").val()+
            	 "&udeg="+$("#udeg").val()+"&hiddenuemail="+$("#hiddenuemail").val(),
            success:function(result){
            	var ht= result.msg;
    			$("#resp").html(ht);
            },
            error: function(result){
            	alert("Some error occured.");
            }
		});	
	}
	
	// function for deleting user information from database
	function deleteUser(that) {	
		$.ajax({
			type:"POST",
			url:"deleteuser.action",
			data:"uemail="+$(that).parent().prev().prev().prev().text(),
			success: function(data){
				if(data.msg==="Delete Successful"){
					alert(data.msg)
					$(that).closest('tr').remove();
					
				} else{
					alert(data.msg)
				}
			},
			error:function(data){
				alert("Some error occured.");
			}
		});
	}
</script>
</head>
<body onload="report();">
	<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><b>STRUTS CRUD</b></a>
			</div>
			<ul class="nav navbar-nav">
				<li>
					<a href="index.jsp"><b>Register</b></a>
				</li>
				<li>
					<a href="report.jsp"><b>Report</b></a>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<tr class="bg-info">
					<th>Nom</th>
					<th>Email</th>
					<th>Password</th>
					<th>D�signation</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody id="tbody">
			</tbody>
		</table>
	</div>
<div class="container" id="updateBlock">
		<div class="modal fade" id="updateModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Mettre � jour les nouvelles informations</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									<input type="text" name="uname" id="uname" class="form-control input-sm" placeholder="Full Name">
								</div>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									<input type="text" name="udeg" id="udeg" class="form-control input-sm" placeholder="Designation">
								</div>
							</div>
						</div>
						<div class="form-group">
							<input type="email" name="uemail" id="uemail" class="form-control input-sm" placeholder="Email">
							<input type="hidden" name="hiddenuemail" id="hiddenuemail">
						</div>
						<div class="form-group">
							<input type="password" name="upass" id="upass" class="form-control input-sm" placeholder="Password">
						</div>
						<button onclick="updateNewRecord();" class="btn btn-info btn-block">Update</button>
						<div id="resp" class="text-center" style="margin-top: 13px;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>