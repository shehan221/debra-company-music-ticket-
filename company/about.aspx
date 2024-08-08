<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="company.about" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to an external CSS file -->
    <style>
        /* Additional inline styles specific to this page */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        header {
            text-align: center;
            margin-bottom: 20px;
        }

        .company-logo {
            max-width: 100%; /* Adjust the maximum width as per your design */
            height: auto;
            display: block;
            margin: 0 auto;
            margin-bottom: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            text-decoration: underline; /* Add underline to the heading */
        }

        h2 {
            color: #666;
            margin-bottom: 10px;
        }

        section {
            margin-bottom: 30px;
        }

        ul {
            list-style-type: disc;
            margin-left: 20px;
            margin-bottom: 10px;
        }

        footer {
            text-align: center;
            margin-top: 30px;
            color: #888;
        }

        footer a {
            color: #888;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .container {
                width: 95%; /* Adjust for smaller screens */
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header>
                <img src="about3.jpeg" alt="Company Logo" class="company-logo" />
                <h1>About us</h1> <!-- Apply underline to this heading -->
            </header>
            
            <section>
                <h2>Our Mission</h2>
                <p>Our mission at Debra Event Management is to curate and deliver exceptional musical experiences featuring the world's top musicians and bands.</p>
            </section>
            
            <section>
                <h2>Company History</h2>
                <p>Founded in Singapore, Debra Event Management has been at the forefront of organizing premier musical shows since [year of establishment]. Over the years, we have garnered a reputation for excellence in event planning and management, collaborating with renowned artists and venues globally.</p>
            </section>
            
            <section>
                <h2>Our Services</h2>
                <ul>
                    <li>Online ticket booking</li>
                    <li>Exclusive deals and offers</li>
                    <li>User-friendly interface</li>
                </ul>
            </section>
            
            <footer>
                <p>Contact us at <a href="mailto:Debramovieticket@gmail.com">Debramovieticket@gmail.com</a></p>
            </footer>
        </div>
    </form>
</body>
</html>