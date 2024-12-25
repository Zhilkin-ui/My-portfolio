<?php
	include 'testOrders.php';
	require_once '../php/connect.php';

	session_start();

	$id = $_GET["id"];
	$result = $mysql -> query("SELECT * FROM `orders` WHERE order_id = $id");
	$row = $result -> fetch_assoc();

	$paymentStatus = array();

	$result = $mysql -> query("SELECT * FROM `payed_status`");
	while ($row1 = $result -> fetch_assoc())
	{
		$paymentStatus[$row1["payed_status_id"]] = $row1["payed_status_name"];
	}

	$tempMenuItems = explode(",", $row["fk_menu_id"]);

	// киря мне вообще по боку, я не хочу делать 100500 миллиардов запросов в несчастную бд чтоб превратить номер статуса в нормальную строку
	$cookStatus = array(
		1 => "Готовится",
		2 => "Готов"
	);

	$menuItems = array();
	// конвертирует из последовательного массива (индексы как 0, 1, 2, 3, ...) в словарь с ключами (индексы как 5, 3, 10, "фыв")
	// сделано для удобства
	for ($i=0; $i < count($tempMenuItems); $i++) { 
		$menuItems[$tempMenuItems[$i]] = true;
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
	<form class="edit_order" enctype="multipart/form-data" action="../php/update_order.php?id=<?=$id;?>" method="post">
		<div>ID:</div>
		<div><?=$id;?></div>
		<div>Время:</div>
		<div>2023-05-26 01:03:07</div>

		<label for="cookStatus">Статус готовности:</label>
		<select name="cookStatus">
			<?php
			for ($cookStatusId=1; $cookStatusId <= count($cookStatus); $cookStatusId++) { 
				?>
				<option <?=$cookStatusId == $row["fk_cooking_status_id"] ? "selected" : "";?> value="<?=$cookStatusId;?>"><?=$cookStatus[$cookStatusId];?></option>
				<?php
			}
			?>
		</select><br>

		<label for="payed_status_name">Статус оплаты:</label>
		<select name="payed_status_name">
			<?php
			$isDisabled = $_SESSION["user"]["isCook"] ? "disabled" : "";
			for ($paymentStatusId=1; $paymentStatusId <= count($paymentStatus); $paymentStatusId++) { 
				?>
				<option <?=$paymentStatusId == $row["fk_payed_status_id"] ? "selected" : "";?> <?=$isDisabled;?> value="<?=$paymentStatusId;?>"><?=$paymentStatus[$paymentStatusId];?></option>
				<?php
			}
			?>
		</select><br>
		<label for="menu">блюда</label>
		<?php
		if ($_SESSION["user"]["isAdmin"] || $_SESSION["user"]["isWaiter"])
		{
			for ($orderId=0; $orderId < count($placeholderOrders); $orderId++) { 
				$order = $placeholderOrders[$orderId];
				?>
				<span>
					<input type="checkbox" name="order[]" value="<?=$orderId+1;?>" <?=isset($menuItems[$orderId+1]) ? "checked" : "";?>><label><?=$order["menu"];?></label>
				</span>
				<?php
			}
		}
		else if ($_SESSION["user"]["isCook"])
		{
			for ($orderId=0; $orderId < count($placeholderOrders); $orderId++) { 
				$order = $placeholderOrders[$orderId];
				?>
				<span>
					<input type="checkbox" name="order[]" value="<?=$orderId+1;?>" <?=isset($menuItems[$orderId+1]) ? "checked" : "";?> disabled><label><?=$order["menu"];?></label>
				</span>
				<?php
			}
		}
		?>
		<br>
		<input type="submit" name="submit-edit-user">
	</form>
</body>
</html>