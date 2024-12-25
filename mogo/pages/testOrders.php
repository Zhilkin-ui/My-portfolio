<?php
	require_once '../php/connect.php';

	$placeholderOrders = array();

	$result = $mysql -> query("SELECT * FROM `menu`");
	$i = 0;
	while ($row = $result -> fetch_assoc()) {
		$placeholderOrders[$i] = array(
			"menu" => $row["menu_id"] . " " . $row["menu_name"]
		);
		$i++;
	}
?>