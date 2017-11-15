<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="room_reservation.aspx.cs" Inherits="room_reservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Accomodation Successful</title>
    <link href="Content/css/form.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/form.js"> </script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
   
    <div class="container">
	    <div class="row text-center">
            <div class="col-sm-6 col-sm-offset-3">
                <br /><br>
                <br><br> <h2 style="color:#0fad00">Success</h2>
                <img src="Content/img/check-true.jpg">
                <h3>Dear, Student</h3>
                <p style="font-size:20px;color:#5C5C5C;">  
                     <strong>You application has been Submitted to the Warden Office. </strong>
                         <br>Contact the Warden Office for further details.
                  </p>
                    <br> <br>
                    <a href="http://www.curaj.ac.in/" class="btn btn-success">  CURaj Home  </a>
                <br><br>
            </div>
	    </div>
    </div>   

</asp:Content>

