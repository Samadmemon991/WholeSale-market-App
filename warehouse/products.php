<?php



include_once("mysql.php");
if(isset($_GET['id'])){
    $cat = $_GET['id'];
    $query = mysqli_query($conn, "SELECT id,CategoryId,Product_name,Product_SPrice FROM products where CategoryId=$cat") or die("Products Query");
    
    $arr_json = [];
    
    while($row = mysqli_fetch_array($query)){
        array_push($arr_json, $row);
    }
    
    echo json_encode($arr_json);
}
