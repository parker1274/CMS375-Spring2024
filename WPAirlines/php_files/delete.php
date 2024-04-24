<?php
include 'db.php';

$message = '';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $bookingId = $_POST['bookingId'];

    $stmt = $conn->prepare("DELETE FROM Bookings WHERE BookingID = ?");
    $stmt->bind_param("i", $bookingId);
    if ($stmt->execute()) {
        $message = "Booking deleted successfully!";
    } else {
        $message = "Error deleting record: " . $stmt->error;
    }
    $stmt->close();
    $conn->close();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Cancel Booking</h2>
    <p><?= $message ?></p>
    <form method="post">
        <div class="mb-3">
            <label for="bookingId" class="form-label">Booking ID:</label>
            <input type="number" class="form-control" id="bookingId" name="bookingId" required>
        </div>
        <button type="submit" class="btn btn-danger">Delete Booking</button>
    </form>
</div>
</body>
</html>
