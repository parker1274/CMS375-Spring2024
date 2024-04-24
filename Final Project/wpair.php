<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WP Airways</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- STYLESHEET CSS-->
    <link rel="stylesheet" href="style.css">

    <!-- REMIX ICONS -->
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css" rel="stylesheet"/>
</head>
<body>
<main>
  <div class="container py-4">
    <header class="pb-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center text-body-emphasis text-decoration-none">
        <i class="ri-flight-takeoff-line ri-2x"></i>
        <span class="fs-4 header-nav">WINTER PARK AIRWAYS</span>
      </a>
    </header>

    <!-- Explore FLIGHTS-->
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <form action="search_flights.php" method="GET">
        <div class="container-fluid py-5">
          <h1 class="display-5 fw-bold">Explore Flights</h1>
          <div class="row g-3">
            <!--Origin-->
            <div class="col-sm-6">
              <label for="origin" class="form-label">Origin</label>
              <input type="text" class="form-control" id="origin" name="origin" placeholder="'MCO'" required>
              <div class="invalid-feedback">
                Valid origin is required.
              </div>
            </div>
            <!--Destination-->
            <div class="col-sm-6">
              <label for="destination" class="form-label">Destination</label>
              <input type="text" class="form-control" id="destination" name="destination" placeholder="'LAX'" required>
              <div class="invalid-feedback">
                Valid destination is required.
              </div>
            </div>
            <!--Date-->
            <div class="col-sm-6 mt-2">
              <label for="departure_date" class="form-label">Departure date</label>
              <input type="date" class="form-control" id="departure_date" name="departure_date" value="2024-04-24" required>
              <div class="invalid-feedback">
                Valid departure date is required.
              </div>
            </div>
          </div>
          <button class="btn btn-primary btn-lg mt-5" type="submit">Search Flights</button>
        </div>
      </form>
    </div>

    <div class="row align-items-md-stretch">
        <!-- Booking Section -->
        <div class="col-md-6">
            <form action="manage_bookings.php" method="POST">
              <div class="h-100 p-5 text-bg-dark rounded-3">
              <h1 class="display-5 fw-bold">Book a Flight</h1>
                <!-- Passenger Name -->
                <div class="col-sm-6 mt-2">
                    <label for="passengerName" class="form-label">Passenger Name</label>
                    <input type="text" class="form-control" id="passengerName" name="passengerName" placeholder="John Doe" required>
                </div>
                <!-- Flight Number -->
                <div class="col-sm-6 mt-2">
                    <label for="flightNumber" class="form-label">Flight Number</label>
                    <input type="text" class="form-control" id="flightNumber" name="flightNumber" placeholder="WP101" required>
                </div>
                <button class="btn btn-primary btn-lg mt-5" type="submit">Book Now</button>
              </div>
            </form>
        </div>

        <!-- Flight Status Section -->
        <div class="col-md-6">
            <form action="display_flights.php" method="POST">
                <div class="h-100 p-5 bg-body-tertiary border rounded-3">
                    <h1 class="display-5 fw-bold">Flight Status</h1>
                    <div class="col-sm-6 mt-2">
                        <label for="flighNumber" class="form-label">Flight number</label>
                        <input type="text" class="form-control" id="flightNumber" placeholder="'WP101'" value="" required>
                    </div>
                    <button class="btn btn-primary btn-lg mt-5" type="submit">Search Flight Status</button>
                </div>
            </form>
        </div>
    </div>

    <footer class="pt-3 mt-4 text-body-secondary border-top">
          © Jet Screener 2024
    </footer>
    
  </div>
</main>
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
