<?php
	require_once '../php/connect.php';

	$id = $_GET["id"];
	$result = $mysql -> query("SELECT * FROM `workers` WHERE id = $id");
	$row = $result -> fetch_assoc();

	$jobIdToString = array(
		"---",
		"Повар",
		"Официант",
		"Администратор"
	);

	$getJobName = function($jobId) use($jobIdToString)
	{
		return $jobIdToString[$jobId];
	};
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
	<form class="edit_profile" enctype="multipart/form-data" action="../php/update_user.php?id=<?=$id;?>" method="post">
		<div>Аватар:</div>
		<img src="../<?=$row["avatar"];?>" width="48px" height="48px">
		<label for="avatar">Новый аватар:</label>
    	<input type="hidden" name="MAX_FILE_SIZE" value="999999999" />
		<input type="file" name="avatar" accept="image/png, image/jpeg">
		<label for="name">Имя:</label>
		<input type="text" name="fname" value="<?=$row["fname"];?>">
		<label for="lname">Фамилия:</label>
		<input type="text" name="lname" value="<?=$row["lname"];?>">
		<label for="mname">Отчество:</label>
		<input type="text" name="mname" value="<?=$row["mname"];?>">
		<label for="edit_profile">Должность:</label>
		<select name="fk_role_id">
			<?php
			for ($jobId=0; $jobId < count($jobIdToString); $jobId++) { 
				?>
				<option <?=$jobId == $row["fk_role_id"] ? "selected" : "";?> value="<?=$jobId;?>"><?=$getJobName($jobId);?></option>
				<?php
			}
			?>
		</select>
		<label for="login">Логин:</label>
		<input type="text" name="login" value="<?=$row["login"];?>">
		<label for="password">Пароль:</label>
		<input type="password" name="password" value="">
		<br>
		<input type="submit" name="submit-edit-user">
	</div>
</body>
</html>