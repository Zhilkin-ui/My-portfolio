<?php
	header("Content-Type: text/html; charset=UTF-8");
	$id = $_GET["id"];

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


	require_once 'connect.php';

	$result = $mysql -> query("UPDATE `workers` SET `login` = '$login', `password` = '$password', `fname` = '$fname', `lname` = '$lname', `mname` = '$mname', `fk_role_id` = $fk_role_id, `avatar` = '$finalPath' WHERE `id` = $id");
	header('Location: ../pages/admin_header.php');

	$mysql -> close();