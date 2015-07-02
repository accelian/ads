<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main" />
</head>
<body>
			<div id="page-wrapper">
				<div id="graph">
					<asset:javascript src="d3.js" />
					<asset:javascript src="drugEvent.js" />	
				</div>
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
			
			
</body>
</html>
