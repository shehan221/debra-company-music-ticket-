using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

namespace company
{
    public partial class Receipt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        [WebMethod]
        public static void SaveReceipt(string ticketName, int quantity, decimal pricePerTicket, decimal totalPrice)
        {
        
            string connectionString = "Data Source=DESKTOP-Q5JGSJE\\SQLEXPRESS;Initial Catalog=companydata;Integrated Security=True;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                
                string sql = "INSERT INTO Receipts (TicketName, Quantity, PricePerTicket, TotalPrice, OrderDate) " +
                             "VALUES (@TicketName, @Quantity, @PricePerTicket, @TotalPrice, @OrderDate)";

                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    
                    command.Parameters.AddWithValue("@TicketName", ticketName);
                    command.Parameters.AddWithValue("@Quantity", quantity);
                    command.Parameters.AddWithValue("@PricePerTicket", pricePerTicket);
                    command.Parameters.AddWithValue("@TotalPrice", totalPrice);
                    command.Parameters.AddWithValue("@OrderDate", DateTime.Now);

                  
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
