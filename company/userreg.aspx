<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userreg.aspx.cs" Inherits="company.userreg" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Registration Form</title>
    <style>
        /* Custom CSS for form */
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
        }

        .form-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* Ensure padding is included in width calculation */
        }

        .btn-primary {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            cursor: pointer;
            margin-top: 0px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .form-check-input {
            margin-top: 5px;
        }
    </style>
</head>

<body>
    <div class="form-container">
        <h2 class="form-header">Registration Form</h2>
        <form runat="server" method="post">
            <div class="form-group">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" required ></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtPass" class="form-label">Password</label>
                <asp:TextBox ID="txtPass" CssClass="form-control" runat="server" TextMode="Password" required></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="TextBox1" class="form-label">Company Name</label>
                <asp:TextBox ID="txtcomna" CssClass="form-control" runat="server" required></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtAdd" class="form-label">Company Address</label>
                <asp:TextBox ID="txtAdd" CssClass="form-control" runat="server" required></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="TextBox2" class="form-label">City</label>
                <asp:TextBox ID="txtcity" CssClass="form-control" runat="server" required></asp:TextBox>
            </div>
            <div class="col-12">
                <asp:Button ID="Button1" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="Button1_Click" />
            </div>
             <div style="text-align: center; margin-bottom: 20px;">
            <a href="login.aspx">Login here</a>
        </div>
        </form>
    </div>
</body>

</html>
