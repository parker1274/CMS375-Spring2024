<!DOCTYPE html>
<html>

<head>
    <title>
        Testing Html ?
    </title>
</head>

<body style="text-align:center;">

    <h1 style="color:green;">
        Test Code

    </h1>

    <?php
    if(array_key_exists('button', $_POST))
        button();
        bye();
        

    function button() {
        echo 'Hello World';
    }

    function bye() {
        echo 'Goodbye World';
    }

    function submit() {

    }
    


    ?>

    <form method="post">
        <input type="submit" name="button"
            class="button" value="Button"/>
        <input type="submit" name="bye"
            class="bye" value="Bye!"/>
    
    <form method="post" action="jack.php">
        <input type="submit" name="submit" value="Go to New Page">
    </form>

    <label for=fname"> first Name:</label>
    <input type="text" id="fname" name="fname">

</body>
</html>