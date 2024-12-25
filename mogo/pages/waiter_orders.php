<?php
	include 'testOrders.php';
	require_once '../php/connect.php';
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<script type="text/javascript" src="../js/index.js"></script>
</head>
<body>
	<br>
	<form class="" id="create-order" action="../php/create_order.php" method="post">
		<?php
			for ($orderId=0; $orderId < count($placeholderOrders); $orderId++) { 
				$order = $placeholderOrders[$orderId];
				?>
				<span>
					<input type="checkbox" name="order[]" value="<?=$orderId+1;?>" <?=isset($menuItems[$orderId+1]) ? "checked" : "";?>><label><?=$order["menu"];?></label>
				</span>
				<?php
			}
		?>
		<textarea form="create-order" placeholder="Комментарий" name="comment"></textarea>
		<br>
		<input type="submit" name="new_orders">
	</form>
	<br>
	<div class="orders">
		<table class="orders-table">
			<thead>
				<th>№</th>
				<th>время</th>
				<th>блюда</th>
				<th>статус оплаты</th>
				<th>комментарий</th>
			</thead>
			<?php require_once '../php/waiter_orders_list.php'?><tbody>
				<tr onclick='linkcontent("order.php")'>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>