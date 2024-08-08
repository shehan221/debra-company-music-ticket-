<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="curd.aspx.cs" Inherits="company.curd" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>EVENT TABLE</title>
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

    /* Table styles */
    .crud-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .crud-table th, .crud-table td {
        padding: 12px;
        border: 1px solid #ccc;
        text-align: left;
    }

    .crud-table th {
        background-color: #f0f0f0;
    }

    /* Link styles */
    .edit-link, .delete-link, .create-link {
        display: inline-block;
        padding: 8px 12px;
        margin-right: 8px;
        cursor: pointer;
        text-decoration: none;
        color: #fff;
        background-color: #337ab7; /* Blue color for links */
        border: 1px solid #2e6da4;
        border-radius: 4px;
        transition: background-color 0.3s ease;
    }

    .edit-link:hover, .delete-link:hover, .create-link:hover {
        background-color: #286090; /* Darker blue on hover */
    }

    /* Form layout */
    form {
        max-width: 800px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 6px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
</style>

<script type="text/javascript">
    function deleteRow(ticketID) {
        if (confirm("Are you sure you want to delete this ticket?")) {
            // Perform AJAX delete request
            $.ajax({
                type: "POST",
                url: "curd.aspx/DeleteTicket",
                data: JSON.stringify({ ticketID: ticketID }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d && response.d.success) {
                        alert(response.d.message);
                        location.reload(); // Reload the page after successful delete
                    } else {
                        alert('Failed to delete ticket.');
                    }
                },
                error: function () {
                    alert('Error deleting ticket.');
                }
            });
        }
    }
</script>

</head>
<body>
    <form id="form1" runat="server">
        <h2>Event Edit Table</h2>

        <a href="add.aspx" class="create-link">Create</a>
        
        <asp:GridView ID="gridViewTickets" runat="server" AutoGenerateColumns="False" CssClass="crud-table">
            <Columns>
                <asp:BoundField DataField="TicketID" HeaderText="ID" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Price" HeaderText="Price (Rs)" DataFormatString="Rs {0:N}" />
                <asp:BoundField DataField="AvailableTickets" HeaderText="Available Tickets" />
                <asp:BoundField DataField="EventDate" HeaderText="Event Date" DataFormatString="{0:d}" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <a href='<%# "edit.aspx?id=" + Eval("TicketID") %>' class="edit-link">Edit</a>
                        <a href='<%# "javascript:void(0);" %>' onclick='<%# "deleteRow(" + Eval("TicketID") + ")" %>' class="delete-link">Delete</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </form>
</body>
</html>
