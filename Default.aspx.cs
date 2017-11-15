using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["LoggedIn"] != null && Session["AuthToken"] != null
           && Request.Cookies["AuthToken"] != null)
            {
                if (!Session["AuthToken"].ToString().Equals(
                   Request.Cookies["AuthToken"].Value))
                {
                    // error code

                }
                else
                {
                    Logout();
                }
            }
            else
            {
                // error
            }

    }

    public static string sanitize(string s)
    {
        StringBuilder b = new StringBuilder(s.Length * 3 / 2);
        foreach (char c in s)

            if (c > '~') b.AppendFormat("&#x{0:x};", (long)c);
            else switch (c)
                {
                    case '"': b.Append("&quot;"); break;
                    case '&': b.Append("&amp;"); break;
                    case '<': b.Append("&lt;"); break;
                    case '>': b.Append("&gt;"); break;
                    default: b.Append(c); break;
                }
        return b.ToString();
    }

    protected void Logout()
      {
          Session.Clear();
          Session.Abandon();
          Session.RemoveAll();

          if (Request.Cookies["ASP.NET_SessionId"] != null)
          {
              Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
              Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-20);
          }

          if (Request.Cookies["AuthToken"] != null)
          {
              Response.Cookies["AuthToken"].Value = string.Empty;
              Response.Cookies["AuthToken"].Expires = DateTime.Now.AddMonths(-20);
          }
          

      } 

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        String varRegistrationNo = null;
        String varPassword = null;
        //   String user_name = sanitize(roll_no.Text);
        //  String password = sanitize(cucet_password.Text);
        String user_name = roll_no.Text;
        String password = cucet_password.Text;

        String varEligibility = null;

        OleDbConnection con = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\raj\\Documents\\Visual Studio 2015\\WebSites\\CURaj_Admission\\Data\\CURaj_Student_Details.accdb");

        con.Open();

        String strQuery = "SELECT RegistrationNo, Password, Eligible FROM CUCET_Details WHERE RegistrationNo = " + user_name + " AND Password = '" + password.ToString() + "' ";

        OleDbCommand cmd = new OleDbCommand(strQuery, con);

        OleDbDataReader reader = cmd.ExecuteReader();

        while (reader.Read())
        {
            varRegistrationNo = reader["RegistrationNo"].ToString();
            varPassword = reader["Password"].ToString();
            varEligibility = reader["Eligible"].ToString() ;
           
        }

        if (varEligibility == null && varRegistrationNo == null) {
            varRegistrationNo = "";
            varEligibility = "";
        
        }
        reader.Close();
        cmd.ExecuteNonQuery();

        if (!(varRegistrationNo.Equals("")) && (varEligibility.Equals("True")))
        {
            Session["LoggedIn"] = int.Parse(varRegistrationNo);
            
            string guid = Guid.NewGuid().ToString();
            Session["AuthToken"] = guid;
            // now create a new cookie with this guid value
            Response.Cookies.Add(new HttpCookie("AuthToken", guid));


            // checking eligibility

            Response.Redirect("admission_form.aspx");
        }
        else
        {
            if (varEligibility.Equals("False"))
            {
                errorLabel.Text = "You are not eligible for the Current Allotment. Better luck next time!";
                errorLabel.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                errorLabel.Text = "Incorrect Login Credentials!";
                errorLabel.ForeColor = System.Drawing.Color.Red;
            }
        }

        con.Close();
    }
}


