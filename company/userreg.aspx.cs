using System;
using System.Data.SqlClient;

namespace company
{
    public partial class userreg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = "Data Source=DESKTOP-Q5JGSJE\\SQLEXPRESS;Initial Catalog=companydata;Integrated Security=True;";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string insertQuery = "INSERT INTO companydata (email, pass, comname, comadd, city) VALUES (@email, @pass, @comname, @comadd, @city)";
                    using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@pass", txtPass.Text);
                        cmd.Parameters.AddWithValue("@comname", txtcomna.Text);
                        cmd.Parameters.AddWithValue("@comadd", txtAdd.Text);
                        cmd.Parameters.AddWithValue("@city", txtcity.Text);

                        int count = cmd.ExecuteNonQuery();
                        if (count > 0)
                        {
                            Response.Write("<script>alert('Registered successfully');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Error in registration');</script>");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                // Log the exception somewhere for debugging purposes
            }
        }
    }
}
