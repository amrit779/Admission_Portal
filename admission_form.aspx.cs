using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;


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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (first_name.Text == "" || last_name.Text == "" || sex.Text == "" ||
            dob.Text == "" || mothers_name.Text == "" || fathers_name.Text == "" ||
            nationality.Text == "" || category.Text == "" || address.Text == "" ||
            city.Text == "" || pincode.Text == "" || state.Text == "" || phone_num.Text == "" ||
            mobile_num.Text == "" || email.Text == "" || program_name.Text == "" || 
            department_name.Text == "" ||  school_name.Text == "")
        {
            //Response.Redirect("admission_form.aspx");
            //errorLabel.Text = "All Fields are Compulsory!";
            //errorLabel.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
          // code to save to database
            OleDbConnection con = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;" + "Data Source=C:\\Users\\raj\\Documents\\Visual Studio 2015\\WebSites\\CURaj_Admission\\Data\\CURaj_Student_Details.accdb");
            try
            {
                con.Open();

                OleDbCommand cmd = new OleDbCommand();
                cmd.CommandText = "INSERT INTO Student_Profile (CUCETNo, FirstName, LastName, Sex, DOB, MothersName, " +
                    "MothersOccupation, FathersName, FathersOccupation, Nationality, Category, PostalAddress, City, " +
                    "PinCode, State, PhoneNo, MobileNo, Email, Programme, Department, School) " +
                    "VALUES (@cucet_no, @first_name, @last_name, @sex, @dob, @mothers_name, @mothers_occupation, @fathers_name, " +
                    "@fathers_occupation, @nationality, @category, @postal_address, @city, @pincode, @state, @phone_no, " +
                    "@mobile_no, @email, @programme, @department, @school)";

                int user_name = (int)System.Web.HttpContext.Current.Session["LoggedIn"];

                cmd.Parameters.AddWithValue("@cucet_no", user_name.ToString());
                cmd.Parameters.AddWithValue("@first_name", first_name.Text);
                cmd.Parameters.AddWithValue("@last_name", last_name.Text);
                cmd.Parameters.AddWithValue("@sex", sex.Text);
                cmd.Parameters.AddWithValue("@dob", dob.Text);
                cmd.Parameters.AddWithValue("@mothers_name", mothers_name.Text);
                cmd.Parameters.AddWithValue("@mothers_occupation", mothers_job.Text);
                cmd.Parameters.AddWithValue("@fathers_name", fathers_name.Text);
                cmd.Parameters.AddWithValue("@fathers_occupation", fathers_job.Text);
                cmd.Parameters.AddWithValue("@nationality", nationality.Text);
                cmd.Parameters.AddWithValue("@category", category.Text);
                cmd.Parameters.AddWithValue("@postal_address", address.Text);
                cmd.Parameters.AddWithValue("@city", city.Text);
                cmd.Parameters.AddWithValue("@pincode", int.Parse(pincode.Text));
                cmd.Parameters.AddWithValue("@state", state.Text);
                cmd.Parameters.AddWithValue("@phone_no", int.Parse(phone_num.Text));
                cmd.Parameters.AddWithValue("@mobile_no", int.Parse(mobile_num.Text));
                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@programme", program_name.Text);
                cmd.Parameters.AddWithValue("@department", department_name.Text);
                cmd.Parameters.AddWithValue("@school", school_name.Text);

                cmd.Connection = con;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                //error handling
            }

            //BindUserDetails();

            Response.Redirect("document_checklist.aspx");
        }
        
    }

    /*
    protected void BindUserDetails()
    {
        DataSet ds = new DataSet();
        string strquery = "SELECT * Student_Profile";
        using (con = new OleDbConnection(@"PROVIDER=Microsoft.ACE.OLEDB.12;" + @"DATA SOURCE=E:\accessdb\Sampledb.accdb"))
        {
            using (cmd = new OleDbCommand(strquery, con))
            {
                OleDbDataAdapter Da = new OleDbDataAdapter(cmd);
                Da.Fill(ds);
            }
        }
        gvDetails.DataSource = ds;
        gvDetails.DataBind();
    }
    */

} 