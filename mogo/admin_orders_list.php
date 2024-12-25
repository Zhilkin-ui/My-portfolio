<?php
	session_start();

	require_once 'connect.php';

	$id = $_SESSION["user"]["id"];

	$result = $mysql -> query("SELECT `order_id`,concat(`lname`, ' ', `fname`, ' ', `mname`) AS `fullname`, `order_time`, `payed_status_name`,`cooking_status_name`, `comment` FROM `orders` JOIN `payed_status` ON `orders`.`fk_payed_status_id`=`payed_status`.`payed_status_id` JOIN `cooking_status` ON `orders`.`fk_cooking_status_id`=`cooking_status`.`cooking_status_id` JOIN `workers` ON `orders`.`fk_worker_id`=`workers`.`id`");

	while ($row = $result -> fetch_assoc()) {
		$order_id = $row['order_id'];
		$fullname = $row['fullname'];
		$order_time = $row['order_time'];
		$cooking_status_name = $row['cooking_status_name'];
		$payed_status_name = $row['payed_status_name'];
		$comment = $row['comment'];

		echo '<tr onclick='.'linkcontent("../pages/order.php?id=' . $order_id . '")'.'>
		<td>'.$order_id.'</td>
		<td>'.$fullname.'</td>
		<td>'.$order_time.'</td>
		<td>'.$payed_status_name.'</td>
		<td>'.$cooking_status_name.'</td>
		<td>'.$comment.'</td>
		</tr>';
	}
?>