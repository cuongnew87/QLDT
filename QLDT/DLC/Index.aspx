<%@ Page Title="" Language="C#" MasterPageFile="~/DLC/MainMenu.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="QLDT.DLC.Index2" %>

<%@ MasterType VirtualPath="~/DLC/MainMenu.Master" %>
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
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <!-- Info boxes -->
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box">
                            <span class="info-box-icon bg-info elevation-1">
                                <i class="fas fa-cog"></i>
                            </span>

                            <div class="info-box-content">
                                <span class="info-box-text">CPU Traffic</span>
                                <span class="info-box-number">10                 
                                    <small>%</small>
                                </span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box mb-3">
                            <span class="info-box-icon bg-danger elevation-1">
                                <i class="fas fa-thumbs-up"></i>
                            </span>

                            <div class="info-box-content">
                                <span class="info-box-text">Comments</span>
                                <span class="info-box-number">
                                    <asp:Label runat="server" ID="lblComments"></asp:Label>
                                </span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->

                    <!-- fix for small devices only -->
                    <div class="clearfix hidden-md-up"></div>

                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box mb-3">
                            <span class="info-box-icon bg-success elevation-1">
                                <i class="fas fa-shopping-cart"></i>
                            </span>
                            <div class="info-box-content">
                                <span class="info-box-text">Sales</span>
                                <span class="info-box-number">
                                    <asp:Label runat="server" ID="lblOrders"></asp:Label>
                                </span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box mb-3">
                            <span class="info-box-icon bg-warning elevation-1">
                                <i class="fas fa-users"></i>
                            </span>

                            <div class="info-box-content">
                                <span class="info-box-text">Total Members</span>
                                <span class="info-box-number">
                                    <asp:Label runat="server" ID="lblUserRegister"></asp:Label>
                                </span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                </div>
            </div>

            <!-- Main row -->
            <div class="row">
                <!-- Left col -->
                <div class="col-md-8">

                    <div class="row">
                        <div class="col-md-6">
                            <!-- DIRECT CHAT -->
                            <div class="card direct-chat direct-chat-warning">
                                <div class="card-header">
                                    <h3 class="card-title">Comments</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <!-- Conversations are loaded here -->
                                    <div class="direct-chat-messages">
                                        <!-- Message. Default to the left -->
                                        <asp:Repeater ID="rptComment" runat="server">
                                            <ItemTemplate>
                                                <div class="direct-chat-msg">
                                                    <div class="direct-chat-infos clearfix">
                                                        <span class="direct-chat-name float-left"><a href='Compose.aspx?id=<%# Eval("id") %>'><%# Eval("student_name") %></a></span>
                                                        <span class="direct-chat-timestamp float-right"><%# Eval("comment_date") %> </span>
                                                    </div>
                                                    <!-- /.direct-chat-infos -->
                                                    <a href='Compose.aspx?id=<%# Eval("id") %>'><img class="direct-chat-img" src='..\<%# Eval("student_image") %>' alt="message user image" /></a>
                                                    <!-- /.direct-chat-img -->
                                                    <div class="direct-chat-text">
                                                        <%# Eval("comment") %>
                                                    </div>
                                                    <!-- /.direct-chat-text -->
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <!--/.direct-chat-messages-->
                                </div>
                            </div>
                            <!--/.direct-chat -->
                        </div>
                        <!-- /.col -->

                        <div class="col-md-6">
                            <!-- USERS LIST -->
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Latest Members</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body p-0">
                                    <ul class="users-list clearfix">
                                        <asp:Repeater ID="rptMember" runat="server">
                                            <ItemTemplate>
                                                <li>
                                                    <a  href='StudentProfile.aspx?studentid=<%# Eval("student_id") %>'><img src='..\<%# Eval("student_image") %>' alt="User Image" /></a>
                                                    <a class="users-list-name" href='StudentProfile.aspx?studentid=<%# Eval("student_id") %>'><%# Eval("student_name") %></a>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                    <!-- /.users-list -->
                                </div>
                                <!-- /.card-body -->
                                <div class="card-footer text-center">
                                    <a href="Tables.aspx">View All Users</a>
                                </div>
                                <!-- /.card-footer -->
                            </div>
                            <!--/.card -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->

                    <!-- TABLE: LATEST ORDERS -->
                    <div class="card">
                        <div class="card-header border-transparent">
                            <h3 class="card-title">Latest Orders</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" data-card-widget="remove">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table m-0">
                                    <thead>
                                        <tr>
                                            <th>Order ID</th>
                                            <th>Item</th>
                                            <th>Status</th>
                                            <th>Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rptOrder" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("id") %></td>
                                                    <td><%# Eval("course_name") %></td>
                                                    <td><span class="badge badge-success">Paid</span></td>
                                                    <td>
                                                        <div class="sparkbar" data-color="#00a65a" data-height="20"><%# Eval("date") %></div>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer clearfix">
                            <a href="OrderList.aspx" class="btn btn-sm btn-secondary float-left">View All Orders</a>
                        </div>
                        <!-- /.card-footer -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->

                <div class="col-md-4">
                    <!-- Info Boxes Style 2 -->
                    <div class="info-box mb-3 bg-warning">
                        <span class="info-box-icon">
                            <i class="fas fa-tag"></i>
                        </span>

                        <div class="info-box-content">
                            <span class="info-box-text">Courses</span>
                            <span class="info-box-number">
                                <asp:Label runat="server" ID="lblNumCourse" /></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                    <div class="info-box mb-3 bg-success">
                        <span class="info-box-icon"><i class="far fa-heart"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Mentions</span>
                            <span class="info-box-number">
                                <asp:Label runat="server" ID="lblNumWishList" /></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                    <div class="info-box mb-3 bg-danger">
                        <span class="info-box-icon">
                            <i class="fas fa-cloud-download-alt"></i>
                        </span>

                        <div class="info-box-content">
                            <span class="info-box-text">Documents</span>
                            <span class="info-box-number"><asp:Label runat="server" ID="lblNumDocument" /></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                    <div class="info-box mb-3 bg-info">
                        <span class="info-box-icon">
                            <i class="far fa-comment"></i>
                        </span>

                        <div class="info-box-content">
                            <span class="info-box-text">Comments</span>
                            <span class="info-box-number">
                                <asp:Label runat="server" ID="lblCountComment" /></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->

                    <!-- PRODUCT LIST -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Recently Added Courses</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" data-card-widget="remove">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body p-0">
                            <ul class="products-list product-list-in-card pl-2 pr-2">
                                <asp:Repeater ID="rptCourse" runat="server">
                                    <ItemTemplate>
                                        <li class="item">
                                            <div class="product-img">
                                                <img src='..\<%# Eval("course_image") %>' alt="Product Image" class="img-size-50" />
                                            </div>
                                            <div class="product-info">
                                                <a href='EditCourse.aspx?courseid=<%# Eval("id") %>' class="product-title"><%# Eval("course_name") %>
                                                    <span class="badge badge-warning float-right"><%#DataBinder.Eval(Container, "DataItem.price", "{0:c}")%></span></a>
                                                <span class="product-description"><%# Eval("description") %>
                                                </span>
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer text-center">
                            <a href="Tables.aspx" class="uppercase">View All Courses</a>
                        </div>
                        <!-- /.card-footer -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
        </section>
    </div>
</asp:Content>
