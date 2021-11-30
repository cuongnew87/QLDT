<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashboard.Master" AutoEventWireup="true" CodeBehind="ReadMail.aspx.cs" Inherits="QLDT.ReadMail" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contents" runat="server">
    <div class="content-wrapper">
        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <a href="Mailbox.aspx" class="btn btn-primary btn-block mb-3">Back to Inbox</a>

                    </div>
                    <!-- /.col -->
                    <div class="col-md-9">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">Read Mail</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body p-0">
                                <div class="mailbox-read-info">
                                    <h5>Message Subject Is Placed Here</h5>
                                    <h6>From:
                                        <asp:Label runat="server" ID="txtSender"></asp:Label>
                                        <span class="mailbox-read-time float-right">
                                            <asp:Label runat="server" ID="txtDataSend"></asp:Label></span></h6>
                                </div>
                                <!-- /.mailbox-read-info -->
                                <div class="mailbox-controls with-border text-center">
                                    <div class="btn-group">
                                        <asp:LinkButton runat="server" ID="delete" OnClientClick="javascript:confirm('you sure you wanna do this?');" OnClick="btnDelete_Click" data-container="body" title="Delete" CssClass="btn btn-default btn-sm">
                                                                                   <i class="far fa-trash-alt"></i>&nbsp;
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="pre" OnClick="btnPrevious_Click" data-container="body" title="Previous" CssClass="btn btn-default btn-sm">
                                                                                    <i class="fas fa-reply"></i>&nbsp;
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="next" OnClick="btnNext_Click" data-container="body" title="Next" CssClass="btn btn-default btn-sm">
                                                                                     <i class="fas fa-share"></i>&nbsp;
                                        </asp:LinkButton>
                                    </div>
                                    <!-- /.btn-group -->
                                    <button type="button" class="btn btn-default btn-sm" title="Print">
                                        <i class="fas fa-print"></i>
                                    </button>
                                </div>
                                <!-- /.mailbox-controls -->
                                <div class="mailbox-read-message">
                                    <p>Hello Admin,</p>

                                    <asp:Label runat="server" ID="txtMessage"></asp:Label>
                                    <br />
                                    <p>
                                        Thanks,<br />
                                        <asp:Label runat="server" ID="txtName"></asp:Label>
                                    </p>
                                </div>
                                <!-- /.mailbox-read-message -->
                            </div>
                            <!-- /.card-body -->
                            <!-- /.card-footer -->
                            <div class="card-footer">
                                <div class="float-right">
                                    <asp:LinkButton runat="server" ID="btnRep" class="btn btn-default"><i class="fas fa-reply">Reply</i></asp:LinkButton>
                                </div>
                            </div>
                            <!-- /.card-footer -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
    </div>
    <!-- /.content -->
</asp:Content>
