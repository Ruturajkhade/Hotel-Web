<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true"
    CodeFile="CheckAvail.aspx.cs" Inherits="CheckAvail" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="bootstrap.min.css" rel="stylesheet" />
    <style>
        body
        {
            width: 100%;
            margin: 5px;
        }
        
        .table-condensed tr th
        {
            border: 0px solid #6e7bd9;
            color: white;
            background-color: #6e7bd9;
        }
        
        .table-condensed, .table-condensed tr td
        {
            border: 0px solid #000;
        }
        
        tr:nth-child(even)
        {
            background: #f8f7ff;
        }
        
        tr:nth-child(odd)
        {
            background: #fff;
        }
    </style>
    <script type="text/javascript">
        function ConfirmationBox(username) {
            var result = confirm('Are you sure you want to delete ' + username + ' Details');
            if (result) {
                return true;
            }
            else {
                return false;
            }
        }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="colorlib-blog">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="aside animate-box">
                        <h3>
                            Check Room Availability</h3>
                        <div class="colorlib-form">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="adults">
                                            Room No.</label>
                                        <div class="form-field">
                                            <i class="icon icon-arrow-down3"></i>
                                            <asp:DropDownList ID="ddlAllRooms" runat="server" CssClass="form-control" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                                                AutoPostBack="True">
                                            </asp:DropDownList>
                                            <asp:Label ID="lblTransNo" runat="server" Text="Label" Visible="False"></asp:Label>
                                            <asp:Label ID="lblPrice" runat="server" Text="Label" Visible="False"></asp:Label>                                           
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="date">
                                            No of Persons</label>
                                        <div class="form-field">
                                            <%--<i class="icon icon-calendar2"></i>--%>
                                            <asp:TextBox ID="txtPersonNo" CssClass="form-control" runat="server" AutoPostBack="true"
                                                OnTextChanged="txtPersonNo_TextChanged" MaxLength="1"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                                FilterType="Numbers" TargetControlID="txtPersonNo" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" CssClass="alert-danger"
                                                runat="server" ControlToValidate="txtPersonNo" ErrorMessage="Enter Person No"
                                                ValidationGroup="bk"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="date">
                                        Check-In Date:</label>
                                    <div class="form-field">       
                                        <asp:TextBox ID="txtChkInDt" runat="server" CssClass="form-control" 
                                            ontextchanged="txtChkInDt_TextChanged" AutoPostBack="true"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender11" runat="server" TargetControlID="txtChkInDt" Format="yyyy-MM-dd"></cc1:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" CssClass="alert-danger"
                                                runat="server" ControlToValidate="txtChkInDt" ErrorMessage="Enter Check-In Date"
                                                ValidationGroup="bk"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="date">
                                            Check-Out Date:</label>
                                        <div class="form-field">                                            
                                            <asp:TextBox ID="txtChkOutDt" runat="server" CssClass="form-control" 
                                                ontextchanged="txtChkOutDt_TextChanged" AutoPostBack="true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender12" runat="server" TargetControlID="txtChkOutDt" Format="yyyy-MM-dd"></cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" CssClass="alert-danger"
                                                runat="server" ControlToValidate="txtChkOutDt" ErrorMessage="Enter Check-Out Date"
                                                ValidationGroup="bk"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <asp:UpdatePanel ID="updMsg" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label ID="lblmsg" runat="server" CssClass="label label-warning" Text="" Font-Size="Large" Visible="false"></asp:Label>
                                        </div>
                                        <div style="padding-bottom:20px; padding-top:15px;"></div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlAllRooms" EventName="SelectedIndexChanged" /> 
                                    <asp:AsyncPostBackTrigger ControlID="txtChkInDt" EventName="TextChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="txtChkOutDt" EventName="TextChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="txtPersonNo" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>                            

                            <div class="row">                            
                                <%--<h3>Check Room Availability</h3>--%>
                                <div class="col-md-4">
                                    <label for="date">
                                        Guest Name:</label>
                                    <div class="form-field">
                                        <%--<i class="icon icon-calendar2"></i>--%>
                                        <asp:TextBox ID="txtCustNm" CssClass="form-control" runat="server" MaxLength="30"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" CssClass="alert-danger"
                                                runat="server" ControlToValidate="txtCustNm" ErrorMessage="Enter Guest Name"
                                                ValidationGroup="bk"></asp:RequiredFieldValidator>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" FilterType="LowercaseLetters, UppercaseLetters, Custom" TargetControlID="txtCustNm" ValidChars=" " />
                                    </div>
                                </div>                                
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="date">
                                            AADHAR CARD No:</label>
                                        <div class="form-field">
                                            <asp:TextBox ID="txtCustIDProof" CssClass="form-control" runat="server" MaxLength="13"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" CssClass="alert-danger"
                                                runat="server" ControlToValidate="txtCustIDProof" ErrorMessage="Enter AADHAR No."
                                                ValidationGroup="bk"></asp:RequiredFieldValidator>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                                FilterType="Numbers" TargetControlID="txtCustIDProof" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="date">
                                            Guest Address:</label>
                                        <div class="form-field">
                                            <asp:TextBox ID="txtCustAdd" CssClass="form-control" runat="server" TextMode="MultiLine" MaxLength="50"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" CssClass="alert-danger"
                                                runat="server" ControlToValidate="txtCustAdd" ErrorMessage="Enter Guest Address"
                                                ValidationGroup="bk"></asp:RequiredFieldValidator>
                                            <%--<cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" FilterType="LowercaseLetters, UppercaseLetters,Numbers, Custom"  InvalidChars="'"" TargetControlID="txtCustAdd" />--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="date">
                                        Phone Number:</label>
                                    <div class="form-field">
                                        <%--<i class="icon icon-calendar2"></i>--%>
                                        <asp:TextBox ID="txtPhnNo" CssClass="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" CssClass="alert-danger"
                                                runat="server" ControlToValidate="txtPhnNo" ErrorMessage="Enter Phone No"
                                                ValidationGroup="bk"></asp:RequiredFieldValidator>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                                FilterType="Numbers" TargetControlID="txtPhnNo" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="date">
                                        Email:</label>
                                    <div class="form-field">
                                        <%--<i class="icon icon-calendar2"></i>--%>
                                        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" MaxLength="30"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" CssClass="alert-danger"
                                            runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Email"
                                            ValidationGroup="bk"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="reg"
                                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail"
                                            ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                    </div>
                                </div>                       
                                <div class="col-md-2">
                                    <asp:Button ID="btnBookNow" CssClass="btn btn-primary btn-block" runat="server"
                                        Text="Book Now" onclick="btnBookNow_Click" ValidationGroup="bk" />
                                </div>
                            </div>
                            <hr />

                            <div class="row">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                        UseAccessibleHeader="true" CssClass="table table-condensed table-hover" DataKeyNames="BookingID"> <%--onrowdatabound="gvrecords_RowDataBound" --%>
                                        <Columns>
                                            <asp:BoundField ItemStyle-Width="150px" DataField="TransNo" HeaderText="Transaction No">
                                                <ItemStyle Width="150px"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="150px" DataField="RoomNo" HeaderText="Room No">
                                                <ItemStyle Width="150px"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="150px" DataField="TotalPerson" HeaderText="TotalPerson">
                                                <ItemStyle Width="150px"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="150px" DataField="dtStart" HeaderText="Book From">
                                                <ItemStyle Width="150px"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="150px" DataField="dtEnd" HeaderText="Book Till">
                                                <ItemStyle Width="150px"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="150px" DataField="RoomPrice" HeaderText="Amount">
                                                <ItemStyle Width="150px"></ItemStyle>
                                            </asp:BoundField>
                                            <%--<asp:TemplateField HeaderText="Delete Row">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkdelete" runat="server" OnClick="lnkdelete_Click">Delete User</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="date">
                                        Payment Mode:</label>
                                    <div class="form-field">
                                        <%--<i class="icon icon-calendar2"></i>--%>
                                        <asp:TextBox ID="TextBox1" CssClass="form-control " runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Display="Dynamic" CssClass="alert-danger"
                                                runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Payment Mode"
                                                ValidationGroup="bk1"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="date">
                                        Bank Name:</label>
                                    <div class="form-field">
                                        <%--<i class="icon icon-calendar2"></i>--%>
                                        <asp:TextBox ID="TextBox2" CssClass="form-control " runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Display="Dynamic" CssClass="alert-danger"
                                            runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter Bank Name"
                                            ValidationGroup="bk1"></asp:RequiredFieldValidator>
                                        <%--<cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" FilterType="LowercaseLetters, UppercaseLetters"  InvalidChars="'"" TargetControlID="TextBox2" />--%>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="date">
                                        Debit Card No.:</label>
                                    <div class="form-field">
                                        <%--<i class="icon icon-calendar2"></i>--%>
                                        <asp:TextBox ID="txtDebtCardNo" CssClass="form-control " runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" Display="Dynamic" CssClass="alert-danger"
                                            runat="server" ControlToValidate="txtDebtCardNo" ErrorMessage="Enter Debit Card No"
                                            ValidationGroup="bk1"></asp:RequiredFieldValidator>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server"
                                            FilterType="Numbers" TargetControlID="txtDebtCardNo" />
                                    </div>
                                </div>
                                
                                <div class="col-md-3">
                                    <asp:Button ID="cmd_Book" CssClass="btn btn-primary btn-block" runat="server" Text="Make Payment"
                                        OnClick="cmd_Book_Click" ValidationGroup="bk1" />
                                </div>
                            </div>
                            <div class="row" style="padding-top:20px;">
                                <div class="col-md-4">
                                    <label for="date">
                                        Billed Amount:</label>
                                    <div class="form-field">
                                        <asp:Label ID="lblbill" runat="server" Font-Bold="True" Font-Size="Larger">0</asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>