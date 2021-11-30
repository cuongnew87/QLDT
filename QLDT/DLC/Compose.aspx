<%@ Page Title="" Language="C#" MasterPageFile="~/DLC/MainMenu.Master" AutoEventWireup="true" CodeBehind="Compose.aspx.cs" Inherits="QLDT.DLC.Compose" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contents" runat="server">
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Compose</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="Index.aspx">Home</a></li>
                            <li class="breadcrumb-item active">Compose</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <a href="MailBox.aspx" class="btn btn-primary btn-block mb-3">Back to Inbox</a>
                    </div>
                    <!-- /.col -->
                    <div class="col-md-9">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">Compose New Message</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="form-group">
                                    <asp:Textbox runat="server" ID="txtTo" class="form-control" placeholder="To:" ></asp:Textbox>
                                </div>
                                <div class="form-group">
                                    <asp:Textbox runat="server" ID="txtSubject" class="form-control" placeholder="Subject:" ></asp:Textbox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox runat="server" ID="compose_textarea" class="form-control" Style="height: 300px" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <div class="btn btn-default btn-file">
                                        <i class="fas fa-paperclip"></i>Attachment
                   
                                        <asp:FileUpload ID="fileUploader" runat="server" />
                                    </div>
                                    <p class="help-block">Max. 32MB</p>
                                </div>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <div class="float-right">
                                    <button type="button" class="btn btn-default"><i class="fas fa-pencil-alt"></i>Draft</button>
                                    <asp:LinkButton runat="server" ID="btnSend" OnClick="btnSend_Click" class="btn btn-primary"><i class="far fa-envelope"></i>&nbsp; Send</asp:LinkButton>
                                </div>
                                <asp:LinkButton runat="server" ID="btnDiscard" OnClientClick="javascript:confirm('you sure you wanna do this?');" OnClick="btnDiscard_Click" type="reset" class="btn btn-default"><i class="fas fa-times"></i>&nbsp; Discard</asp:LinkButton>
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
        <!-- /.content -->
    </div>
</asp:Content>

