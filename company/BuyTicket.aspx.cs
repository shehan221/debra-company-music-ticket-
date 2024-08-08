using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace company
{
    public partial class BuyTicket : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load tickets into DropDownList on first page load
                BindTicketsDropDown();
            }
        }

        protected void BindTicketsDropDown()
        {
            // Define connection string from web.config
            string connectionString = "Data Source=DESKTOP-Q5JGSJE\\SQLEXPRESS;Initial Catalog=companydata;Integrated Security=True;";
            string query = "SELECT TicketID, Name, Price, AvailableTickets, EventDate FROM Tickets";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable ticketsTable = new DataTable();

                try
                {
                    connection.Open();
                    adapter.Fill(ticketsTable);

                    // Bind the DataTable to the DropDownList
                    ticketSelect.DataSource = ticketsTable;
                    ticketSelect.DataTextField = "Name"; // Displayed text in DropDownList
                    ticketSelect.DataValueField = "TicketID"; // Value corresponding to each item
                    ticketSelect.DataBind();

                    // Add data-price attribute to each option for client-side access
                    for (int i = 0; i < ticketSelect.Items.Count; i++)
                    {
                        ListItem item = ticketSelect.Items[i];
                        DataRow row = ticketsTable.Rows[i];
                        item.Attributes["data-price"] = row["Price"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    // Handle any exceptions (e.g., log, display error message)
                    throw new Exception("Error fetching tickets: " + ex.Message);
                }
            }

            // Add initial price update using JavaScript function on page load
            ClientScript.RegisterStartupScript(this.GetType(), "UpdatePriceScript", "updatePrice();", true);
        }


    }
}
