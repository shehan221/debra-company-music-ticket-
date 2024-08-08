using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Services;
using System.Web.Services;

namespace company
{
    public partial class edit : System.Web.UI.Page
    {
        private string connectionString = "Data Source=DESKTOP-Q5JGSJE\\SQLEXPRESS;Initial Catalog=companydata;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if ticketID is provided in query string
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    int ticketID = Convert.ToInt32(Request.QueryString["id"]);
                    PopulateTicketDetails(ticketID);
                }
                else
                {
                    
                    Response.Redirect("curd.aspx"); // Redirect to CRUD page or handle as appropriate
                }
            }
        }

        private void PopulateTicketDetails(int ticketID)
        {
            string query = "SELECT TicketID, Name, Price, AvailableTickets, EventDate FROM Tickets WHERE TicketID = @TicketID";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@TicketID", ticketID);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Read ticket details from the database
                        txtTicketID.Text = reader["TicketID"].ToString();
                        txtName.Text = reader["Name"].ToString();
                        txtPrice.Text = reader["Price"].ToString();
                        txtAvailableTickets.Text = reader["AvailableTickets"].ToString();
                        txtEventDate.Text = Convert.ToDateTime(reader["EventDate"]).ToString("yyyy-MM-dd");
                    }
                    else
                    {
                       
                        Response.Redirect("curd.aspx"); 
                    }
                }
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object UpdateTicket(int ticketID, string name, decimal price, int availableTickets, DateTime eventDate)
        {
            string connectionString = "Data Source=DESKTOP-Q5JGSJE\\SQLEXPRESS;Initial Catalog=companydata;Integrated Security=True;";
            string query = "UPDATE Tickets SET Name = @Name, Price = @Price, AvailableTickets = @AvailableTickets, EventDate = @EventDate WHERE TicketID = @TicketID";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@TicketID", ticketID);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@AvailableTickets", availableTickets);
                    cmd.Parameters.AddWithValue("@EventDate", eventDate);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        return new { success = true, message = "Ticket updated successfully" };
                    }
                    else
                    {
                        return new { success = false, message = "Failed to update ticket" };
                    }
                }
            }
        }
    }
}
