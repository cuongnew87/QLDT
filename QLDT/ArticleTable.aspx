<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashboard.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="ArticleTable.aspx.cs" Inherits="QLDT.Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contents" runat="server">
    <div>
        <style>

        </style>
    </div>
    <div>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript">  
            function StateCity(input) {
                var displayIcon = "img" + input;
                if ($("#" + displayIcon).attr("alt") == "Show") {
                    $("#" + displayIcon).closest("tr")
                        .after("<tr><td></td><td colspan = '100%'>" + $("#" + input)
                            .html() + "</td></tr>");
                    $("#" + displayIcon).attr("alt", "Hide");
                } else {
                    $("#" + displayIcon).closest("tr").next().remove();
                    $("#" + displayIcon).attr("alt", "Show");
                }
            }

        </script>
    </div>
    <div class="wrapper">
        <div class="content-wrapper">
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Aricle Table</h3>
                                </div>
                                <div class="card-body p-0">

                                    <div>
                                        <asp:GridView ID="GridState" runat="server" AutoGenerateColumns="false" DataKeyNames="id"
                                            CssClass="Grid table table-head-fixed table-hover text-nowrap" OnRowDataBound="GridState_RowDataBound" AllowPaging="true" PageSize="10" OnPageIndexChanging="GridState_PageIndexChanging">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <a href="JavaScript:StateCity('div<%# Eval("id") %>');">
                                                            <img alt="Show" id="imgdiv<%# Eval("id") %>" width="50" height="50" src="style/images/open.png" />
                                                        </a>
                                                        <div id="div<%# Eval("id") %>" style="display: none;">
                                                            <asp:GridView ID="GridCity" runat="server" AutoGenerateColumns="false" DataKeyNames="id"
                                                                CssClass="ChildGrid table table-head-fixed table-hover text-nowrap">
                                                                <Columns>
                                                                    <asp:BoundField DataField="document_name" HeaderText="Document Name" />
                                                                    <asp:BoundField DataField="link" HeaderText="Link" />
                                                                    <asp:BoundField DataField="document_description" HeaderText="Description" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:HyperLinkField DataNavigateUrlFields="course_id" HeaderText="Course Name" DataNavigateUrlFormatString="EditCourse.aspx?courseid={0}" DataTextField="course_name" />
                                                <asp:HyperLinkField DataNavigateUrlFields="course_id" HeaderText="Article Name" DataNavigateUrlFormatString="EditArticle.aspx?courseid={0}" DataTextField="article_name" />
                                                <asp:BoundField DataField="description" HeaderText="Description" />

                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
