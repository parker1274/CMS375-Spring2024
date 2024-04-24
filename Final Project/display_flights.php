<?php
include 'db.php'; // Include your database connection

// SQL query to select all flights
$sql = "SELECT FlightID, FlightNumber, OriginAirportID, DestinationAirportID, DepartureTime, ArrivalTime FROM Flights";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Display Flights</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 20px;
        }
        table {
            width: 100%;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mb-4">Flight Details</h1>

    <!-- Flight Table -->
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Flight ID</th>
                    <th>Flight Number</th>
                    <th>Origin Airport ID</th>
                    <th>Destination Airport ID</th>
                    <th>Departure Time</th>
                    <th>Arrival Time</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . $row["FlightID"] . "</td>";
                        echo "<td>" . $row["FlightNumber"] . "</td>";
                        echo "<td>" . $row["OriginAirportID"] . "</td>";
                        echo "<td>" . $row["DestinationAirportID"] . "</td>";
                        echo "<td>" . $row["DepartureTime"] . "</td>";
                        echo "<td>" . $row["ArrivalTime"] . "</td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='6'>No results found</td></tr>";
                }
                ?>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>

<?php $conn->close(); ?>
