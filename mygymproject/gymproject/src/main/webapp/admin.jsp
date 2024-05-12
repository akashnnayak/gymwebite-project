<!DOCTYPE html>
<html>
<head>
    <title>Admin page</title>
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

h2 {
    margin-top: 40px; /* Adjusted to provide space below the fixed navbar */
}

/* Add styles for better GUI */
h2 {
    color: black;
    text-align: center;
    margin-top: 50px;
}


 .nav-container {
            
            background-color: #ffffd7;
            padding: 50px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            width: 100%;
        }

        h4 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        input[type="submit"]
         {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 60px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }
        input[type="button"] {
        color: #fff;
            border: none;
            padding: 10px 70px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
        
        input[type="button"]:hover {
         background-color: #e40000;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 25px;
            
        }
         .button-container .btn {
        background-color: #ff2626;
        
        }
        .form-group input[type="file"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 14px;
    background-color: #f9f9f9; /* Light gray background */
    color: #333; /* Text color */
    cursor: pointer; /* Change cursor to pointer on hover */
    transition: border-color 0.3s ease;
}

.form-group input[type="file"]:hover {
    border-color: #999; /* Darken border on hover */
}
        
    </style>
</head>
<body>

<div class="navbar" id="navbar">
    <a href="home.jsp">Home</a>
    <a href="mems-form.jsp">Update Membership</a>
    <a href="deleteUser">Users</a>
    <a href="deleteTrainer">Trainers</a>
    <a href="productsList">Inventory</a>
    <a href="deleteFreeClass">Classes</a>
    <a href="final-report.jsp">Reports</a>
</div>

<div class="container">
   
    <!-- Add more content here -->
</div>
<div class="nav-container">
<h2>Welcome Admin, <%= session.getAttribute("username") %>!</h2>
        <h4>Add New Product</h4>
        <form action="addProductServlet" method="post">
            <div class="form-group">
                <label for="name">Product Name:</label>
                <input type="text" id="name" name="name" placeholder="enter your product name" required>
            </div>
            <div class="form-group">
                <label for="category">Category:</label>
                <input type="text" id="category" name="category" placeholder="enter product category" required>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" id="price" name="price"  placeholder="enter product price" oninput="this.value = this.value.replace(/[^0-9]/g, '');" required>
            </div>
			<div class="form-group">
				<label for="image">Image:</label> 
				<input type="file" id="image" name="image" accept="image/*" required>
			</div>

			<div class="button-container">
            <input type="submit" value="Add Product">
            <input type="button" class="btn" value="Cancel" onclick="clearForm()">
            </div>
        </form>
    </div>

<!-- Add JavaScript to hide navbar on scroll down and show on scroll up -->

<script>
function clearForm() {
    document.getElementById("name").value = "";
    document.getElementById("category").value = "";
    document.getElementById("price").value = "";
    document.getElementById("image").value = "";
}

    let prevScrollpos = window.pageYOffset;
    window.onscroll = function() {
        let currentScrollPos = window.pageYOffset;
        if (prevScrollpos > currentScrollPos) {
            document.getElementById("navbar").style.top = "0";
        } else {
            document.getElementById("navbar").style.top = "-50px";
        }
        prevScrollpos = currentScrollPos;
    }
</script>

</body>
</html>
