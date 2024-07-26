<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="User_InvoicePage.aspx.cs" Inherits="FruitKart.User_InvoicePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .form-group {
            margin-bottom: 1rem;
        }
        .form-label {
            font-weight: bold;
        }
        .alert-success {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="alert alert-success" role="alert" id="successAlert">
            Order placed successfully!
        </div>
        <div class="form-group row">
            <label for="Label1" class="col-sm-2 col-form-label form-label">Payment Method</label>
            <div class="col-sm-10">
                <asp:Label ID="Label1" runat="server" Text="Cash" CssClass="form-control-plaintext"></asp:Label>
            </div>
        </div>
        <div class="form-group row">
            <label for="TextBox1" class="col-sm-2 col-form-label form-label">Account Number</label>
            <div class="col-sm-10">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter the Account Number!" CssClass="text-danger"></asp:RequiredFieldValidator>
                <asp:Label ID="Label7" runat="server" Text="Label" CssClass="text-danger"></asp:Label>
            </div>
        </div>
        <div class="form-group row">
            <label for="Label5" class="col-sm-2 col-form-label form-label">Amount to Pay</label>
            <div class="col-sm-10">
                <asp:Label ID="Label5" runat="server" Text="Label" CssClass="form-control-plaintext"></asp:Label>
            </div>
        </div>
        <div class="form-group row">
            <label for="Label6" class="col-sm-2 col-form-label form-label">Account Balance</label>
            <div class="col-sm-10">
                <asp:Label ID="Label6" runat="server" Text="Label" CssClass="form-control-plaintext"></asp:Label>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-10 offset-sm-2">
                <asp:Button ID="Button1" runat="server" Text="Back" CssClass="btn btn-secondary" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="PAY" CssClass="btn btn-primary" OnClick="Button2_Click" />
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</asp:Content>
