<?php
include 'db.php';

$message = '';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $passengerId = $_POST['passengerId'];
    $flightId = $_POST['flightId'];
    $bookingDate = date('Y-m-d'); // Defaulting to the current date for the booking

    $stmt = $conn->prepare("INSERT INTO Bookings (PassengerID, FlightID, BookingDate) VALUES (?, ?, ?)");
    $stmt->bind_param("iis", $passengerId, $flightId, $bookingDate);
    if ($stmt->execute()) {
        $message = "New booking added successfully!";
    } else {
        $message = "Error: " . $stmt->error;
    }
    $stmt->close();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Add a New Booking</h2>
    <p><?= $message ?></p>
    <form action="insert.php" method="post">
        <div class="mb-3">
            <label for="passengerId" class="form-label">Passenger ID:</label>
            <input type="number" class="form-control" id="passengerId" name="passengerId" required>
        </div>
        <div class="mb-3">
            <label for="flightId" class="form-label">Flight ID:</label>
            <input type="number" class="form-control" id="flightId" name="flightId" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Booking</button>
    </form>
</div>
</body>
</html>
