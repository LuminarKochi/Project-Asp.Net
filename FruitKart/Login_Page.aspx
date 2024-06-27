﻿<%@ Page Title="" Language="C#" MasterPageFile="~/LoginReg.Master" AutoEventWireup="true" CodeBehind="Login_Page.aspx.cs" Inherits="FruitKart.Admin_Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .centered-form {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-wrap {
            background: rgba(94, 163, 232, 0.10); /* Adjusted opacity */
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 1rem;
        }
        .btn-primary {
            background-color: #5ea3e8;
            border-color: #5ea3e8;
        }
        .btn-primary:hover {
            background-color: #4a90d6;
            border-color: #4a90d6;
        }
        .checkbox-wrap {
            display: flex;
            align-items: center;
        }
        .checkbox-wrap input {
            margin-right: 0.5rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="centered-form">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="login-wrap">
                        <h3 class="mb-4 text-center">Have an account?</h3>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="Button1" runat="server" Text="Login" class="form-control btn btn-primary submit px-3" OnClick="Button1_Click" />
                        </div>
                        <div class="form-group d-md-flex">
                            <div class="w-50">
                                <label class="checkbox-wrap checkbox-primary">Remember Me
                                    <input type="checkbox" checked>
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="w-50 text-md-right">
                                <a href="#" style="color: #5ea3e8">Forgot Password</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
