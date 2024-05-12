<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MuscleBlaze Biozyme Performance Whey Protein</title>
 
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
*{
    font-family: 'Poppins', sans-serif
}
header div a {
    color: #00FF00; /* Change the color to green using hexadecimal value */
    
  }

.container {
    display: flex;
    flex-wrap: nowrap;
    width: 80%;
    margin: 0 auto;
    padding: 20px;
}

.product-image {
    width: 70%;
    flex: 0 0 40%;
}

.product-image img {
    width: 60%;
    height: auto;
}

.product-info {
    width: 60%;
    flex: 0 0 60%;
    padding-left: 10px;
}

.product-title {
    margin-bottom: 10px;
}

.product-title h1 {
    font-size: 24px;
    font-weight: bold;
    margin: 0;
}

.product-title span {
    font-size: 14px;
    color: #888;
}

.brand {
    margin-bottom: 5px;
    font-size: 12px;
    color: #aaa;
}

.ratings {
    margin-bottom: 10px;
}



.rating-count {
    font-size: 14px;
    color: #aaa;
}

.price-section {
    display: flex;
    justify-content:center;
    margin-bottom: 10px;
}

.btn-click .btn1 {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    margin: 10px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    
}



.price {
    font-weight: bold;
    color: #000;
}

.cashback {
    margin-bottom: 5px;
    font-size: 14px;
    color: #388e3c;
}

 .cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

    
    </style>
</head>
<body>
    <header>
        <div>
            <a href="all_product_page.html">back to home page</a>
        </div>
    </header>
    <div class="container">
        <div class="product-image">
            <img src="protein3.jpg" alt="Impact Whey Protein">
        </div>
        <div class="product-info">
            <div class="product-title">
                <h1>Impact Whey Protein</h1>
                <span>Highest-quality British-manufactured product</span>
            </div>
            <div class="brand">
                By MuscleBlaze >
            </div>
            <div class="ratings">
                <span class="rating-stars">
                    </span>
                <span class="rating-count">4.4 (3,515 Reviews)</span>
            </div>
            <div class="price-section">
                
                <div class="price">
                    Price: <span>&#8377;</span>500
                </div>
            </div>
            <div class="cashback">
                Get 82 HK Cash
            </div>
            <div class="inclusions">
                Inclusive of all taxes
            </div>
            <div class="highlights">
                </div>
            <div class="btn-click">
                
                <button id="rzp-button1" class="btn1">Buy Now</button>
                <button type="button" onclick="window.location.href='all_product_page.html'" class="cancelbtn">Cancel</button>
            </div>
           
        </div>
    </div>
     <!-- Your existing HTML code -->
    <form action="sendTransactionEmail" method="post" id="paymentSuccessForm">
        <input type="hidden" name="productName" value="MuscleBlaze Biozyme Performance Whey Protein">
        <input type="hidden" name="productPrice" value="500">
        <!-- Other hidden fields for additional product details if needed -->
    </form>
    <!-- Your existing JavaScript code -->
    

<script>
var options = {
    "key": "rzp_test_l4gYkuI0RkoNN8", // Enter the Key ID generated from the Dashboard
    "amount": "50000", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
    "currency": "INR",
    "name": "Acme Corp", //your business name
    "description": "Test Transaction",
    "image": "https://example.com/your_logo",
     //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
    "handler": function (response){
        alert(response.razorpay_payment_id);
        alert(response.razorpay_order_id);
        alert(response.razorpay_signature)
    },
    
};
var rzp1 = new Razorpay(options);

rzp1.on('payment.success', function(response) {
    document.getElementById('paymentSuccessForm').submit();
});

rzp1.on('payment.failed', function (response){
        alert(response.error.code);
        alert(response.error.description);
        alert(response.error.source);
        alert(response.error.step);
        alert(response.error.reason);
        alert(response.error.metadata.order_id);
        alert(response.error.metadata.payment_id);
});
document.getElementById('rzp-button1').onclick = function(e){
    rzp1.open();
    e.preventDefault();
};
</script>

</body>
</html>