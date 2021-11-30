<%@ Page Title="Add new Article" Language="C#" MasterPageFile="~/AdminDashboard.Master" AutoEventWireup="true" CodeBehind="AddNewArticle.aspx.cs" EnableEventValidation="false" Inherits="QLDT.AddNewArticle" MaintainScrollPositionOnPostback="true" %>

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
                                            <label>Category</label>
                                            <asp:DropDownList runat="server" class="custom-select" ID="ddlCategory" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label>Course</label>
                                            <asp:DropDownList runat="server" class="custom-select" ID="ddlCourse" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged" AutoPostBack="true">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label>Article</label>
                                            <asp:DropDownList runat="server" class="custom-select" ID="ddlArticle" OnSelectedIndexChanged="ddlArticle_SelectedIndexChanged" AutoPostBack="true">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Article Name</label>
                                            <asp:TextBox runat="server" class="form-control" ID="txtNewArticleName" placeholder="Article Name" AutoCompleteType="Disabled"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Article Description</label>
                                            <asp:TextBox runat="server" class="form-control" ID="txtNewArticleDescription" placeholder="Article Description" AutoCompleteType="Disabled"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Document Name</label>
                                            <asp:TextBox runat="server" class="form-control" ID="txtNewDocumentName" placeholder="Document Name" AutoCompleteType="Disabled"></asp:TextBox>
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
                                        <asp:Button runat="server" Text="Add New Article" ID="btnAddNewArticle" class="btn btn-primary" OnClick="btnAddNewArticle_Click"></asp:Button>
                                        <asp:Button runat="server" Text="Add New Document" ID="btnAddNewDocument" class="btn btn-primary" OnClick="btnAddNewDocument_Click"></asp:Button>
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
