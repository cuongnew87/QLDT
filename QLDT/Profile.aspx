<%@ Page Title="" Language="C#" MasterPageFile="~/Index2.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="QLDT.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <link type="text/css" rel="stylesheet" href="profile/staticx/udemy/style/styles1.css" />
    <link type="text/css" rel="stylesheet" href="profile/staticx/udemy/style/styles2.css" />
    <link type="text/css" rel="stylesheet" href="profile/staticx/udemy/style/styles3.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="main-content">
        <div class="container ud-app-loader ud-app-loaded" data-module-id="user-manage">
            <div id="edit-template">
                <div id="main-section">
                    <div class="side-nav db-sm" data-purpose="side-menu">
                        <div id="user-short">
                            <div class="fx-c">
                                <div class="user-avatar <%--user-avatar--initials--%> " data-purpose="user-avatar" style="width: 120px; height:120px; font-size: 36px;">
                                    <div class="user-avatar__inner fx-c">
                                        <asp:Image runat="server" ID="imgUser" ImageUrl="style/images/user_default.png"></asp:Image>
                                    </div>
                                </div>
                            </div>
                            <hgroup class="tooltip-container">
                                <h2>
                                    <asp:Label runat="server" ID="lblUserName" Text="User Name"></asp:Label></h2>
                            </hgroup>
                        </div>
                        <ul>
                            <li>
                                <asp:Label runat="server" ID="lblAddress"></asp:Label>
                            </li>
                            <li>
                                <asp:Label runat="server" ID="lblPhone"></asp:Label>
                            </li>
                            <li>
                                <asp:Label runat="server" ID="lblDob"></asp:Label>
                            </li>
                        </ul>
                    </div>
                    <div class="form-wrapper">
                        <div>
                            <div class="manage-fields-wrapper sectioned">
                                <div class="form-section" id="form-item-email">
                                    <h2 style="text-align: center">Account</h2>
                                    <h3>Edit your account settings and change your password here.</h3>
                                    <label>Email:</label>
                                    <div id="tooltip-reference-email" class="tooltip-reference">
                                        <div class="input-group w100p">
                                            <div class="form-control">
                                                Your email address is <b>
                                                    <asp:Label runat="server" ID="lblUserEmail" Text="user@gmail.com"></asp:Label></b>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="manage-fields-wrapper">
                                <div class="form-field-container labeled form-section" id="form-item-current_password">
                                    <div id="tooltip-reference-current_password" class="tooltip-reference pos-r ">
                                        <asp:TextBox runat="server" type="password" MaxLength="64" placeholder="Enter Current Password" class="textinput textInput form-control" ID="txtCurrentPassword"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-field-container labeled form-section labeled--sr-only" id="form-item-new_password">
                                    <div id="tooltip-reference-new_password" class="tooltip-reference pos-r ">
                                        <asp:TextBox runat="server" type="password" MaxLength="64" placeholder="Enter New Password" class="textinput textInput form-control" ID="txtNewPassword"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-field-container labeled form-section labeled--sr-only" id="form-item-confirm_new_password">
                                    <div id="tooltip-reference-confirm_new_password" class="tooltip-reference pos-r ">
                                        <asp:TextBox runat="server" type="password" MaxLength="64" placeholder="ReEnter New Password" class="textinput textInput form-control" ID="txtReNewPassword"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="submit-row">
                                    <asp:Button runat="server" Text="Change Password" class="btn btn-primary " ID="btnChangePass" OnClick="btnChangePass_Click"></asp:Button>
                                </div>
                            </div>

                            <div class="manage-fields-wrapper">
                                <div class="form-field-container labeled form-section">
                                    <h2>Public profile</h2>
                                    <h3>Add information about yourself</h3>
                                    <label class="control-label">Basic:</label>
                                    <div class="tooltip-reference pos-r ">
                                        <asp:TextBox runat="server" ID="txtUserName" MaxLength="64" placeholder="Full Name" class="textinput textInput form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-field-container labeled form-section labeled--sr-only">
                                    <div class="tooltip-reference pos-r ">
                                        <asp:TextBox runat="server" ID="txtAddress" MaxLength="64" placeholder="Address" class="textinput textInput form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-field-container labeled form-section labeled--sr-only">
                                    <div class="tooltip-reference pos-r ">
                                        <asp:TextBox runat="server" ID="txtPhone" TextMode="Number" MaxLength="64" placeholder="Phone" class="textinput textInput form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-field-container labeled form-section labeled--sr-only">
                                    <div class="tooltip-reference pos-r ">
                                        <asp:TextBox runat="server" ID="txtDob" type="date" placeholder="New Dob" data-date-format="MM dd yyyy" class="textinput textInput form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="submit-row">
                                    <asp:Button runat="server" ID="btnSaveChange" Text="Save Change" class="btn btn-primary" OnClick="btnSaveChange_Click"></asp:Button>
                                </div>
                            </div>

                            <div class="manage-fields-wrapper">
                                <div class="form-field-container  labeled form-section" id="form-item-image_file">
                                    <h2>Photo</h2>
                                    <h3>Add a nice photo of yourself for your profile.</h3>
                                    <label class="control-label " for="id_image_file">Image preview</label>
                                    <div id="tooltip-reference-image_file" class="tooltip-reference pos-r ">
                                        <div>
                                            <div class="ud-app-loader ud-component--versioned-image-upload-with-preview--app mt20 mb30 ud-app-loaded">
                                                <div class="">
                                                    <div class="image-upload-preview-with-crop--previewWrapper--1eYsy">
                                                        <div class="image-upload-preview-with-crop--imageWrapper--fNINE">
                                                            <asp:Image ID="imgPreview" Width="100%" Height="100%" runat="server"></asp:Image>
                                                        </div>
                                                        <div class="image-upload-preview-with-crop--tips--17Lj2">
                                                        </div>
                                                    </div>
                                                    <div class="image-upload-preview-with-crop--form-element--2Nnsf">
                                                        <div>
                                                            <label>Add / Change Image:</label>
                                                            <asp:FileUpload ID="FileUpload" onchange="previewFile()" runat="server"></asp:FileUpload>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="submit-row">
                                    <asp:Button runat="server" ID="btnSaveImage" Text="Save Image" OnClick="btnSaveImage_Click" class="btn btn-primary"></asp:Button>
                                </div>
                            </div>

                            <div class="manage-fields-wrapper">
                                <div class="form-field-container  labeled form-section">
                                    <h2>Close Account</h2>
                                    <h3>Close your account permanently.</h3>
                                    <label>Close Your Account</label>
                                    <div id="remove-account">
                                        <p>
                                            <b class="text-danger-dark">Warning:</b>
                                            If you close your account, you will be unsubscribed from your 1 course, and will lose access forever.
                                        </p>
                                        <div class="mt15 ud-component--user-manage--close-account-button">
                                            <asp:Button runat="server" ID="btnDeleteAccount" class="btn btn-danger" Text="Close Account" OnClick="btnDeleteAccount_Click" OnClientClick="return confirm('Are you sure you want to delete account?');"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function previewFile() {
            var preview = document.querySelector('#<%=imgPreview.ClientID %>');
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
