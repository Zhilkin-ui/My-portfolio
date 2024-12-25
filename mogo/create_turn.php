<?php
	header("Content-Type: text/html; charset=UTF-8");
	$date = $_POST['date'];
	
	$fk_turn_time_id = $_POST['fk_turn_time_id'];

	$workers = "";
	for ($i=0; $i < count($_POST["workers"]); $i++) { 
		$workers .= $_POST["workers"][$i] . ",";
	}

	require_once 'connect.php';

	$all = $mysql -> query("SELECT `date`, `fk_turn_time_id` FROM `turns` WHERE `date` = '$date' AND `fk_turn_time_id` = '$fk_turn_time_id'");

	if ($all->num_rows > 0) {
		echo "<p>Такая смена уже существует</p>";
	} else {
		$result = $mysql -> query("INSERT INTO `turns` (`date`, `fk_turn_time_id`, `workers`)VALUES ('$date', '$fk_turn_time_id', '$workers')");
		header('Location: ../pages/admin_header.php');
	}

	$mysql -> close();

	//header('location: ../pages/admin_header.php');
	
?>