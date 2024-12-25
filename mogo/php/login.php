<?php
	session_start();
	header("Content-Type: text/html; charset=UTF-8");
	$login = $_POST['login'];
	$password = $_POST['password'];

	#$password = crypt($password, '$1$rasmusle$');

	require_once 'connect.php';

	$auth = $mysql -> query("SELECT * FROM `workers` WHERE `login` = '$login' and `password` = '$password'");
	if ($auth -> num_rows == 1) {
		$result = $auth -> fetch_assoc();
		foreach ($result as $i) {
		 	echo $i;		 
		}
		$_SESSION['user']=$result;
		$_SESSION['user']["isCook"] = $_SESSION["user"]["fk_role_id"] == 1;
		$_SESSION['user']["isWaiter"] = $_SESSION["user"]["fk_role_id"] == 2;
		$_SESSION['user']["isAdmin"] = $_SESSION["user"]["fk_role_id"] == 3;
		header('Location: ../pages/admin_header.php');

	} else{
		echo "<p>вы ввели неправильный пароль</p>";
	}

	$mysql -> close();
?>