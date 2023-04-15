<?php

// Connect to the MySQL database
$host = "localhost";
$username = "victor";
$password = "password";
$dbname = "home";
$conn = mysqli_connect($host, $username, $password, $dbname);

// Check the connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
  $sql = "SELECT * FROM readings ORDER BY id DESC LIMIT 1";
  $result = $conn->query($sql);

  $final = array();
  
  while($row =mysqli_fetch_assoc($result))
  {
      $final[] = $row;
  }

  echo json_encode($final);
}

// Close the connection
mysqli_close($conn);
