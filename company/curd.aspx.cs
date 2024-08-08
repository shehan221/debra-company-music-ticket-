using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace company
{
    public partial class curd : Page
    {
        // Define a class to hold ticket information
        public class Ticket
        {
            public int TicketID { get; set; }
            public string Name { get; set; }
            public decimal Price { get; set; }
            public int AvailableTickets { get; set; }
            public DateTime EventDate { get; set; }
        }


        public static object DeleteTicket(int ticketID)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["companydataConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM Tickets WHERE TicketID = @TicketID";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@TicketID", ticketID);
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            return new { success = true, message = "Ticket deleted successfully." };
                        }
                        else
                        {
                            return new { success = false, message = "Failed to delete ticket." };
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return new { success = false, message = "Error: " + ex.Message };
            }
        }
    

    protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Ticket> Tickets = new List<Ticket>();

                // Retrieve connection string from web.config
                string connectionString = "Data Source=DESKTOP-Q5JGSJE\\SQLEXPRESS;Initial Catalog=companydata;Integrated Security=True;";
                string query = "SELECT TicketID, Name, Price, AvailableTickets, EventDate FROM Tickets";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        Tickets.Add(new Ticket
                        {
                            TicketID = Convert.ToInt32(reader["TicketID"]),
                            Name = reader["Name"].ToString(),
                            Price = Convert.ToDecimal(reader["Price"]),
                            AvailableTickets = Convert.ToInt32(reader["AvailableTickets"]),
                            EventDate = Convert.ToDateTime(reader["EventDate"])
                        });
                    }

                    reader.Close();
                }

               
                gridViewTickets.DataSource = Tickets; 
                gridViewTickets.DataBind();
            }
        }
    }
}
