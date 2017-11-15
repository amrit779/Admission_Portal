<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="document_checklist.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CheckList & Fee Chalan</title>
    <link href="Content/css/form.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/form.js"> </script>
    <script src="Scripts/print_chalan.js"></script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div onload="load();">
        <form id="form2">
            <div>
               <iframe id="frame2" src="feechalan.pdf"  runat="server" frameborder="0" style="height: 0px; width: 0px;" />
            </div>
        </form>
    </div>

    <div class="row">
        <div class="col-xs-12 col-sm-10 col-md-10 col-sm-offset-1 col-md-offset-1">
             <div class="progress">
                <div class="progress-bar  progress-bar-info progress-bar-striped active" role="progressbar"
                    aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:50%">
                        50% Complete (info)
                </div>
             </div>
         </div>
     </div>
     
    <div class="row">
        <div class="col-xs-12 col-sm-10 col-md-10 col-sm-offset-1 col-md-offset-1">
		    <form role="form" Runat="Server">
			    <h2 class="text-center">Document Checklist</h2>
			    <hr class="colorgraph">

                <table class="table">
                      <thead class="thead-default">
                        <tr>
                          <th>S.No</th>
                          <th>Documents</th>
                          <th>Status</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row">1</th>
                          <td>Proof for DOB</td>
                          <td>Mandatory</td>
                        </tr>
                        <tr>
                          <th scope="row">2</th>
                          <td>Senior Secondary School Mark Sheet</td>
                          <td>Mandatory</td>
                        </tr>
                        <tr>
                          <th scope="row">3</th>
                          <td>Graduation Mark List - First Year</td>
                          <td>Mandatory</td>
                        </tr>
                        <tr>
                          <th scope="row">4</th>
                          <td>Graduation Mark List - Second Year</td>
                          <td>Mandatory</td>
                        </tr>
                        <tr>
                          <th scope="row">5</th>
                          <td>Graduation Mark List - Third Year</td>
                          <td>Mandatory</td>
                        </tr>
                        <tr>
                          <th scope="row">6</th>
                          <td>Graduation Degree</td>
                          <td>Mandatory</td>
                        </tr>
                        <tr>
                          <th scope="row">7</th>
                          <td>Medical Fitness Certificate</td>
                          <td>For Foreign Nationals</td>
                        </tr>
                        <tr>
                          <th scope="row">8</th>
                          <td>Student Visa</td>
                          <td>For Foreign Nationals</td>
                        </tr>
                        <tr>
                          <th scope="row">9</th>
                          <td>Affidavit (Anti-Ragging Form)</td>
                          <td>Mandatory</td>
                        </tr>
                        <tr>
                          <th scope="row">10</th>
                          <td>Character Certificate</td>
                          <td>Mandatory</td>
                        </tr>
                        <tr>
                          <th scope="row">11</th>
                          <td>Migration Certificate</td>
                          <td>Mandatory</td>
                        </tr>
                      </tbody>
                    </table>

                <br>
                <h4> <a href="feechalan.pdf">Click here</a> to print the Fee Payment Challan</h4>
                <br> <br>

                <div class="alert alert-danger">
                    <div class="container-fluid">
	                  <div class="alert-icon">
	                    <span class="glyphicon glyphicon-flash" aria-hidden="true"></span>
	                  </div>
	                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
	                  </button>
                      <strong><b>Notice:</b> All the required documents must be submitted to the University before 15th August 2017.    </strong>
                    </div>
                </div>

                <hr class="colorgraph">
                <div class="row">
				<div class="col-xs-12 col-md-12">
                    <asp:Button type="submit" CssClass="btn btn-success btn-block btn-lg" tabindex="10" id="btnGenerateOfferLetter" OnClick="btnGenerateOfferLetter_Click" Text="Generate Offer Letter" runat="server"></asp:Button>
                    <br/>
                </div>
			</div>
            </form>
            
            
        </div>
    </div>
</asp:Content>

