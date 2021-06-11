<?php



include_once("mysql.php");
if(isset($_GET['customer'])){
    $cat = $_GET['customer'];
    $query = mysqli_query($conn, "SELECT * FROM customer WHERE username='$cat' LIMIT 0,1") or die("Category Query");
    $c_id = mysqli_fetch_array($query)['id'];
    
    $query2 = mysqli_query($conn, "SELECT * FROM orders WHERE Customer_Id=$c_id") or die("Category Query");

    $order_json = [];
    
    while($row = mysqli_fetch_array($query2)){
        $order_id  = $row['id'];
        $query3 = mysqli_query($conn, "SELECT * FROM order_details WHERE order_id=$order_id") or die("Category Query");
        $products = [];
        while($row2 = mysqli_fetch_array($query3)){
            $p_id = $row2['product_id'];
            $query4 = mysqli_query($conn, "SELECT Product_name FROM products WHERE id=$p_id") or die("Category Query");

            array_push($products, mysqli_fetch_array($query4));
            
        }
        $order = ["order"=>$row, "products"=>$products];
        array_push($order_json, $order);

    }
    
    echo json_encode($order_json);
}
