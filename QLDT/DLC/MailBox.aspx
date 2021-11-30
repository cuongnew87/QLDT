<%@ Page Title="" Language="C#" MasterPageFile="~/DLC/MainMenu.Master" AutoEventWireup="true" CodeBehind="MailBox.aspx.cs" Inherits="QLDT.DLC.MailBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contents" runat="server">
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Inbox</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="Index.aspx">Home</a></li>
                            <li class="breadcrumb-item active">Comments</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-3">
                    <a href="Compose.aspx" class="btn btn-primary btn-block mb-3">Compose</a>

                    <!-- /.card -->
                </div>
                <!-- /.col -->
                <div class="col-md-9">
                    <div class="card card-primary card-outline">
                        <div class="card-header">
                            <h3 class="card-title">Inbox</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body p-0">
                            <div class="mailbox-controls">
                                <!-- /.btn-group -->
                                <asp:LinkButton runat="server" ID="btnRefresh" class="btn btn-default btn-sm">
                                    <i class="fas fa-sync-alt"></i>
                                </asp:LinkButton>
                            </div>
                            <div class="table-responsive mailbox-messages">
                                <table class="table table-hover table-striped">
                                    <tbody>
                                        <asp:Repeater ID="rptMail" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="mailbox-star"><a href="#"><i class="fas fa-star text-warning"></i></a></td>
                                                    <td class="mailbox-name">
                                                        <asp:HyperLink ID="linkView" NavigateUrl='<%# FormatUrl( (int) Eval("id")) %>' runat="server" Text='<%# Eval("student_name") %>' class="link-product-add-cart">Quick View</asp:HyperLink>
                                                        <td class="mailbox-subject"><%# Eval("comment") %></td>
                                                        <td class="mailbox-subject"><%# Eval("course_name") %></td>
                                                        <td class="mailbox-attachment"></td>
                                                        <td class="mailbox-date">
                                                            <asp:Label runat="server" ID="txtDateSend" Text='<%# Eval("comment_date") %>'></asp:Label></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                                <!-- /.table -->
                            </div>
                            <!-- /.mail-box-messages -->
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer p-0">
                            <div class="mailbox-controls">
                                <div class="float-right">
                                    1-50/200
                 
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default btn-sm">
                                            <i class="fas fa-chevron-left"></i>
                                        </button>
                                        <button type="button" class="btn btn-default btn-sm">
                                            <i class="fas fa-chevron-right"></i>
                                        </button>
                                    </div>
                                    <!-- /.btn-group -->
                                </div>
                                <!-- /.float-right -->
                            </div>
                        </div>
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
</asp:Content>

