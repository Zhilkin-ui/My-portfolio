<?php
include 'testUsers.php';
?>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title></title>
		<script type="text/javascript" src="../js/index.js"></script>
		<style type="text/css">
			@import url("../css/style.css");
		</style>
	</head>
	<body>
		<div class="users">
			<table class="users-table" border="1">
				<thead>
					<th>ID</th>
					<th>ФИО</th>
					<th>Должность</th>
					<th>Спец. возможности</th>
				</thead>
				
				<?php require_once '../php/workers.php'?>
			</table>
		</div>

		<center><h2>Создать нового пользователя</h2></center>
		<div class="create-user">
			<form id="create-user" enctype="multipart/form-data" action="../php/create_user.php" method="post">
				<input type="text" name="login" placeholder="login">
				<input type="password" name="password" placeholder="password">
				<input type="text" name="fname" placeholder="Имя">
				<input type="text" name="lname" placeholder="Фамилия">
				<input type="text" name="mname" placeholder="Отчество">
				<select form="create-user" name="fk_role_id">
					<option value="0">---</option>
					<option value="1">Повар</option>
					<option value="2">Официант</option>
					<option value="3">Администратор</option>
				</select>
				<input type="file" name="avatar" accept="image/png, image/jpeg, image/jpg">
				<input type="submit" name="reg" value="Создать">
			</form>
		</div>
	</body>
</html>