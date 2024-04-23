<?php
// Database connection details
$connection = mysqli_connect("localhost", "root", "CODE", "WPAirways");

// Check if the connection was successful
if (!$connection) {
    die("Could not connect: " . mysqli_connect_error());
}

// SQL query to select all rows from the 'airports' table
$airports = "SELECT * FROM airports;";

// Execute the query and store the result set
$stmt = mysqli_query($connection, $airports);

// Start the HTML table
echo "<table>";

// Display the table header row
echo "<tr><th>Airport Name</th><th>City</th><th>Country</th><th>IATA Code</th></tr>";

// Loop through each row in the result set
while ($row = mysqli_fetch_array($stmt, MYSQLI_ASSOC)) {
    // Start a new table row
    echo "<tr>";

    // Display the columns for this row
    echo "<td>" . $row['AirportName'] . "</td>";
    echo "<td>" . $row['City'] . "</td>";
    echo "<td>" . $row['Country'] . "</td>";
    echo "<td>" . $row['IATACode'] . "</td>";

    // End the table row
    echo "</tr>";
}

// End the HTML table
echo "</table>";
?>