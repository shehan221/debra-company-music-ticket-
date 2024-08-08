<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UI Interface</title>
    <style>
        
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
            background-image: url('backs3.jpeg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            display: flex;
            flex-direction: column;
            min-height: 100vh; 
        }

        /* Navbar styles */
        .navbar {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar .logo {
            font-size: 24px;
            color: white;
            text-decoration: none;
            transition: color 0.3s ease; 
        }

        .navbar .logo:hover {
            color: #ffcc00;
        }

        .navbar .menu {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .navbar .menu ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        .navbar .menu ul li {
            margin: 0 15px;
        }

        .navbar .menu ul li a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        .navbar .menu ul li a:hover {
            color: #ffcc00; 
        }

        /* Container styles */
        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            flex-grow: 1; 
        }

        /* Image container styles */
        .image-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            margin-top: 20px; 
        }

        .image-container div {
            text-align: center;
            margin: 15px;
            position: relative;
            overflow: hidden;
        }

        .image-container img {
            width: 200px;
            height: 200px;
            border: 2px solid #333;
            border-radius: 10px;
            margin-bottom: 5px;
            transition: transform 0.3s ease-in-out;
        }

        .image-container div:hover img {
            transform: scale(1.1);
        }

        .image-container p {
            margin: 5px;
            font-family: 'Arial', sans-serif;
            font-size: 16px;
            font-weight: bold;
            color: white;
            text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            opacity: 0;
            transition: opacity 0.3s ease-in-out;
        }

        .image-container div:hover p {
            opacity: 1;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div class="icon">
        <a href="company_menu.aspx" class="logo">Debara Company</a>
    </div>
    <div class="menu">
        <ul>
            <li><a href="about.aspx">ABOUT</a></li>
            <li><a href="BuyTicket.aspx">TICKET BOOKING</a></li>
        </ul>
    </div>
</div>

<div class="container">
    <!-- Image container - Top Section -->
    <div class="image-container">
        <div>
            <a href="BuyTicket.aspx">
                <img src="valentine.jpeg" alt="Valentine Party">
                <p>Valentine Party</p>
            </a>
        </div>
        <div>
            <a href="BuyTicket.aspx">
                <img src="stars.jpeg" alt="Super Stars">
                <p>Super Stars</p>
            </a>
        </div>
        <div>
            <a href="BuyTicket.aspx">
                <img src="rock.jpeg" alt="Metal Rock Fest">
                <p>Metal Rock Fest</p>
            </a>
        </div>
    </div>

    <!-- Image container - Bottom Section -->
    <div class="image-container" style="margin-top: 20px;">
        <div>
            <a href="BuyTicket.aspx">
                <img src="lion.jpeg" alt="The Lion King">
                <p>The Lion King</p>
            </a>
        </div>
        <div>
            <a href="BuyTicket.aspx">
                <img src="six.jpeg" alt="Broadway Show">
                <p>Broadway Show</p>
            </a>
        </div>
    </div>
</div>

</body>
</html>
