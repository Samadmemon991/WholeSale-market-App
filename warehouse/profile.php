<?php



include_once("mysql.php");
$username = $_GET['username'];
$query = mysqli_query($conn, "SELECT * FROM customer WHERE username='$username' LIMIT 0,1") or die("Category Query");

while($row = mysqli_fetch_array($query)){
    echo json_encode($row);
}

