<?php
	header("Content-Type: text/html; charset=UTF-8");
	$id = $_GET["id"];

	require_once 'connect.php';

	$payedStatus = $_POST["payed_status_name"];
	$cookStatus = $_POST["cookStatus"];
	$time = $_POST["turn"];

	$menuItems = "";
	for ($i=0; $i < count($_POST["order"]); $i++) { 
		$menuItems .= $_POST["order"][$i] . ",";
	}

	$result = $mysql -> query("UPDATE `orders` SET `fk_payed_status_id` = '$payedStatus', `fk_cooking_status_id` = '$cookStatus', `fk_menu_id` = '$menuItems' WHERE `order_id` = $id");
	header('Location: ../pages/admin_header.php');

	$mysql -> close();