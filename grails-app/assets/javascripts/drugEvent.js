var width = 960,
height = 650;

var force = d3.layout.force()
.size([width, height])
.charge(-400)
.linkDistance(30)
.on("tick", tick);

var drag = force.drag()
.on("dragstart", dragstart);

var svg = d3.select("#graph").append("svg")
.attr("width", width)
.attr("height", height);

var link = svg.selectAll(".link"),
node = svg.selectAll(".node");


d3.json("./drugEvent/graph.json", function(error, graph) {
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