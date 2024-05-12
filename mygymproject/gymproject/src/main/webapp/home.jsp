
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Home page</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="home.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
    </head>
    <body>
        <!-- ........................navigation bar....................... -->
        <div class="navbar"> 
            <a href="#" class="logo">F<B>H</B>.</a>
            <div class="toggle" onclick="navToggle();"></div>
            <ol>
                <li><a href="#home" onclick="navToggle();">home</a></li>
                <li><a href="#trainer" onclick="navToggle();">trainers</a></li>
                <li><a href="#workout" onclick="navToggle();">workout</a></li>
                <li><a href="#membership" onclick="navToggle();">membership</a></li>
                <li><a href="#supplement" onclick="navToggle();">supplement</a></li>
               <li> <a href="adminlogin.jsp" class="admin" onclick="navToggle();">Admin</a></li>
			<%
			// Check if the session contains the user's information
			if (session.getAttribute("name") == null) {
			%>
			<li><a href="loginpage.jsp" class="admin" onclick="navToggle();">Login</a></li>
			<%
			}
			%>
		</ol>
          
        </div>
        <!-- ........................home section....................... -->
        <section id="home" class="home view">
            <div class="highlights">
                <h3>feel the power with</h3>
                <h1><b>FITNESS</b> HEALTH</h1><br>
                <p class="tagline">
                 <strong style="color: #00ff34; font-family:  'Concert One', sans-serif; font-size: 22px;">Hello <%= session.getAttribute("name") %>!</strong>
                    We're thrilled to have you join our fitness community. At Fitness and Health, we're dedicated to helping you achieve your health and wellness goals.
                </p>
                <a href="signup.jsp" class="join">Sign Up Now</a>
            </div>
            <div class="banner"></div>
        </section>
        <!-- ........................trainer section....................... -->
       <section id="trainer" class="trainer view">
        <div class="main">
            <h2><span>T</span>rainer</h2> 
             <h6>Lorem ipsum dolor, sit amet consectetur, adipiscing elit. Itaque, dolorum.</h6>
        </div>
        <div class="content">
            <div class="cols">
               <p><b>L</b>orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, 
                remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software
                 like Aldus PageMaker including versions of Lorem Ipsum.when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, 
                 remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software
                  like Aldus PageMaker including versions of Lorem Ipsum. </p> 
                 <a style=" text-decoration: none;" href="trainerregs.jsp" class="trn_btn">trainer Registration</a>
            </div>
            <div class="cols">
                <div class="box">
                    <img src="About.jpg" alt="">
                </div>
            </div>
        </div>
       </section>
        <!-- ........................workout section....................... -->
       <section id="workout" class="workout view">
        <div class="main">
            <h2><span>W</span>orkout</h2>
            <h6>Lorem ipsum dolor, sit amet consectetur, adipiscing elit, Itaque, dolorum.</h6>
        </div>

        <div class="content">
            <div class="frame">
                <div class="box">
                    <img src="workout1.jpg" alt="">
                </div>
                <div class="title">someone famous</div>
                <p>Lorem ipsum dolor, sit amet consectetur, adipiscing elit.</p>
            </div>

            <div class="frame">
                <div class="box">
                    <img src="workout2.jpg" alt="">
                </div>
                <div class="title">someone famous</div>
                <p>Lorem ipsum dolor, sit amet consectetur, adipiscing elit.</p>
            </div>

            <div class="frame">
                <div class="box">
                    <img src="workout3.jpg" alt="">
                </div>
                <div class="title">someone famous</div>
                <p>Lorem ipsum dolor, sit amet consectetur, adipiscing elit.</p>
            </div>

            <div class="frame">
                <div class="box">
                    <img src="workout4.jpg" alt="">
                </div>
                <div class="title">someone famous</div>
                <p>Lorem ipsum dolor, sit amet consectetur, adipiscing elit.</p>
            </div>

            <div class="frame">
                <div class="box">
                    <img src="workout5.jpg" alt="">
                </div>
                <div class="title">someone famous</div>
                <p>Lorem ipsum dolor, sit amet consectetur, adipiscing elit.</p>
            </div>

            <div class="frame">
                <div class="box">
                    <img src="workout6.jpg" alt="">
                </div>
                <div class="title">someone famous</div>
                <p>Lorem ipsum dolor, sit amet consectetur, adipiscing elit.</p>
            </div>
        </div>
        <!-- free classes registration form -->
        
        <br><br><br>
        <div>
        
     <div class="container" style="display: flex; justify-content:center; ">
      <img style="width:500px; height: auto; max-width: 100%; max-height: 100%;  box-shadow: 0 0 20px rgba(0, 0, 0, 0.6);" src="gymclasses.jpg" alt="">
    <form action="free-classes" method="post" style=" width: 500px;  background-color: #fff; padding: 25px;  box-shadow: 0 0 10px rgba(0, 0, 0, 0.6);">
        <h4 style="text-align: center; color: #cc0000;">Register for Free Classes</h4><br>
        <label for="username" style="display: block; margin-bottom: 10px; color:black;">Full Name:</label>
        <input type="text" id="username" name="username" required style="width: 100%; padding: 8px; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 4px; color: #007bff;">
        
        <label for="phoneNumber" style="display: block; margin-bottom: 10px; color:black;">Phone Number:</label>
        <input type="text" id="phoneNumber" name="phoneNumber" required maxlength="10" oninput="this.value = this.value.replace(/[^0-9]/g, '').substring(0, 10);" style="width: 100%; padding: 8px; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 4px; color: #007bff;">

        <label for="classType" style="display: block; margin-bottom: 10px; color:black;">Select Class Type:</label>
        <select id="classType" name="classType" style="width: 100%; color:#007bff; padding: 8px; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 4px;">
            <option value="" disabled selected>Select Class</option>
            <option value="Yoga" style="color: #007bff;">Yoga</option>
            <option value="Cardio" style="color: #007bff;">Cardio</option>
            <option value="bodybuilding" style="color: #007bff;">bodybuilding</option>
        </select>
        
        <label for="timing" style="display: block; margin-bottom: 10px; color:black;">Select Timing:</label>
        <select id="timing" name="timing" style="width: 100%; padding: 8px; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 4px; color:#007bff;">
            <option value="" disabled selected >Select Time</option>
            <option value="9am" style="color: #007bff;">9:00 AM</option>
            <option value="5pm" style="color: #007bff;">5:00 PM</option>
            <option value="8pm" style="color: #007bff;">8:00 PM</option>
        </select>
        <br><br>
        <input type="submit" value="Register" style="width: 100%; padding: 10px; background-color: #4caf50; color: #fff; border: none; border-radius: 4px; cursor: pointer;">
        
    </form>
        
        </div>
        </div>
       </section>

       <!-- ........................membership section....................... -->
       
       <section id="membership" class="membership view">
        <div class="main">
            <h2><span>M</span>embership</h2>
            <h6>Lorem ipsum dolor, sit amet consectetur, adipiscing elit, Itaque, dolorum.</h6>
        </div>
        
		<div class="membershipp" style="max-width: 100%; overflow: hidden; height: 500px;">
        <img src="membership.jpg" alt="Membership Image" style="width: 100%; height: 100%; object-fit: cover; filter: brightness(40%); border-radius: 35px; z-index: 0;">
			<div class="content" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 1; display: flex; justify-content: space-evenly; align-items: center; flex-wrap: wrap;">
            <div class="frame1">
                
                <p class="curvy-background" style="text-transform: uppercase;" >&#x2705;Top-notch Facilities</p><br/>
                <p class="curvy-background" style="text-transform: uppercase;" >&#x2705;Innovative Classes and Programs</p>
            </div>
            <div class="frame1">

                <p class="curvy-background" style="text-transform: uppercase;">&#x2705;Expert Guidance</p><br/>
                <p class="curvy-background" style="text-transform: uppercase;" >&#x2705;Flexible Membership Options</p>
            </div>
            <div class="frame1">
                
                <p class="curvy-background" style="text-transform: uppercase;">&#x2705;Thriving Community</p><br/>
               <p class="curvy-background" style="text-transform: uppercase;" >&#x2705;Track Your Progress</p> 
            </div>
        </div>
			<a style=" text-decoration: none;  margin-top: 350px; z-index: 1;" href="display_memberships.jsp" class="trn_btn">Choose Your Membership Now</a>
    </div>
   
	</section>
       <!-- ........................supplement section....................... -->
       <section id="supplement" class="trainer view">
        <div class="main">
            <h2><span>S</span>upplement</h2> 
             <h6>Lorem ipsum dolor, sit amet consectetur, adipiscing elit. Itaque, dolorum.</h6>
        </div>
        <div class="content">
            <div class="cols">
               <p>&#x2705;<b>L</b>orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, 
                remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software
                 like Aldus PageMaker including versions of Lorem Ipsum.when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, 
                 remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software
                  like Aldus PageMaker including versions of Lorem Ipsum. </p> 
                
            </div>
            <div class="cols">
                <div class="box">
                    <img src="Pre.jpg" alt="">
                </div>
            </div>
        </div>
       </section>

       <!--------- footer   --------->
       
       <footer class="footer-distributed">

        <div class="footer-left">
            <h3>fitness<span>Health</span></h3>

            <p class="footer-links">
                <a href="#home">Home</a>
                |
                <a href="#trainer">Trainer</a>
                |
                <a href="#workout">Workout</a>
                |
                <a href="#membership">Membership</a>
                |
                <a href="#product">Product</a>
            </p>

            <p class="footer-company-name">Copyright Â© 2021 AkashNayak All rights reserved</p>
        </div>

        <div class="footer-center">
            <div>
                <i class="fa fa-map-marker"></i>
                <p><span>Vasai</span>
                    Maharashtra</p>
            </div>

            <div>
                <i class="fa fa-phone"></i>
                <p>+91 74**9**258</p>
            </div>
            <div>
                <i class="fa fa-envelope"></i>
                <p><a>xyz@gmail.com</a></p>
            </div>
        </div>
        <div class="footer-right">
            <p class="footer-company-about">
                <span>About the company</span>
                <strong>fitness n Health</strong> Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
            </p>
            <div class="footer-icons">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
                <a href="#"><i class="fa fa-linkedin"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-youtube"></i></a>
            </div>
        </div>
    </footer>
       
 <!-- this line is for sticky navbar scrolling animation-->
<script>
    window.addEventListener('scroll', function(){
        const navbar = document.querySelector('.navbar');
        navbar.classList.toggle('sticky', window.scrollY > 50);
    });

    const togglebar = document.querySelector('.toggle');
    const menu = document.querySelector('ol');

    function navToggle(){
        togglebar.classList.toggle("active");
        menu.classList.toggle("active");
    }
  
   


</script>


    </body>  
</html>
