<?php
include 'db.php';

$result = $conn->query("SELECT * FROM Bookings JOIN Passengers ON Bookings.PassengerID = Passengers.PassengerID JOIN Flights ON Bookings.FlightID = Flights.FlightID");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Current Bookings</h2>
    <table class="table">
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Passenger Name</th>
                <th>Flight Number</th>
                <th>Booking Date</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?= htmlspecialchars($row['BookingID']) ?></td>
                <td><?= htmlspecialchars($row['FirstName']) . ' ' . htmlspecialchars($row['LastName']) ?></td>
                <td><?= htmlspecialchars($row['FlightNumber']) ?></td>
                <td><?= htmlspecialchars($row['BookingDate']) ?></td>
            </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</div>
</body>
</html>
