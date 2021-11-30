<%@ Page Title="" Language="C#" MasterPageFile="~/Index2.Master" AutoEventWireup="true" CodeBehind="SingleCategory.aspx.cs" Inherits="QLDT.SingleCategory" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
    <link type="text/css" rel="stylesheet" href="singleCategory/staticx/udemy/js/webpack/entry-udlite-baseline-legacy.bba72b9d74950320c99c.css" />
    <link type="text/css" rel="stylesheet" href="singleCategory/staticx/udemy/js/webpack/udlite-common-css.af1fa594c2f88f5709d6.css" />
    <script type="text/javascript" src="singleCategory/staticx/udemy/js/webpack/udlite-common-css.1f2de2f61c0fd6c106cb.js" defer="">
    </script>
    <link type="text/css" rel="stylesheet" href="singleCategory/staticx/udemy/js/webpack/common-udlite-desktop-server-side.05aed638c2239ddb4537.css" />
    <script type="text/javascript" src="singleCategory/staticx/udemy/js/webpack/common-udlite-desktop-server-side.9822cb35af36c848ada7.js" defer="">
    </script>
    <link type="text/css" rel="stylesheet" href="singleCategory/staticx/udemy/js/webpack/topic-udlite-server-side.907b4a1873ce3b9c9ece.css" />
    <script type="text/javascript" src="singleCategory/staticx/udemy/js/webpack/topic-udlite-server-side.36594039c1d8f6e3cde9.js" defer="">
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="main-content">
        <div class="ud-component--topic--topic">
            <div class="udlite-container udlite-page-wrapper">
                <div class="component-margin">
                    <div class="alternate-headline--title--1sUQT">
                        <h1 class="udlite-heading-xxl" data-purpose="alternate-headline-title">
                            <asp:Label runat="server" ID="lblCourseName"></asp:Label>
                            Courses</h1>
                    </div>
                </div>
                <p class="component-margin topic-enrollment-stats--container--23owL">
                    <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-medium udlite-icon-color-neutral">
                        <use xlink:href="#icon-people">
                        </use>
                    </svg>
                    <span class="udlite-text-sm topic-enrollment-stats--text--TIZ5q" data-purpose="safely-set-inner-html:topic-enrollment-stats:num-students-learning">
                        <asp:Label runat="server" ID="lblNumLearners"></asp:Label>
                        learners</span>
                </p>
                <div class="component-margin" data-item-index="-3">
                    <div class="topic--secondary-heading--25J3W">
                        <div class="alternate-headline--title--1sUQT">
                            <h2 class="udlite-heading-xl" data-purpose="alternate-headline-title">All
                                <asp:Label runat="server" ID="lblCourseName2"></asp:Label>
                                courses</h2>
                        </div>
                        <p class="udlite-text-md alternate-headline--secondary-text--yJqPe">
                            <asp:Label runat="server" ID="lblCategoryDescription"></asp:Label>
                        </p>
                    </div>
                    <div class="topic--refund-notice--3I0nl">
                        <div class="refund-notice--refund-notice--1nq4D alert-banner--alert-banner--3j6wd alert-banner--alert-banner-information--1fccT">
                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-large udlite-icon-color-info">
                                <use xlink:href="#icon-info">
                                </use>
                            </svg>
                            <div style="flex: 1 1 0%;">
                                <div class="alert-banner--text-frame--9MaKJ alert-banner--text-frame-with-icon--2wK1l">
                                    <span class="udlite-sr-only">information alert</span>
                                    <h2 class="udlite-heading-md">Not sure? All courses have a 30-day money-back guarantee</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="course-directory--container--5ZPhr">
                        <div data-purpose="mobile-filter-container" class="filter-container--container--3A8k6">
                            <div class="filter-drawer--container--1CvSl">
                                <div class="filter-button-container--button-bar--DU5FK">
                                    <div class="udlite-form-group">
                                        <label class="udlite-sr-only udlite-form-label udlite-heading-sm" for="u35-form-group--374">Sort courses</label>
                                        <div class="udlite-select-container udlite-select-container-large">
                                            <asp:DropDownList runat="server" ID="ddlSort" class="udlite-select udlite-text-md" AutoPostBack="true" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">
                                                <asp:ListItem> Sort</asp:ListItem>
                                                <asp:ListItem Value="Name"> Name</asp:ListItem>
                                                <asp:ListItem Value="Price"> Price </asp:ListItem>
                                                <asp:ListItem Value="Newest"> Newest </asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="udlite-select-icon-container udlite-select-icon-right">
                                                <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-small udlite-icon-color-neutral">
                                                    <use xlink:href="#icon-expand">
                                                    </use>
                                                </svg>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="course-list--container--3zXPS">
                                <asp:Repeater ID="rptCourseList" OnItemDataBound="rptCourseList_ItemDataBound" runat="server">
                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" ID="hdfCourseListId" Value='<%# Eval("id") %>'></asp:HiddenField>
                                        <div class="popper--popper--19faV popper--popper-hover--4YJ5J">
                                            <a id="u35-popper-trigger--375" tabindex="0" aria-expanded="false" href='SingleCourse.aspx?courseid=<%# Eval("id") %>' class="udlite-custom-focus-visible browse-course-card--link--3KIkQ" style="display: block;">
                                                <div data-purpose="container" class="course-card--container--3w8Zm course-card--large--1BVxY">
                                                    <div class="course-card--image-wrapper--Sxd90">
                                                        <img alt="" width="260" height="145" class="course-card--course-image--2sjYP browse-course-card--image--35hYN" src='<%# Eval("course_image") %>'>
                                                    </div>
                                                    <div class="course-card--main-content--3xEIw course-card--has-price-text--1Ikr0">
                                                        <div class="udlite-focus-visible-target udlite-heading-md course-card--course-title--2f7tE"><%# Eval("course_name") %></div>
                                                        <p class="udlite-text-sm course-card--course-headline--yIrRk" data-purpose="safely-set-inner-html:course-card:course-headline"><%# Eval("description") %></p>
                                                        <div class="udlite-text-xs course-card--instructor-list--lIA4f" data-purpose="safely-set-inner-html:course-card:visible-instructors"><%# Eval("teacher_name") %></div>
                                                        <div class="udlite-text-xs course-card--row--1OMjg course-card--course-meta-info--1hHb3">
                                                            <span class="course-card--row--1OMjg"><%# Eval("hours") %> total hours</span>
                                                            <span class="course-card--row--1OMjg">
                                                                <asp:Label runat="server" ID="lblCourseListNumArticle"></asp:Label>
                                                                lectures</span>
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
                        <div class="pagination--container--2wc6Z">
                            <asp:LinkButton ID="lnkBtnPrev" runat="server" OnClick="lnkBtnPrev_Click" aria-disabled="false" class="udlite-btn udlite-btn-medium udlite-btn-secondary udlite-btn-round udlite-heading-sm udlite-btn-icon udlite-btn-icon-medium udlite-btn-icon-round pagination--prev--1hkLF">
                                <svg aria-label="previous page" focusable="false" class="udlite-icon udlite-icon-small">
                                    <use xlink:href="#icon-previous">
                                    </use>
                                </svg>
                            </asp:LinkButton>

                            <asp:Label ID="txtHiddens" Style="width: 28px" Text="0" runat="server"></asp:Label>
                            <asp:Label ID="txtMax" Style="width: 28px" Text="0" runat="server"></asp:Label>

                            <asp:LinkButton ID="lnkBtnNext" runat="server" OnClick="lnkBtnNext_Click" aria-disabled="false" class="udlite-btn udlite-btn-medium udlite-btn-secondary udlite-btn-round udlite-heading-sm udlite-btn-icon udlite-btn-icon-medium udlite-btn-icon-round pagination--next--5NrLo">
                                <svg aria-label="next page" focusable="false" class="udlite-icon udlite-icon-small">
                                    <use xlink:href="#icon-next">
                                    </use>
                                </svg>
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="discovery-unit-empty-render">
                </div>
                <div class="topic--learn-more-section-container--1D6vG">
                    <div class="topic--learn-more-section--2yFPv learn-more-section--container--4OyoU">
                        <div>
                            <h2 class="udlite-heading-xxl learn-more-section--title--3u9Ly" data-purpose="title">Learn more about
                                <asp:Label runat="server" ID="lblCourseName3"></asp:Label></h2>
                            <p class="udlite-text-md learn-more-section--primary-description--2aVSW" data-purpose="primary-description">
                                <asp:Label runat="server" ID="lblCategoryDefine"></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="singleCategory/staticx/udemy/js/webpack/entry-udlite-baseline-manifest.3bb79dcfb8be4a207055.js" defer>
    </script>
    <script type="text/javascript" src="singleCategory/staticx/udemy/js/webpack/entry-udlite-baseline-legacy-vendor.36807ce6e437fb7f8e1f.js" defer>
    </script>
    <script type="text/javascript" src="singleCategory/staticx/udemy/js/webpack/jsi18n-en-us-discovery-udlite-baseline.ff8675625bee30090ba4.js" defer>
    </script>
    <script type="text/javascript" src="singleCategory/staticx/udemy/js/webpack/entry-udlite-baseline-legacy.6f8a3f1038ff99306df6.js" defer>
    </script>
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
