using System;
using System.Web.UI;

namespace company
{
    public partial class company_menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Optional: You can initialize the dropdown list here if needed
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Get the selected option from the DropDownList
            string selectedOption = userType.SelectedValue;

            // Redirect based on the selected option
            if (selectedOption == "admin")
            {
                Response.Redirect("adminlogin.aspx");
            }
            else if (selectedOption == "staff")
            {
                Response.Redirect("userreg.aspx");
            }
        }
    }
}
