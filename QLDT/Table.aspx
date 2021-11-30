<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashboard.Master" AutoEventWireup="true" CodeBehind="Table.aspx.cs" Inherits="QLDT.Table" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contents" runat="server">
    <link href="style/css/GridView.css" rel="stylesheet" />
    <div class="wrapper">
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Course Tables</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Simple Tables</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Students List</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body table-responsive p-0">
                                    <asp:GridView runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" ID="gvStudent" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="5" OnPageIndexChanging="gvStudent_PageIndexChanging">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="ID" />
                                             <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hylkStudent" runat="server" NavigateUrl='<%# FormatStudentUrl( (int) Eval("id")) %>'><%# Eval("student_name") %></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="dob" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Dob" />
                                            <asp:BoundField DataField="address" HeaderText="Address" />
                                            <asp:BoundField DataField="phone" HeaderText="Phone" />
                                            <asp:BoundField DataField="email" HeaderText="Email" />
                                        </Columns>

                                        <FooterStyle BackColor="White" ForeColor="#000066" />
                                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                        <RowStyle ForeColor="#000066" />
                                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#00547E" />

                                    </asp:GridView>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                 <div class="card-header">
                                    <h3 class="card-title">Teachers List</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body table-responsive p-0">
                                    <asp:GridView ID="gvTeacher" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" AllowPaging="True" OnPageIndexChanging="gvTeacher_PageIndexChanging" PageSize="5">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="ID" />
                                            <asp:TemplateField HeaderText="Tên giảng viên">
                                                <ItemTemplate>
                                                    <asp:HyperLink runat="server" NavigateUrl='<%# FormatTeacherUrl( (int) Eval("id")) %>' ID="hplkTeacher"><%# Eval("teacher_name") %></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="dob" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày sinh" />
                                            <asp:BoundField DataField="address" HeaderText="Address" />
                                            <asp:BoundField DataField="phone" HeaderText="Phone" />
                                            <asp:BoundField DataField="job" HeaderText="Job" />
                                            <asp:BoundField DataField="email" HeaderText="Email" />
                                        </Columns>
                                        <FooterStyle BackColor="White" ForeColor="#000066" />
                                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                        <RowStyle ForeColor="#000066" />
                                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#00547E" />

                                    </asp:GridView>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>

                    <!-- /.row -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Courses List</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body table-responsive p-0">
                                    <asp:GridView runat="server" ID="gvCourse" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" AllowPaging="True" OnPageIndexChanging="gvCourse_PageIndexChanging" PageSize="5">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="ID" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hylkCourse" runat="server" NavigateUrl='<%# FormatCourseUrl( (int) Eval("id")) %>'><%# Eval("course_name") %></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="teacher_name" HeaderText="Teacher" />
                                            <asp:BoundField DataField="category_name" HeaderText="Category" />
                                            <asp:BoundField DataField="price" DataFormatString="{0:c}" HeaderText="Price" />
                                            <asp:BoundField DataField="hours" HeaderText="Hours" />
                                            <asp:BoundField DataField="date_update" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Updated" />
                                        </Columns>

                                    </asp:GridView>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>
    </div>
</asp:Content>
