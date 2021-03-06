<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
	<c:set var="validUser" value="${session.validUser}" scope="page" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Home</title>
<link href="pages/assets/img/favicon.png" rel="shortcut icon" type="image/x-icon">
<!-- BOOTSTRAP STYLES-->
<link href="pages/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="pages/assets/css/font-awesome.css" rel="stylesheet" />
<!-- MORRIS CHART STYLES-->
<link href="pages/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="pages/assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".sidebar-collapse">
				<span class="sr-only">MSCE</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">MSCE</a>
		</div>
		<div
			style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
			Last access : <fmt:formatDate value="${validUser.lastLogin}" pattern="MM/dd/yyyy hh:mm:ss a"/> &nbsp; <a href="logout.ac"
				class="btn btn-danger square-btn-adjust">Logout</a>
		</div>
		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">
				<li class="text-center"><img
					src="pages/assets/img/find_user.png"
					class="user-image img-responsive" /></li>
				<li><a class="active-menu" href="#" id=admin_dashboard">
					<i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
				</li>
				
				
			</ul>
		</div>
		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Sensor Admin Dashboard</h2>
						<h5>Welcome ${validUser.firstName} ${validUser.lastName}, Love to see you back.</h5>
					</div>
				</div>
				<!-- /. ROW  -->
				<c:choose>
					<c:when test="${requestScope.errMsg != '' && requestScope.errMsg != null}">
						<div class="alert alert-danger" id="msg">
                    		${errMsg}
                		</div>
					</c:when>
					<c:when test="${requestScope.sucMsg != '' && requestScope.sucMsg != null}">
						<div class="alert alert-success" id="msg">
                    		${sucMsg}
                		</div>
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
				<div class="row" id="section1">
					<div class="col-md-3 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box">
							<span class="icon-box bg-color-red set-icon"> <i
								class="fa fa-crosshairs"></i>
							</span>
							<div class="text-box">
								<p class="main-text">${sessionScope.numOfSensors}</p>
								<marquee class="text-muted">Sensors You Have</marquee>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box">
							<span class="icon-box bg-color-green set-icon"> <i
								class="fa fa-info-circle"></i>
							</span>
							<div class="text-box">
								<p class="main-text">${sessionScope.thisProvideTotalUsers}</p>
								<marquee class="text-muted">Users Using Your Sensors</marquee>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box">
							<span class="icon-box bg-color-blue set-icon"> <i
								class="fa fa-usd"></i>
							</span>
							<div class="text-box">
								<p class="main-text">$${sessionScope.thisProviderTotalEarning}</p>
								<marquee class="text-muted">Total Earnings</marquee>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box">
							<span class="icon-box bg-color-brown set-icon"> <i
								class="fa fa-warning"></i>
							</span>
							<div class="text-box">
								<p class="main-text">0</p>
								<marquee class="text-muted">Sensors are not working properly</marquee>
							</div>
						</div>
					</div>
				</div>				
				
				<!-- /. ROW  -->
				<div class="row" id="section4">					
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">Providers List</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table id="providers-list"
										class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>User ID</th>
												<th>First Name</th>
												<th>Last Name</th>												
												<th>Email</th>
												<th>Phone Number</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- /. ROW  -->
				<div class="row" id="section4">					
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">Users List</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table id="users-list"
										class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>User ID</th>
												<th>First Name</th>
												<th>Last Name</th>												
												<th>Email</th>
												<th>Phone Number</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>			
			</div>			
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="pages/assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="pages/assets/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="pages/assets/js/jquery.metisMenu.js"></script>
	<!-- MORRIS CHART SCRIPTS -->
	<script src="pages/assets/js/morris/raphael-2.1.0.min.js"></script>
	<script src="pages/assets/js/morris/morris.js"></script>
	<!-- DATA TABLE SCRIPTS -->
    <script src="pages/assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="pages/assets/js/dataTables/dataTables.bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="pages/assets/js/admin-custom.js"></script>
</body>
</html>
