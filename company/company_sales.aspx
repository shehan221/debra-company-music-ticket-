<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="company_sales.aspx.cs" Inherits="company.company_sales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Company Sales</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        #gridViewTickets {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #ddd;
            margin-bottom: 20px;
        }

        #gridViewTickets th, #gridViewTickets td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #gridViewTickets th {
            background-color: #f2f2f2;
            text-align: left;
        }

        #gridViewTickets tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        #gridViewTickets tr:hover {
            background-color: #e9e9e9;
        }

        #lblTotalSales {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-top: 20px; /* Add margin top for spacing */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Sales Report</h2>

            <asp:GridView ID="gridViewTickets" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ReceiptID" HeaderText="Receipt ID" />
                    <asp:BoundField DataField="TicketName" HeaderText="Ticket Name" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="PricePerTicket" HeaderText="Price Per Ticket (Rs)" DataFormatString="Rs {0:N2}" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total Price (Rs)" DataFormatString="Rs {0:N2}" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:yyyy-MM-dd}" />
                </Columns>
            </asp:GridView>

            <asp:Label ID="lblTotalSales" runat="server" Text="Total Sales: Rs 0.00"></asp:Label>
        </div>
    </form>
</body>
</html>
