using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace company
{
    public partial class add : System.Web.UI.Page
    {
        private string connectionString = "Data Source=DESKTOP-Q5JGSJE\\SQLEXPRESS;Initial Catalog=companydata;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            decimal price = Convert.ToDecimal(txtPrice.Text);
            int availableTickets = Convert.ToInt32(txtAvailableTickets.Text);
            DateTime eventDate = Convert.ToDateTime(txtEventDate.Text);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Tickets (Name, Price, AvailableTickets, EventDate) VALUES (@Name, @Price, @AvailableTickets, @EventDate)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@AvailableTickets", availableTickets);
                    cmd.Parameters.AddWithValue("@EventDate", eventDate);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Session["SuccessMessage"] = "Ticket added successfully";
                        Response.Redirect("curd.aspx"); 
                    }
                    else
                    {
                        Session["ErrorMessage"] = "Failed to add ticket";
                    }
                }
            }
        }
    }
}
