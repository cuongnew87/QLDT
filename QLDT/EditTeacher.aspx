<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/AdminDashboard.Master" AutoEventWireup="true" CodeBehind="EditTeacher.aspx.cs" Inherits="QLDT.EditTeacher" %>

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
                                    <h3 class="card-title">New information</h3>
                                </div>
                                <div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Teacher name</label>
                                            <asp:TextBox runat="server" class="form-control" ID="txtTeacherName" placeholder="Teacher name"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Job</label>
                                            <asp:TextBox runat="server" class="form-control" ID="txtJob" placeholder="Job"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <asp:TextBox runat="server" class="form-control" ID="txtEmail" placeholder="Email"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Date of birth</label>
                                            <asp:TextBox runat="server" class="form-control" ID="txtDob" placeholder="Date of birth"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Phone number</label>
                                            <asp:TextBox runat="server" class="form-control" ID="txtPhoneNumber" placeholder="Phone number"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Address</label>
                                            <asp:TextBox runat="server" class="form-control" ID="txtAddress" placeholder="Address"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Note</label>
                                            <asp:TextBox runat="server" TextMode="MultiLine" class="form-control" ID="txtNote" placeholder="Note"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputFile">File input</label>
                                            <div class="input-group">
                                                <div class="custom-file">
                                                    <asp:FileUpload ID="FileUpload" onchange="previewFile()" runat="server"></asp:FileUpload>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.card-body -->

                                    <div class="card-footer">
                                        <asp:Button runat="server" Text="Submit" OnClick="btnSubmit_Click" ID="btnSubmit" class="btn btn-primary"></asp:Button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- general form elements disabled -->
                            <div class="card card-warning">
                                <div class="card-header">
                                    <h3 class="card-title">Image field</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <asp:Image ID="imgTeacher" Width="100%" Height="100%" runat="server"></asp:Image>
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
    <script type="text/javascript">
        function previewFile() {
            var preview = document.querySelector('#<%=imgTeacher.ClientID %>');
            var file = document.querySelector('#<%=FileUpload.ClientID %>').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }
    </script>
</asp:Content>
