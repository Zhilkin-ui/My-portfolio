<?php
	session_start();
	?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Admin</title>
	<script type="text/javascript" src="../js/index.js"></script>
	<style type="text/css">
		@import url("../css/style.css");
	</style>
</head>
<body>
	<header>
		<div class="nav-scroll">
			<nav class="nav-scroll_items">
				<a class="nav-scroll_item" href="#" onclick='linkcontent("waiter_orders.php")'>Заказы</a>
				<a class="nav-scroll_item last-item" href="#" onclick='linkcontent("accaunt.php")'><?=$_SESSION["user"]["login"];?></a>
			</nav>
		</div>
	</header>
	<div id="content"></div>
	<div id="loading"></div>
</body>
</html>