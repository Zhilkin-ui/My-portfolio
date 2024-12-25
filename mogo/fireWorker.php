<?php 

	require_once 'connect.php';

	$id = $_GET["id"];
	$result = $mysql -> query("SELECT `fk_worker_status_id` FROM `workers` WHERE `id`=$id");

	$row = $result -> fetch_assoc();
		$fk_worker_status_id = $row['fk_worker_status_id'];
	
	//$result = $mysql -> query("UPDATE `workers` SET fk_status_id=2 WHERE id = $id");
	($fk_worker_status_id == 1 ? $result = $mysql -> query("UPDATE `workers` SET `fk_worker_status_id`=2 WHERE `id` = $id") : $result = $mysql -> query("UPDATE `workers` SET `fk_worker_status_id`=1 WHERE `id` = $id"));


?>