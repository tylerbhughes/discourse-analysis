<?php
	include 'header.php';include 'fileModule.php';
	$fileMod = new FileModule($connection); //$connection comes from the header.php
	$username = $_POST['owner'];
	$filename = $_POST['filename'];

	$returnedContent = $fileMod->getFileContents($username, $filename);
	echo $returnedContent;

?>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <title> - Graphical Interface</title>
  <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
  <script type="text/javascript" src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
  <link rel="stylesheet" type="text/css" href="/css/result-light.css">
  <script type='text/javascript' src="http://jsplumb.org/js/1.3.4/jquery.jsPlumb-1.3.4-all.js"></script>
	<style type='text/css'>
		.window
        {
            background-color: white;
            border: 3px solid #cccccc;
            font-size: 0.8em;
            height: 150px;
            opacity: 0.8;
            padding: 40px;
            position: absolute;
            width: 150px;
            z-index: 20;
            text-align: center;
			resize:vertical;
			overflow:auto;
			
        }
        
		.textarea
		{	
			top:10px;
			width: 150px;
			height: 110px;
			box-sizing: border-box;
			border: 1px solid #111111;
			padding: 5px;
			resize:none;
			left:200px;
			rows="6";
		}
		
		.Chapter
		{
		
			top:1px;
			width:80px;
			height:15px;
			box-sizing: border-box;
			border: 1px solid #000000;
			resize: none;
			rows = "1";
		}  
	</style>
 
	<script type='text/javascript'>//<![CDATA[ 
		$(window).load(function(){
			var targetDropOptions = {

			};

			connectorHoverStyle = {
				lineWidth: 7,
				strokeStyle: "#2e2aF8",
				cursor: 'pointer'
			}

			//Setting up a Target endPoint
			var targetColor = "#316b31";
			var targetEndpoint = {
				anchor: "LeftMiddle", 
				endpoint: ["Dot", { radius: 8}], 
				paintStyle: { fillStyle: targetColor }, 
				isSource: true, 
				scope: "green dot",
				connectorStyle: { strokeStyle: targetColor, lineWidth: 8 },
				connector: ["Flowchart", { curviness: 63}],
				maxConnections: 2,
				isTarget: true,
				dropOptions: targetDropOptions, 
				connectorHoverStyle: connectorHoverStyle
			};

			//Setting up a Source endPoint
			var sourceColor = "#ff9696";
			var sourceEndpoint = {
				anchor: "RightMiddle",
				endpoint: ["Dot", { radius: 8}],
				paintStyle: { fillStyle: sourceColor },
				isSource: true,
				scope: "green dot",
				connectorStyle: { strokeStyle: sourceColor, lineWidth: 4 },
				connector: ["Flowchart", { curviness: 63}],
				maxConnections: 2,
				isTarget: true,
				dropOptions: targetDropOptions,
				connectorHoverStyle: connectorHoverStyle
			};

			jsPlumb.bind("ready", function () {

				jsPlumb.animate($("#A"), { "left": 50, "top": 100 }, { duration: "slow" });
				jsPlumb.animate($("#B"), { "left": 300, "top": 100 }, { duration: "slow" });
				var window = jsPlumb.getSelector('.window');
				jsPlumb.addEndpoint(window, targetEndpoint);
				jsPlumb.addEndpoint(window, sourceEndpoint);
				jsPlumb.draggable(window);
				jsPlumb.connect
				(
					{
						source: 'A',
						target: 'B',
						anchors: ["RightMiddle", "LeftMiddle"],
						endpoint: ["Blank"],
						paintStyle: { strokeStyle: "#ff9696", lineWidth: 8 },
						connector: ["Flowchart", { curviness: 63}],
						connectorStyle: [{
							lineWidth: 3,
							strokeStyle: "#5b9ada"
						}],
						hoverPaintStyle: { strokeStyle: "#2e2aF8", lineWidth: 8 }
					}
				);
			});
	});//]]>  

	</script>


</head>
<body>
	<div id="workspace">
		<div  class="a window"; class="draggable" class="ui-widget-content">
		Chapter:<textarea <textarea class = "a Chapter"; ></textarea>
		<textarea class = "a textarea"; ></textarea>	
		<input type="submit" value="Submit"/> 
		<strong>A</strong>
		</div>
		
		<div  class="b window"; class="draggable" class="ui-widget-content">
		Chapter:<textarea <textarea class = "b Chapter"; ></textarea>
		<textarea class = "b textarea"; ></textarea>	
		<input type="submit" value="Submit"/> 
		<strong>B</strong>
		</div>
		
		<div  class="c window"; class="draggable" class="ui-widget-content">
		Chapter:<textarea class = "c Chapter"; ></textarea>
		<textarea class="c textarea"; ></textarea>	
		<input type="submit" value="Submit"/> 
		<strong>C</strong>
		</div>
	</div>
</body>
</html>

