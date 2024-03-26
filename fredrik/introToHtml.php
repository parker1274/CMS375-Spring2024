<!DOCTYPE html>
<html>
<head>
    <title>Testing HTML</title>
</head>
<body style="text-align:center;">
    <h1 style="color: green;">Trevor</h1>
    <?php
    if (isset($_POST['button']) && isset($_POST['textInput'])) {
        $name = $_POST['textInput'];
        echo "<h2>Hello, $name!</h2>";
        button($name);
        echo '<img src="trev.jpeg" alt="Simple Image" style="height:200px;"/>';
    } else {
        // Display the form if the page is loaded for the first time
        displayForm();
    }

    function button($text) {
        echo '<p>' . $text . '</p>';
    }

    function displayForm() {
    ?>
        <form method="post">
            <input type="text" name="textInput" placeholder="Enter your text here" />
            <input type="submit" name="button" class="button" value="button" />
        </form>
    <?php
    }
    ?>
</body>
</html>