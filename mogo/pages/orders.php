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
				<th>ФИО</th>
				<th>дата</th>
				<th>статус оплаты</th>
				<th>готовность</th>
				<th>комментарий</th>
			</thead>
			<tbody>

				<?php require_once '../php/admin_orders_list.php'?>
			</tbody>
		</table>
	</div>
</body>
</html>