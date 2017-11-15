using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

// for generating the pdf
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Reflection;


public partial class Default2 : System.Web.UI.Page
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

    protected void btnGenerateOfferLetter_Click(object sender, EventArgs e)
    {
        int username = (int)System.Web.HttpContext.Current.Session["LoggedIn"];

        string valFirstName = "";
        string valLastName = "";
        string valProgramme = "";
        string valDepartment = "";
        string valSchool = "";
        string valAddress = "";
        string valCity = "";

        // code to generate offer letter
        Document offerLetter = new Document(iTextSharp.text.PageSize.LETTER, 10, 10, 42, 35);
        PdfReader CURajBackground = null;

        OleDbConnection con = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;" + "Data Source=C:\\Users\\raj\\Documents\\Visual Studio 2015\\WebSites\\CURaj_Admission\\Data\\CURaj_Student_Details.accdb");
        
        try
        {
            con.Open();

            string selectString = "SELECT FirstName, LastName, Programme, Department, School , PostalAddress, City FROM Student_Profile " +
                "WHERE CUCETNo = " + username.ToString() + " ";
            OleDbCommand cmd = new OleDbCommand(selectString, con);

            OleDbDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                valFirstName = reader["FirstName"].ToString();
                valLastName = reader["LastName"].ToString();
                valProgramme = reader["Programme"].ToString();
                valDepartment = reader["Department"].ToString();
                valSchool = reader["School"].ToString();
                valAddress = reader["PostalAddress"].ToString();
                valCity = reader["City"].ToString();
            }


            reader.Close();
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            //error handling
        }

        try
        {   
            PdfWriter writer = PdfWriter.GetInstance(offerLetter, new FileStream("C:\\Users\\raj\\Documents\\Visual Studio 2015\\WebSites\\CURaj_Admission\\Test.pdf", FileMode.Create));
            const string background = "C:\\Users\\raj\\Documents\\Visual Studio 2015\\WebSites\\CURaj_Admission\\Content\\docs\\CURaj.pdf";

            offerLetter.Open();  // Open the document to write;

            // Load the background image and add it to the document structure
            CURajBackground = new PdfReader(background);
            PdfTemplate backGround = writer.GetImportedPage(CURajBackground, 1);

            // Create a page in the document and add it to the bottom layer
            offerLetter.NewPage();
            PdfContentByte _pcb = writer.DirectContentUnder;
            _pcb.AddTemplate(backGround, 0, 0);

            // Get the top layer and write some text
            _pcb = writer.DirectContent;
            _pcb.BeginText();

            string heading = "Offer Letter for Admission";

            string strProgramme = "Name of the Programme : " + valProgramme;
            string strDepartment = "Name of the Department : " + valDepartment;
            string strSchool = "Name of the School : " + valSchool;
            string strFrom = "From,";
            string strUniversityName = "Central University of Rajasthan";
            string strUniversityAddress1 = "Bandarsindri, Kishangarh";
            string strUniversityAddress2 = "Dist:-Ajmer(Raj.) 305817";
            string strTo = "To,";
            string strName = valFirstName + " " + valLastName;
            string strAddress1 = valAddress;
            string strAddress2 = valCity;
            string salutation = "Dear "+ valFirstName + " , ";
            string bodyContent1 = "With reference to your participation in the Concelling-and-Admission process," +
                "you are hereby offered Provisional";
            string bodyContent2 = " Admission to the aboveforementioned  programme of the University " +
                "subject to fulfillment of eligibilty and other ";
            string bodyContent3 = "conditions and verification of documents.";
            string wishes = "With best wishes ,";
            string signatory1 = "Head";
            string signatory2 = "Departmental Admission Committee";
            string signatory3 = "Central University of Rajasthan";
            string signatoryRight1 = "Seal / Stamp";



            BaseFont font = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, false);
            _pcb.SetFontAndSize(font,20);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_CENTER, heading, 290, 750, 0);

            _pcb.SetFontAndSize(font, 12);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, strProgramme, 45, 680, 0);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, strDepartment, 45, 665, 0);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, strSchool, 45, 650, 0);

            _pcb.SetFontAndSize(font, 11);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, strFrom, 45, 610, 0);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, strUniversityName, 70, 595, 0);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, strUniversityAddress1, 70, 580, 0);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, strUniversityAddress2, 70, 565, 0);

            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, strTo, 45, 535, 0);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, strName, 60, 520, 0);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, strAddress1, 60, 505, 0);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, strAddress2, 60, 490, 0);

            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, salutation, 45, 450, 0);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, bodyContent1, 45, 430, 0);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, bodyContent2, 45, 415, 0);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, bodyContent3, 45, 400, 0);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, wishes, 45, 360, 0);

            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, signatory1, 45, 250, 0);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, signatory2, 45, 235, 0);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, signatory3, 45, 220, 0);
            _pcb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, signatoryRight1, 480, 235, 0);


            _pcb.EndText();

            writer.Flush();

            // Write some Content
           //Paragraph paragraph = new Paragraph("Welcome to CURaj. \n New Line :)");
            // Now add the above created text using different class object to our Pdf document.  
           //offerLetter.Add(paragraph);
            offerLetter.Close(); // Close document
        }
        finally
        {
            if (CURajBackground != null)
            {
                CURajBackground.Close();
            }
            offerLetter.Close();
        }

        Response.Redirect("admission_success.aspx");
    }
}