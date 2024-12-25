<?php
include 'testUsers.php';

?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<style type="text/css">
		@import url("../css/style.css")
	</style>
</head>
<body>
	<div class="turns">
		<table class="turns-table" >
			<thead>
				<th>№</th>
				<th>дата</th>
				<th>смена</th>
				<th>спец. возможности</th>
			</thead>

			<?php require_once '../php/turns_list.php'?>
			
		</table>
	</div>
	<form class="new-turns" action="../php/create_turn.php" method="post">
		<input type="date" name="date" required>
		<span><input type="radio" name="fk_turn_time_id" value="9:00-18:00" required>
		<label>9:00-18:00</label></span>
		<span><input type="radio" name="fk_turn_time_id" value="18:00-9:00" required>
		<label>18:00-9:00</label></span>
		<?php
		for ($i=0; $i < count($placeholderUsers); $i++) { 
			$user = $placeholderUsers[$i];
			?>
			<span>
				<input type="checkbox" value="<?=$i;?>" name="workers[]"><label><?=$user["name"];?></label>
			</span>
			<?php
		}
		?>
		<input type="submit" name="submit">
	</form>
</body>
</html>