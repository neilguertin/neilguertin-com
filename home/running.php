<!DOCTYPE html>

<head>
<meta charset="utf-8"/>
<?php include_once("head.php"); ?>
<title>Neil Guertin - Running</title>
</head>

<body id="running">
<?php include_once("navbar.php"); ?>

<div id="content">
<h2>Races</h2>

<?php
$f = fopen("race_results.csv", "r");
// Read header
$line = fgetcsv($f);
?>


<h3>2008&ndash;2011 (Middlebury)</h3>
<table>
<tr><td><h4>Date</h4></td><td><h4>Race Name</h4></td><td><h4>Location</h4></td><td><h4>Dist</h4></td><td><h4>Time</h4></td><td><h4>Place</h4></td><td><h4>Full Results</h4></td></tr>
<?php
for ($i = 0; $i < 28; $i++) {
	$line = fgetcsv($f);
    print_line($line);
}
?>
</table>

<h3>2012&ndash;2016 (Rochester)</h3>
<table>
<tr><td><h4>Date</h4></td><td><h4>Race Name</h4></td><td><h4>Location</h4></td><td><h4>Dist</h4></td><td><h4>Time</h4></td><td><h4>Place</h4></td><td><h4>Full Results</h4></td></tr>
<?php
for ($i = 0; $i < 18; $i++) {
	$line = fgetcsv($f);
    print_line($line);
}
?>

</table>
<h3>2017&ndash;Present (Boston)</h3>
<table>
<tr><td><h4>Date</h4></td><td><h4>Race Name</h4></td><td><h4>Location</h4></td><td><h4>Dist</h4></td><td><h4>Time</h4></td><td><h4>Place</h4></td><td><h4>Full Results</h4></td></tr>
<?php
while (($line = fgetcsv($f)) !== false) {
    print_line($line);
}
?>
</table>

<?php fclose($f); ?>



</div>

<?php include_once("footer.php"); ?>
</body>
</html>

<?php
function print_line($line){
	    echo "<tr>";
		for ($j=0; $j<6 && $j<count($line); $j++) {
			echo "<td>" . htmlspecialchars(trim($line[$j])) . "</td>";
		}
		if(count($line)>=7){
			echo "<td><a href=\"" . trim($line[6]) . "\">Results</a>";
				if(count($line)==8){
					echo " <a href=\"" . trim($line[7]) . "\">Results</a>";
				}
			echo "</td>";
		}
        echo "</tr>\n";
}
?>
