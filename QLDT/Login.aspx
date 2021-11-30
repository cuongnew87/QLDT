<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QLDT.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login</title>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="styleLogin/plugins/fontawesome-free/css/all.min.css" />
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="styleLogin/plugins/icheck-bootstrap/icheck-bootstrap.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="styleLogin/dist/css/adminlte.min.css" />
</head>
<body class="hold-transition login-page">
    <form id="formLogin" runat="server" class="login-box">
        <div class="login-logo">
            <a href="Index2.aspx"><b>Known</b></a>
        </div>
        <div class="card">
            <div class="card-body login-card-body">
                <p class="login-box-msg">Sign in to start your session</p>

                <div class="input-group mb-3">
                    <asp:TextBox ID="txtUsername" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-user"></span>
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

                <div class="row">
                    <div class="col-8">
                        <div class="icheck-primary">
                            <asp:CheckBox ID="remember" runat="server" Text="Remember Me" />
                            <asp:Label ID="lbEmpty" runat="server" ForeColor="Red" Text="Textbox empty!!!" Visible="False"></asp:Label>
                        </div>
                    </div>
                    <div class="col-4">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-primary btn-block" OnClick="btnLogin_Click" />
                    </div>
                </div>

                <div class="social-auth-links text-center mb-3">
                    <p>- OR -</p>
                    <asp:LinkButton runat="server" ID="btnGGLogin" OnClick="btnGGLogin_Click" class="btn btn-block btn-danger">
                        <i class="fab fa-google-plus mr-2"></i>Sign in using Google+
                    </asp:LinkButton>
                </div>

<%--                <p class="mb-1">
                    <a href="ForgotPassword.aspx" class="text-center">I forgot password</a>
                    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QLDTConnectionString %>" SelectCommand="SELECT * FROM [Login]"></asp:SqlDataSource>
                </p>--%>

                <p class="mb-0">
                    <a href="Signin.aspx" class="text-center">Register a new membership</a>
                </p>
            </div>
        </div>
    </form>
    <!-- AdminLTE App -->
    <script src="styleLogin/dist/js/adminlte.min.js"></script>
</body>
</html>
