<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
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
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
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
		    <script>

		    var width = 960,
		    height = 650;

		var force = d3.layout.force()
		    .size([width, height])
		    .charge(-400)
		    .linkDistance(30)
		    .on("tick", tick);

		var drag = force.drag()
		    .on("dragstart", dragstart);

		var svg = d3.select("body").append("svg")
		    .attr("width", width)
		    .attr("height", height);

		var link = svg.selectAll(".link"),
		    node = svg.selectAll(".node");

		

		    
		d3.json("graph.json", function(error, graph) {
			  if (error) throw error;

			  force
			      .nodes(graph.nodes)
			      .links(graph.links)
			      .start();

			  link = link.data(graph.links)
			    .enter().append("line")
			      .attr("class", "link");

			  node = node.data(graph.nodes)
			  .enter().append("g")
			      .attr("class", "node")
			      .call(drag);

			      node.append("circle")
			      .attr("r", 12)
			      .on("dblclick", dblclick)

			  node.append("text")
			    .attr("dx", ".10em")
			    .attr("dy", ".10em")
			    .text(function(d) { return d.label; });
		      
			
			});
			function tick() {
			  link.attr("x1", function(d) { return d.source.x; })
			      .attr("y1", function(d) { return d.source.y; })
			      .attr("x2", function(d) { return d.target.x; })
			      .attr("y2", function(d) { return d.target.y; });

				node.attr("transform", function(d) {return "translate(" + d.x + "," + d.y + ")";});
			}

			function dblclick(d) {
			  d3.select(this).classed("fixed", d.fixed = false);
			}

			function dragstart(d) {
			  d3.select(this).classed("fixed", d.fixed = true);
			}
    </script>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
	</body>
</html>
