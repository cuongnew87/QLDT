<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signin.aspx.cs" Inherits="QLDT.Signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Register</title>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="styleLogin/plugins/fontawesome-free/css/all.min.css" />
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="styleLogin/plugins/icheck-bootstrap/icheck-bootstrap.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="styleLogin/dist/css/adminlte.min.css" />
</head>
<body class="hold-transition register-page">
    <form id="formRegister" runat="server">
        <div class="register-box">
            <div class="register-logo">
                <a href="Index2.aspx"><b>Known</b></a>
            </div>
            <div class="card">
                <div class="card-body register-card-body">
                    <p class="login-box-msg">Register a new membership</p>

                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtEmail" runat="server" type="email" class="form-control" placeholder="Email"></asp:TextBox>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtPassword" runat="server" type="password" class="form-control" placeholder="Password"></asp:TextBox>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtConfirm" runat="server" type="password" class="form-control" placeholder="Confirm password"></asp:TextBox>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtFullname" runat="server" class="form-control" type="text" placeholder="Full name"></asp:TextBox>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-user"></span>
                            </div>
                        </div>
                    </div>
              
                    <div class="social-auth-links text-center">
                        <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary btn-block" Text="Register" OnClick="btnSubmit_Click"></asp:Button>
                    </div>                    
                </div>
            </div>
        </div>
    </form>
</body>
</html>
