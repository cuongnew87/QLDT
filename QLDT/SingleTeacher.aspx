<%@ Page Title="" Language="C#" MasterPageFile="~/Index2.Master" AutoEventWireup="true" CodeBehind="SingleTeacher.aspx.cs" Inherits="QLDT.SingleTeacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="main-content">
        <div class="ud-component--user-profile-udlite--instructor-profile">
            <div class="udlite-container instructor-profile--page-container--RmS-H" data-purpose="instructor-profile">
                <asp:Image runat="server" ID="imgTeacher" class="instructor-profile--instructor-image--2ZEV_ instructor-profile--right-column--3Nw2B" Width="200" Height="200" />
                <div class="instructor-profile--instructor-info--3bSTR instructor-profile--left-column--2PhRH">
                    <div class="udlite-heading-sm instructor-profile--instructor-heading--C4ld7">Instructor</div>
                    <h1 class="udlite-heading-xxxl">
                        <asp:Label runat="server" ID="lblTeacherName"></asp:Label>
                    </h1>
                    <h2 class="udlite-heading-md instructor-profile--instructor-title--2VTBB">
                        <asp:Label runat="server" ID="lblTeacherJob"></asp:Label>
                    </h2>
                    <div class="instructor-profile--instructor-stats--1kvWD">
                        <div class="instructor-profile--stat--136jc">
                            <div class="udlite-heading-sm instructor-profile--stats-title--3QUgF">Total students</div>
                            <div class="udlite-heading-xl">
                                <asp:Label runat="server" ID="lblNumStudents"></asp:Label>
                            </div>
                        </div>
                        <div class="instructor-profile--stat--136jc">
                            <div class="udlite-heading-sm instructor-profile--stats-title--3QUgF">Courses</div>
                            <div class="udlite-heading-xl">
                                <asp:Label runat="server" ID="lblNumCourses"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <h2 class="udlite-heading-lg instructor-profile--about-me--2txQp">About me</h2>
                    <div class="show-more--container--1QLmn">
                        <span id="u224-show-more--1" data-type="checkbox" data-checked="" style="display: none"></span>
                        <div style="max-height: 320px" class="show-more--content--isg5c show-more--with-gradient--2abmN">
                            <div>
                                <div data-purpose="instructor-description">
                                    <asp:Label runat="server" ID="lblNote"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="udlite-btn udlite-btn-medium udlite-btn-ghost udlite-heading-sm show-more--focusable-label--14fP5" data-css-toggle-id="u224-show-more--1">
                            <span>
                                <span class="show-more--show-more--3ve3e">Show more</span>
                                <span class="show-more--show-less--3eSCX">Show less</span>
                            </span>
                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall show-more--show-more--3ve3e">
                                <use xlink:href="#icon-expand"></use>
                            </svg>
                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall show-more--show-less--3eSCX">
                                <use xlink:href="#icon-collapse"></use>
                            </svg>
                        </button>
                    </div>
                </div>
                <div class="instructor-profile--left-column--2PhRH">
                    <div class="instructor-courses--instructor-courses-container--1anj0">
                        <h2 class="udlite-heading-lg instructor-courses--my-courses-heading--CgveN">My courses (<asp:Label runat="server" ID="lblNumMyCourse"></asp:Label>)</h2>
                        <div class="instructor-courses--instructor-courses--13ysz">
                            <asp:Repeater ID="rptCourse" runat="server">
                                <ItemTemplate>
                                    <div class="instructor-courses--course-card-container--KF75a">
                                        <a href="SingleCourse.aspx?courseid=<%# Eval("id") %>" class="udlite-custom-focus-visible browse-course-card--link--3KIkQ" style="display: block;">
                                            <div data-purpose="container" class="course-card--container--3w8Zm course-card--medium--iRtVR">
                                                <div class="course-card--image-wrapper--Sxd90">
                                                    <img alt="" width="240" height="135" class="course-card--course-image--2sjYP browse-course-card--image--35hYN" src="<%# Eval("course_image") %>">
                                                </div>
                                                <div class="course-card--main-content--3xEIw course-card--has-price-text--1Ikr0">
                                                    <div class="udlite-focus-visible-target udlite-heading-md course-card--course-title--2f7tE"><%# Eval("course_name") %></div>
                                                    <div class="udlite-text-xs course-card--row--1OMjg course-card--course-meta-info--1hHb3">
                                                        <span class="course-card--row--1OMjg"><%# Eval("hours") %> total hours</span>
                                                        <span class="course-card--row--1OMjg">63 lectures</span>
                                                    </div>
                                                    <div class="price-text--container--Ws-fP course-card--price-text-container--2sb8G" data-purpose="price-text-container">
                                                        <div class="price-text--price-part--Tu6MH course-card--discount-price--3TaBk udlite-heading-md" data-purpose="course-price-text">
                                                            <span class="udlite-sr-only">Current price</span>
                                                            <span>
                                                                <span><%#DataBinder.Eval(Container, "DataItem.price", "{0:c}")%></span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="udlite-badge udlite-heading-xs udlite-badge-bestseller ">Bestseller</div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
                <div class="instructor-profile--contact-info-buttons--3w0nB instructor-profile--right-column--3Nw2B">
                    <div class="instructor-profile--social-links--3Kub5">
                        <asp:Repeater ID="rptLink" runat="server">
                            <ItemTemplate>
                                <a href='<%# Eval("url") %>' data-purpose="personal-website-link" class="udlite-btn udlite-btn-large udlite-btn-secondary udlite-heading-md" target="_blank">
                                    <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-small">
                                        <use xlink:href="#icon-link"></use>
                                    </svg>
                                    <span><%# Eval("url_name") %></span>
                                </a>
                            </ItemTemplate>
                        </asp:Repeater>
<%--                        <a href="https://linkedin.com/in/avinashj1/" data-purpose="linkedin-link" class="udlite-btn udlite-btn-large udlite-btn-secondary udlite-heading-md">
                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-small">
                                <use xlink:href="#icon-linkedin"></use>
                            </svg>
                            <span>Linkedin</span>
                        </a>
                        <a href="https://www.youtube.com/c/thecodex" data-purpose="youtube-link" class="udlite-btn udlite-btn-large udlite-btn-secondary udlite-heading-md">
                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-small">
                                <use xlink:href="#icon-youtube"></use>
                            </svg>
                            <span>Youtube</span>
                        </a>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="singleTeacher/staticx/udemy/js/webpack/entry-udlite-baseline-manifest.e324ddaade08a17a045d.js" defer></script>
    <script type="text/javascript" src="singleTeacher/staticx/udemy/js/webpack/entry-udlite-baseline-legacy-vendor.36807ce6e437fb7f8e1f.js" defer></script>
    <script type="text/javascript" src="singleTeacher/staticx/udemy/js/webpack/jsi18n-en-us-discovery-udlite-baseline.ff8675625bee30090ba4.js" defer></script>
    <script type="text/javascript" src="singleTeacher/staticx/udemy/js/webpack/entry-udlite-baseline-legacy.6f8a3f1038ff99306df6.js" defer></script>
    <script>
        window.handleCSSToggleButtonClick = function (event) {
            var target = event.currentTarget;
            var cssToggleId = target && target.dataset && target.dataset.cssToggleId;
            var input = cssToggleId && document.getElementById(cssToggleId);
            if (input) {
                if (input.dataset.type === 'checkbox') {
                    input.dataset.checked = input.dataset.checked ? '' : 'checked';
                } else {
                    input.dataset.checked = input.dataset.allowToggle && input.dataset.checked ? '' : 'checked';
                    var radios = document.querySelectorAll('[name="' + input.dataset.name + '"]');
                    for (var i = 0; i < radios.length; i++) {
                        if (radios[i] !== input) {
                            radios[i].dataset.checked = '';
                        }
                    }
                }
            }
        };
        (function () {
            var cssToggleButtons = document.querySelectorAll('[data-css-toggle-id');
            for (var i = 0; i < cssToggleButtons.length; i++) {
                cssToggleButtons[i].addEventListener('click', window.handleCSSToggleButtonClick);
            }
        })();
    </script>
</asp:Content>
