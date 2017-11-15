<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/LandingMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admission Portal Login</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/form-elements.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script type = "text/javascript">
            function onPostBack() {
                var y = generateRandomSequence();
                var hdnGuid = document.getElementById("hdnGuid");
                hdnGuid.value = y;
            }

            function generateRandomSequence() {
                var g = "";
                for (var i = 0; i < 32; i++)
                    g += Math.floor(Math.random() * 0xF).toString(0xF)
                return g;
            }
        </script>

         <script type="text/javascript">
             function filterDigits(eventInstance) {
                 eventInstance = eventInstance || window.event;
                 key = eventInstance.keyCode || eventInstance.which;
                 if ((47 < key) && (key < 58) || key == 8) {
                     return true;
                 } else {
                     if (eventInstance.preventDefault) eventInstance.preventDefault();
                     eventInstance.returnValue = false;
                     return false;
                 } //if
             } //filterDigits
         </script>
        <!-- Favicon and touch icons -->
		<link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>Integrated Admission Portal</strong></h1>
                            <div class="description">
                            	<p>
	                            	To check your Eligibility and to Apply for the Programmes offered in 
	                            	Central University of Rajasthan <a href="http://www.curaj.ac.in"><strong>CURaj</strong></a>, log-in using your CUCET details.
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Welcome</h3>
                            		<p>Enter your Roll No and Password to log on:</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">CUCET Roll No</label>
			                        	<asp:textbox type="text" autocomplete="off" required = "true" onkeypress="filterDigits(event)" name="form-username" placeholder="Roll No..." tabindex="1" class="form-username form-control" id="roll_no" runat="server">
                                            </asp:textbox>
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<asp:textbox type="password" autocomplete="off" required = "true" name="form-password" placeholder="Password..." tabindex="2" class="form-password form-control" id="cucet_password" runat="server">
                                            </asp:textbox>
			                        </div>
                                    <div class="row">
				                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			                                <asp:Button type="submit" name="btnLogin" class="btn btn-lg btn-success" id="btnLogin" OnClick="btnLogin_Click" Text="Submit" tabindex="3"  runat="server"> </asp:Button>
			                            </div>
                                        <div class=" text-center">
                                            <asp:Label id="errorLabel" runat="server"/>
                                        </div>
                                     </div>
                                 </form>
		                    </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            
       


        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
</asp:Content>

