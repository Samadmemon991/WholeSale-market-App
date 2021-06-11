<?php
require __DIR__ . '/vendor/autoload.php';
$basic  = new \Nexmo\Client\Credentials\Basic('9487ad35', 'EAZotUBN1AfXg8MP');
$client = new \Nexmo\Client($basic);



include_once("mysql.php");
if(isset($_GET['number'])){
    $number = $_GET['number'];
    $code = mt_rand(1000,9999); 

     $message = $client->message()->send([
         'to' => $number,
         'from' => 'Nexmo',
         'text' => 'Your Verification Code for Wholesale Management System is: '.$code
     ]);
   // $message = true;
            if($message){
                echo json_encode(["code"=>$code]);
            }else{
                echo json_encode(["error"=>"something went wrong"]);
            }
    
    
}
