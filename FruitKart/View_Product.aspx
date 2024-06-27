<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="View_Product.aspx.cs" Inherits="FruitKart.View_Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
        }

        .header-label {
            font-size: 28px;
            font-weight: bold;
            color: #006600; /* Updated color */
            text-align: center;
            margin: 40px 0;
            text-transform: uppercase;
        }

        .form-label {
            font-size: 16px;
            color: #495057;
            margin-bottom: 5px;
            display: block;
        }

        .form-label-heading {
            font-size: 20px;
            color: #007bff; /* Blue color */
            margin-bottom: 10px;
        }

        .form-control, .form-control-select {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px 0;
            display: inline-block;
            border: 1px solid #ced4da;
            border-radius: 5px;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-control-select:focus {
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
        }

        .form-row {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
        }

        .form-column {
            flex: 1;
            margin: 0 10px;
        }

        .form-column:first-child {
            margin-left: 0;
        }

        .form-column:last-child {
            margin-right: 0;
        }

        .grid-view {
            width: 100%;
            margin: 40px 0;
            border-collapse: collapse;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            overflow: hidden;
        }

        .grid-view th, .grid-view td {
            padding: 15px;
            border: 1px solid #e9ecef;
            text-align: left;
        }

        .grid-view th {
            background-color: #006600; /* Updated color */
            color: white;
            text-transform: uppercase;
        }

        .grid-view tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .grid-view tr:hover {
            background-color: #f1f1f1;
        }

        .image-thumbnail {
            max-width: 100px;
            max-height: 100px;
            border-radius: 5px;
        }

        .action-buttons {
            display: flex;
            justify-content: space-between;
        }

        .btn {
            padding: 10px 20px;
            margin: 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-edit {
            background-color: #17a2b8;
            color: white;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
        }

        .btn-edit:hover {
            background-color: #138496;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header-label">
        <asp:Label ID="Label1" runat="server" Text="View Products"></asp:Label>
    </div>
    <div class="form-row">
        <div class="form-column">
            <asp:Label ID="Label2" runat="server" Text="Select Category" CssClass="form-label form-label-heading"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="form-control-select" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="product_id" CssClass="grid-view" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:BoundField DataField="product_id" HeaderText="Product ID" ReadOnly="True" />
            <asp:BoundField DataField="category_id" HeaderText="Category ID" ReadOnly="True" />
            <asp:BoundField DataField="category_name" HeaderText="Category Name" ReadOnly="True" />
            <asp:TemplateField HeaderText="Product Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("product_name") %>' CssClass="form-control"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("product_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product Image">
                <EditItemTemplate>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                    <asp:HiddenField ID="HiddenFieldImagePathEdit" runat="server" Value='<%# Bind("product_image") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("product_image") %>' CssClass="image-thumbnail" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("product_price") %>' CssClass="form-control"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("product_price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("product_description") %>' TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("product_description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Stock">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("stock") %>' CssClass="form-control"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("stock") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("product_status") %>' CssClass="form-control-select">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("product_status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>
