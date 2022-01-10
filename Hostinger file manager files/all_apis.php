<?php
date_default_timezone_set('Asia/Kolkata'); 
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, X-Requested-With");
header('Content-Type: text/html; charset=utf-8');
include 'DatabaseConfig.php' ;


    $conn = mysqli_connect($HostName, $HostUser, $HostPass, $DatabaseName);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    
    $func = $_REQUEST['func'];

switch ($func) {
    
    case "test":
        $sql = "Select * from test";
        break;
    
    
    default:
        echo "Please enter Function name";
    
    
}
    $result = $conn->query($sql);
    $products = array();
    while ($product = mysqli_fetch_assoc($result)) 
    {
        $products[] = array_merge($product);
    }
    
    echo json_encode($products);
  
   mysqli_close($conn);
?>