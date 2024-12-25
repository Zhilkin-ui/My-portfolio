<?php
	session_start();

	require_once 'connect.php';

	$id = $_SESSION["user"]["id"];

	$result = $mysql -> query("SELECT `order_id`, `order_time`, `payed_status_name`, `menu_name`, `comment` FROM `orders` JOIN `payed_status` ON `orders`.`fk_payed_status_id`=`payed_status`.`payed_status_id` JOIN `cooking_status` ON `orders`.`fk_cooking_status_id`=`cooking_status`.`cooking_status_id` JOIN `workers` ON `orders`.`fk_worker_id`=`workers`.`id` JOIN `menu` ON `orders`.`fk_menu_id`=`menu`.`menu_id` WHERE `fk_worker_id`= '$id'");

	while ($row = $result -> fetch_assoc()) {
		$order_id = $row['order_id'];
		$order_time = $row['order_time'];
		$menu_name = $row['menu_name'];
		$payed_status_name = $row['payed_status_name'];
		$comment = $row['comment'];

		echo '<tr onclick='.'linkcontent("../pages/order.php?id=' . $order_id . '")'.'>
		<td>'.$order_id.'</td>
		<td>'.$order_time.'</td>
		<td>'.$menu_name.'</td>
		<td>'.$payed_status_name.'</td>
		<td>'.$comment.'</td>
		</tr>';
	}
?>