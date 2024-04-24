<?php
include 'db.php'; // Ensure your database connection details are correct

$message = '';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $action = $_POST['action'];

    if ($action == 'Add') {
        $passengerName = $_POST['passengerName'];
        $flightNumber = $_POST['flightNumber'];
        $bookingDate = $_POST['bookingDate']; // Capture booking date from form if you want dynamic input

        // Fetch PassengerID using Passenger Name
        $passengerIDQuery = $conn->prepare("SELECT PassengerID FROM Passengers WHERE CONCAT(FirstName, ' ', LastName) = ?");
        $passengerIDQuery->bind_param("s", $passengerName);
        $passengerIDQuery->execute();
        $passengerIDResult = $passengerIDQuery->get_result();
        $passengerIDRow = $passengerIDResult->fetch_assoc();
        $passengerID = $passengerIDRow['PassengerID'];
        $passengerIDQuery->close();

        // Fetch FlightID using Flight Number
        $flightIDQuery = $conn->prepare("SELECT FlightID FROM Flights WHERE FlightNumber = ?");
        $flightIDQuery->bind_param("s", $flightNumber);
        $flightIDQuery->execute();
        $flightIDResult = $flightIDQuery->get_result();
        $flightIDRow = $flightIDResult->fetch_assoc();
        $flightID = $flightIDRow['FlightID'];
        $flightIDQuery->close();

        // Insert the booking
        $stmt = $conn->prepare("INSERT INTO Bookings (PassengerID, FlightID, BookingDate) VALUES (?, ?, ?)");
        $stmt->bind_param("iis", $passengerID, $flightID, $bookingDate);
        if ($stmt->execute()) {
            $message = "New booking added successfully!";
        } else {
            $message = "Error: " . $stmt->error;
        }
        $stmt->close();
    } elseif ($action == 'Update') {
        $passengerName = $_POST['passengerName'];
        $flightNumber = $_POST['flightNumber'];

        // Fetch PassengerID using Passenger Name
        $passengerIDQuery = $conn->prepare("SELECT PassengerID FROM Passengers WHERE CONCAT(FirstName, ' ', LastName) = ?");
        $passengerIDQuery->bind_param("s", $passengerName);
        $passengerIDQuery->execute();
        $passengerIDResult = $passengerIDQuery->get_result();
        $passengerIDRow = $passengerIDResult->fetch_assoc();
        $passengerID = $passengerIDRow['PassengerID'];
        $passengerIDQuery->close();

        // Fetch FlightID using Flight Number
        $flightIDQuery = $conn->prepare("SELECT FlightID FROM Flights WHERE FlightNumber = ?");
        $flightIDQuery->bind_param("s", $flightNumber);
        $flightIDQuery->execute();
        $flightIDResult = $flightIDQuery->get_result();
        $flightIDRow = $flightIDResult->fetch_assoc();
        $flightID = $flightIDRow['FlightID'];
        $flightIDQuery->close();

        // Update the booking
        $stmt = $conn->prepare("UPDATE Bookings SET FlightID = ? WHERE PassengerID = ?");
        $stmt->bind_param("ii", $flightID, $passengerID);
        if ($stmt->execute()) {
            $message = "Booking updated successfully!";
        } else {
            $message = "Error updating record: " . $stmt->error;
        }
        $stmt->close();
    } elseif ($action == 'Delete') {
        $passengerName = $_POST['passengerName'];

        // Fetch PassengerID using Passenger Name
        $passengerIDQuery = $conn->prepare("SELECT PassengerID FROM Passengers WHERE CONCAT(FirstName, ' ', LastName) = ?");
        $passengerIDQuery->bind_param("s", $passengerName);
        $passengerIDQuery->execute();
        $passengerIDResult = $passengerIDQuery->get_result();
        $passengerIDRow = $passengerIDResult->fetch_assoc();
        $passengerID = $passengerIDRow['PassengerID'];
        $passengerIDQuery->close();

        // Delete the booking
        $stmt = $conn->prepare("DELETE FROM Bookings WHERE PassengerID = ?");
        $stmt->bind_param("i", $passengerID);
        if ($stmt->execute()) {
            $message = "Booking deleted successfully!";
        } else {
            $message = "Error deleting record: " . $stmt->error;
        }
        $stmt->close();
    }
}

// Fetch all current bookings
$result = $conn->query("SELECT * FROM Bookings JOIN Passengers ON Bookings.PassengerID = Passengers.PassengerID JOIN Flights ON Bookings.FlightID = Flights.FlightID ORDER BY Bookings.BookingDate DESC");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Manage Bookings</h2>
    <p class="<?= !empty($message) ? 'alert alert-success' : '' ?>"><?= $message ?></p>

    <form action="manage_bookings.php" method="post">
        <div class="mb-3">
            <label for="passengerName">Passenger Name:</label>
            <input type="text" class="form-control" id="passengerName" name="passengerName" required>
            <label for="flightNumber">Flight Number:</label>
            <input type="text" class="form-control" id="flightNumber" name="flightNumber" required>
            <label for="bookingDate">Booking Date:</label>
            <input type="date" class="form-control" id="bookingDate" name="bookingDate" required>
            <button type="submit" name="action" value="Add" class="btn btn-primary mt-2">Add Booking</button>
        </div>
    </form>

    <form action="manage_bookings.php" method="post">
        <div class="mb-3">
            <label for="passengerNameUpdate">Passenger Name to Update:</label>
            <input type="text" class="form-control" id="passengerNameUpdate" name="passengerName" required>
            <label for="flightNumber">New Flight Number:</label>
            <input type="text" class="form-control" id="flightNumber" name="flightNumber" required>
            <button type="submit" name="action" value="Update" class="btn btn-secondary mt-2">Update Booking</button>
        </div>
    </form>

    <form action="manage_bookings.php" method="post">
        <div class="mb-3">
            <label for="passengerNameDelete">Passenger Name to Delete:</label>
            <input type="text" class="form-control" id="passengerNameDelete" name="passengerName" required>
            <button type="submit" name="action" value="Delete" class="btn btn-danger mt-2">Delete Booking</button>
        </div>
    </form>

    <h3>Existing Bookings</h3>
    <table class="table">
        <thead>
            <tr>
                <th>Passenger Name</th>
                <th>Flight Number</th>
                <th>Booking Date</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?= htmlspecialchars($row['FirstName']) . ' ' . htmlspecialchars($row['LastName']) ?></td>
                <td><?= htmlspecialchars($row['FlightNumber']) ?></td>
                <td><?= htmlspecialchars($row['BookingDate']) ?></td>
            </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
