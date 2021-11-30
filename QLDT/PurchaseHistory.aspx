<%@ Page Title="" Language="C#" MasterPageFile="~/Index2.Master" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="QLDT.PurchaseHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <link type="text/css" href="myLearning/staticx/udemy/js/webpack/styles1.css" rel="stylesheet">
    <link type="text/css" href="myLearning/staticx/udemy/js/webpack/styles2.css" rel="stylesheet">
    <link type="text/css" href="myLearning/staticx/udemy/js/webpack/styles3.css" rel="stylesheet">
    <link type="text/css" href="myLearning/staticx/udemy/js/webpack/styles4.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="ud-app-loader ud-component--my-courses-v3--app course-cards-grid ud-app-loaded" data-module-id="my-courses-v3">
        <div class="app--my-courses-v3--DkSN3">
            <section class="jumbotron-header-bar--tabs bg-midnight-light-force jumbotron jumbotron-header-bar">
                <div class="container">
                    <div class="jumbotron-header-bar__inner">
                        <div>
                            <h1>Purchase History</h1>
                        </div>
                    </div>
                </div>
            </section>
            <ul class="my-courses__container">
                <li class="container__main-section">
                    <div class="container">
                        <div class="card-wrapper">
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
                    </div>
                </li>
            </ul>
        </div>
        <div style="padding-bottom:20px"></div>
    </div>
</asp:Content>
