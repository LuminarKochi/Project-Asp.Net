<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="User_AccountCreation.aspx.cs" Inherits="FruitKart.User_AccountCreation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #accountCreationContainer {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        #accountCreationContainer .form-group {
            margin-bottom: 20px;
        }
        #accountCreationContainer .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        #accountCreationContainer .form-group input,
        #accountCreationContainer .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        #accountCreationContainer .form-group input:focus,
        #accountCreationContainer .form-group select:focus {
            border-color: #5b9bd5;
            outline: none;
            box-shadow: 0 0 5px rgba(91, 155, 213, 0.2);
        }
        #accountCreationContainer .form-group .error {
            color: #d9534f;
            font-size: 0.875em;
        }
        #accountCreationContainer .form-group .success {
            color: #5bc0de;
            font-size: 0.875em;
            margin-top: 10px;
        }
        #accountCreationContainer .button-group {
            display: flex;
            justify-content: space-between;
        }
        #accountCreationContainer .button-group button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            color: #fff;
            background-color: #5bc0de;
            cursor: pointer;
            font-size: 16px;
        }
        #accountCreationContainer .button-group button:hover {
            background-color: #31b0d5;
        }
        #accountCreationContainer .button-group button.back {
            background-color: #d9534f;
        }
        #accountCreationContainer .button-group button.back:hover {
            background-color: #c9302c;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="accountCreationContainer">
        <h2>Create Account</h2>
        <asp:Label ID="Label2" runat="server" CssClass="success"></asp:Label>
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Account Number"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Account Number Should be between 1000 &amp; 9999" MaximumValue="9999" MinimumValue="1000" CssClass="error"></asp:RangeValidator>
        </div>
        <div class="form-group">
            <asp:Label ID="LabelAccountType" runat="server" Text="Account Type"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Savings</asp:ListItem>
                <asp:ListItem>Current</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Label ID="LabelSavingsAmount" runat="server" Text="Savings Amount"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Amount should be between 1000 &amp; 9999" MaximumValue="9999" MinimumValue="1000" CssClass="error"></asp:RangeValidator>
        </div>
        <div class="button-group">
            <asp:Button ID="Button2" runat="server" Text="Back" CssClass="back" />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Create Account" />
        </div>
    </div>
</asp:Content>
