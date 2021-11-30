<%@ Page Title="" Language="C#" MasterPageFile="~/DLC/MainMenu.Master" AutoEventWireup="true" CodeBehind="LinkTable.aspx.cs" Inherits="QLDT.DLC.LinkTable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contents" runat="server">
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Dashboard</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item">Home</li>
                            <li class="breadcrumb-item"><a href="Index.aspx">Dashboard</a></li>
                            <li class="breadcrumb-item active">Links Table</li>
                        </ol>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Url</label>
                                <asp:TextBox runat="server" class="form-control" ID="txtUrl" placeholder="Url" AutoCompleteType="Disabled"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Url Name</label>
                                <asp:TextBox runat="server" class="form-control" ID="txtName" placeholder="Name" AutoCompleteType="Disabled"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Button runat="server" Text="Edit" ID="btnSubmit" OnClick="btnSubmit_Click" class="btn btn-primary"></asp:Button>
                                <asp:Button runat="server" Text="Create" ID="btnCreate" OnClick="btnCreate_Click" class="btn btn-primary"></asp:Button>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:GridView ID="Grid" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="Grid_RowCommand">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:TemplateField ShowHeader="false">
                            <ItemTemplate>
                                <asp:Button runat="server" ID="btnEdit" Text="Edit" CausesValidation="false" CommandName="EditUrl" CommandArgument='<%# Eval("id") %>'></asp:Button>
                                <asp:Button runat="server" ID="btnDelete" Text="Delete" CausesValidation="false" CommandName="DeleteUrl" CommandArgument='<%# Eval("id") %>'></asp:Button>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
</asp:Content>

