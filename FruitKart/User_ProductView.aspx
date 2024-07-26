<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="User_ProductView.aspx.cs" Inherits="FruitKart.User_ProductView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header h2 {
            font-size: 28px;
            color: #4CAF50;
        }
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); /* Ensure items have a minimum size */
            gap: 20px;
        }
        .product-card {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease-in-out;
            height: 100%; /* Ensure all cards have the same height */
            display: flex;
            flex-direction: column;
        }
        .product-card:hover {
            transform: translateY(-5px);
        }
        .product-image {
            width: 100%;
            height: auto;
            border-radius: 8px;
            margin-bottom: 15px;
            max-height: 200px; /* Limit maximum height for product image */
            object-fit: cover; /* Ensure images maintain aspect ratio */
        }
        .product-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
            text-transform: uppercase;
            flex: 1; /* Ensure title takes up remaining space */
        }
        .product-description {
            font-size: 16px;
            color: #666;
            margin-bottom: 15px;
            height: 80px; /* Fixed height for description */
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 4; /* Number of lines to show before truncating */
            -webkit-box-orient: vertical;
        }
        .product-price {
            font-size: 18px;
            font-weight: bold;
            color: #4CAF50;
            margin-bottom: 15px;
        }
        .text-center {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="header">
            <h2><asp:Label ID="Label1" runat="server" Text="Category Name"></asp:Label></h2>
        </div>
        <div class="product-grid">
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="3">
                <ItemTemplate>
                    <div class="product-card">
                        <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("product_id") %>' CssClass="product-image" ImageUrl='<%# Eval("product_image") %>' OnCommand="ImageButton1_Command" />
                        <div class="product-title">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("product_name") %>'></asp:Label>
                        </div>
                        <div class="product-description">
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("product_description").ToString().Length > 100 ? Eval("product_description").ToString().Substring(0, 100) + "..." : Eval("product_description") %>'></asp:Label>
                        </div>
                        <div class="product-price">
                            <asp:Label ID="Label3" runat="server" Text='<%# "₹" + Eval("product_price") + "/kg" %>'></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>