<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyTicket.aspx.cs" Inherits="company.BuyTicket" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Buy Tickets</title>
   <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            background-image: url('ticket.jpeg'); 
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            padding: 20px;
        }

        h2 {
            color: #fff;
        }

        /* Form layout */
        .ticket-form {
            max-width: 600px;
            margin: 0 auto;
            background-color: #000; 
            padding: 20px;
            border-radius: 6px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            color: #fff; 
        }

        /* Form elements */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #fff; 
        }

        .form-group select, .form-group input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #555; 
            border-radius: 4px;
            box-sizing: border-box;
            background-color: #333; 
            color: #fff; 
        }

        .form-group button {
            padding: 10px 20px;
            background-color: #337ab7;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            width: 100%; 
            max-width: 200px; 
            margin: 0 auto; 
            display: block; 
        }

        .form-group button:hover {
            background-color: #286090;
        }

        /* Result section */
        .result-section {
            margin-top: 20px;
            background-color: #222; 
            padding: 10px;
            border-radius: 6px;
            color: #fff; 
        }

        .result-section h3, .result-section p {
            color: #fff; 
        }

        .result-section button {
            margin-top: 10px; 
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            width: 100%;
            max-width: 200px; 
            margin: 0 auto; 
            display: block; 
        }

        .result-section button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="ticket-form">
            <h2>Buy Tickets</h2>
            <div class="form-group">
                <label for="ticketSelect">Select Ticket:</label>
                <asp:DropDownList ID="ticketSelect" runat="server" CssClass="form-control" onchange="updatePrice()">
                </asp:DropDownList>
            </div>
            <div class="form-group" id="ticketPriceRow" style="display: none;">
                <label>One Ticket Price:</label>
                <span id="ticketPrice">$0.00</span>
            </div>
            <div class="form-group">
                <label for="quantity">Quantity:</label>
                <input type="number" id="quantity" name="quantity" min="1" value="1" />
            </div>
            <div class="form-group">
                <button type="button" onclick="calculateTotal()">Calculate Total</button>
            </div>
            <div class="result-section">
                <h3>Total Price:</h3>
                <p id="totalPrice">$0.00</p>
                <button type="button" onclick="buyTickets()">Buy Tickets</button>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        function updatePrice() {
            var select = document.getElementById('<%= ticketSelect.ClientID %>');
            var selectedIndex = select.selectedIndex;
            var pricePerTicket = select.options[selectedIndex].getAttribute('data-price');
            document.getElementById('ticketPrice').innerHTML = 'Rs' + parseFloat(pricePerTicket).toFixed(2);
            document.getElementById('ticketPriceRow').style.display = 'block'; // Show the price row
        }

        function calculateTotal() {
            var quantity = parseInt(document.getElementById('quantity').value);
            var pricePerTicket = parseFloat(document.getElementById('<%= ticketSelect.ClientID %>').options[document.getElementById('<%= ticketSelect.ClientID %>').selectedIndex].getAttribute('data-price'));
            var totalPrice = quantity * pricePerTicket;
            document.getElementById('totalPrice').innerHTML = 'Rs' + totalPrice.toFixed(2);
        }

        function buyTickets() {
            var quantity = parseInt(document.getElementById('quantity').value);
            var ticketID = document.getElementById('<%= ticketSelect.ClientID %>').value;
       var ticketName = document.getElementById('<%= ticketSelect.ClientID %>').options[document.getElementById('<%= ticketSelect.ClientID %>').selectedIndex].text;
       var pricePerTicket = parseFloat(document.getElementById('<%= ticketSelect.ClientID %>').options[document.getElementById('<%= ticketSelect.ClientID %>').selectedIndex].getAttribute('data-price'));
            var totalPrice = quantity * pricePerTicket;

            var confirmMsg = 'Are you sure you want to buy ' + quantity + ' ticket(s)?';
            if (confirm(confirmMsg)) {
                window.location.href = 'Receipt.aspx?ticketID=' + ticketID + '&quantity=' + quantity + '&ticketName=' + encodeURIComponent(ticketName) + '&pricePerTicket=' + pricePerTicket + '&totalPrice=' + totalPrice;
            }
        }
</script>
</body>
</html>
