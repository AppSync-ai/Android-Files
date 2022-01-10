<?php 

$to = $_GET['to'];
$message = $_GET['message'];
$title = $_GET['title'];

$finalTopic = "'".$to."' in topics";

$API_ACCESS_KEY = "AAAAjLJNj_c:APA91bGR0fbxrgoEyyfsML8tp516aG5UEFn8Ftx7B1bjMD-06krXOfRnl8Mj-IxTGlJ1LfVyjNubp_5OpFUBgl5_P5yTSmRdGqaASff8tZVxplLQ11mQUQFKZuRuFxot_ZC1K2h2RDqE";

$data = array("condition" => $finalTopic,  "priority" => "high", "notification" => array( "title" => "".$title, "body" => "".$message));
$data_string = json_encode($data);
// echo "The Json Data : ".$data_string;
$headers = array ( 'Authorization: key=' . $API_ACCESS_KEY, 'Content-Type: application/json' );
$ch = curl_init(); curl_setopt( $ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
curl_setopt( $ch,CURLOPT_POST, true );
curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
curl_setopt( $ch,CURLOPT_POSTFIELDS, $data_string);
$result = curl_exec($ch);
curl_close ($ch);
// echo "<p>&nbsp;</p>";
// echo "The Result : ".$result;

?>