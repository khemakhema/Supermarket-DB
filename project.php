<?php
$host = "localhost";
$username = "aandamar_john";
$pw = "john";
$db_name = "aandamar_supermarket";

$mysqli = new mysqli($host, $username, $pw, $db_name);



function showAllDepartmentPeople() {
    global $mysqli;
    $query = "SELECT * FROM department";
    if ($result = $mysqli->query($query)) {
echo '<div class="container">
  <h2>All Information from departments</h2>         
  <table class="table table-bordered table-hover table-striped">
    <thead> <tr>
        <th>departmentName</th>
        <th>deptManager</th>
        <th>aisle</th>
      </tr>
    </thead>
    <tbody>';
    /* fetch associative array */
    while ($row = $result->fetch_assoc()) {
        echo '<tr class="success">';
        echo "<th>" . $row["departmentName"] . "</th>";
        echo "<th>" . $row["deptManager"] . "</th>";
        echo "<th>" . $row["aisle"] . "</th>";
        echo "</tr>";
    }
        echo "</tbody>
  </table>
</div>";

    /* free result set */
    $result->free();
}
}

function showAllEmployees($salary = 0) {
    global $mysqli;
    $query = "SELECT * FROM employees WHERE salary > '$salary'";
    if ($result = $mysqli->query($query)) {
echo '<div class="container">
  <h2>All Information from departments</h2>         
  <table class="table table-bordered table-hover table-striped">
    <thead> <tr>
        <th>employee Id</th>
        <th>employee Name </th>
        <th>Position</th>
        <th>Shift</th>
        <th>Salary</th>
      </tr>
    </thead>
    <tbody>';
    /* fetch associative array */
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<th>" . $row["empID"] . "</th>";
        echo "<th>" . $row["empName"] . "</th>";
        echo "<th>" . $row["position"] . "</th>";
        echo "<th>" . $row["departmentName"] . "</th>";
         echo "<th>" . $row["shift"] . "</th>";
          echo "<th>" . $row["salary"] . "</th>";
        echo "</tr>";
    }
        echo "</tbody>
  </table>
</div>";

    /* free result set */
    $result->free();
}
}

function showItemsFilteredBydept($dptName) {
    global $mysqli;
    $query = "SELECT barcode, itemName, aisle, price, stock FROM items WHERE departmentName = '$dptName'";
    if ($result = $mysqli->query($query)) {
echo '<div class="container">
  <h2>All Information from departments</h2>         
  <table class="table table-bordered table-hover table-striped">
    <thead> <tr>
        <th>Barcode</th>
        <th>ItemName</th>
        <th>Aisle</th>
        <th>Price</th>
        <th>Stock</th>
      </tr>
    </thead>
    <tbody>';
    /* fetch associative array */
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<th>" . $row["barcode"] . "</th>";
        echo "<th>" . $row["itemName"] . "</th>";
        echo "<th>" . $row["aisle"] . "</th>";
        echo "<th>" . $row["price"] . "</th>";
         echo "<th>" . $row["stock"] . "</th>";
        echo "</tr>";
    }
        echo "</tbody>
  </table>
</div>";

    /* free result set */
    $result->free();
}
}


function filterSupplier($supplierId) {
    global $mysqli;
    $query = "SELECT * FROM suppliers WHERE supplierID = '$supplierId'";
    if ($result = $mysqli->query($query)) {
echo '<div class="container">
  <h2>All Information from departments</h2>         
  <table class="table table-bordered table-hover table-striped">
    <thead> <tr>
        <th>Supplier ID</th>
        <th>Supplier Name</th>
        <th>Supplier Address</th>
        <th>Supplier Phone Number</th>
        <th>Other Details</th>
      </tr>
    </thead>
    <tbody>';
    /* fetch associative array */
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<th>" . $row["supplierID"] . "</th>";
        echo "<th>" . $row["supplierName"] . "</th>";
        echo "<th>" . $row["supplierAddress"] . "</th>";
        echo "<th>" . $row["supplierPhoneNumber"] . "</th>";
         echo "<th>" . $row["other_details"] . "</th>";
        echo "</tr>";
    }
        echo "</tbody>
  </table>
</div>";

    /* free result set */
    $result->free();
}
}











?>



<DOCTYPE HTML>
<html lang = "en">
<head>
<meta charset="utf-8">
<!-- default styles -->
<style>
    html, body {
margin: 0px;
padding: 0px;
border: 0px;
}
    
    form {
        text-align: center;
    }
    
    form input {
        text-align: center;
    }

    

</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<title>Our Database Project</title>    
    
</head>

<body>
    
   

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">Home</a>
</nav>
    
    <div class="container">
  <div class="jumbotron" style = "padding: 1em 2em;">
    <h1 style="text-align:center;">Store Owner Controls</h1>           
</div>
    </div>
     <br>
    <br>
    <br>
        <?php
        if($_SERVER["REQUEST_METHOD"] == "POST") {
    if(isset($_POST['deparmentbtn'])){
    showAllDepartmentPeople();
}
        }
            ?>
    
 <form method="post" action="">
 <button type="submit" class="btn btn-primary" style = "letter-spacing: 1px;" name = "deparmentbtn">Show me my Department, their managers, and their locations</button>
    </form>
    
    <br>
    <br>
      <?php
        if($_SERVER["REQUEST_METHOD"] == "POST") {
    if(isset($_POST['employeebtn'])){
        if(isset($_POST["salary"])) {
              showAllEmployees($_POST["salary"]);
        }
  
}
        }
            ?>
 <form method="post" action="">
     <input type="text" class="form-control" placeholder="Enter the salary to filter my employees" name = "salary">
<button type="submit" class="btn btn-primary" style = "letter-spacing: 1px;" name = "employeebtn">Show me all my employees who make more than this salary</button>
</form>
    
    <br>
    <br>
    
        
          <?php
        if($_SERVER["REQUEST_METHOD"] == "POST") {
    if(isset($_POST["itembtn"])){
        if(isset($_POST["itemm"])) {
              showItemsFilteredBydept($_POST["itemm"]);
        }
  
}
        }
            ?>
 <form method="post" action="">
     <input type="text" class="form-control" placeholder="Enter the item department" name = "itemm">
<button type="submit" class="btn btn-primary" style = "letter-spacing: 1px;" name = "itembtn">Show me all my items and filter by department</button>
</form>
    
        <br>
    <br>
        
        
          <?php
        if($_SERVER["REQUEST_METHOD"] == "POST") {
    if(isset($_POST["supplierbtn"])){
        if(isset($_POST["shome"])) {
              filterSupplier($_POST["shome"]);
        }
  
}
        }
            ?>
 <form method="post" action="">
     <input type="text" class="form-control" placeholder="Enter the id of the supplier" name ="shome">
<button type="submit" class="btn btn-primary" style = "letter-spacing: 1px;" name = "supplierbtn">Show me a certain supplier</button>
        </form>
    
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
</body>
</html>