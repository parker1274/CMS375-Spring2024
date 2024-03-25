<!DOCTYPE html>
<html>

<head>
    <title>
        Testing Html
    </title>
</head>

<body style="text-align:center;">

    <h1 style="color:green;">
        Test HTML Code
    </h1>

    <?php
    if(array_key_exists('button1', $_POST)) 
        button1();
    
    if(array_key_exists('button2', $_POST)) 
        button2();

    function button1(){
        echo 'Hello World';
    }

    function button2(){
        echo 'Bye World';
    }

    function button3(){
        echo 'Bye World';
    }
    
    ?>

    <!-- <form method="post">
        <input type="submit" name="button1"
                clss="button" value="Button" />
    </form>

    <form method="post">
        <input type="submit" name="button2"
                clss="button" value="Button" />
    </form> -->

    <form action="/action_page.php">
        <label for="lname">User Input:</label>
        <input type="text" id="lname" name="lname"><br><br>
        <input type="submit" value="Submit">
    </form>


</body>
</html>