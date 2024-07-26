<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="User_BillPage.aspx.cs" Inherits="FruitKart.User_BillPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .billing-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            padding: 20px;
            max-width: 800px;
            margin: auto;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            font-family: Arial, sans-serif;
        }
        
        .billing-header {
            grid-column: span 2;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #003300;
        }
        
        .billing-item {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        
        .billing-item label {
            font-weight: bold;
            color: #2c3e50;
        }
        
        .billing-item .value {
            color: #555;
        }
        
        .billing-total {
            grid-column: span 2;
            text-align: right;
            font-size: 22px;
            font-weight: bold;
            padding: 10px;
            background-color: #ecf0f1;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 20px;
        }
        
        .billing-total span {
            color: #e74c3c;
        }
        
        .button-container {
            grid-column: span 2;
            text-align: right;
            margin-top: 20px;
        }
        
        .button-container .btn {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
        }
        
        .button-container .btn-cancel {
            background-color: #e74c3c;
            color: white;
        }
        
        .button-container .btn-checkout {
            background-color: #2ecc71;
            color: white;
        }

        .custom-confirm {
            display: none;
            position: fixed;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        .custom-confirm-box {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .custom-confirm-box a {
            margin: 10px;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            color: white;
        }

        .btn-myaccount {
            background-color: #3498db;
            color: white;
        }

        .btn-continue {
            background-color: #2ecc71;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="billing-container">
        <div class="billing-header">
            Billing
        </div>
        
        <div class="billing-item">
            <label>Name:</label>
            <span class="value"><asp:Label ID="NAME" runat="server" Text="Label"></asp:Label></span>
        </div>
        
        <div class="billing-item">
            <label>Address:</label>
            <span class="value"><asp:Label ID="ADDRESS" runat="server" Text="Label"></asp:Label></span>
        </div>
        
        <div class="billing-item">
            <label>Email:</label>
            <span class="value"><asp:Label ID="EMAIL" runat="server" Text="Label"></asp:Label></span>
        </div>
        
        <div class="billing-item">
            <label>Phone Number:</label>
            <span class="value"><asp:Label ID="PHONE" runat="server" Text="Label"></asp:Label></span>
        </div>
        
        <div class="billing-item">
            <label>City:</label>
            <span class="value"><asp:Label ID="CITY" runat="server" Text="Label"></asp:Label></span>
        </div>
        
        <div class="billing-item">
            <label>State:</label>
            <span class="value"><asp:Label ID="STATE" runat="server" Text="Label"></asp:Label></span>
        </div>
        
        <div class="billing-item">
            <label>Pincode:</label>
            <span class="value"><asp:Label ID="PINCODE" runat="server" Text="Label"></asp:Label></span>
        </div>
        
        <div class="billing-item">
            <label>Products:</label>
            <span class="value"><asp:Label ID="PRODUCTS" runat="server" Text="Label"></asp:Label></span>
        </div>
        
        <div class="billing-total">
            Total Amount: <span><asp:Label ID="TOTALPRICE" runat="server" Text="Label"></asp:Label></span>
        </div>
        
        <div class="button-container">
            <asp:Button ID="Button2" runat="server" CssClass="btn btn-checkout" Text="Checkout" OnClick="Button2_Click" />
        </div>
    </div>

    <!-- Custom Confirmation Box -->
    <div id="customConfirmBox" class="custom-confirm">
        <div class="custom-confirm-box">
            <p>You already have an account. Do you want to create a new one?</p>
            <a href="User_MyAccount.aspx" class="btn-myaccount">MyAccount</a>
            <a href="User_InvoicePage.aspx" class="btn-continue">Continue</a>
        </div>
    </div>

    <script type="text/javascript">
        function showCustomConfirm() {
            var confirmBox = document.getElementById('customConfirmBox');
            confirmBox.style.display = 'flex';
        }
    </script>
</asp:Content>
