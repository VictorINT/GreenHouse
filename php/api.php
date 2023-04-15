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

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  // Get the temperature and humidity data from the POST request
  $temperature = $_POST['temperature'];
  $humidity = $_POST['humidity'];
  $soil_humidity = $_POST['soil'];
  echo "data recieved through post method -> ";
  echo "temperature: " . $temperature . ", ";
  echo "humidity: " . $humidity . ", ";
  echo "soil humidity: " . $soil_humidity;
  // Insert the temperature and humidity data into the MySQL database
  $sql = "INSERT INTO readings VALUES (default, '$temperature', '$humidity', '$soil_humidity', default)";
  if (mysqli_query($conn, $sql)) {
    echo "Temperature and humidity data added successfully";
  } else {
    echo "Error adding temperature and humidity data: " . mysqli_error($conn);
  }
}
else if ($_SERVER['REQUEST_METHOD'] === 'GET')
{
  
}
// Close the connection
mysqli_close($conn);
