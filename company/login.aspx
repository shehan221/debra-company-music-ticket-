<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="company.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        #form1 {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-control {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn {
            display: inline-block;
            padding: 8px 20px;
            font-size: 14px;
            font-weight: bold;
            color: #fff;
            background-color: #337ab7;
            border: 1px solid #2e6da4;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #286090;
            border-color: #204d74;
        }
        .error-message {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }
        .register-link {
            text-align: center;
            margin-top: 10px;
        }
        .register-link a {
            color: #337ab7;
            text-decoration: none;
        }
        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <h2>Login Page</h2>
            <div class="form-group">
                <label>Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required ></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Password:</label>
                <asp:TextBox ID="txtPass" TextMode="Password" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnlog" Text="Login" OnClick="btnlog_Click" runat="server" CssClass="btn" />
            </div>
            <div>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="error-message"></asp:Label>
            </div>
            <div class="register-link">
                <a href="userreg.aspx">Create a new account</a>
            </div>
        </div>
    </form>
</body>
</html>
