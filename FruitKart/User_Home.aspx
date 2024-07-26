<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="User_Home.aspx.cs" Inherits="FruitKart.User_Home" %>
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
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
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
        .text-center {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2 class="text-center mb-4">Explore Our Fresh Products</h2>
        <div class="product-grid">
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="3">
                <ItemTemplate>
                    <div class="product-card">
                        <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("category_id") %>' CssClass="product-image" ImageUrl='<%# Eval("category_image") %>' OnCommand="ImageButton1_Command" />
                        <div class="product-title">
                            <%# Eval("category_name") %>
                        </div>
                        <div class="product-description">
                            <%# Eval("category_description").ToString().Length > 100 ? Eval("category_description").ToString().Substring(0, 100) + "..." : Eval("category_description") %>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
