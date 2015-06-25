<!DOCTYPE html>
<html>
<head>

<title>Welcome to Grails</title>
<link href="${resource(dir: 'css', file: 'bootstrap.min.css')}"
	rel="stylesheet">
<link href="${resource(dir: 'css', file: 'font-awesome.min.css')}"
	rel="stylesheet">
<link href="${resource(dir: 'css', file: 'admin.css')}" rel="stylesheet">
<link href="${resource(dir: 'css', file: 'fda.css')}" rel="stylesheet">
<g:javascript src="jquery.min.js" />
<g:javascript src="bootstrap.min.js" />
<g:javascript src="admin.js" />
<g:javascript src="metisMenu.min.js" />
<style type="text/css" media="screen">
#status {
	background-color: #eee;
	border: .2em solid #fff;
	margin: 2em 2em 1em;
	padding: 1em;
	width: 12em;
	float: left;
	-moz-box-shadow: 0px 0px 1.25em #ccc;
	-webkit-box-shadow: 0px 0px 1.25em #ccc;
	box-shadow: 0px 0px 1.25em #ccc;
	-moz-border-radius: 0.6em;
	-webkit-border-radius: 0.6em;
	border-radius: 0.6em;
}

.ie6 #status {
	display: inline;
	/* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
}

#status ul {
	font-size: 0.9em;
	list-style-type: none;
	margin-bottom: 0.6em;
	padding: 0;
}

#status li {
	line-height: 1.3;
}

#status h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin: 0 0 0.3em;
}

#page-body {
	margin: 2em 1em 1.25em 18em;
}

h2 {
	margin-top: 1em;
	margin-bottom: 0.3em;
	font-size: 1em;
}

p {
	line-height: 1.5;
	margin: 0.25em 0;
}

#controller-list ul {
	list-style-position: inside;
}

#controller-list li {
	line-height: 1.3;
	list-style-position: inside;
	margin: 0.25em 0;
}

@media screen and (max-width: 480px) {
	#status {
		display: none;
	}
	#page-body {
		margin: 0 1em 1em;
	}
	#page-body h1 {
		margin-top: 0;
	}
}

.link {
	stroke: #000;
	stroke-width: 1.5px;
}

.node {
	cursor: move;
	fill: #ccc;
	stroke: #000;
	stroke-width: 1.5px;
}

.node.fixed {
	fill: #f00;
}

text {
	font: 10px sans-serif;
	pointer-events: none;
}
</style>

</head>
<body>
	<script src='http://d3js.org/d3.v3.min.js'></script>
	<asset:javascript src="drugEvent.js" />

		<div id="wrapper">

			<!-- Navigation -->
			<nav class="" role="navigation" style="margin-bottom: 0">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.html">open FDA browser</a>
				</div>
				<!-- /.navbar-header -->

				<div class="navbar-default sidebar" role="navigation">
					<div class="sidebar-nav navbar-collapse">
						<ul class="nav" id="side-menu">
							<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
									Examine Data<span class="fa arrow"></span></a>
								<ul class="nav nav-second-level">
									<li><a href="#">Drugs</a></li>
									<li><a href="#">Devices</a></li>
									<li><a href="#">Food</a></li>
								</ul> <!-- /.nav-second-level --></li>
							<li><a href="#"><i class="fa fa-wrench fa-fw"></i> About
									Us<span class="fa arrow"></span></a>
								<ul class="nav nav-second-level">
									<li><a href="#">About Open FDA</a></li>
									<li><a href="#">About Our Team</a></li>
									<li><a href="#">About Our Approach</a></li>
									<li><a href="#">Our github</a></li>
								</ul> <!-- /.nav-second-level --></li>
						</ul>
					</div>
					<!-- /.sidebar-collapse -->
				</div>
				<!-- /.navbar-static-side -->
			</nav>

			<div id="page-wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Adverse Drug Events in the United
							States</h1>
					</div>
					<div class="overview">
						<p>This is the openFDA API endpoint for adverse drug events.
							An adverse event is submitted to the FDA to report any
							undesirable experience associated with the use of a drug,
							including serious drug side effects, product use errors, product
							quality problems, and therapeutic failures.</p>
						<p>Reporting of adverse events by healthcare professionals and
							consumers is voluntary in the United States. Increases in the
							total number of adverse events are likely caused by improved
							reporting. News, enforcement actions, and other phenomena can
							also spur reporting.</p>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-8">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-bar-chart-o fa-fw"></i> Drug Event Data
								<div class="pull-right">
									<div class="btn-group">
										<button type="button"
											class="btn btn-default btn-xs dropdown-toggle"
											data-toggle="dropdown">
											Quick Filter <span class="caret"></span>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><a href="#">Last 3 Months</a></li>
											<li><a href="#">Last 6 Months</a></li>
											<li><a href="#">Last 12 Months</a></li>
											<li class="divider"></li>
											<li><a href="#">Reset</a></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div id="morris-area-chart"></div>
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
					<!-- /.col-lg-8 -->
					<div class="col-lg-4">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-wrench fa-fw"></i> Refine Data
							</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="list-group">
									<a href="#" class="list-group-item"> </a> <a href="#"
										class="list-group-item"> </a> <a href="#"
										class="list-group-item"> </a> <a href="#"
										class="list-group-item"> </a> <a href="#"
										class="list-group-item"> </a> <a href="#"
										class="list-group-item"> </a> <a href="#"
										class="list-group-item"> </a> <a href="#"
										class="list-group-item"> </a> <a href="#"
										class="list-group-item"></a>
								</div>
								<!-- /.list-group -->
								<a href="#" class="btn btn-default btn-block">Reset All
									Filters</a>
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
					<!-- /.col-lg-4 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /#page-wrapper -->
		</div>
</body>
</html>
