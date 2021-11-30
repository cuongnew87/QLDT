<%@ Page Title="" Language="C#" MasterPageFile="~/DLC/MainMenu.Master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="QLDT.DLC.OrderList" %>
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
                            <li class="breadcrumb-item active">Order List</li>
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
                                <label>Courses</label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <asp:Button runat="server" Text="Search" ID="btnSearchCategory" class="btn btn-danger" OnClick="btnSearchCategory_Click"></asp:Button>
                                    </div>
                                    <asp:DropDownList runat="server" class="custom-select" ID="ddlCourse">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Total order</label>
                                <asp:TextBox runat="server" class="form-control" ID="txtTotalOrder" placeholder="Total Order" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Total money</label>
                                <asp:TextBox runat="server" class="form-control" ID="txtTotalMoney" placeholder="Total Money" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:GridView ID="Grid" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                </asp:GridView>
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
</asp:Content>

