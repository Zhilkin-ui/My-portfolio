<?php
	header("Content-Type: text/html; charset=UTF-8");
	$id = $_GET["id"];

	require_once 'connect.php';

	$date = $_POST["date"];
	$time = $_POST["turn"];

	$workers = "";
	for ($i=0; $i < count($_POST["worker"]); $i++) { 
		$workers .= $_POST["worker"][$i] . ",";
	}

	$result = $mysql -> query("UPDATE `turns` SET `date` = '$date', `fk_turn_time_id` = '$time', `workers` = '$workers' WHERE `turn_id` = $id");
	header('Location: ../pages/admin_header.php');

	$mysql -> close();