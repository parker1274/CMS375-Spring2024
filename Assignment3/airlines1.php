<?php

$servername = "localhost";
$username = "root";
$password = "#"; // your password
$dbname = "airlines1";

// create connection

$connection = mysqli_connect($servername, $username, $password, $dbname);
if(!$connection)
  die("couldn't connect".mysqli_connect_error());
else
echo 'Connection Success';

?>
