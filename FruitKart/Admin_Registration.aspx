<%@ Page Title="" Language="C#" MasterPageFile="~/LoginReg.Master" AutoEventWireup="true" CodeBehind="Admin_Registration.aspx.cs" Inherits="FruitKart.Admin_Registration1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .centered-form {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-wrap {
            background: rgba(94, 163, 232, 0.10); /* Adjusted opacity */
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 1rem;
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
                            <asp:Label ID="Label1" runat="server" Text="Admin Registration"></asp:Label>
                        </h3>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Admin Name"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Admin Email-ID"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Admin Username" AutoPostBack="True" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox4" runat="server" class="form-control" placeholder="Admin Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="Button1" runat="server" Text="Register" class="form-control btn btn-primary submit px-3" OnClick="Button1_Click" />
                        </div>
                        <div class="form-group d-md-flex"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
