<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="View_Category.aspx.cs" Inherits="FruitKart.View_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
        }

        .center-text {
            text-align: center;
            display: block;
            width: 100%;
            font-family: Impact, sans-serif;
            font-size: 24px;
            color: #006600;
            margin-bottom: 20px;
        }

        .gridview-header {
            background-color: #006600;
            color: white;
            text-align: center;
        }

        .gridview-row {
            background-color: #f2f2f2;
        }

        .gridview-row-alt {
            background-color: #e6e6e6;
        }

        .gridview-row:hover {
            background-color: #d4d4d4;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        .gridview th, .gridview td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        .image-size {
            width: 100px;
            height: auto;
        }

        .textbox-large {
            width: 100%;
            height: 100px;
        }

        .textbox-small {
            width: 100%;
        }

        .dropdown {
            width: 100%;
        }

        .form-label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" CssClass="center-text" Text="VIEW CATEGORY"></asp:Label>

    <div class="form-group">
        <asp:Label ID="Label2" runat="server" CssClass="form-label" Text="Select the Category"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
    </div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview"
        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" 
        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="category_id" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
        <HeaderStyle CssClass="gridview-header" />
        <RowStyle CssClass="gridview-row" />
        <AlternatingRowStyle CssClass="gridview-row-alt" />
        <Columns>
            <asp:BoundField DataField="category_id" HeaderText="Category ID" ReadOnly="true" />
            <asp:TemplateField HeaderText="Category Name">
                <ItemTemplate>
                    <asp:Label ID="LabelCategoryName" runat="server" Text='<%# Eval("category_name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxNameEdit" runat="server" Text='<%# Bind("category_name") %>' CssClass="textbox-small form-control"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" CssClass="image-size" ImageUrl='<%# Eval("category_image") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" />
                    <asp:HiddenField ID="HiddenFieldImagePathEdit" runat="server" Value='<%# Bind("category_image") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
                    <asp:Label ID="LabelDescription" runat="server" Text='<%# Eval("category_description") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxDescEdit" runat="server" Text='<%# Bind("category_description") %>' CssClass="textbox-large form-control" TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label ID="LabelStatus" runat="server" Text='<%# Eval("category_status") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("category_status") %>' CssClass="dropdown form-control">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>
