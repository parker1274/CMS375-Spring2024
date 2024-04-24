<?php
include 'db.php';

$message = '';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $bookingId = $_POST['bookingId'];
    $newFlightId = $_POST['newFlightId'];

    $stmt = $conn->prepare("UPDATE Bookings SET FlightID = ? WHERE BookingID = ?");
    $stmt->bind_param("ii", $newFlightId, $bookingId);
    if ($stmt->execute()) {
        $message = "Booking updated successfully!";
    } else {
        $message = "Error updating record: " . $stmt->error;
    }
    $stmt->close();
    $conn->close();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Update Booking</h2>
    <p><?= $message ?></p>
    <form method="post">
        <div class="mb-3">
            <label for="bookingId" class="form-label">Booking ID:</label>
            <input type="number" class="form-control" id="bookingId" name="bookingId" required>
        </div>
        <div class="mb-3">
            <label for="newFlightId" class="form-label">New Flight ID:</label>
            <input type="number" class="form-control" id="newFlightId" name="newFlightId" required>
        </div>
        <button type="submit" class="btn btn-primary">Update Booking</button>
    </form>
</div>
</body>
</html>
