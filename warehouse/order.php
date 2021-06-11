<?php

include_once("mysql.php");

$postdata = file_get_contents("php://input");
$request = json_decode($postdata,true);

if( isset($request['customer']) && isset($request['products'])){

    $customer = $request['customer'];
    $products = $request['products'];
    $products_json = json_decode($products, true);
    $query = mysqli_query($conn, "SELECT * FROM customer where username='$customer' LIMIT 0,1") or die("Login Query");
    if(mysqli_num_rows($query) > 0){
        while($row = mysqli_fetch_array($query)){
            $c_id = $row['id'];
            $query3 = mysqli_query($conn, "INSERT INTO orders VALUES(0,$c_id, NOW())") or die("Order Create Query");
            $last_id = mysqli_insert_id($conn);

            foreach($products_json as $p){
                $p_id = $p['id'];
                $query2 = mysqli_query($conn, "INSERT INTO order_details VALUES(0,$last_id,$p_id )") or die("Login Query");

            }

            echo json_encode(["message"=>"order_created"]);
        }
    }
}
