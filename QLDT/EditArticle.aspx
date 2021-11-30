<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/AdminDashboard.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="EditArticle.aspx.cs" Inherits="QLDT.EditArticle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contents" runat="server">
    <div class="wrapper">
        <div class="content-wrapper">
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        <asp:Label runat="server" ID="lblCourseName"></asp:Label>
                                    </h3>
                                </div>
                                <div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>Article</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <asp:Button runat="server" Text="Delete" ID="btnDeleteArticle" OnClick="btnDeleteArticle_Click" class="btn btn-danger" OnClientClick="return confirm('Are you sure you want to delete selected records?');"></asp:Button>
                                                </div>
                                                <asp:DropDownList runat="server" class="custom-select" ID="ddlArticle" OnSelectedIndexChanged="ddlArticle_SelectedIndexChanged" AutoPostBack="true">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Article Name</label>
                                            <asp:TextBox runat="server" class="form-control" ID="txtArticleName" placeholder="Article Name" AutoCompleteType="Disabled"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Article Description</label>
                                            <asp:TextBox runat="server" class="form-control" ID="txtArticleDescription" placeholder="Article Description" AutoCompleteType="Disabled"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Document</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <asp:Button runat="server" Text="Delete" ID="btnDeleteDocument" OnClick="btnDeleteDocument_Click" class="btn btn-danger" OnClientClick="return confirm('Are you sure you want to delete selected records?');"></asp:Button>
                                                </div>
                                                <asp:DropDownList runat="server" class="custom-select" ID="ddlDocument" OnSelectedIndexChanged="ddlDocument_SelectedIndexChanged" AutoPostBack="true">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Document Name</label>
                                            <asp:TextBox runat="server" class="form-control" ID="txtDocumentName" placeholder="Document Name" AutoCompleteType="Disabled"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputFile">File input</label>
                                            <div class="input-group">
                                                <div class="custom-file">
                                                    <asp:FileUpload ID="FileUpload" runat="server"></asp:FileUpload>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Document Type</label>
                                            <asp:DropDownList runat="server" ID="ddlDocumentType" class="custom-select">
                                                <asp:ListItem Value="Video"> Video </asp:ListItem>
                                                <asp:ListItem Value="Document"> Document </asp:ListItem>
                                                <asp:ListItem Value="MP3"> MP3 </asp:ListItem>
                                                <asp:ListItem Value="Image"> Image </asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                    </div>
                                    <!-- /.card-body -->

                                    <div class="card-footer">
                                        <asp:Button runat="server" Text="Save" ID="btnSubmit" OnClick="btnSubmit_Click" class="btn btn-primary"></asp:Button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- general form elements disabled -->
                            <div class="card card-warning">
                                <div class="card-header">
                                    <h3 class="card-title">Preview field</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <asp:Image ID="imgDocument" Width="100%" Height="100%" runat="server"></asp:Image>
                                    <video controls="controls" runat="server" id="vdDocument" style="height: 273px; width: 490px;">
                                        <source runat="server" id="srcVideo" type="video/mp4" />
                                    </video>
                                    <audio controls="controls" runat="server" id="adDocument">
                                        <source runat="server" id="srcMp3" type="audio/mpeg" />
                                    </audio>
                                   <embed runat="server" id="txtDocument"/>
                                </div>


                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
