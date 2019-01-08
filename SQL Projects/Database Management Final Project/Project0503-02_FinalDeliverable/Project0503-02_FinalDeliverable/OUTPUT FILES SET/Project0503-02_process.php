<?php
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "Nexus";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
$gender = $_POST["gender"];	
$dob = $_POST["dob"];

$sql = "SELECT * FROM Alumnus WHERE alumGender ".$gender." AND alumDOB ".$dob;
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    echo "<table align='center' border='1'> <tr> <th>ID</th> <th>First Name</th> <th>Last Name</th> <th>Gender</th> <th>Date of Birth</th> </tr>";
	while($row = mysqli_fetch_assoc($result)) {
        echo "<tr><td>" . $row["alumId"]. "</td><td>" . $row["alumFName"]. "</td><td>" . $row["alumLName"]. "</td><td>" . $row["alumGender"]. "</td><td>" . $row["alumDOB"]."</td></tr><br>";
    }
	echo "</table>";
} else {
    echo "0 results";
}
mysqli_close($conn);
?>
<center><h3><a href="http://localhost:8080/HTML/Project0503-02_nexus.php">Go Back</a></h3></center>