<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="User_MyAccount.aspx.cs" Inherits="FruitKart.User_MyAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .account-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .account-header {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .account-item {
            margin-bottom: 15px;
        }
        .account-item label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .account-item span {
            display: block;
            font-size: 16px;
            padding: 10px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .account-item input[type="text"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .button-group {
            text-align: center;
            margin-top: 20px;
        }
        .button-group button {
            padding: 10px 20px;
            font-size: 16px;
            margin: 0 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .button-back {
            background-color: #ddd;
        }
        .button-add,
        .button-done {
            background-color: #28a745;
            color: #fff;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="account-container">
        <div class="account-header">
            <asp:Label ID="Label1" runat="server" Text="My Account"></asp:Label>
        </div>
        <div class="account-item">
            <label>Account Number</label>
            <span>
                <asp:Label ID="Label3" runat="server" Text="" Visible="False"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="" Visible="False"></asp:Label>
            </span>
        </div>
        <div class="account-item">
            <label>Account Type</label>
            <span>
                <asp:Label ID="Label4" runat="server" Text="" Visible="False"></asp:Label>
                <asp:Label ID="Label7" runat="server" Text="" Visible="False"></asp:Label>
            </span>
        </div>
        <div class="account-item">
            <label>Balance</label>
            <span>
                <asp:Label ID="Label5" runat="server" Text="" Visible="False"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" Visible="False"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please enter a value between 1000 and 9999." MaximumValue="9999" MinimumValue="1000" ForeColor="Red"></asp:RangeValidator>
            </span>
        </div>
        <div class="button-group">
            <asp:Button ID="Button1" runat="server" Text="Back" CssClass="button-back" />
            <asp:Button ID="Button2" runat="server" Text="Add Money" OnClick="Button2_Click" CssClass="button-add" Visible="False" />
            <asp:Button ID="Button3" runat="server" Text="Done" OnClick="Button3_Click" CssClass="button-done" Visible="False" />
        </div>
    </div>
</asp:Content>
