using System;
using System.Web.UI;

namespace company
{
    public partial class adminlogin : Page
    {
        // Hardcoded admin username and password 
        private const string AdminUsername = "shehan";
        private const string AdminPassword = "2001";

        protected void Page_Load(object sender, EventArgs e)
        {
            //  Redirect to another page if already logged in
            if (Session["AdminUsername"] != null)
            {
                Response.Redirect("adminpanel.aspx"); // Redirect to admin panel page
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Check if username and password match hardcoded values
            if (username == AdminUsername && password == AdminPassword)
            {
                // Store username in session
                Session["AdminUsername"] = username;

                // Redirect to admin panel page
                Response.Redirect("company_sales.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
            }
        }
    }
}
