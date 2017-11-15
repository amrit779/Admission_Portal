<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="hostel_form.aspx.cs" Inherits="hostel_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Hostel Form</title>
    <link href="Content/css/form.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/form.js"> </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">

<div class="row">
    <div class="col-xs-12 col-sm-10 col-md-10 col-sm-offset-1 col-md-offset-1">
        <div class="progress">
            <div class="progress-bar  progress-bar-info progress-bar-striped active" role="progressbar"
                aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%">
                    0% Complete (info)
            </div>
        </div>
    </div>
 </div>

<div class="row">
    <div class="col-xs-12 col-sm-10 col-md-10 col-sm-offset-1 col-md-offset-1">
                 
		<form role="form" Runat="Server">
			<h2 class="text-center">Hostel Accomodation Form</h2>
			<hr class="colorgraph">
            <h3>Personal Details</h3> 
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group label-floating">
                        <label class="control-label">Student Name</label>
                        <asp:TextBox type="text" onkeypress="filterAlphabet(event)" autocomplete="off" required="true" runat="server" name="student_name" id="student_name" class="form-control input-lg" tabindex="1"></asp:TextBox>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
                        <label class="control-label">Date of Birth</label>
                        <asp:TextBox  runat="server" id="dob" CssClass="datepicker form-control" type="text" value="DD/MM/YYYY" tabindex="2"></asp:TextBox>
					</div>
				</div>
			</div>

            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group label-floating">
                        <label class="control-label">Sex</label>
						<asp:DropDownList ID="sex" runat="server" tabindex="3" class="form-control input-lg">
                            <asp:ListItem Enabled="True">Female</asp:ListItem>
                            <asp:ListItem Enabled="True">Male</asp:ListItem>
                            <asp:ListItem Enabled="True">Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group label-floating">
                        <label class="control-label">Category</label>
					    <asp:DropDownList ID="category1" runat="server" tabindex="4" class="form-control input-lg">
                            <asp:ListItem>General</asp:ListItem>
                            <asp:ListItem>OBC</asp:ListItem>
                            <asp:ListItem>SC</asp:ListItem>
                            <asp:ListItem>ST</asp:ListItem>
                        </asp:DropDownList>
					</div>
				</div>
			</div>

            <div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
			        <div class="form-group label-floating">
                        <label class="control-label">Mother's Name</label>
				        <asp:TextBox  runat="server" tabindex="5"  onkeypress="filterAlphabet(event)" type="text" name="mothers_name" autocomplete="off" required="true"  id="mothers_name" class="form-control input-lg"></asp:TextBox>
			        </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group label-floating">
                        <label class="control-label">Contact</label>
				        <asp:TextBox  runat="server" onkeypress="filterDigits(event)" type="text" autocomplete="off" required="true"  name="mothers_contact" id="mothers_contact" class="form-control input-lg" tabindex="6"></asp:TextBox>
			        </div>
                 </div>
			</div>

            <div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
			        <div class="form-group label-floating">
                        <label class="control-label">Father's Name</label>
				        <asp:TextBox  runat="server" type="text" autocomplete="off" onkeypress="filterAlphabet(event)" required="true"  name="fathers_name" id="fathers_name" class="form-control input-lg" tabindex="7"></asp:TextBox>
			        </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group label-floating">
                        <label class="control-label">Contact</label>
				        <asp:TextBox  runat="server" autocomplete="off" onkeypress="filterDigits(event)" required="true"  type="text" name="fathers_contact" id="fathers_contact" class="form-control input-lg" tabindex="8"></asp:TextBox>
			        </div>
                 </div>
			</div>

            <div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
			        <div class="form-group label-floating">
                        <label class="control-label">Blood Group</label>
			            <asp:DropDownList ID="blood_group" runat="server" class="form-control input-lg" tabindex="9">
                            <asp:ListItem>A+</asp:ListItem>
                            <asp:ListItem>B+</asp:ListItem>
                            <asp:ListItem>AB+</asp:ListItem>
                            <asp:ListItem>O+</asp:ListItem>
                            <asp:ListItem>A-</asp:ListItem>
                            <asp:ListItem>B-</asp:ListItem>
                            <asp:ListItem>AB-</asp:ListItem>
                            <asp:ListItem>O-</asp:ListItem>
                            <asp:ListItem>Don't Know</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group label-floating">
                        <label class="control-label">Marital Status</label>
			            <asp:DropDownList ID="marital_status" runat="server" class="form-control input-lg" tabindex="10">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:DropDownList>
			        </div>
                 </div>
			</div>

            <div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
			        <div class="form-group label-floating">
                        <label class="control-label">Photo ID (Adhaar/PAN/Voter ID/Student ID)</label>
				        <asp:TextBox  runat="server" onkeypress="filterAlphabet(event)" autocomplete="off" required="true" name="photo_id" id="photo_id" class="form-control input-lg" tabindex="11"></asp:TextBox>
			        </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group label-floating">
                        <label class="control-label">Photo ID Number</label>
				        <asp:TextBox  runat="server" onkeypress="filterAlphaNumeric(event)" autocomplete="off" required="true"  type="text" name="photo_id_no" id="photo_id_no" class="form-control input-lg" tabindex="12"></asp:TextBox>
			        </div>
                 </div>
			</div>

            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="form-group label-floating">
                        <label class="control-label">Permanent Address</label>
				        <asp:TextBox  runat="server" onkeypress="filterAlphaNumericExt(event)" type="text" name="address" autocomplete="off" required="true" id="address" class="form-control input-lg" tabindex="13"></asp:TextBox>
			        </div>
                </div>
            </div>

            <div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
			        <div class="form-group label-floating">
                        <label class="control-label">City</label>
				        <asp:TextBox  runat="server" onkeypress="filterAlphabet(event)" type="text" name="city" id="city" autocomplete="off" required="true" class="form-control input-lg" tabindex="14"></asp:TextBox>
			        </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group label-floating">
                        <label class="control-label">Pincode</label>
				        <asp:TextBox  runat="server" type="text" onkeypress="filterDigits(event)" MaxLength="6" autocomplete="off" required="true" name="pincode" id="pincode" class="form-control input-lg" tabindex="15"></asp:TextBox>
			        </div>
                 </div>
			</div>

            <div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
			        <div class="form-group label-floating">
                        <label class="control-label">State</label>
			            <asp:DropDownList ID="state" runat="server" class="form-control input-lg" tabindex="16">
                            <asp:ListItem>Andaman and Nicobar</asp:ListItem> 
                            <asp:ListItem>Andhra Pradesh</asp:ListItem>
                            <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                            <asp:ListItem>Assam</asp:ListItem>
                            <asp:ListItem>Bihar</asp:ListItem>
                            <asp:ListItem>Chandigarh</asp:ListItem>
                            <asp:ListItem>Chhattisgarh</asp:ListItem>
                            <asp:ListItem>Dadra and Nagar Haveli</asp:ListItem>
                            <asp:ListItem>Daman and Diu</asp:ListItem>
                            <asp:ListItem>Delhi</asp:ListItem>
                            <asp:ListItem>Goa</asp:ListItem>
                            <asp:ListItem>Gujarat</asp:ListItem>
                            <asp:ListItem>Haryana</asp:ListItem>
                            <asp:ListItem>Himachal Pradesh</asp:ListItem>
                            <asp:ListItem>Jammu and Kashmir</asp:ListItem>
                            <asp:ListItem>Jharkhand</asp:ListItem>
                            <asp:ListItem>Karnataka</asp:ListItem>
                            <asp:ListItem>Kerala</asp:ListItem>
                            <asp:ListItem>Lakshadweep</asp:ListItem>
                            <asp:ListItem>Madhya Pradesh</asp:ListItem>
                            <asp:ListItem>Maharashtra</asp:ListItem>
                            <asp:ListItem>Manipur</asp:ListItem>
                            <asp:ListItem>Meghalaya</asp:ListItem>
                            <asp:ListItem>Mizoram</asp:ListItem>
                            <asp:ListItem>Nagaland</asp:ListItem>
                            <asp:ListItem>Odisha</asp:ListItem>
                            <asp:ListItem>Puducherry</asp:ListItem>
                            <asp:ListItem>Punjab</asp:ListItem>
                            <asp:ListItem>Rajasthan</asp:ListItem>
                            <asp:ListItem>Sikkim</asp:ListItem>
                            <asp:ListItem>Tamil Nadu</asp:ListItem>
                            <asp:ListItem>Telangana</asp:ListItem>
                            <asp:ListItem>Tripura</asp:ListItem>
                            <asp:ListItem>Uttar Pradesh</asp:ListItem>
                            <asp:ListItem>Uttarakhand</asp:ListItem>
                            <asp:ListItem>West Bengal</asp:ListItem>
                        </asp:DropDownList>
			        </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group label-floating">
                        <label class="control-label">Phone Number</label>
				        <asp:TextBox  runat="server" type="text" onkeypress="filterDigits(event)" autocomplete="off" required="true" name="phone_num" id="phone_num" class="form-control input-lg" tabindex="17"></asp:TextBox>
			        </div>
                 </div>
			</div>

            <div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
			        <div class="form-group label-floating">
                        <label class="control-label">Email Address</label>
				        <asp:TextBox  runat="server" type="email" autocomplete="off" required="true" name="email" id="email" class="form-control input-lg" tabindex="18"></asp:TextBox>
			        </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group label-floating">
                        <label class="control-label">Mobile Number</label>
				        <asp:TextBox  runat="server" onkeypress="filterDigits(event)" MaxLength="10" type="text" autocomplete="off" required="true" name="mobile_num" id="mobile_num" class="form-control input-lg" tabindex="19"></asp:TextBox>
			        </div>
                 </div>
			</div>
						
			<hr class="colorgraph">
            <h3>Course Details</h3> 
            <div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group label-floating">
                        <label class="control-label">Name of Programme</label>
					    <asp:DropDownList ID="program_name" runat="server" class="form-control input-lg" tabindex="20">
                            <asp:ListItem>Integrated M.Sc (5 Years)</asp:ListItem>
                            <asp:ListItem>Integrated M.Sc B.Ed (3 Years)</asp:ListItem>
                            <asp:ListItem>Mtech</asp:ListItem>
                            <asp:ListItem>MBA</asp:ListItem>
                            <asp:ListItem>MA</asp:ListItem>
                            <asp:ListItem>M.Sc</asp:ListItem>
                            <asp:ListItem>M.Sc Tech Mathematics</asp:ListItem>
                            <asp:ListItem>PhD</asp:ListItem>
                        </asp:DropDownList>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group label-floating">
                        <label class="control-label">Name of Department</label>
					    <asp:dropdownlist runat="server" type="text" required="true"  name="department-name" id="department_name" class="form-control input-lg" tabindex="21">
                                <asp:ListItem>Architecture</asp:ListItem>
                                <asp:ListItem>Atmoshpheric Science</asp:ListItem>
                                <asp:ListItem>Big Data Analytics</asp:ListItem>
                                <asp:ListItem>Biochemistry</asp:ListItem>
                                <asp:ListItem>Biotechnology</asp:ListItem>
                                <asp:ListItem>Computer Science</asp:ListItem>
                                <asp:ListItem>Computer Science & Engineering</asp:ListItem>
                                <asp:ListItem>Commerce</asp:ListItem>
                                <asp:ListItem>Culture & Media Studies</asp:ListItem>
                                <asp:ListItem>Economics</asp:ListItem>
                                <asp:ListItem>Education</asp:ListItem>
                                <asp:ListItem>Environmental Science</asp:ListItem>
                                <asp:ListItem>English</asp:ListItem>
                                <asp:ListItem>Hindi</asp:ListItem>
                                <asp:ListItem>Microbiology</asp:ListItem>
                                <asp:ListItem>Management</asp:ListItem>
                                <asp:ListItem>Pharmacy</asp:ListItem>
                                <asp:ListItem>Physics</asp:ListItem>
                                <asp:ListItem>Public Policy Law & Governance</asp:ListItem>
                                <asp:ListItem>Statistics</asp:ListItem>
                                <asp:ListItem>Social Work</asp:ListItem>
                            </asp:dropdownlist>
                    </div>
				</div>
			</div>

            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group label-floating">
                        <label class="control-label">Name of School</label>
			            <asp:dropdownlist runat="server" required="true" type="text" name="school_name" id="school_name" class="form-control input-lg" tabindex="22">
                                <asp:ListItem>School of Architecture</asp:ListItem>
                                <asp:ListItem>School of Chemical Sciences and Pharmacy</asp:ListItem>
                                <asp:ListItem>School of Commerce & Management</asp:ListItem>
                                <asp:ListItem>School of Engineering and Technology</asp:ListItem>
                                <asp:ListItem>School of Earth Sciences</asp:ListItem>
                                <asp:ListItem>School of Life Sciences</asp:ListItem>
                                <asp:ListItem>School of Humanities & Languages</asp:ListItem>
                                <asp:ListItem>School of Mathematics, Statistics & Computational Sciences</asp:ListItem>
                                <asp:ListItem>School of Social Science</asp:ListItem>
                                <asp:ListItem>School of Physical Sciences</asp:ListItem>
                        </asp:dropdownlist>
                    </div>
                </div>
            </div>

            <hr class="colorgraph">
            <h3>Person to Contact in Emergency</h3>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="form-group label-floating">
                        <label class="control-label">Guardian Name</label>
				        <asp:TextBox  runat="server" type="text" autocomplete="off" onkeypress="filterAlphabet(event)" required="true" name="guardian_name" id="guardian_name" class="form-control input-lg" tabindex="23"></asp:TextBox>
			        </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="form-group label-floating">
                        <label class="control-label">Address</label>
				        <asp:TextBox  runat="server" onkeypress="filterAlphaNumericExt(event)" type="text" autocomplete="off" required="true" name="Eaddress" id="Eaddress" class="form-control input-lg" tabindex="24"></asp:TextBox>
			        </div>
                </div>
            </div>

            <div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
			        <div class="form-group label-floating">
                        <label class="control-label">City</label>
				        <asp:TextBox  runat="server" type="text" autocomplete="off" required="true" name="Ecity" onkeypress="filterAlphabet(event)" id="Ecity" class="form-control input-lg" tabindex="25"></asp:TextBox>
			        </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group label-floating">
                        <label class="control-label">Pincode</label>
				        <asp:TextBox  runat="server" onkeypress="filterDigits(event)" MaxLength="6" type="text" name="Epincode" autocomplete="off" required="true" id="Epincode" class="form-control input-lg" tabindex="26"></asp:TextBox>
			        </div>
                 </div>
			</div>

            <div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
			        <div class="form-group label-floating">
                        <label class="control-label">State</label>
			            <asp:DropDownList ID="gstate" runat="server" class="form-control input-lg" tabindex="27">
                            <asp:ListItem>Andaman and Nicobar</asp:ListItem> 
                            <asp:ListItem>Andhra Pradesh</asp:ListItem>
                            <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                            <asp:ListItem>Assam</asp:ListItem>
                            <asp:ListItem>Bihar</asp:ListItem>
                            <asp:ListItem>Chandigarh</asp:ListItem>
                            <asp:ListItem>Chhattisgarh</asp:ListItem>
                            <asp:ListItem>Dadra and Nagar Haveli</asp:ListItem>
                            <asp:ListItem>Daman and Diu</asp:ListItem>
                            <asp:ListItem>Delhi</asp:ListItem>
                            <asp:ListItem>Goa</asp:ListItem>
                            <asp:ListItem>Gujarat</asp:ListItem>
                            <asp:ListItem>Haryana</asp:ListItem>
                            <asp:ListItem>Himachal Pradesh</asp:ListItem>
                            <asp:ListItem>Jammu and Kashmir</asp:ListItem>
                            <asp:ListItem>Jharkhand</asp:ListItem>
                            <asp:ListItem>Karnataka</asp:ListItem>
                            <asp:ListItem>Kerala</asp:ListItem>
                            <asp:ListItem>Lakshadweep</asp:ListItem>
                            <asp:ListItem>Madhya Pradesh</asp:ListItem>
                            <asp:ListItem>Maharashtra</asp:ListItem>
                            <asp:ListItem>Manipur</asp:ListItem>
                            <asp:ListItem>Meghalaya</asp:ListItem>
                            <asp:ListItem>Mizoram</asp:ListItem>
                            <asp:ListItem>Nagaland</asp:ListItem>
                            <asp:ListItem>Odisha</asp:ListItem>
                            <asp:ListItem>Puducherry</asp:ListItem>
                            <asp:ListItem>Punjab</asp:ListItem>
                            <asp:ListItem>Rajasthan</asp:ListItem>
                            <asp:ListItem>Sikkim</asp:ListItem>
                            <asp:ListItem>Tamil Nadu</asp:ListItem>
                            <asp:ListItem>Telangana</asp:ListItem>
                            <asp:ListItem>Tripura</asp:ListItem>
                            <asp:ListItem>Uttar Pradesh</asp:ListItem>
                            <asp:ListItem>Uttarakhand</asp:ListItem>
                            <asp:ListItem>West Bengal</asp:ListItem>
                        </asp:DropDownList>
			        </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group label-floating">
                        <label class="control-label">Phone Number</label>
				        <asp:TextBox  runat="server" onkeypress="filterDigits(event)" type="text" autocomplete="off" required="true" name="Ephone_num" id="Ephone_num" class="form-control input-lg" tabindex="28"></asp:TextBox>
			        </div>
                 </div>
			</div>

            <div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
			        <div class="form-group label-floating">
                        <label class="control-label">Email Address</label>
				        <asp:TextBox  runat="server" type="email" autocomplete="off" required="true" name="Eemail" id="Eemail" class="form-control input-lg" tabindex="29"></asp:TextBox>
			        </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group label-floating">
                        <label class="control-label">Mobile Number</label>
				        <asp:TextBox  runat="server" onkeypress="filterDigits(event)" MaxLength="10" type="text" autocomplete="off" required="true" name="Emobile_num" id="Emobile_num" class="form-control input-lg" tabindex="30"></asp:TextBox>
			        </div>
                 </div>
			</div>

            <hr class="colorgraph">

            
            <h5> By clicking <strong class="label label-primary">Submit</strong>, I hereby declare that all the particulars given by me above are correct to the best of my knowledge and belief. <br />
            <br/>     I am aware of the <a data-toggle="modal" data-target="#myModal" href="#myModal">Hostel Rules</a> and I shall abide by them, failing which disciplinary action may be taken against me. </h5>
            <br/>

            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title text-center"><b>RULES AND REGULATIONS FOR BOYS AND GIRLS HOSTELS</b></h4>
                        </div>
                        <div class="modal-body" style="text-align:justify">
                            <ol>
                                <li><i>BEHAVIOUR AND DISCIPLINE</i>
                                <ul>
                                    <li>Students are expected to display acceptable form of behavior, maintain discipline and decorum in the hostel complex.</li>
                                    <li>Smoking is <b>Strictly Prohibited</b> in the hostel complex at anytime.</li>
                                    <li><b>Possession, distribution and consumption of alcoholic beverages, prohibited drugs, chewable tobacco in the hostel complex is Strictly Prohibited.</b></li>
                                    <li>Parties, social or political gatherings in the hostel complex are not permitted without the prior and written consent of the hostel warden and/or University authorities.</li>
                                    <li>Students must return to the hostel by <b>10:00 p.m.</b> everyday and are not allowed to leave the hostel before <b>6.00 a.m.</b></li>
                                    <li>The students will be allowed to stay out of the hostel on submission of proper application duly authorized by parent and only if the permission granted in writing by the hostel warden.</li>
                                    <li>A hostel campus should be a place where students can have the best possible conditions for studying and adequate rest. As such due consideration must be accorded to other hostellers at all times. Noise level must be kept low to allow other’s the opportunity to study or sleep in comfort. Television, Radio etc provided in the common room must be switched off or volume toned down after 10:00 pm. These rules are intended to ensure a conducive environment for all hostellers.</li>
                                    <li>Ragging is a very serious offence. Hostellers found guilty of committing such an offence can be evicted from the hostel.</li>
                                    <li>In case of any unacceptable behavior by the room-mate, the other room-mate/s must report it to the University authorities.</li>
                                </ul></li>
                                <li><i>UPKEEP OF THE HOSTEL</i>
                                    <ul>
                                        <li>Students are responsible for keeping their rooms clean and tidy at all times.</li>
                                        <li>All fans, lights and electrical appliances must be switched off when not in use.</li>
                                        <li>Cooking, making tea etc is not allowed in the hostel.</li>
                                        <li>Common hostel furniture must not be moved without the permission of the hostel warden.</li>
                                        <li>Any damage to the hostel property must be reported immediately to the hostel warden. Students will be charged for all damages except damages caused by normal wear and tear.</li>
                                        <li>Pasting of posters, writings, wall chalking, slogans of any kind or defacing the hostel in any form is not allowed.</li>
                                        <li>The University Authority reserves the right to make spot checks on the hostel and rooms without having to give prior notice to the students.</li>
                                        <li>Electricians, contractors or any other service person may enter rooms as and when necessary in the course of their duty under the directive of the hostel warden. However, every effort will be made to respect the privacy and dignity of the hostellers.</li>
                                        <li>The hostel management reserves the right to move hostellers to other hostel units or any other alternative place if there is a necessity.</li>
                                    </ul>
                                </li>
                                <li><i>VISITORS</i>
                                    <ul>
                                        <li>Visitors including parents are allowed only into the visitor’s area of the hostel during the visiting hours as follows:
                                            <ul>
                                                <li><b>Weekdays: (Monday-Friday)</b> - 5:00 pm to 8:00 pm & 7:30 am to 8:30 am</li>
                                                <li><b>Weekend (Saturday, Sunday) and Holidays</b> - 7:30 am to 8:00 pm.</li>
                                            </ul>
                                        </li>
                                        <li>All visitors must register at the guard cabin and provide all details and documents as requested by Security before entering the hostel complex. All visitors must leave the hostel complex by <b>8:00 pm.</b></li>
                                        <li>Students are not permitted to allow visitors of the opposite sex into rooms at any time for whatever reason. Any hostellers found violating this rule will be evicted from the hostel.</li>
                                        <li>Non-Hostel students are prohibited in the hostel without the permission of hostel Warden. The student who violates this is answerable to the Warden.</li>
                                    </ul>
                                </li>
                                
                                <li><i>SECURITY</i>
                                    <ul>
                                        <li>Hostellers are advised to lock all doors at all times for security reason.</li>
                                        <li>The University Authority is not responsible for any loss of private property. Hostellers are strongly advised to lock all your valuable e.g. mobile phones, laptop, watches, money etc at all times.</li>
                                        <li>Hostellers are not permitted to change rooms or sleep anywhere other than in their own room.</li>
                                        <li>Any student, who finds anything unusual about his room-mate or finds him missing for more than 24 hours, must report to the hostel warden immediately. This is to enable the University authorities to take immediate action if any untoward incident takes place .Your cooperation is very much appreciated.</li>
                                        <li>Possessions, distribution and use of fire-arms, lethal weapons including air gun, contraband drugs, alcohol, toxic and hazardous material are strictly prohibited in the hostel. Keeping electric appliances such as T.V., VCR, heater, iron, oven etc in the rooms is also prohibited.</li>
                                        <li>Pets are not allowed in the hostel complex.</li>
                                    </ul>
                                </li>

                                <li><i>EMERGENCY</i>
                                    <ul>
                                        <li>In case of any emergency, please contact the security guards at the guard cabin/house or call hostel/University authorities.</li>
                                    </ul>
                                </li>

                                <li><i>REVISION OF RULES AND REGULATIONS</i>
                                    <ul>
                                        <li>
                                            The University Authority reserves the right to revise the rules and regulations from time to time and will keep the hostellers informed of any changes in the form of notices on the hostel notice boards. Ignorance of rules will not be accepted as an excuse.
                                        </li>
                                    </ul>
                                </li>

                                <li><i>COMPLAINTS AND SUGGESTION</i>
                                    <ul>
                                        <li>Any complaints, suggestions or enquiries are always welcome.</li>
                                    </ul>
                                </li>
                            </ol>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
      
                </div>
            </div>

			<div class="row">
				<div class="col-xs-12 col-md-12">
                    <asp:Button type="submit" CssClass="btn btn-primary btn-block btn-lg" id="btnSubmit" OnClick="btnSubmit_Click" Text="Submit" runat="server" tabindex="31"></asp:Button>
                    <br/>
                </div>
			</div>
		</form>
	</div>
</div>

</div>
</asp:Content>