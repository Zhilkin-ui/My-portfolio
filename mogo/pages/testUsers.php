<?php
	require_once '../php/connect.php';

	$placeholderUsers = array();

	$result = $mysql -> query("SELECT * FROM `workers` WHERE `fk_worker_status_id`=1");
	$i = 0;
	while ($row = $result -> fetch_assoc()) {
		$placeholderUsers[$i] = array(
			"name" => $row["lname"] . " " . $row["fname"] . " " . $row["mname"],
			"job" => $row["fk_role_id"],

			"isCook" => $row["fk_role_id"] == 1,
			"isWaiter" => $row["fk_role_id"] == 2,
			"isAdmin" => $row["fk_role_id"] == 3,
		);
		$i++;
	}
?>