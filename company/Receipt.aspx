<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="company.Receipt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Receipt</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('ticket.jpeg'); 
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            padding: 20px;
            color: #fff; 
        }

        .receipt-container {
            max-width: 600px;
            margin: 0 auto;
            background-color: rgba(0, 0, 0, 0.8); 
            padding: 20px;
            border-radius: 6px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); 
        }

        h2 {
            color: #fff;
        }

        .receipt-item {
            margin-bottom: 10px;
        }

        .receipt-item label {
            font-weight: bold;
            color: #fff; 
        }

        .receipt-item span {
            margin-left: 10px;
            color: #fff; /* White text */
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #fff; 
            text-decoration: underline;
        }

        .confirm-payment {
            margin-top: 20px;
            text-align: center;
        }

        .confirm-payment button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .confirm-payment button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="receipt-container">
        <h2>Receipt</h2>
        <div class="receipt-item">
            <label>Ticket Name:</label>
            <span><%= Request.QueryString["ticketName"] %></span>
        </div>
        <div class="receipt-item">
            <label>Quantity:</label>
            <span><%= Request.QueryString["quantity"] %></span>
        </div>
        <div class="receipt-item">
            <label>Price Per Ticket:</label>
            <span>Rs <%= Request.QueryString["pricePerTicket"] %></span>
        </div>
        <div class="receipt-item">
            <label>Total Price:</label>
            <span>Rs <%= Request.QueryString["totalPrice"] %></span>
        </div>
        <div class="confirm-payment">
            <button type="button" onclick="confirmPayment()">Confirm Payment</button>
        </div>

        <a href="BuyTicket.aspx" class="back-link">Back to Buy Tickets</a>
    </div>

    <script type="text/javascript">
        function confirmPayment() {
            var data = {
                ticketName: '<%= Request.QueryString["ticketName"] %>',
                quantity: '<%= Request.QueryString["quantity"] %>',
                pricePerTicket: '<%= Request.QueryString["pricePerTicket"] %>',
                totalPrice: '<%= Request.QueryString["totalPrice"] %>'
            };

            fetch('Receipt.aspx/SaveReceipt', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            })
                .then(response => {
                    if (response.ok) {
                        alert('Receipt saved successfully!');
                    } else {
                        alert('Failed to save receipt. Please try again.');
                    }
                })
                .catch(error => {
                    alert('Failed to save receipt. Please try again.');
                    console.error('Error:', error);
                });
        }
    </script>
</body>
</html>
