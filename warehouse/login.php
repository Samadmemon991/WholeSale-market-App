<?php

include_once("mysql.php");

$postdata = file_get_contents("php://input");
$request = json_decode($postdata,true);

if( isset($request['username']) && isset($request['password'])){

    $username = $request['username'];
    $password = $request['password'];

    $query = mysqli_query($conn, "SELECT * FROM customer where username='$username' AND C_Pass='$password'") or die("Login Query");
    if(mysqli_num_rows($query) > 0){
        echo json_encode( ["message" => "loggedin"] );
    }else{
        echo json_encode( ["message" => "error"] );
    }
}
