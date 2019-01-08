<!DOCTYPE html>
<html lang="en">
<head>
  <title>Nexus Consulting</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link rel="shortcut icon" href="vjti_logo.ico" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
	.btn-sm{font-size:18px;background-color:#404040;color:#ccc;}
	.btn-sm:hover,.btn-sm:active{background-color:#ccc;color:#404040;}
  </style>
</head>
<body>

<div class="container">
<div class="row">
	<div class="col-md-6">
		<h1><b>Nexus Consulting</b></h1>
	</div>
</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-13"><br>
			<ul class="nav nav-tabs">
				<li><a data-toggle="tab" href="#fillcv" class="mylink">Biodata</a></li>
				<li><a data-toggle="tab" href="#contactdetails" class="mylink">Contact Details</a></li>
				<li><a data-toggle="tab" href="#educationdetails" class="mylink">Education Details</a></li>
				<li><a data-toggle="tab" href="#companydetails" class="mylink">Company Details</a></li>
				<li><a data-toggle="tab" href="#jobdetails" class="mylink">Job Details</a></li>
			</ul>
		</div>
	</div>


<div class="tab-content">
	<!--Query Database-->	
	<div id="fillcv" class="tab-pane fade">
	  <h2>Biodata</h2>
		<!--Query Database-->	      
		<form id="1" class="form-horizontal" action = "Project0503-02_process.php" method = "post" role="form">
		<div class="form-group">
			<label class="control-label col-sm-2" for="gender">Gender</label>
				<div class="col-sm-4">
					<select name="gender" class="form-control" id="1">
					<option value="IS NOT NULL">any</option>
					<option value="= 'M'">Male</option>
					<option value="= 'F'">Female</option>
					</select></br>
				</div>

			<label class="control-label col-sm-2" for="dob">Age</label>
				<div class="col-sm-4">
					<select name="dob" class="form-control" id="1">
					<option value="IS NOT NULL">any</option>
					<option value=">= '1992-01-01'">Under 26</option>
					<option value="< '1992-01-01'">26 and above</option>
					</select></br>
				</div>
				<div align="center">
				<input type="submit" name="submit" value="Submit">
				</div>
		</div>
		</form>
	</div>


	<!--Query Database-->	
	<div id="contactdetails" class="tab-pane fade">
	  <h2>Contact Details</h2>
		<!--Query Database-->	      
		<form id="2" class="form-horizontal" action = "Project0503-02_process2.php" method = "post" role="form">
		<div class="form-group">
			<label class="control-label col-sm-2" for="gender">Gender</label>
				<div class="col-sm-4">
					<select name="gender" class="form-control" id="2">
					<option value="IS NOT NULL">any</option>
					<option value="= 'M'">Male</option>
					<option value="= 'F'">Female</option>
					</select></br>
				</div>

			<label class="control-label col-sm-2" for="dob">Age</label>
				<div class="col-sm-4">
					<select name="dob" class="form-control" id="2">
					<option value="IS NOT NULL">any</option>
					<option value=">= '1992-01-01'">Under 26</option>
					<option value="< '1992-01-01'">26 and above</option>
					</select></br>
				</div>
				<div align="center">
				<input type="submit" name="submit" value="Submit">
				</div>
		</div>
		</form>
	</div>


	<!--Query Database-->	
	<div id="educationdetails" class="tab-pane fade">
	  <h2>Education Details</h2>
		<!--Query Database-->	      
		<form id="3" class="form-horizontal" action = "Project0503-02_process3.php" method = "post" role="form">
		<div class="form-group">
			<label class="control-label col-sm-2" for="gpa">GPA</label>
				<div class="col-sm-4">
					<select name="gpa" class="form-control" id="3">
					<option value="IS NOT NULL">any</option>
					<option value="< 3.5">Below 3.5</option>
					<option value=">= 3.5">3.5 and above</option>
					</select></br>
				</div>

			<label class="control-label col-sm-2" for="gradyear">Graduation Year</label>
				<div class="col-sm-4">
					<select name="gradyear" class="form-control" id="3">
					<option value="IS NOT NULL">any</option>
					<option value="< '2014-01-01'">Before 2014</option>
					<option value=">= '2014-01-01'">After 2014</option>
					</select></br>
				</div>
				<div align="center">
				<input type="submit" name="submit" value="Submit">
				</div>
		</div>
		</form>
	</div>


	<!--Query Database-->	
	<div id="companydetails" class="tab-pane fade">
	  <h2>Company Details</h2>
		<!--Query Database-->	      
		<form id="4" class="form-horizontal" action = "Project0503-02_process4.php" method = "post" role="form">
			<div class="form-group">
				<label class="control-label col-sm-2" for="company">Company</label>
					<div class="col-sm-4">
						<select name="company" class="form-control" id="4">
						<option value="IS NOT NULL">any</option>
						<option value="= 'Bank of Washington'">Bank of Washington</option>
						<option value="= 'Coalgate'">Coalgate</option>
						<option value="= 'Digital Tech'">Digital Tech</option>
						<option value="= 'Hadron Inc'">Hadron Inc</option>
						<option value="= 'Finco Corp'">Finco Corp</option>
						<option value="= 'Wecare'">Wecare</option>
						</select></br>
					</div>

				<label class="control-label col-sm-2" for="companylocation">Company Location</label>
					<div class="col-sm-4">
						<select name="companylocation" class="form-control" id="4">
						<option value="IS NOT NULL">any</option>
						<option value="= 'Atlanta'">Atlanta</option>
						<option value="= 'Chicago'">Chicago</option>
						<option value="= 'Dallas'">Dallas</option>
						<option value="= 'Miami'">Miami</option>
						<option value="= 'San Jose'">San Jose</option>
						<option value="= 'Seattle'">Seattle</option>
						</select></br>
					</div>
				<div align="center">
					<input type="submit" name="submit" value="Submit">
					</div>
			</div>
		</form>
	</div>


	<!--Query Database-->	
	<div id="jobdetails" class="tab-pane fade">
	<h2>Job Details</h2>
	<!--Query Database-->	      
	<form id="5" class="form-horizontal" action = "Project0503-02_process5.php" method = "post" role="form">
	<div class="form-group">
		<label class="control-label col-sm-2" for="jobdomain">Job Domain</label>
				<div class="col-sm-4">
					<select name="jobdomain" class="form-control" id="1">
					<option value="IS NOT NULL">any</option>
					<option value="= 'Banking'">Banking</option>
					<option value="= 'Consulting'">Consulting</option>
					<option value="= 'Financial Consulting'">Financial Consulting</option>
					<option value="= 'Healthcare'">Healthcare</option>
					<option value="= 'Manufacturing'">Manufacturing</option>
					<option value="= 'Technology'">Technology</option>
					</select></br>
				</div>

			<label class="control-label col-sm-2" for="jobtitle">Job Title</label>
				<div class="col-sm-4">
					<select name="jobtitle" class="form-control" id="1">
					<option value="IS NOT NULL">any</option>
					<option value="= 'Analyst'">Analyst</option>
					<option value="= 'Business Analyst'">Business Analyst</option>
					<option value="= 'Business Consultant'">Business Consultant</option>
					<option value="= 'Data Analyst'">Data Analyst</option>
					<option value="= 'Data Consultant'">Data Consultant</option>
					<option value="= 'Engineer'">Engineer</option>
					</select></br>
				</div>
				<div align="center">
				<input type="submit" name="submit" value="Submit">
				</div>
	</div>
	</form>
	</div>
</div>
</div>
</body>
</html>
