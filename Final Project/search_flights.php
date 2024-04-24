<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
        p {
            margin-bottom: 10px;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Search Results</h1>
    
    <?php
    // Connect to the database
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "WPAirways";

    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Retrieve search parameters
    $origin = $_GET['origin'];
    $destination = $_GET['destination'];
    $date = $_GET['departure_date'];

    // Prepare and execute SQL query
    $sql = "SELECT * FROM Flights WHERE OriginAirportID = '$origin' AND DestinationAirportID = '$destination' AND DATE(DepartureTime) = '$date'";
    $result = $conn->query($sql);

    // Display search results
    if ($result->num_rows > 0) {
        echo "<p>Flights from $origin to $destination on $date:</p>";
        echo "<table>";
        echo "<tr><th>Flight Number</th><th>Origin</th><th>Destination</th><th>Departure Time</th><th>Arrival Time</th></tr>";
        while($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>".$row["FlightNumber"]."</td>";
            echo "<td>".$row["OriginAirportID"]."</td>";
            echo "<td>".$row["DestinationAirportID"]."</td>";
            echo "<td>".$row["DepartureTime"]."</td>";
            echo "<td>".$row["ArrivalTime"]."</td>";
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "<p>No flights found for the selected criteria.</p>";
    }

    // Close database connection
    $conn->close();
    ?>
    <br>
    <a href="wpair.php">Go back to search</a>
</body>
</html>
