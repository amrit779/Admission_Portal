<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admission_success.aspx.cs" Inherits="admission_success" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Admission Success</title>
    <link href="Content/css/form.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/form.js"> </script>
    <script src="Scripts/print_letter.js"></script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div onload="load();">
        <form id="form1" runat="server">
            <div>
               <iframe id="frame1" src="Test.pdf"  runat="server" frameborder="0" style="height: 0px; width: 0px;" />
            </div>
        </form>
    </div>

    <div class="row">
        <div class="col-xs-12 col-sm-10 col-md-10 col-sm-offset-1 col-md-offset-1">
            <div class="progress">
                <div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar"
                    aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
                        100% Complete (info)
                </div>
            </div>
        </div>
    </div>

    <div class="container">
	    <div class="row text-center">
            <div class="col-sm-6 col-sm-offset-3">
                <br><br> <h2 style="color:#0fad00">Success</h2>
                <img src="Content/img/check-true.jpg">
                <h3>Dear, Student</h3>
                <p style="font-size:20px;color:#5C5C5C;">Congratulations!  
                    <a href="Test.pdf">Click here</a> to print the Offer Letter.</p>
                    <a href="http://www.curaj.ac.in/" class="btn btn-success">  CURaj Home  </a>
                <br><br>
            </div>
	    </div>
    </div>


    <div class="alert alert-info" role="alert">
        <div class="container-fluid">
	      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
	      </button>
	      <b><strong>Accomodation:</strong></b> You can avail the hostel accomodation only by registering for it above.  
            <strong><em>Hurry!!! Limited Seats only.</em></strong>
     </div>
</div>

</asp:Content>

