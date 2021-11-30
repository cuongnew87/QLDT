<%@ Page Title="" Language="C#" MasterPageFile="~/DLC/MainMenu.Master" AutoEventWireup="true" CodeBehind="AddNewArticle.aspx.cs" Inherits="QLDT.DLC.AddNewArticle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contents" runat="server">
    <div class="wrapper">
        <div class="content-wrapper">
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6" id="dvFirstDiv">
                            <!-- general form elements disabled -->
                            <div class="card card-warning">
                                <div class="card-header">
                                    <h3 class="card-title">New information</h3>
                                </div>
                                <!-- /.card-header -->
                                <div>
                                    <div class="card-body">

                                        <div class="form-group">
                                            <label>Course</label>
                                            <asp:dropdownlist runat="server" class="custom-select" id="ddlCourse" onselectedindexchanged="ddlCourse_SelectedIndexChanged" autopostback="true">
                                            </asp:dropdownlist>
                                        </div>
                                        <div class="form-group">
                                            <label>Article</label>
                                            <asp:dropdownlist runat="server" class="custom-select" id="ddlArticle" onselectedindexchanged="ddlArticle_SelectedIndexChanged" autopostback="true">
                                            </asp:dropdownlist>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Article Name</label>
                                            <asp:textbox runat="server" class="form-control" id="txtNewArticleName" placeholder="Article Name" autocompletetype="Disabled"></asp:textbox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Article Description</label>
                                            <asp:textbox runat="server" class="form-control" id="txtNewArticleDescription" placeholder="Article Description" autocompletetype="Disabled"></asp:textbox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Document Name</label>
                                            <asp:textbox runat="server" class="form-control" id="txtNewDocumentName" placeholder="Document Name" autocompletetype="Disabled"></asp:textbox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputFile">File input</label>
                                            <div class="input-group">
                                                <div class="custom-file">
                                                    <asp:fileupload id="FileUpload" runat="server"></asp:fileupload>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Document Type</label>
                                            <asp:dropdownlist runat="server" id="ddlDocumentType" class="custom-select">
                                                <asp:ListItem Value="Video"> Video </asp:ListItem>
                                                <asp:ListItem Value="Document"> Document </asp:ListItem>
                                                <asp:ListItem Value="MP3"> MP3 </asp:ListItem>
                                                <asp:ListItem Value="Image"> Image </asp:ListItem>
                                            </asp:dropdownlist>
                                        </div>

                                    </div>
                                    <!-- /.card-body -->

                                    <div class="card-footer">
                                        <asp:button runat="server" text="Add New Article" id="btnAddNewArticle" class="btn btn-primary" onclick="btnAddNewArticle_Click"></asp:button>
                                        <asp:button runat="server" text="Add New Document" id="btnAddNewDocument" class="btn btn-primary" onclick="btnAddNewDocument_Click"></asp:button>
                                    </div>
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
