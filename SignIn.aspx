<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="VirtuMart_5.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="col-md-4 p-4 border shadow-lg rounded bg-light">
            <h4 class="text-center mb-4">Welcome to Sign In</h4>

            <!-- Username -->
            <div class="mb-3">
                <label for="usernameTxt" class="form-label">Username:</label>
                <asp:TextBox ID="usernameTxt" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <!-- Password -->
            <div class="mb-3">
                <label for="passwordTxt" class="form-label">Password:</label>
                <asp:TextBox ID="passwordTxt" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
            </div>

            <!-- Submit Button -->
            <div class="d-grid gap-2 mb-3">
                <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="TryLogin" CssClass="btn btn-primary" />
            </div>

            <!-- Redirect to Sign Up -->
            <p class="text-center">
                New Member? <a href="SignUp.aspx" class="link-primary">Sign Up</a>
            </p>
        </div>
    </div>
</asp:Content>
