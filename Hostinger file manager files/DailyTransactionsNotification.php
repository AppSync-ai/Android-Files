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
    
    case "Transactions":
        $selected = "Inwards";
        $sql = "Select (select count(*) from Transactions where date = '".date("d/m/Y")."' AND type = 'in') as Inwards,
        (select count(*) from Transactions where date = '".date("d/m/Y")."' AND type = 'out') as Outwards;";
    
    
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
    
    if($selected=='Inwards')
    {
        $TodaysInwards = $products[0]['Inwards'];
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://novoagri.in/Other/snehi/fire_notification.php?title=Todays%20Transactions&message=Total%20Inwards%20Today%20:%20".$products[0]['Inwards']."%20and%20Total%20Outwards%20:%20".$products[0]['Outwards']."&to=admin");
        
        print_r($products);
        
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_exec($ch);
        curl_close($ch);
    }
    
    // echo "Final => ".$products[0]['Inwards'];
  
   mysqli_close($conn);
?>