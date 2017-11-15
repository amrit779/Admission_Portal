using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// for generating the pdf
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;

public partial class admission_success : System.Web.UI.Page
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

    private void PrintMenu()
    {
    
    var filePathName = "Test.pdf";
    var notUriPath = Server.MapPath("~/" + filePathName);

        var doc = new Document();
        var reader = new PdfReader(notUriPath);
        using (var memoryStream = new MemoryStream())
        {
            var writer = PdfWriter.GetInstance(doc, memoryStream);
            doc.Open();

            // this action leads directly to printer dialogue
            var jAction = PdfAction.JavaScript("this.print(true);\r", writer);
            writer.AddJavaScript(jAction);

            var cb = writer.DirectContent;
            doc.AddDocListener(writer);

            for (var p = 1; p <= reader.NumberOfPages; p++)
            {
                doc.SetPageSize(reader.GetPageSize(p));
                doc.NewPage();
                var page = writer.GetImportedPage(reader, p);
                var rot = reader.GetPageRotation(p);
                if (rot == 90 || rot == 270)
                    cb.AddTemplate(page, 0, -1.0F, 1.0F, 0, 0, reader.GetPageSizeWithRotation(p).Height);
                else
                    cb.AddTemplate(page, 1.0F, 0, 0, 1.0F, 0, 0);
            }

            reader.Close();
            doc.Close();
            File.WriteAllBytes(notUriPath, memoryStream.ToArray());
        }

        frame1.Attributes.Add("src", "C:\\Users\\raj\\Documents\\Visual Studio 2015\\WebSites\\CURaj_Admission\\Test.pdf");
    }
}