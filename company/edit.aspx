<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="company.edit" %>

<!DOCTYPE html>
<html lang="en">
<head>
     <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
        }
        #form1 {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        div.form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        .btn-save {
            padding: 10px 20px;
            background-color: #337ab7;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn-save:hover {
            background-color: #286090;
        }
    </style>
    <meta charset="UTF-8" />
    <title>Edit Ticket</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var ticketID = '<%= Request.QueryString["id"] %>';

            // Load ticket details on page load
            $.ajax({
                type: "POST",
                url: "edit.aspx/GetTicketDetails",
                data: JSON.stringify({ ticketID: ticketID }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        $('#txtTicketID').val(response.d.ticketID);
                        $('#txtName').val(response.d.name);
                        $('#txtPrice').val(response.d.price);
                        $('#txtAvailableTickets').val(response.d.availableTickets);
                        $('#txtEventDate').val(response.d.eventDate);
                    } else {
                        alert('Ticket details not found.');
                    }
                },
                error: function () {
                    
                }
            });

            // Handle form submission
            $('#btnSave').click(function (e) {
                e.preventDefault();

                var ticketID = $('#txtTicketID').val();
                var name = $('#txtName').val();
                var price = parseFloat($('#txtPrice').val());
                var availableTickets = parseInt($('#txtAvailableTickets').val(), 10);
                var eventDate = $('#txtEventDate').val();

                $.ajax({
                    type: "POST",
                    url: "edit.aspx/UpdateTicket",
                    data: JSON.stringify({
                        ticketID: ticketID,
                        name: name,
                        price: price,
                        availableTickets: availableTickets,
                        eventDate: eventDate
                    }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d && response.d.success) {
                            alert(response.d.message);
                            window.location.href = 'curd.aspx'; // Redirect to CRUD page after successful update
                        } else {
                            alert('Failed to update ticket.');
                        }
                    },
                    error: function () {
                        alert('Error updating ticket.');
                    }
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Edit Ticket</h2>
        <div class="form-group">
            <asp:Label ID="lblTicketID" runat="server" Text="Ticket ID:" AssociatedControlID="txtTicketID"></asp:Label>
            <asp:TextBox ID="txtTicketID" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
        </div>
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
            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn-save" />
        </div>
    </form>
</body>
</html>
