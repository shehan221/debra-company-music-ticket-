<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="company.add" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create Ticket</title>
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 20px;
        }

        h2 {
            color: #333;
        }

        form {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 6px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
        }

        input[type=text], input[type=number], input[type=date] {
            width: calc(100% - 16px); 
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; 
        }

        input[type=text]:focus, input[type=number]:focus, input[type=date]:focus {
            outline: none;
            border-color: #337ab7; 
        }

        .btn-create {
            background-color: #337ab7;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-create:hover {
            background-color: #286090; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Create Ticket</h2>
        <div class="form-group">
            <asp:Label ID="lblName" runat="server" Text="Name:" AssociatedControlID="txtName"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblPrice" runat="server" Text="Price:" AssociatedControlID="txtPrice"></asp:Label>
            <asp:TextBox ID="txtPrice" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblAvailableTickets" runat="server" Text="Available Tickets:" AssociatedControlID="txtAvailableTickets"></asp:Label>
            <asp:TextBox ID="txtAvailableTickets" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblEventDate" runat="server" Text="Event Date:" AssociatedControlID="txtEventDate"></asp:Label>
            <asp:TextBox ID="txtEventDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btnCreate" runat="server" Text="Create Ticket" OnClick="btnCreate_Click" CssClass="btn-create" />
        </div>
    </form>
</body>
</html>
