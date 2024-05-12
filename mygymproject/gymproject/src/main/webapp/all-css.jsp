<style>@charset "UTF-8";

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap');

*{
    margin: 0%;
    padding: 0%;
    font-family: 'Poppins',sans-serif;
    box-sizing: border-box;
    outline: none;
    color: #fff;
}
:root{
    --prime: #00ff34;
    --secondary-color: #40f564;
    --secondary-black: #1f2125;
    --black: #111317; 
    --white: #fff;
    --fade: #373737;
}
html{
   scroll-behavior: smooth; 
   scroll-padding: 0rem;
}
body{
    background-color: #131b2b;
}

/*----------------- style navbar ---------------------*/
.navbar{
    width: 100%;
    display: flex;
    position: fixed;
    padding: 30px 120px;
    background-color: transparent;
    justify-content: space-between;
    z-index: 1111;
    transition: 0.5s ease;
}
.navbar .admin {
  padding: 8px 25px;
  margin-left: 10px;
  border: solid var(--prime);
  border-radius: 17px;
   /* Adjust padding values as needed */
}
.navbar .admin:hover {
	color: #fff;
    cursor: pointer;
    
    background: var(--prime);
}
.navbar.sticky{
    padding: 6px 60px;
    background: #0c1518;
    box-shadow: 0 0 15px rgba(0,0,0,0.3);
}
.navbar.sticky .logo{
    font-size: 2em;
    color: var(--prime);
}
.navbar.sticky .logo B{
    color: #fff;
}
/*----------------- made responsive ---------------------*/
@media screen and (max-width: 900px){
    .navbar{
        padding: 0 60px;
    }
    .navbar ol{
        display: none;
    }
    .navbar ol.active{
        top: 60px;
        left: 0;
        width: 100%;
        display: flex;
        position: fixed;
        background: #222;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        height: calc(100% - 60px);
    }
    .navbar ol.active li{
        margin: 8px;
        
    }
    .navbar ol.active li a{
        font-size: 25px;
        
    }
    .navbar .toggle{
        height: 25px;
        width: 25px;
        margin: auto 0;
        cursor: pointer;
        background: url(menubar.jpg);
        background-size: 25px;
        background-position: center;
        filter: invert(1);
        background-repeat: no-repeat;
    }
    .navbar .toggle.active{
        background: url(close.png);
        background-size: 40px;
        background-position: center;
        cursor: pointer;
        filter: invert(1);
    }
    .highlights h3{
        font-size: 3vw;
        padding: 5px 10px;
        border-left: 3px solid var(--prime);
    }
    .highlights h1{
        font-size: 16vw;
    }
    .highlights .join{
        font-size: 1.8vw;
        border: 1px solid var(--prime);
    }
    .main h2{
        font-size: 1.5rem;
    }
    .main h6{
        font-size: 10px;
    }
    .about .content{
        flex-direction: column;
    }
    .workout .content .frame{
        width: 260px;
        padding: 18px;
    }
}
.logo{
   font-size: 2.8em;
   font-weight: 800;
   letter-spacing: 2px;
   text-transform: uppercase;
   text-decoration: none;
}
.logo B{
    color: var(--prime);
}
ol{
    display: flex;
    margin: auto 0;
}
ol li{
    list-style: none;
    margin-right: 20px;
}
ol li a{
    font-size: 20px;
    font-weight: 500;
    text-decoration: none;
    text-transform: capitalize;
}
ol li:hover a{
    color: var(--prime);
}
</style>

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