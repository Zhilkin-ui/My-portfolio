<?php
	session_start();

	require_once 'connect.php';

	$id = $_SESSION["user"]["id"];

	$result = $mysql -> query("SELECT `order_id`, `order_time`, `cooking_status_name`, `menu_name`, `comment` FROM `orders` JOIN `cooking_status` ON `orders`.`fk_cooking_status_id`=`cooking_status`.`cooking_status_id` JOIN `menu` ON `orders`.`fk_menu_id`=`menu`.`menu_id` JOIN `payed_status` ON `orders`.`fk_payed_status_id`=`payed_status`.`payed_status_id` WHERE `payed_status_id`=2");
	
	while ($row = $result -> fetch_assoc()) {
		$order_id = $row['order_id'];
		$order_time = $row['order_time'];
		$menu_name = $row['menu_name'];
		$cooking_status_name = $row['cooking_status_name'];
		$comment = $row['comment'];

		echo '<tr onclick='.'linkcontent("../pages/cook_order.php?id=' . $order_id . '")'.'>
		<td>'.$order_id.'</td>
		<td>'.$order_time.'</td>
		<td>'.$menu_name.'</td>
		<td>'.$cooking_status_name.'</td>
		<td>'.$comment.'</td>
		</tr>';
	}
?>