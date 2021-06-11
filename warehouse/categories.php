<?php



include_once("mysql.php");

$query = mysqli_query($conn, "SELECT * FROM category") or die("Category Query");

$arr_json = [];

while($row = mysqli_fetch_array($query)){
    array_push($arr_json, $row);
}

echo json_encode($arr_json);