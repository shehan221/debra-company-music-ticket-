using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static company.curd;

namespace company
{
    public partial class curd : Page
    {
        // Define a class to hold receipt information
        public class Receipts
        {
            public int ReceiptID { get; set; }
            public string TicketName { get; set; }
            public int Quantity { get; set; }
            public decimal PricePerTicket { get; set; }
            public decimal TotalPrice { get; set; }
            public DateTime OrderDate { get; set; }
        }

    }
    public partial class company_sales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Receipts> receiptsList = new List<Receipts>();

                // Retrieve connection 
                string connectionString = "Data Source=DESKTOP-Q5JGSJE\\SQLEXPRESS;Initial Catalog=companydata;Integrated Security=True;";
                string query = "SELECT ReceiptID, TicketName, Quantity, PricePerTicket, TotalPrice, OrderDate FROM Receipts";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        receiptsList.Add(new Receipts
                        {
                            ReceiptID = Convert.ToInt32(reader["ReceiptID"]),
                            TicketName = reader["TicketName"].ToString(),
                            Quantity = Convert.ToInt32(reader["Quantity"]),
                            PricePerTicket = Convert.ToDecimal(reader["PricePerTicket"]),
                            TotalPrice = Convert.ToDecimal(reader["TotalPrice"]),
                            OrderDate = Convert.ToDateTime(reader["OrderDate"])
                        });
                    }

                    reader.Close();
                }

                // Calculate total sales
                decimal totalSales = receiptsList.Sum(r => r.TotalPrice);

                // Display total sales (Rs) 
                lblTotalSales.Text = "Total Sales: Rs " + totalSales.ToString("N2");

                // Bind the receipts list to the GridView
                gridViewTickets.DataSource = receiptsList;
                gridViewTickets.DataBind();
            }
        }

    }
}

