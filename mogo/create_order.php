<?php
	session_start();

	header("Content-Type: text/html; charset=UTF-8");
	//$fk_menu_id = $_POST['fk_menu_id'];
	$fk_menu_id = "";
	for ($i=0; $i < count($_POST["order"]); $i++) { 
		$fk_menu_id .= $_POST["order"][$i] . ",";
	}
	$id = $_SESSION["user"]["id"];
	$comment = $_POST['comment'];

	require_once 'connect.php';

	$result = $mysql -> query("INSERT INTO `orders` (`fk_payed_status_id`, `fk_cooking_status_id`, `fk_worker_id`, `fk_menu_id`, `comment`) VALUES ('2', '1', '$id', '$fk_menu_id', '$comment')");
	$mysql -> close();

	header('location: ../pages/admin_header.php');
	
?>