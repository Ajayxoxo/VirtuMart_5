<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="VirtuMart_5.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="col-md-6 p-4 border shadow-lg rounded bg-light">
            <h3 class="text-center mb-4">Sign Up</h3>
            
            <!-- Username -->
            <div class="mb-3">
                <label for="usernameTxt" class="form-label">Username:</label>
                <asp:TextBox ID="usernameTxt" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="usernameRFV" ControlToValidate="usernameTxt" ErrorMessage="* Username is required" runat="server" ForeColor="Red" />
            </div>

            <!-- Password -->
            <div class="mb-3">
                <label for="passwordTxt" class="form-label">Password:</label>
                <asp:TextBox ID="passwordTxt" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="passwordRFV" ControlToValidate="passwordTxt" ErrorMessage="* Password is required" runat="server" ForeColor="Red" />
            </div>

            <!-- Confirm Password -->
            <div class="mb-3">
                <label for="confirmPasswordTxt" class="form-label">Confirm Password:</label>
                <asp:TextBox ID="confirmPasswordTxt" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="confirmPasswordRFV" ControlToValidate="confirmPasswordTxt" ErrorMessage="* Confirm password is required" runat="server" ForeColor="Red" />
                <asp:CompareValidator ID="passwordCV" ControlToValidate="confirmPasswordTxt" ControlToCompare="passwordTxt" ErrorMessage="Passwords do not match" runat="server" ForeColor="Red" />
            </div>

            <!-- Phone Number -->
            <div class="mb-3">
                <label for="phoneTxt" class="form-label">Phone Number:</label>
                <asp:TextBox ID="phoneTxt" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="phoneRFV" ControlToValidate="phoneTxt" ErrorMessage="* Phone number is required" runat="server" ForeColor="Red" />
                <asp:RegularExpressionValidator ID="PhoneValidator" ControlToValidate="phoneTxt" ValidationExpression="^(\+?\d{1,3}[- ]?)?(\(?\d{3}\)?[- ]?)?\d{3}[- ]?\d{4}$" ErrorMessage="Invalid phone number format" runat="server" ForeColor="Red" />
            </div>

            <!-- Email -->
            <div class="mb-3">
                <label for="emailTxt" class="form-label">Email ID:</label>
                <asp:TextBox ID="emailTxt" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="emailRFV" ControlToValidate="emailTxt" ErrorMessage="* Email ID is required" runat="server" ForeColor="Red" />
                <asp:RegularExpressionValidator ID="EmailValidator" ControlToValidate="emailTxt" ValidationExpression="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$" ErrorMessage="Invalid email format" runat="server" ForeColor="Red" />
            </div>

            <!-- Submit Button -->
            <div class="d-grid gap-2 mb-3">
                <asp:Button ID="SubmitBtn" runat="server" Text="Submit" OnClick="AddUser" CssClass="btn btn-primary" />
            </div>

            <!-- Redirect to Sign In -->
            <p class="text-center">
                Already a member? <a href="SignIn.aspx" class="link-primary">Sign In</a>
            </p>
        </div>
    </div>
</asp:Content>
