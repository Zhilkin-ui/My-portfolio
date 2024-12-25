<?php 

	require_once 'connect.php';

	$id = $_GET["id"];
	$result = $mysql -> query("SELECT `fk_turn_status_id` FROM `turns` WHERE `turn_id`=$id");

	$row = $result -> fetch_assoc();
		$fk_turn_status_id = $row['fk_turn_status_id'];
	
	//$result = $mysql -> query("UPDATE `workers` SET fk_status_id=2 WHERE id = $id");
	($fk_turn_status_id == 1 ? $result = $mysql -> query("UPDATE `turns` SET `fk_turn_status_id`=2 WHERE `turn_id` = $id") : $result = $mysql -> query("UPDATE `turns` SET `fk_turn_status_id`=1 WHERE `turn_id` = $id"));


?>