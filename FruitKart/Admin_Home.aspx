<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Admin_Home.aspx.cs" Inherits="FruitKart.Admin_Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .admin-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            font-family: Arial, sans-serif;
        }
        .admin-title {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .admin-link {
            display: block;
            padding: 15px;
            margin: 10px 0;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .admin-link:hover {
            background-color: #45a049;
        }
        .spacer {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="admin-container">
        <div class="admin-title">Admin Home</div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Add_Category.aspx" CssClass="admin-link">Add Category</asp:HyperLink>
        <div class="spacer"></div>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/View_Category.aspx" CssClass="admin-link">View Categories</asp:HyperLink>
        <div class="spacer"></div>
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Add_Product.aspx" CssClass="admin-link">Add Product</asp:HyperLink>
        <div class="spacer"></div>
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/View_Product.aspx" CssClass="admin-link">View Products</asp:HyperLink>
    </div>
</asp:Content>
