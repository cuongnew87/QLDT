<%@ Page Title="" Language="C#" MasterPageFile="~/Index2.Master" AutoEventWireup="true" CodeBehind="MyLearning.aspx.cs" Inherits="QLDT.MyLearning" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <link type="text/css" href="myLearning/staticx/udemy/js/webpack/styles1.css" rel="stylesheet">
    <link type="text/css" href="myLearning/staticx/udemy/js/webpack/styles2.css" rel="stylesheet">
    <link type="text/css" href="myLearning/staticx/udemy/js/webpack/styles3.css" rel="stylesheet">
    <link type="text/css" href="myLearning/staticx/udemy/js/webpack/styles4.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="main-content">
        <div class="ud-app-loader ud-component--my-courses-v3--app course-cards-grid ud-app-loaded" data-module-id="my-courses-v3">
            <div class="app--my-courses-v3--DkSN3">
                <section class="jumbotron-header-bar--tabs bg-midnight-light-force jumbotron jumbotron-header-bar">
                    <div class="container">
                        <div class="jumbotron-header-bar__inner">
                            <div>
                                <h1>My learning</h1>
                            </div>
                        </div>
                    </div>
                </section>
                <ul class="my-courses__container">
                    <li class="container__main-section">
                        <div class="container">
                            <div class="card-wrapper">
                                <asp:Repeater ID="rptCourse" runat="server">
                                    <ItemTemplate>
                                        <div role="presentation" tabindex="-1" class="card card--learning" data-purpose="enrolled-course-card">
                                            <a href='SingleCourse.aspx?courseid=<%# Eval("course_id") %>' class="card--learning__image" tabindex="-1">
                                                <div class="card__image play-button-trigger">
                                                    <asp:Image runat="server" class="course-image" Width="240" Height="135" src='<%# Eval("course_image") %>'></asp:Image>
                                                    <div class="play-button"></div>
                                                </div>
                                            </a>
                                            <a href='SingleCourse.aspx?courseid=<%# Eval("course_id") %>' class="card--learning__details">
                                                <div class="card__details">
                                                    <strong class="details__name"><%# Eval("course_name") %></strong>
                                                    <div class="details__instructor"><%# Eval("teacher_name") %><span>, <%# Eval("job") %>, <%# Eval("note") %></span></div>
                                                </div>                                              
                                            </a>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
