<meta charset="utf-8">
<title>ADS</title>
<link href="${resource(dir: 'css', file: 'bootstrap.min.css')}"
	rel="stylesheet">
<link href="${resource(dir: 'css', file: 'font-awesome.min.css')}"
	rel="stylesheet">
<link href="${resource(dir: 'css', file: 'admin.css')}" rel="stylesheet">
<link href="${resource(dir: 'css', file: 'fda.css')}" rel="stylesheet">
<g:layoutHead/>		
<asset:javascript src="jquery.js" />
<asset:javascript src="bootstrap.js" />
<g:javascript src="admin.js" />
<g:javascript src="metisMenu.min.js" />
<style type="text/css" media="screen">

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