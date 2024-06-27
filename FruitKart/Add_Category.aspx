﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Add_Category.aspx.cs" Inherits="FruitKart.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
        }

        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            text-align: center;
            font-family: Impact, sans-serif;
            font-size: 24px;
            color: #006600;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-input[type="file"] {
            padding: 0;
        }

        .form-textarea {
            height: 150px;
        }

        .form-button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        .form-button:hover {
            background-color: #218838;
        }

        .form-secondary-button {
            background-color: #007bff;
        }

        .form-secondary-button:hover {
            background-color: #0056b3;
        }

        .form-message {
            text-align: center;
            font-size: 16px;
            margin-top: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        
        <div class="form-title"><asp:Label ID="Label6" runat="server" Text="ADD CATEGORY"></asp:Label></div>

        <div class="form-group">
            <asp:Label ID="Label2" runat="server" CssClass="form-label" Text="Category Name"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-input"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="Label3" runat="server" CssClass="form-label" Text="Category Image"></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-input" />
        </div>

        <div class="form-group">
            <asp:Label ID="Label4" runat="server" CssClass="form-label" Text="Category Description"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-input form-textarea" TextMode="MultiLine"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="Label5" runat="server" CssClass="form-label" Text="Category Status"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-input">
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>Inactive</asp:ListItem>
            </asp:DropDownList>
        </div>

        <asp:Button ID="Button1" runat="server" CssClass="form-button" OnClick="Button1_Click" Text="ADD CATEGORY" />
        <asp:Button ID="Button2" runat="server" CssClass="form-button form-secondary-button" OnClick="Button2_Click" Text="VIEW ALL CATEGORIES" />

        <asp:Label ID="Label1" runat="server" CssClass="form-message"></asp:Label>
    </div>
</asp:Content>
