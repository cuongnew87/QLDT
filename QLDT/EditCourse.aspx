<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/AdminDashboard.Master" AutoEventWireup="true" CodeBehind="EditCourse.aspx.cs" Inherits="QLDT.EditCourse" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="server">
    <style>
        select[id*='lbWhatllLearn'] option {
            white-space: normal;
        }
    </style>
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
                                            <label for="exampleInputEmail1">Course name</label>
                                            <asp:TextBox runat="server" class="form-control" ID="txtCourseName" placeholder="Course name" AutoCompleteType="Disabled"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Teacher</label>
                                            <asp:DropDownList runat="server" AppendDataBoundItems="True" class="custom-select" ID="ddlTeacher">
                                                <asp:ListItem>Teacher</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label>Category</label>
                                            <asp:DropDownList runat="server" AppendDataBoundItems="True" class="custom-select" ID="ddlCategory">
                                                <asp:ListItem>Category</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Language</label>
                                            <asp:DropDownList runat="server" ID="ddlLanguage" class="custom-select">
                                                <asp:ListItem Value="English"> English </asp:ListItem>
                                                <asp:ListItem Value="French"> French </asp:ListItem>
                                                <asp:ListItem Value="Japanese"> Japanese </asp:ListItem>
                                                <asp:ListItem Value="Italian"> Italian </asp:ListItem>
                                                <asp:ListItem Value="Vietnamese"> Vietnamese </asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Description</label>
                                            <asp:TextBox runat="server" class="form-control" ID="txtDescription" placeholder="Description" AutoCompleteType="Disabled"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Price</label>
                                            <asp:TextBox runat="server" TextMode="Number" class="form-control" ID="txtPrice" placeholder="Price" AutoCompleteType="Disabled"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Hours</label>
                                            <asp:TextBox runat="server" TextMode="Number" class="form-control" ID="txtHours" placeholder="Hours" AutoCompleteType="Disabled"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Detail Description</label>
                                            <asp:TextBox runat="server" TextMode="MultiLine" class="form-control" ID="txtDetailDescription" placeholder="Detail Description"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Updated</label>
                                            <div class="input-group date" id="reservationdate" data-target-input="nearest">
                                                <asp:TextBox runat="server" ID="txtUpdated" class="form-control datetimepicker-input" data-target="#reservationdate" AutoCompleteType="Disabled"></asp:TextBox>
                                                <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>What student'll learn</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
                                                        Action                  
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li class="dropdown-item">
                                                            <asp:LinkButton runat="server" ID="btnAddItem" Text="Add Item" OnClick="btnAddItem_Click"></asp:LinkButton></li>
                                                        <li class="dropdown-item">
                                                            <asp:LinkButton runat="server" ID="btnEditItem" Text="Edit Item" OnClick="btnEditItem_Click"></asp:LinkButton></li>
                                                        <li class="dropdown-item">
                                                            <asp:LinkButton runat="server" ID="brnRemoveItem" Text="Remove Item" OnClick="brnRemoveItem_Click"></asp:LinkButton></li>
                                                    </ul>
                                                </div>
                                                <asp:TextBox runat="server" class="form-control" ID="txtWhatllLearn" AutoCompleteType="Disabled"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:ListBox SelectionMode="Single" ID="lbWhatllLearn" runat="server" class="custom-select" OnSelectedIndexChanged="lbWhatllLearn_SelectedIndexChanged" AutoPostBack="true"></asp:ListBox>
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
                                    <asp:Image ID="imgCourse" Width="100%" Height="100%" runat="server"></asp:Image>
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
            var preview = document.querySelector('#<%=imgCourse.ClientID %>');
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
    <!-- Bootstrap 4 -->
    <script src="style/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

</asp:Content>
