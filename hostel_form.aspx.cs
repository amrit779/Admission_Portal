using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

public partial class hostel_form : System.Web.UI.Page
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
                //
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // code to save to database
        OleDbConnection con = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\raj\\Documents\\Visual Studio 2015\\WebSites\\CURaj_Admission\\Data\\CURaj_Student_Details.accdb");

        try
        {
            con.Open();

            OleDbCommand cmd = new OleDbCommand();
            cmd.CommandText = "INSERT INTO Student_Hostel_Profile (CUCETNo, StudentName, DateOfBirth, Sex, Category,"+
                "MotherName, MotherContact, FatherName, FatherContact, BloodGroup, Married, PhotoID, PhotoIDNumber,"+
                "PermanentAddress, City, Pincode, State, PhoneNumber, Email, ContactNumber, NameOfProgramme,"+
                "NameOfDepartment, NameOfSchool, GuardianName, GuardianAddress, GuardianCity, GuardianPinCode,"+
                "GuardianState, GuardianPhoneNo, GuardianEmail, GuardianMobileNo) VALUES (@cucet_no, @student_name,"+
                "@dob, @sex, @category, @mName, @mContact, @fName, @fContact, @blood_group, @married, @photo_id,"+
                "@photo_id_no, @pAddress, @pCity, @pPIN, @pState, @pPhone, @email, @pContact, @program, @dept, @school," +
                "@guardian_name, @guardian_address, @guardian_city, @guardian_pin_code, @guardian_state,"+
                "@guardian_phone_no, @guardian_email, @guardian_mobile_no)";

            int user_name = (int)System.Web.HttpContext.Current.Session["LoggedIn"];

            cmd.Parameters.AddWithValue("@cucet_no", user_name);
            cmd.Parameters.AddWithValue("@student_name", student_name.Text);
            cmd.Parameters.AddWithValue("@dob", dob.Text);
            cmd.Parameters.AddWithValue("@sex", sex.Text);
            cmd.Parameters.AddWithValue("@category", category1.Text);
            cmd.Parameters.AddWithValue("@mName", mothers_name.Text);
            cmd.Parameters.AddWithValue("@mContact", int.Parse(mothers_contact.Text));
            cmd.Parameters.AddWithValue("@fName", fathers_name.Text);
            cmd.Parameters.AddWithValue("@fContact", int.Parse(fathers_contact.Text));
            cmd.Parameters.AddWithValue("@blood_group", blood_group.Text);
            cmd.Parameters.AddWithValue("@married", marital_status.Text);
            cmd.Parameters.AddWithValue("@photo_id", photo_id.Text);
            cmd.Parameters.AddWithValue("@photo_id_no", photo_id_no.Text);
            cmd.Parameters.AddWithValue("@pAddress", address.Text);
            cmd.Parameters.AddWithValue("@pCity", city.Text);
            cmd.Parameters.AddWithValue("@pPIN", int.Parse(pincode.Text));
            cmd.Parameters.AddWithValue("@pState", state.Text);
            cmd.Parameters.AddWithValue("@pPhone", int.Parse(phone_num.Text));
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@pContact", int.Parse(mobile_num.Text));
            cmd.Parameters.AddWithValue("@program", program_name.Text);
            cmd.Parameters.AddWithValue("@dept", department_name.Text);
            cmd.Parameters.AddWithValue("@school", school_name.Text);
            cmd.Parameters.AddWithValue("@guardian_name", guardian_name.Text);
            cmd.Parameters.AddWithValue("@guardian_address", Eaddress.Text);
            cmd.Parameters.AddWithValue("@guardian_city", Ecity.Text);
            cmd.Parameters.AddWithValue("@guardian_pin_code", int.Parse(Epincode.Text));
            cmd.Parameters.AddWithValue("@guardian_state", gstate.Text);
            cmd.Parameters.AddWithValue("@guardian_phone_no", int.Parse(Ephone_num.Text));
            cmd.Parameters.AddWithValue("@guardian_email", Eemail.Text);
            cmd.Parameters.AddWithValue("@guardian_mobile_no", int.Parse(Emobile_num.Text));
            

            cmd.Connection = con;
            cmd.ExecuteNonQuery();

            Response.Redirect("room_reservation.aspx");
        }
        catch (Exception ex)
        {
            // error handling
        }
    }
}