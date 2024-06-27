<%@ Page Title="" Language="C#" MasterPageFile="~/LoginReg.Master" AutoEventWireup="true" CodeBehind="User_Registration.aspx.cs" Inherits="FruitKart.User_Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .centered-form {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-wrap {
            background: rgba(94, 163, 232, 0.10); /* Adjustedd opacity */
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .error-message {
            color: #d9534f;
            font-size: 0.875rem;
            margin-top: 0.25rem;
            display: block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="centered-form">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="login-wrap">
                        <h3 class="mb-4 text-center">
                            <asp:Label ID="Label1" runat="server" Text="User Registration"></asp:Label>
                        </h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter the First Name" CssClass="error-message"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter the Last Name" CssClass="error-message"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Phone Number"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Enter valid Phone Number" ValidationExpression="^[789]\d{9}$" CssClass="error-message"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox4" runat="server" class="form-control" placeholder="Email ID"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="Enter valid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="error-message"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox5" runat="server" class="form-control" placeholder="Address" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage="Enter the Address" CssClass="error-message"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox6" runat="server" class="form-control" placeholder="City"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox6" ErrorMessage="Enter the City" CssClass="error-message"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox7" runat="server" class="form-control" placeholder="State"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox7" ErrorMessage="Enter the City" CssClass="error-message"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox8" runat="server" class="form-control" placeholder="Pincode"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox8" ErrorMessage="Enter valid Pincode" ValidationExpression="^[1-9][0-9]{5}$" CssClass="error-message"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox9" runat="server" class="form-control" placeholder="Username" AutoPostBack="True" OnTextChanged="TextBox9_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox9" ErrorMessage="Enter the User Name" CssClass="error-message"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox10" runat="server" class="form-control" placeholder="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox10" ErrorMessage="Enter the Password" CssClass="error-message"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox11" runat="server" class="form-control" placeholder="Confirm Password" ></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox11" ErrorMessage="Password Mismatch..!" CssClass="error-message" ControlToCompare="TextBox10"></asp:CompareValidator>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="Button1" runat="server" Text="Register" class="form-control btn btn-primary submit px-3" OnClick="Button1_Click" />
                        </div>
                        <div class="form-group d-md-flex">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
