<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashboard.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="QLDT.StudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contents" runat="server">
    <div class="content-wrapper">
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">

                        <!-- Profile Image -->
                        <div class="card card-primary card-outline">
                            <div class="card-body box-profile">
                                <div class="text-center">
                                    <asp:Image runat="server" ID="imgStudent" class="profile-user-img img-fluid img-circle" alt="User profile picture" />
                                </div>
                                <h3 class="profile-username text-center">
                                    <asp:Label runat="server" ID="txtStudentName"></asp:Label>
                                </h3>
                                <p class="text-muted text-center">
                                    <asp:Label runat="server" ID="txtDob"></asp:Label>
                                </p>
                                <p class="text-muted text-center">
                                    <asp:Label runat="server" ID="txtEmail"></asp:Label>
                                </p>
                                <ul class="list-group list-group-unbordered mb-3">
                                    <li class="list-group-item">
                                        <b>Following</b> <a class="float-right">
                                            <asp:Label runat="server" ID="txtNumFollowCourse"></asp:Label>
                                        </a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Comments</b> <a class="float-right">
                                            <asp:Label runat="server" ID="txtNumComment"></asp:Label>
                                        </a>
                                    </li>
                                </ul>

                                <a href="Compose.aspx" class="btn btn-primary btn-block"><b>Send Message</b></a>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->

                        <!-- About Me Box -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">About Me</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <strong>
                                    <i class="fas fa-book mr-1"></i>Education
                                </strong>
                                <p class="text-muted">
                                    <asp:Label runat="server" ID="txtLatestCourse" Text="None"></asp:Label>
                                </p>
                                <hr />
                                <strong>
                                    <i class="fas fa-map-marker-alt mr-1"></i>Location
                                </strong>
                                <p class="text-muted">
                                    <asp:Label runat="server" ID="txtAddress"></asp:Label>
                                </p>
                                <hr />
                                <strong>
                                    <i class="fas fa-pencil-alt mr-1"></i>Skills
                                </strong>
                                <p class="text-muted">
                                    <asp:Repeater runat="server" ID="rptSkill">
                                        <ItemTemplate>
                                            <span class="tag tag-danger"><%# Eval("category_name") %></span>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </p>
                                <hr />
                                <strong>
                                    <i class="far fa-file-alt mr-1"></i>Phone Number
                                </strong>
                                <p class="text-muted">
                                    <asp:Label runat="server" ID="txtPhone"></asp:Label>
                                </p>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-header p-2">
                                <ul class="nav nav-pills">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#activity" data-toggle="tab">Activity</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#timeline" data-toggle="tab">Timeline</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="tab-content">
                                    <div class="active tab-pane" id="activity">
                                        <!-- Post -->
                                        <asp:Repeater runat="server" ID="rptComment">
                                            <ItemTemplate>
                                                <div class="post clearfix">
                                                    <div class="user-block">
                                                        <img class="img-circle img-bordered-sm" src='../<%# Eval("student_image") %>' alt="User Image" />
                                                        <span class="username">
                                                            <a href="#/"><%# Eval("student_name") %></a>
                                                        </span>
                                                        <span class="description"><a href='SingleCourse.aspx?courseid=<%# Eval("course_id") %>'><%# Eval("course_name") %></a> - <%# Eval("comment_date") %></span>
                                                    </div>
                                                    <!-- /.user-block -->
                                                    <p>
                                                        <%# Eval("comment") %>
                                                    </p>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <!-- /.post -->
                                    </div>

                                    <div class="tab-pane" id="timeline">
                                        <!-- The timeline -->
                                        <div class="timeline timeline-inverse">
                                            <!-- timeline time label -->
                                            <div class="time-label">
                                                <span class="bg-success">Order History</span>
                                            </div>
                                            <!-- /.timeline-label -->
                                            <!-- timeline item -->
                                            <asp:Repeater runat="server" ID="rptOrderHistory">
                                                <ItemTemplate>
                                                    <div>
                                                        <i class="fas fa-dollar-sign bg-purple"></i>
                                                        <div class="timeline-item">
                                                            <span class="time"><i class="far fa-clock"></i><%# Eval("date") %></span>

                                                            <h3 class="timeline-header"><%# Eval("student_name") %> order new course</h3>

                                                            <div class="timeline-body">
                                                                <%# Eval("course_name") %>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <!-- END timeline item -->
                                            <div>
                                                <i class="far fa-clock bg-gray"></i>
                                                <div class="timeline-item">
                                                    <span class="time"><i class="far fa-clock"></i><asp:Label runat="server" ID="txtSignUpDate"/></span>
                                                    <h3 class="timeline-header"><asp:Label runat="server" ID="txtStudentName2"/> create account</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.tab-pane -->
                                </div>
                                <!-- /.tab-content -->
                            </div>
                            <!-- /.card-body -->
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
</asp:Content>
