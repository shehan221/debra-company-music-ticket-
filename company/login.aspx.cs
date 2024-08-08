using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace company
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlog_Click(object sender, EventArgs e)

        {
            try
            {
                string connectionString = "Data Source=DESKTOP-Q5JGSJE\\SQLEXPRESS;Initial Catalog=companydata;Integrated Security=True;";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "SELECT COUNT(*) FROM companydata WHERE email = @email AND pass = @pass";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@pass", txtPass.Text);

                        int count = (int)cmd.ExecuteScalar();

                        if (count > 0)
                        {
                            // Login successful
                            Response.Write("<script>alert('Login successfully');</script>");
                            Response.Redirect("curd.aspx");
                           
                        }
                        else
                        {
                            lblMessage.Text = "Invalid email or password";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = $"Error: {ex.Message}";
                
            }
        }
    }
}