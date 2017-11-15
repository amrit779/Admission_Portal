using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class room_reservation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoggedIn"] != null && Session["AuthToken"] != null
    && Request.Cookies["AuthToken"] != null)
        {
            if (!Session["AuthToken"].ToString().Equals(
               Request.Cookies["AuthToken"].Value))
            {
                Response.Redirect("Default.aspx");
            }
            else
            {

            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
}