<?php
	require_once 'connect.php';

	$result = $mysql -> query("SELECT `turn_id`, `date`, `fk_turn_time_id`, `fk_turn_status_id` FROM `turns`");

	while ($row = $result -> fetch_assoc()) {
		$id = $row['turn_id'];
		$date = $row['date'];
		$turn = $row['fk_turn_time_id'];
		$fk_turn_status_id = $row['fk_turn_status_id'];

		echo '<tr>
		<td onclick='.'linkcontent("../pages/turn.php?id=' . $id . '")'.'>'.$id.'</td>
		<td onclick='.'linkcontent("../pages/turn.php?id=' . $id . '")'.'>'.$date.'</td>
		<td onclick='.'linkcontent("../pages/turn.php?id=' . $id . '")'.'>'.$turn.'</td>
		<td onclick='.'linkcontent("../php/fireTurn.php?id=' . $id . '")'.'>'.($fk_turn_status_id == 1 ? "Открыть" : "Закрыть").'</td>
		</tr>';
	}
	
?>