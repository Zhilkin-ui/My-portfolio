<?php
	require_once 'connect.php';

	$result = $mysql -> query("SELECT `id`, concat(`lname`, ' ', `fname`, ' ', `mname`) AS `fullname`, `role_name`, `fk_worker_status_id` FROM `workers` JOIN `roles` ON `workers`.`fk_role_id`=`roles`.`role_id`");

	/*$jobIdToString = array(
		"---",
		"Повар",
		"Официант",
		"Администратор"
	);

	$getJobName = function($jobId) use($jobIdToString)
	{
		return $jobIdToString[$jobId];
	};*/

	while ($row = $result -> fetch_assoc()) {
		$id = $row['id'];
		$fullname = $row['fullname'];
		$role_name = $row['role_name'];
		$fk_worker_status_id = $row['fk_worker_status_id'];

		echo '<tr>
		<td onclick='.'linkcontent("../pages/user.php?id=' . $id . '")'.'>'.$id.'</td>
		<td onclick='.'linkcontent("../pages/user.php?id=' . $id . '")'.'>'.$fullname.'</td>
		<td onclick='.'linkcontent("../pages/user.php?id=' . $id . '")'.'>'.$role_name.'</td>
		<td onclick='.'linkcontent("../php/fireWorker.php?id='.$id.'")'.'>'.//;
		/*if($fk_worker_status_id == 1) {
			echo "Уволить";
		}else{echo "Принять";};*/
		($fk_worker_status_id == 1 ? "Уволить" : "Принять").
		'</td>
		</tr>';
	}
?>