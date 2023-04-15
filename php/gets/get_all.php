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
  $sql = "SELECT * FROM readings";
  $result = $conn->query($sql);
  
//   if ($result->num_rows > 0) {
//     // output data of each row
//     while($row = $result->fetch_assoc()) {
//       echo "id: " . $row["id"]. ", temperature: " . $row["temperature"]. ", humidity: " . $row["humidity"]. ", timestamp: ". $row["timestamp"]. "<br>";
//     }
//   } else {
//     echo "0 results";
//   }
// }
$final = array();
  
while($row =mysqli_fetch_assoc($result))
{
    $final[] = $row;
}

echo json_encode($final);
// Close the connection
mysqli_close($conn);
}