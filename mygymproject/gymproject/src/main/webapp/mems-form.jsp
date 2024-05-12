<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Membership Form</title>
    <style>
        * {
            font-family: 'Poppins', sans-serif;
            box-sizing: border-box;
            outline: none;
        }
        body {
            background-color: white;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #1f2125;
            overflow: hidden;
            z-index: 1000;
            transition: top 0.3s;
        }
        .navbar a {
            float: right;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #00ff34;
            color: black;
        }
        .navbar a.active {
            background-color: #00ff34;
            color: black;
        }
        .container {
            width: 50%;
            margin-top: 50px; /* Adjust the top margin as needed */
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #ffffd7;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            color: #333;
        }
        input[type="text"], input[type="number"], textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }
        input[type="button"] {
            background-color: #ff3126;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }
        input[type="button"]:hover {
            background-color: #ff1206;
        }
         input[type="submit"]:hover {
            background-color: green;
        }
        h2{
        display:flex;
        justify-content: center;
        }
    </style>
</head>
<body>
<div class="navbar" id="navbar">
    <a href="admin.jsp">Dashboard</a>
    <a href="mems-form.jsp">Update Membership</a>
    <a href="deleteUser">Users</a>
    <a href="deleteTrainer">Trainers</a>
    <a href="deleteFreeClass">Classes</a>
</div>
<div class="container">
    <h2>Update Membership</h2>
    <form action="update-membership" method="post">
        <div class="form-group">
            <label for="id">ID:</label>
            <input type="text" id="id" name="id" placeholder="Enter membership ID" required>
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" min="0.00" step="0.01" placeholder="Enter membership Price" required>
        </div>
        <div class="form-group">
            <label for="details">Details:</label>
            <textarea id="details" name="details" rows="4" placeholder="Enter membership Details" required></textarea>
        </div>
        <input type="submit" value="Update">
        <input type="button" value="Cancel" onclick="clearForm()">
    </form>
</div>

<script>
    function clearForm() {
        document.getElementById("id").value = "";
        document.getElementById("price").value = "";
        document.getElementById("details").value = "";
    }
</script>
</body>
</html>
