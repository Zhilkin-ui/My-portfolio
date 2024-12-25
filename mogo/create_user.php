<?php
	header("Content-Type: text/html; charset=UTF-8");

	require_once 'connect.php';

	$result = $mysql -> query("SELECT COUNT(`id`)+1 FROM `workers`");

	while ($row = $result -> fetch_assoc()){
	$id = $row['COUNT(`id`)+1'];
	}	
	$login = $_POST['login'];
	$login = preg_replace("/\s+/", "", $login);
	$login = stripslashes($login);
	$login = htmlspecialchars($login);
	$login = trim($login, ' \n');
	$password = $_POST['password'];

	$password = crypt($password, '$1$rasmusle$');

	$fname = $_POST['fname'];

	$lname = $_POST['lname'];

	$mname = $_POST['mname'];

	$fk_role_id = $_POST['fk_role_id'];

	$info = pathinfo($_FILES['avatar']['name']);
	$ext = $info["extension"];
	$avatarName = $id . "_avatar." . $ext;

	$finalPath = "img/" . $avatarName; // вот эта переменная тебе нужна будет для сохранения в бд

	move_uploaded_file($_FILES["avatar"]["tmp_name"], "../" . $finalPath);


	$all = $mysql -> query("SELECT `login` FROM `workers` WHERE `login` = '$login'");

	if ($all->num_rows > 0) {
		echo "<p>пользователь с таким именем или почтой уже существует</p>";
	} else {
		$result = $mysql -> query("INSERT INTO `workers` (`login`, `password`, `fname`, `lname`, `mname`, `fk_role_id`, `avatar`)VALUES ('$login', '$password', '$fname', '$lname', '$mname', '$fk_role_id', '$finalPath')");
		header('Location: ../pages/admin_header.php');
	}

	$mysql -> close();

	header('location: ../pages/admin_header.php');
	
?>