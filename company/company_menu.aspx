<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="company_menu.aspx.cs" Inherits="company.company_menu" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cineplex Company Menu</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: aqua;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            text-align: center;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="userForm" runat="server">
        <h1>Welcome to Debra Company Menu</h1>
        
        <label for="userType">Select User Type:</label>
        <asp:DropDownList ID="userType" runat="server" CssClass="form-control">
            <asp:ListItem Value="admin">Admin login</asp:ListItem>
            <asp:ListItem Value="staff">Partner login/Register</asp:ListItem>
        </asp:DropDownList>
        <br /><br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />

    </form>

    <script>
        //  redirection based on the selected option in the dropdown
        document.getElementById('userForm').addEventListener('submit', function (e) {
            e.preventDefault(); // Prevents the form from submitting in the traditional way

            // Get the selected option
            var selectedOption = document.getElementById('<%= userType.ClientID %>').value;

            // Redirect based on the selected option
            if (selectedOption === 'admin') {
                window.location.href = 'adminlogin.aspx';
            } else if (selectedOption === 'staff') {
                window.location.href = 'userreg.aspx';
            }
        });
    </script>

</body>
</html>
