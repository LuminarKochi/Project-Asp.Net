<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="User_Cart.aspx.cs" Inherits="FruitKart.User_Cart" %>

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

        /* Style for the GridView */
        .gridview-style {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        .gridview-style th {
            background-color: #4CAF50; /* Header background color */
            color: white; /* Header text color */
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        .gridview-style td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        .gridview-style tr:hover {
            background-color: #f0f0f0; /* Light gray background on hover */
            cursor: pointer;
        }

        .cart-product-image {
            max-width: 150px; /* Adjust image size */
            height: auto;
            display: block;
            margin: 0 auto;
            border-radius: 8px; /* Rounded corners for images */
        }

        /* Button styles */
        .btn-cancel {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-right: 10px;
            cursor: pointer;
        }

        .btn-confirm {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
        }

        /* Container style for buttons */
        .button-container {
            text-align: right;
            margin-top: 20px;
            padding-right: 20px;
        }

        /* Styling for text inside GridView */
        .gridview-text {
            font-size: 14px;
            color: #333;
        }

        /* Grand Total Container */
        .grand-total-container {
            margin-top: 20px;
            text-align: right;
        }

        .grand-total-label {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-right: 20px;
        }

        /* Grand Total Value */
        .grand-total-value-container {
            text-align: right;
            margin-bottom: 30px;
        }

        .grand-total-value {
            font-size: 28px;
            font-weight: bold;
            color: #28a745; /* Green color for the total */
            background-color: #ffffff; /* White background for contrast */
            padding: 10px 20px;
            border: 2px solid #28a745; /* Green border matching the total color */
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
            display: inline-block;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="container">
                <div class="header">
                    <h2><asp:Label ID="Label1" runat="server" Text="Shopping Cart"></asp:Label></h2>
                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="cart_id"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting"
                    OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" CssClass="gridview-style">
                    <Columns>
                        <asp:BoundField DataField="product_name" HeaderText="Product Name" />
                        <asp:TemplateField HeaderText="Product Image">
                            <ItemTemplate>
                                <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("product_image") %>'
                                    CssClass="cart-product-image" AlternateText='<%# Eval("product_name") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quantity">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("quantity") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("quantity") %>' CssClass="gridview-text"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="product_price" HeaderText="Price" />
                        <asp:BoundField DataField="total_price" HeaderText="Total Price" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" DeleteText="Remove" />
                    </Columns>
                </asp:GridView>
                <div class="grand-total-container">
                    <asp:Label ID="Label3" runat="server" Text="Grand Total" CssClass="grand-total-label"></asp:Label>
                </div>
                <div class="grand-total-value-container">
                    <asp:Label ID="Label4" runat="server" Text="Label" CssClass="grand-total-value"></asp:Label>
                </div>

                <div class="button-container">
                    <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btn-cancel" OnClick="Button2_Click" />
                    <asp:Button ID="Button1" runat="server" Text="Confirm Order" CssClass="btn-confirm" OnClick="Button1_Click" />
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowDeleting" />
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowEditing" />
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCancelingEdit" />
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowUpdating" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
