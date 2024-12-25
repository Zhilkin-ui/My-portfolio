<?php
	include 'testUsers.php';
	require_once '../php/connect.php';

	$id = $_GET["id"];
	$result = $mysql -> query("SELECT * FROM `turns` WHERE turn_id = $id");
	$row = $result -> fetch_assoc();

	$tempAssignedWorkes = explode(",", $row["workers"]);

	$assignedWorkers = array();
	// конвертирует из последовательного массива (индексы как 0, 1, 2, 3, ...) в словарь с ключами (индексы как 5, 3, 10, "фыв")
	// сделано для удобства
	for ($i=0; $i < count($tempAssignedWorkes); $i++) { 
		$assignedWorkers[$tempAssignedWorkes[$i]] = true;
	}
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
	<form class="edit_turn" method="post" action="../php/update_turn.php?id=<?=$id;?>">
		<label for="date">Дата:</label>
		<input type="date" name="date" value="<?=$row["date"];?>">
		<label for="turn">Смена:</label>
		<span><input type="radio" name="turn" value="9:00-18:00" required>
		<label>9:00-18:00</label></span>
		<span><input type="radio" name="turn" value="18:00-9:00" required>
		<label>18:00-9:00</label></span>
		<label>работники:</label>
		<?php
		for ($userId=0; $userId < count($placeholderUsers); $userId++) { 
			$user = $placeholderUsers[$userId];
			?>
			<span>
				<input type="checkbox" name="worker[]" value="<?=$userId;?>" <?=isset($assignedWorkers[$userId]) ? "checked" : "";?>><label><?=$user["name"];?></label>
			</span>
			<?php
		}
		?>
		<input type="submit" name="submit-edit-turn">
	</div>
</body>
</html>