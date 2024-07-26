<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="User_SingleProductView.aspx.cs" Inherits="FruitKart.User_SingleProductView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .product-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }
        .product-card {
            display: flex;
            flex-direction: row;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 20px 0;
        }
        .product-image {
            flex: 1;
            max-width: 300px;
            margin-right: 20px;
        }
        .product-image img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .product-details {
            flex: 2;
            display: flex;
            flex-direction: column;
        }
        .product-title {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }
        .product-price {
            font-size: 24px;
            font-weight: bold;
            color: #4CAF50;
            margin-bottom: 20px;
        }
        .product-description {
            font-size: 16px;
            color: #666;
            margin-bottom: 20px;
        }
        .product-quantity {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .product-quantity label {
            font-size: 16px;
            color: #333;
            margin-right: 10px;
        }
        .product-quantity input {
            width: 60px;
            padding: 5px;
            font-size: 16px;
            margin-right: 10px;
        }
        .product-buttons {
            display: flex;
            gap: 10px;
        }
        .product-buttons button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .product-buttons .btn-add-to-cart {
            background-color: #4CAF50;
            color: #ffffff;
        }
        .product-buttons .btn-continue {
            background-color: #f5f5f5;
            color: #333;
        }
        .product-warning {
            font-size: 14px;
            color: red;
            margin-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-container">
        <div class="product-card">
            <div class="product-image">
                <asp:Image ID="Image1" runat="server" />
            </div>
            <div class="product-details">
                <div class="product-title">
                    <asp:Label ID="Label1" runat="server" Text="Product Name"></asp:Label>
                </div>
                <div class="product-price">
                    ₹<asp:Label ID="Label2" runat="server" Text="Price"></asp:Label> /kg
                </div>
                <div class="product-description">
                    <asp:Label ID="Label3" runat="server" Text="Description"></asp:Label>
                </div>
                <div class="product-quantity">
                    <asp:Label ID="Label4" runat="server" Text="Quantity"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </div>
                <div class="product-warning">
                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                </div>
                <div class="product-buttons">
                    <asp:Button ID="Button1" runat="server" CssClass="btn-add-to-cart" OnClick="Button1_Click" Text="Add to Cart" />
                    <asp:Button ID="Button2" runat="server" CssClass="btn-continue" OnClick="Button2_Click" Text="Continue Shopping" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
