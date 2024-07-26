<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="User_Feedback.aspx.cs" Inherits="FruitKart.User_Feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .container {
            margin-top: 50px;
        }
        .form-label {
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Feedback</h2>
        <asp:Label ID="LabelMessage" runat="server" CssClass="text-success" Text=""></asp:Label>
        <div class="form-group">
            <label for="FeedbackText" class="form-label">Your Feedback</label>
            <asp:TextBox ID="FeedbackText" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FeedbackText" ErrorMessage="Please enter your feedback" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Button ID="SubmitButton" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="SubmitButton_Click" />
        </div>
    </div>
</asp:Content>
