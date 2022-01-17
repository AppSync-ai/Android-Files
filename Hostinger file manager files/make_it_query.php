<?php

include 'DatabaseConfig.php' ;
 
 $con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
 
 $query = $_REQUEST['query'];
 $code = $_REQUEST['code'];

 $Sql_Query = $query;
 
 if(mysqli_query($con,$Sql_Query)){
 
         if($code != null)
         {
            echo $code;
         }
         else {
             echo 'Data submited successfully';
         }
 }
 else{
 
 echo 'Try Again';
 
 }
 mysqli_close($con);
?>