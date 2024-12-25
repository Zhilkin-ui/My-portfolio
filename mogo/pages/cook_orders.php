<?php

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
	<div class="orders">
		<table class="orders-table">
			<thead>
				<th>№</th>
				<th>время</th>
				<th>блюда</th>
				<th>готовность</th>
				<th>комментарий</th>
			</thead>
			<tbody>
				<?php require_once '../php/cook_orders_list.php'?>
				<!--<tr onclick='linkcontent("order.php")'>
					<td>1</td>
					<td>12:00</td>
					<td>Золотое яблоко</td>
					<td>Готов</td>
				</tr>-->
			</tbody>
		</table>
	</div>
</body>
</html>