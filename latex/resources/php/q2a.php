<?php

header('Content-Type: application/json');

include('../connect.php');

if (isset($_GET['table'])) {
	$tablename = $_GET['table'];
	unset($_GET['table']);
} else {
	echo "Unspecified table.";
	exit;
}

$response = $pdo->query("DESC $tablename;");
$desc = $response->fetchAll(PDO::FETCH_NUM);

$sql = "SELECT * FROM $tablename WHERE ";

foreach ($desc as $attr) {
	if (isset($_GET[$attr[0]])) {
		if ($attr[1] == 'date') {
			$sql .= $attr[0]." = '".date('Y-m-d', strtotime($_GET[$attr[0]]))."'";
		} else {
			$pos = strpos($attr[1], 'int');
			if (!$pos && $pos !== 0) {
				$sql .= $attr[0]." COLLATE UTF8_GENERAL_CI LIKE '%".$_GET[$attr[0]]."%'";
			} else {
				$sql .= $attr[0]." = ".$_GET[$attr[0]];
			}
		}
		$sql .= " AND ";
	}
}

$sql .= "1;";

$response = $pdo->query($sql);
$table = $response->fetchAll(PDO::FETCH_NUM);

echo json_encode(array($desc, $table));

?>