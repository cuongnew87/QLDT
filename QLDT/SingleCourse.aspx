<%@ Page Title="" Language="C#" MasterPageFile="~/Index2.Master" AutoEventWireup="true" CodeBehind="SingleCourse.aspx.cs" Inherits="QLDT.WebForm2" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
    <meta name="title" content="This is the Title" />
    <meta name="description" content="This is a short summary of the page." />
    <link rel="image_src" href="E:\Downloads\Balance_UNLIMITED.jpg" />

    <link type="text/css" rel="stylesheet" href="singleCourse/staticx/udemy/js/webpack/entry-udlite-baseline-legacy.bba72b9d74950320c99c.css" />
    <link type="text/css" rel="stylesheet" href="singleCourse/staticx/udemy/js/webpack/udlite-common-css.af1fa594c2f88f5709d6.css" />
    <script type="text/javascript" src="singleCourse/staticx/udemy/js/webpack/udlite-common-css.1f2de2f61c0fd6c106cb.js" defer=""></script>
    <link type="text/css" rel="stylesheet" href="singleCourse/staticx/udemy/js/webpack/common-udlite-desktop-server-side.05aed638c2239ddb4537.css" />
    <script type="text/javascript" src="singleCourse/staticx/udemy/js/webpack/common-udlite-desktop-server-side.9822cb35af36c848ada7.js" defer=""></script>
    <link type="text/css" rel="stylesheet" href="singleCourse/staticx/udemy/js/webpack/course-landing-page-udlite-server-side.547f22fd5b246e7da80c.css" />
    <script type="text/javascript" src="singleCourse/staticx/udemy/js/webpack/course-landing-page-udlite-server-side.9cf48beb03a3ae68243d.js" defer=""></script>
    <link type="text/css" rel="stylesheet" href="singleCourse/staticx/udemy/js/webpack/course-landing-page-udlite-udlite-app.6ca52f12cd377fdc8bfe.css" />

    <link rel="prefetch" as="style" href="singleCourse/staticx/udemy/js/webpack/course-landing-page-udlite-lazy.4cfda7aebdefb4b0f345.css">
    <link rel="prefetch" as="script" href="singleCourse/staticx/udemy/js/webpack/course-landing-page-udlite-lazy.070307b623c0add9cd42.js">
    <script async src='singleCourse/cdn-cgi/bm/cv/669835187/api.js'></script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="paid-course-landing-page__container">
        <div class="sidebar-container-position-manager">
            <div class="clp-component-render">
                <div class="clp-component-render">
                    <div class="ud-component--course-landing-page-udlite--sidebar-container">
                        <div data-purpose="sidebar-container" class="course-landing-page_sidebar-container ">
                            <div class="sidebar-container--content--gsvyJ">
                                <div class="sidebar-container--content-group--1upV8">
                                    <div class="sidebar-container--introduction-asset--5ckuC">
                                        <div class="intro-asset--wrapper--zDTjg">
                                            <div class="intro-asset--asset--1eSsi" data-purpose="introduction-asset">
                                                <button type="button" class="udlite-btn udlite-btn-large udlite-btn-ghost udlite-heading-md udlite-custom-focus-visible intro-asset--placeholder--16yPA" aria-label="Play course preview">
                                                    <span class="intro-asset--img-aspect--1UbeZ">
                                                        <asp:Image runat="server" ID="imgCourse" Width="100%" Height="100%" />
                                                    </span>
                                                    <span class="intro-asset--overlay--3Z3co intro-asset--gradient--Od7zs"></span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="sidebar-container--purchase-section--17KRp">
                                        <div class="generic-purchase-section--main-cta-container--3xxeM" data-purpose="purchase-section">
                                            <div class="generic-purchase-section--buy-box-main--siIXV">
                                                <div class="buy-box--buy-box--3d_i8" data-purpose="buy-box">
                                                    <div class="buy-box--buy-box-item--1Qbkl">
                                                        <div>
                                                            <div class="price-text--container--Ws-fP udlite-clp-price-text" data-purpose="price-text-container">
                                                                <div class="price-text--price-part--Tu6MH udlite-clp-discount-price udlite-heading-xxl" data-purpose="course-price-text">
                                                                    <span class="udlite-sr-only">Current price</span>
                                                                    <span><span>
                                                                        <asp:Label runat="server" ID="lblPrice" Text="$12.99"></asp:Label></span></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="buy-box--buy-box-item--1Qbkl buy-box--add-to-cart-button--u5kCJ">
                                                        <div data-purpose="add-to-cart">
                                                            <asp:Button runat="server" ID="btnAddtoCart" Text="Add to cart" class="udlite-btn udlite-btn-large udlite-btn-brand udlite-heading-md add-to-cart" Style="width: 100%" OnClick="btnAddtoCart_Click"></asp:Button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="generic-purchase-section--cta--2yuje">
                                                <h2 class="udlite-heading-md incentives--header--3O_-f" data-purpose="header">This course includes:</h2>
                                                <ul class="unstyled-list udlite-block-list">
                                                    <li>
                                                        <div class="udlite-block-list-item udlite-block-list-item-small udlite-block-list-item-tight udlite-block-list-item-neutral udlite-text-sm">
                                                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall udlite-icon-color-neutral udlite-block-list-item-icon">
                                                                <use xlink:href="#icon-video"></use>
                                                            </svg>
                                                            <div class="udlite-block-list-item-content">
                                                                <span data-purpose="video-content-length">22 hours on-demand video</span>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="udlite-block-list-item udlite-block-list-item-small udlite-block-list-item-tight udlite-block-list-item-neutral udlite-text-sm">
                                                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall udlite-icon-color-neutral udlite-block-list-item-icon">
                                                                <use xlink:href="#icon-article"></use>
                                                            </svg>
                                                            <div class="udlite-block-list-item-content">
                                                                <span data-purpose="num-articles">
                                                                    <asp:Label runat="server" ID="lblNumArticle"></asp:Label>
                                                                    articles</span>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="udlite-block-list-item udlite-block-list-item-small udlite-block-list-item-tight udlite-block-list-item-neutral udlite-text-sm">
                                                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall udlite-icon-color-neutral udlite-block-list-item-icon">
                                                                <use xlink:href="#icon-lifetime"></use></svg>
                                                            <div class="udlite-block-list-item-content">
                                                                <span data-purpose="has-lifetime-access">Full lifetime access</span>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="udlite-block-list-item udlite-block-list-item-small udlite-block-list-item-tight udlite-block-list-item-neutral udlite-text-sm">
                                                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall udlite-icon-color-neutral udlite-block-list-item-icon">
                                                                <use xlink:href="#icon-mobile"></use></svg>
                                                            <div class="udlite-block-list-item-content">
                                                                <span data-purpose="devices-access-incentive">Access on mobile and TV</span>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="udlite-block-list-item udlite-block-list-item-small udlite-block-list-item-tight udlite-block-list-item-neutral udlite-text-sm">
                                                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall udlite-icon-color-neutral udlite-block-list-item-icon">
                                                                <use xlink:href="#icon-certificate"></use></svg>
                                                            <div class="udlite-block-list-item-content">
                                                                <span data-purpose="incentive-certificate">Certificate of completion</span>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-purpose="slider-menu-container" class="course-landing-page_slider-menu-container "></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="top-container dark-background">
            <div class="dark-background-inner-position-container">
                <div class="">
                    <div class="course-landing-page__main-content course-landing-page__topic-menu dark-background-inner-text-container">
                        <div class="clp-component-render">
                            <div class="topic-menu udlite-breadcrumb">
                                <asp:HyperLink runat="server" ID="hplCategoryName" class="udlite-heading-sm"></asp:HyperLink>
                            </div>
                        </div>
                    </div>
                    <div class="course-landing-page__main-content dark-background-inner-text-container">
                        <div class="clp-component-render">
                            <div class="udlite-text-sm clp-lead">
                                <div class="clp-component-render">
                                    <h1 class="udlite-heading-xl clp-lead__title clp-lead__title--small" data-purpose="lead-title">
                                        <asp:Label runat="server" ID="lblCourseName"></asp:Label>
                                    </h1>
                                    <div class="udlite-text-md clp-lead__headline" data-purpose="lead-headline">
                                        <asp:Label runat="server" ID="lblCourseDescription" Text="Learn Python like a Professional Start from the basics and go all the way to creating your own applications and games"></asp:Label>
                                    </div>
                                </div>
                                <div class="clp-lead__badge-ratings-enrollment">
                                    <div class="clp-lead__element-item">
                                        <div class="clp-component-render">
                                            <span class="udlite-badge udlite-badge-bestseller udlite-heading-xs" data-purpose="badge">Bestseller
                                            </span>
                                        </div>
                                    </div>
                                    <div class="clp-lead__element-item clp-lead__element-item--row">
                                        <div class="clp-component-render">
                                            <div data-purpose="enrollment" class="">
                                                <asp:Label runat="server" ID="lblNumStudents"></asp:Label>
                                                students
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clp-lead__element-item">
                                    <div class="clp-component-render">
                                        <div class="clp-component-render">
                                            <div class="ud-component--course-landing-page-udlite--instructor-links">
                                                <div class="instructor-links--instructor-links--3d8_F" data-purpose="instructor-name-top">
                                                    <span class="instructor-links--names--7UPZj">
                                                        <span class="udlite-text-sm">Created by</span>
                                                        <asp:HyperLink ID="hplTeacherName" runat="server" class="udlite-btn udlite-btn-large udlite-btn-link udlite-heading-md udlite-text-sm udlite-instructor-links" data-position="1" href="#instructor-1"></asp:HyperLink>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clp-lead__element-meta">
                                    <div class="clp-lead__element-item">
                                        <div class="clp-component-render">
                                            <div class="last-update-date" data-purpose="last-update-date">
                                                <span class="last-update-date__icon">
                                                    <svg aria-hidden="true" class="udlite-icon udlite-icon-xsmall udlite-icon-color-neutral ">
                                                        <use xlink:href="#icon-new"></use>
                                                    </svg>
                                                </span>
                                                <span>Last updated
                                                    <asp:Label runat="server" ID="lblUpdated"></asp:Label></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clp-lead__element-item clp-lead__locale" data-purpose="lead-course-locale">
                                        <span class="icon">
                                            <svg aria-hidden="true" class="udlite-icon udlite-icon-xsmall udlite-icon-color-neutral ">
                                                <use xlink:href="#icon-language"></use>
                                            </svg>
                                        </span>
                                        <asp:Label runat="server" ID="lblLanguage"></asp:Label>
                                    </div>
                                    <div class="clp-lead__element-item  clp-lead__caption">
                                        <div class="clp-component-render">
                                            <div class="ud-component--course-landing-page-udlite--caption">
                                                <div class="udlite-text-sm caption--captions--1LuDm" data-purpose="caption">
                                                    <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall udlite-icon-color-neutral caption--caption-icon--1OBWu">
                                                        <use xlink:href="#icon-captions"></use></svg>
                                                    <span>English [Auto]</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clp-lead__element-row">
                                    <div class="clp-lead__element-item">
                                        <div class="ud-component--course-landing-page-udlite--course-context-menu-clp"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="lead-share-cta">
                                <div class="clp-component-render">
                                    <div class="share-and-gift">
                                        <div class="clp-component-render">
                                            <div class="ud-component--course-landing-page-udlite--wishlist" data-skip-hydration="true">
                                                <div>
                                                    <asp:LinkButton runat="server" ID="btnAddWishlist" OnClick="btnAddWishlist_Click" data-purpose="toggle-wishlist" class="udlite-btn udlite-btn-medium udlite-btn-secondary udlite-heading-sm" Style="width: 100%;">
                                                        <span runat="server" id="spanWishlist">Wishlist</span>
                                                        <svg runat="server" id="svgWishlist" aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-small" style="fill: transparent; padding: 1px; stroke: currentcolor; stroke-width: 2;">
                                                            <use xlink:href="#icon-wishlisted"></use>
                                                        </svg>
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clp-component-render">
                                            <div class="ud-component--course-landing-page-udlite--social-share-button" data-skip-hydration="true">
                                                <button type="button" onclick="openForm()" data-purpose="social-share-button" class="udlite-btn udlite-btn-medium udlite-btn-secondary udlite-heading-sm" style="width: 100%;">
                                                    <span>Share</span>
                                                    <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall">
                                                        <use xlink:href="#icon-share"></use></svg>
                                                </button>
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
        <div class="bottom-container">
            <div class="clp-component-render">
                <div class="ud-component--course-landing-page-udlite--floating-buttons"></div>
            </div>
            <div class="course-landing-page__main-content component-margin">
                <div class="clp-component-render">
                    <span id="objective" class="in-page-offset-anchor"></span>
                    <div class="clp-component-render">
                        <div class="ud-component--course-landing-page-udlite--whatwillyoulearn">
                            <div class="what-you-will-learn--what-will-you-learn--mnJ5T">
                                <h2 class="udlite-heading-xl what-you-will-learn--title--hropy">What you&#x27;ll learn</h2>
                                <div class="what-you-will-learn--content-spacing--3btHJ">
                                    <ul class="unstyled-list udlite-block-list what-you-will-learn--objectives-list--2cWZN">
                                        <asp:Repeater ID="rptWhatllLearn" runat="server">
                                            <ItemTemplate>
                                                <li>
                                                    <div data-purpose="objective" class="udlite-block-list-item udlite-block-list-item-small udlite-block-list-item-tight udlite-block-list-item-neutral udlite-text-sm">
                                                        <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall udlite-icon-color-neutral udlite-block-list-item-icon">
                                                            <use xlink:href="#icon-tick"></use>
                                                        </svg>
                                                        <div class="udlite-block-list-item-content">
                                                            <span class="what-you-will-learn--objective-item--ECarc"><%# Eval("learn_description") %></span>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="course-landing-page__main-content component-margin" data-purpose="curriculum-development">
                <div class="clp-component-render">
                    <div class="clp-component-render">
                        <div class="ud-component--course-landing-page-udlite--curriculum">
                            <div data-purpose="course-curriculum">
                                <h2 class="udlite-heading-xl curriculum--header--1d_Nv" data-purpose="curriculum-header">Course content</h2>
                                <div class="curriculum--sub-header--23ncD">
                                    <div class="udlite-text-sm" data-purpose="curriculum-stats">
                                        <span class="curriculum--content-length--1XzLS">
                                            <asp:Label runat="server" ID="lblNumArticle2"></asp:Label>
                                            sections
                                            •
                                            <asp:Label runat="server" ID="lblNumDocument2" Text="155"></asp:Label>
                                            lectures
                                            • <span><span>
                                                <asp:Label runat="server" ID="lblNumHour2" Text="22"></asp:Label>h</span> total length</span></span>
                                    </div>
                                </div>
                                <div>
                                    <asp:Repeater ID="rptArticle" OnItemDataBound="rptArticle_ItemDataBound" runat="server" OnItemCommand="rptArticle_ItemCommand">
                                        <ItemTemplate>
                                            <div class="section--panel--1tqxC section--first-panel--2fbBU panel--panel--3NYBX">
                                                <div class="udlite-btn udlite-btn-large udlite-btn-link udlite-heading-md udlite-accordion-panel-toggler panel--panel-toggler--39q84 panel--outer-panel-toggler--2Xmux" data-css-toggle-id="u482-accordion-panel--6">
                                                    <h3 class="udlite-accordion-panel-heading">
                                                        <button type="button" aria-expanded="false" class="udlite-btn udlite-btn-large udlite-btn-link udlite-heading-md js-panel-toggler panel--panel-toggler--39q84" id="u482-accordion-panel-title--7">
                                                            <span class="udlite-accordion-panel-title">
                                                                <span class="section--section-title--8blTh"><%# Eval("article_name") %></span>
                                                                <asp:HiddenField ID="hdfArticle" runat="server" Value='<%# Eval("id") %>' />
                                                                <span class="udlite-text-sm section--hidden-on-mobile--171Q9 section--section-content--9kwnY" data-purpose="section-content">
                                                                    <asp:Label runat="server" ID="lblCourseContentNumDocument"></asp:Label>
                                                                    lectures
                                                                </span>
                                                            </span>
                                                        </button>
                                                    </h3>
                                                    <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-small udlite-icon-color-neutral panel--expand-icon--cRV8x">
                                                        <use xlink:href="#icon-expand">
                                                        </use>
                                                    </svg>
                                                </div>
                                                <div aria-labelledby="u482-accordion-panel-title--7" aria-hidden="true" role="region">
                                                    <div class="udlite-accordion-panel-content panel--content--18-7N">
                                                        <ul class="unstyled-list udlite-block-list">
                                                            <asp:Repeater ID="rptDocument" runat="server" OnItemCommand="rptDocument_ItemCommand">
                                                                <ItemTemplate>
                                                                    <li>
                                                                        <div class="udlite-block-list-item udlite-block-list-item-small udlite-block-list-item-neutral udlite-text-sm">
                                                                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall udlite-icon-color-neutral udlite-block-list-item-icon">
                                                                                <use xlink:href="#icon-play">
                                                                                </use>
                                                                            </svg>
                                                                            <div class="udlite-block-list-item-content">
                                                                                <div>
                                                                                    <div class="section--row--3PNBT">
                                                                                        <span class="section--item-title--2k1DQ">
                                                                                            <asp:LinkButton runat="server" CommandName="Click" ID="txtCourseListDocumentName" NavigateUrl='<%# Eval("link") %>' Text='<%# Eval("document_name") %>'></asp:LinkButton></span>
                                                                                        <asp:HiddenField ID="hdfDocLink" runat="server" Value='<%# Eval("link") %>' />
                                                                                    </div>
                                                                                </div>
                                                                                <span class="section--hidden-on-mobile--171Q9" style="flex: 1"></span>
                                                                                <span class="section--hidden-on-mobile--171Q9 section--item-content-summary--126oS"><%# Eval("document_description") %></span>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="course-landing-page__main-content component-margin">
                </div>
                <div class="clp-component-render">
                    <div class="clp-component-render">
                        <div class="ud-component--course-landing-page-udlite--incentives-under-curriculum">
                        </div>
                    </div>
                </div>
                <div class="clp-component-render">
                    <div class="clp-component-render">
                        <div class="ud-component--course-landing-page-udlite--top-companies-trust-udemy">
                        </div>
                    </div>
                </div>
                <div class="course-landing-page__main-content component-margin" data-purpose="curriculum-practice-test">
                </div>
                <div class="course-landing-page__main-content component-margin">
                    <div class="clp-component-render">
                        <div class="clp-component-render">
                            <div class="ud-component--course-landing-page-udlite--description">
                                <div class="udlite-text-sm  styles--description--3y4KY" data-purpose="course-description">
                                    <h2 class="udlite-heading-xl styles--description__header--3SNsO">Description</h2>
                                    <div class="show-more--container--1QLmn">
                                        <span id="u215-show-more--1" data-type="checkbox" data-checked="" style="display: none"></span>
                                        <div style="max-height: 221px" class="show-more--content--isg5c show-more--with-gradient--2abmN">
                                            <div>
                                                <div data-purpose="safely-set-inner-html:description:description">
                                                    <asp:Label runat="server" ID="lblDetailDescription"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="button" class="udlite-btn udlite-btn-medium udlite-btn-ghost udlite-heading-sm show-more--focusable-label--14fP5" data-css-toggle-id="u215-show-more--1">
                                            <span>
                                                <span class="show-more--show-more--3ve3e">Show more</span>
                                                <span class="show-more--show-less--3eSCX">Show less</span></span>
                                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall show-more--show-more--3ve3e">
                                                <use xlink:href="#icon-expand"></use></svg>
                                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall show-more--show-less--3eSCX">
                                                <use xlink:href="#icon-collapse"></use></svg></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="course-landing-page__main-content component-margin">
                    <div class="clp-component-render">
                        <div class="clp-component-render">
                            <div class="ud-component--course-landing-page-udlite--recommendations" data-skip-hydration="true">
                                <h2 class="udlite-heading-xl" data-purpose="title">Students also bought</h2>
                                <div class="course-comparison--show-more--3YS6t show-more--container--1QLmn">
                                    <span id="u621-show-more--50" data-type="checkbox" data-checked="" style="display: none;"></span>
                                    <div class="show-more--content--isg5c" style="max-height: 610px;">
                                        <asp:Repeater ID="rptCourseList" OnItemDataBound="rptCourseList_ItemDataBound" runat="server">
                                            <ItemTemplate>
                                                <div>
                                                    <div class="course-comparison--content-container--NuO96" data-purpose="show-more-content-container">
                                                        <div>
                                                            <div class="course-comparison--course-container--3h-HG" data-purpose="course-container">
                                                                <div class="course-comparison--main-content--B9SeZ">
                                                                    <asp:HyperLink runat="server" ID="hplCourseListName" NavigateUrl='SingleCourse.aspx?courseid=<%# Eval("id") %>' Text='<%# Eval("course_name") %>' class="udlite-heading-md course-comparison--course-title--V0Uad"></asp:HyperLink>
                                                                    <asp:HiddenField runat="server" ID="hdfCourseListId" Value='<%# Eval("id") %>'></asp:HiddenField>
                                                                    <div class="course-comparison--course-info--3uSaS">
                                                                        <div class="udlite-badge udlite-heading-xs udlite-badge-bestseller course-comparison--badge--GqbFA">Bestseller</div>
                                                                        <div class="udlite-text-sm course-comparison--meta-items--WV51Z">
                                                                            <span class="course-comparison--content-info--2vhHR"><%# Eval("hours") %> total hours</span>
                                                                            <span>Updated <%#DataBinder.Eval(Container, "DataItem.date_update", "{0:d}")%></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="course-comparison--comparison-content--5S0Ub">
                                                                    <span class="udlite-text-sm course-comparison--num-students--3DG-p">
                                                                        <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall udlite-icon-color-neutral">
                                                                            <use xlink:href="#icon-people">
                                                                            </use>
                                                                        </svg>
                                                                        <span>
                                                                            <asp:Label runat="server" ID="lblCourseListNumStudent"></asp:Label></span>
                                                                    </span>
                                                                    <div class="price-text--container--Ws-fP course-comparison--price-text-container--28CYv" data-purpose="price-text-container">
                                                                        <div class="price-text--price-part--Tu6MH udlite-heading-sm course-comparison--discount-price--1DIpR" data-purpose="course-price-text">
                                                                            <span class="udlite-sr-only">Current price</span>
                                                                            <span>
                                                                                <span><%#DataBinder.Eval(Container, "DataItem.price", "{0:c}")%></span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="course-comparison--image-wrapper--3r835">
                                                                    <asp:Image runat="server" ID="imgCourseList" alt="" Width="64" Height="64" class="course-comparison--course-image--11DSp" ImageUrl='<%# Eval("course_image") %>'></asp:Image>
                                                                </div>
                                                                <a class="course-comparison--whole-card-link--2MxVn" href='SingleCourse.aspx?courseid=<%# Eval("id") %>' aria-hidden="true" tabindex="-1"></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="course-landing-page__main-content component-margin">
                    <div class="clp-component-render">
                        <div class="instructor">
                            <span id="instructor" class="in-page-offset-anchor"></span>
                            <div class="clp-component-render">
                                <div class="ud-component--course-landing-page-udlite--instructors">

                                    <div class="styles--instructors--2JsS3">
                                        <h2 class="udlite-heading-xl styles--instructors__header--16F_8">Instructor</h2>
                                        <div class="instructor--instructor--1wSOF" data-purpose="instructor-bio">
                                            <span class="in-page-offset-anchor" id="instructor-1"></span>
                                            <div>
                                                <div class="udlite-heading-lg instructor--instructor__title--34ItB">
                                                    <asp:Label runat="server" ID="lblInstructorName"></asp:Label>
                                                </div>
                                                <div class="udlite-text-md instructor--instructor__job-title--1HUmd">
                                                    <asp:Label runat="server" ID="lblInstructorJob"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="instructor--instructor__image-and-stats--1IqE7">
                                                <a runat="server" id="instructorLink" class="instructor--instructor__image-link--9e3fA">
                                                    <asp:Image runat="server" ID="imgInstructor" class="instructor--instructor__image--va-P5 udlite-avatar udlite-avatar-image" Width="64" Height="64" Style="width: 6.4rem; height: 6.4rem" /></a>
                                                <ul class="unstyled-list udlite-block-list">
                                                    <li>
                                                        <div data-purpose="stat" class="udlite-block-list-item udlite-block-list-item-small udlite-block-list-item-tight udlite-block-list-item-neutral udlite-text-sm">
                                                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall udlite-icon-color-warning udlite-block-list-item-icon">
                                                                <use xlink:href="#icon-rating-star"></use></svg>
                                                            <div class="udlite-block-list-item-content">4.6 Instructor Rating</div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div data-purpose="stat" class="udlite-block-list-item udlite-block-list-item-small udlite-block-list-item-tight udlite-block-list-item-neutral udlite-text-sm">
                                                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall udlite-icon-color-warning udlite-block-list-item-icon">
                                                                <use xlink:href="#icon-certificate"></use>
                                                            </svg>
                                                            <div class="udlite-block-list-item-content">746,514 Reviews</div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div data-purpose="stat" class="udlite-block-list-item udlite-block-list-item-small udlite-block-list-item-tight udlite-block-list-item-neutral udlite-text-sm">
                                                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall udlite-icon-color-warning udlite-block-list-item-icon">
                                                                <use xlink:href="#icon-people"></use></svg>
                                                            <div class="udlite-block-list-item-content">
                                                                <asp:Label runat="server" ID="lblInstructorNumStudent"></asp:Label>
                                                                Students
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div data-purpose="stat" class="udlite-block-list-item udlite-block-list-item-small udlite-block-list-item-tight udlite-block-list-item-neutral udlite-text-sm">
                                                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall udlite-icon-color-warning udlite-block-list-item-icon">
                                                                <use xlink:href="#icon-play"></use></svg>
                                                            <div class="udlite-block-list-item-content">
                                                                <asp:Label runat="server" ID="lblInstructorNumCourse"></asp:Label>
                                                                Courses
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="show-more--container--1QLmn">
                                                <span id="u890-show-more--1" data-type="checkbox" data-checked="" style="display: none"></span>
                                                <div style="max-height: 146px" class="show-more--content--isg5c show-more--with-gradient--2abmN">
                                                    <div>
                                                        <div class="udlite-text-sm instructor--instructor__description--1dHxF" data-purpose="description-content">
                                                            <p>
                                                                <asp:Label runat="server" ID="lblInstructorNote"></asp:Label>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button type="button" class="udlite-btn udlite-btn-medium udlite-btn-ghost udlite-heading-sm show-more--focusable-label--14fP5" data-css-toggle-id="u890-show-more--1">
                                                    <span>
                                                        <span class="show-more--show-more--3ve3e">Show more</span>
                                                        <span class="show-more--show-less--3eSCX">Show less</span></span>
                                                    <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall show-more--show-more--3ve3e">
                                                        <use xlink:href="#icon-expand"></use>
                                                    </svg>
                                                    <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-xsmall show-more--show-less--3eSCX">
                                                        <use xlink:href="#icon-collapse"></use>
                                                    </svg>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="reviews-section--sub-title--3Lxry">
                    <h2 class="udlite-heading-xl">Reviews</h2>
                    <div class="reviews-section--controls--2xAkI">
                        <div class="reviews-section--search-filter--1hXkA">
                            <div class="udlite-form-group">
                                <label class="udlite-sr-only udlite-form-label udlite-heading-sm" for="u17-form-group--8">Search reviews</label>
                                <div class="text-input-form--text-input-form--1L2vx">
                                    <asp:Textbox runat="server" ID="txtComment" AutoCompleteType="Disabled" placeholder="Enter your review" class="udlite-text-input udlite-text-input-large udlite-text-md"></asp:Textbox>
                                    <asp:LinkButton runat="server" ID="btnSaveComments" OnClick="btnSaveComment_Click" Text="Save" class="udlite-btn udlite-btn-large udlite-btn-primary udlite-heading-md udlite-btn-icon udlite-btn-icon-large text-input-form--submit-button--2dkoG"></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div>
                        <div data-purpose="landing-page-review-list">
                            <asp:Repeater ID="rptComment" runat="server">
                                <ItemTemplate>
                                    <div class="reviews-section--review-container--3F3NE">
                                        <div class="individual-review--individual-review--1AJi4" data-purpose="individual-review">
                                            <div class="individual-review--individual-review-author-avatar--3k5Ty">
                                                <img class="udlite-avatar udlite-heading-md" style="width: 4.8rem; height: 4.8rem;" src='<%# Eval("student_image") %>' />
                                            </div>
                                            <div class="individual-review--individual-review-content--en4c7">
                                                <div class="individual-review--individual-review__name-container--YY9yu">
                                                    <div class="udlite-heading-md individual-review--individual-review__name--3slEE" data-purpose="review-detail-user-name"><%# Eval("student_name") %></div>
                                                </div>
                                                <div class="individual-review--individual-review__detail--3qCWi">
                                                    <span class="udlite-text-sm individual-review--individual-review__detail-date--DEkVn"><%# Eval("comment_date") %></span>
                                                </div>
                                                <div class="show-more--container--1QLmn">
                                                    <span id="u650-show-more--21" data-type="checkbox" data-checked="" style="display: none;"></span>
                                                    <div class="show-more--content--isg5c" style="max-height: 100px;">
                                                        <div>
                                                            <div class="udlite-text-sm individual-review--individual-review__comment--2o94n" data-purpose="review-comment-content">
                                                                <p><%# Eval("comment") %></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
<%--                                                <div class="individual-review--individual-review__feedback--3MjZc">
                                                    <div>
                                                        <p class="review-feedback--review-feedback__title--1kbbZ" data-purpose="helpfulness-prompt">Was this review helpful?</p>
                                                        <div class="review-feedback--review-feedback__actions--3WPPm">
                                                            <button type="button" value="yes" class="udlite-btn udlite-btn-medium udlite-btn-secondary udlite-btn-round udlite-heading-sm udlite-btn-icon udlite-btn-icon-medium udlite-btn-icon-round review-feedback--review-feedback__actions-thumb_up--1TdU7 helpful-button--icon-button-wrapper--1H_4e">
                                                                <svg data-purpose="icon" aria-label="Mark as helpful" focusable="false" class="udlite-icon udlite-icon-small helpful-button--icon--2CtKB">
                                                                    <use xlink:href="#icon-thumb-up">
                                                                    </use>
                                                                </svg>
                                                            </button>
                                                            <button type="button" value="no" class="udlite-btn udlite-btn-medium udlite-btn-secondary udlite-btn-round udlite-heading-sm udlite-btn-icon udlite-btn-icon-medium udlite-btn-icon-round review-feedback--review-feedback__actions-thumb_down--sQ2lz helpful-button--icon-button-wrapper--1H_4e">
                                                                <svg data-purpose="icon" aria-label="Mark as unhelpful" focusable="false" class="udlite-icon udlite-icon-small helpful-button--icon--2CtKB">
                                                                    <use xlink:href="#icon-thumb-down">
                                                                    </use>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>--%>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
<%--                    <div class="reviews-section--reviews-show-more--2cJQg" data-purpose="show-more-review-button-wrapper">
                        <button type="button" data-purpose="show-more-review-button" class="udlite-btn udlite-btn-medium udlite-btn-secondary udlite-heading-sm">
                            <span>See more reviews</span>
                        </button>
                    </div>--%>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="singleCourse/staticx/udemy/js/webpack/entry-udlite-baseline-manifest.e324ddaade08a17a045d.js" defer></script>
        <script type="text/javascript" src="singleCourse/staticx/udemy/js/webpack/entry-udlite-baseline-legacy-vendor.36807ce6e437fb7f8e1f.js" defer></script>
        <script type="text/javascript" src="singleCourse/staticx/udemy/js/webpack/jsi18n-en-us-discovery-udlite-baseline.ff8675625bee30090ba4.js" defer></script>
        <script type="text/javascript" src="singleCourse/staticx/udemy/js/webpack/entry-udlite-baseline-legacy.6f8a3f1038ff99306df6.js" defer></script>
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
        <script>
            function openForm() {
                document.getElementById("myForm").style.display = "block";
            }

            function closeForm() {
                document.getElementById("myForm").style.display = "none";
            }

            function openEmailForm() {
                document.getElementById("shareform").style.display = "block";
            }

            function closeEmailForm() {
                document.getElementById("shareform").style.display = "none";
            }
        </script>
        <script>
            function copyToClipboard() {
                /* Get the text field */
                var copyText = document.getElementById("txtLink");

                /* Select the text field */
                copyText.select();
                copyText.setSelectionRange(0, 99999); /* For mobile devices */

                /* Copy the text inside the text field */
                document.execCommand("copy");

                /* Alert the copied text */
                alert("Copied the text: " + copyText.value);
            }
        </script>
        <script>
            window.onload = function () {
                document.getElementById("txtLink").value = window.location.href;
            }
        </script>
        <div id="myForm" class="modal--dialog-container--3rrJR" style="display: none;">
            <span class="full-page-overlay-checkbox" data-type="checkbox" data-checked="checked" data-was-aria-hidden="false" aria-hidden="true"></span>
            <div class="full-page-overlay-container modal--scroll-wrapper--2jvbz modal--desktop-centered--pIirQ">
                <div role="presentation" class="udlite-btn udlite-btn-large udlite-btn-link udlite-heading-md modal--overlay--3iV5X full-page-overlay--full-page-overlay--2EGvi" data-css-toggle-id="u419-modal--4" data-was-aria-hidden="false" aria-hidden="true"></div>
                <div class="udlite-modal modal--dialog--16df1 modal--default-size--cbk60" role="dialog" tabindex="-1" aria-labelledby="u419-modal-title--5" aria-modal="true">
                    <div class="modal--title-spacer--3ZXio">
                        <h2 id="u419-modal-title--5" class="udlite-modal-title udlite-heading-lg">Share this course</h2>
                    </div>
                    <div class="social-share-items--social-share-items--OXB9W">
                        <div class="js-social-share-clipboard social-share-button--text-input-form--3MVWd udlite-form-group">
                            <label class="udlite-sr-only udlite-form-label udlite-heading-sm" for="u420-form-group--70">Copy share link</label>
                            <div class="text-input-form--text-input-form--1L2vx">
                                <input id="txtLink" type="text" class="udlite-text-input udlite-text-input-large udlite-text-md" value="1" />
                                <button class="udlite-btn udlite-btn-large udlite-btn-primary udlite-heading-md text-input-form--submit-button--2dkoG" onclick="copyToClipboard()">
                                    <span>Copy</span>
                                </button>
                            </div>
                        </div>
                        <button type="button" onclick="openEmailForm()" class="udlite-btn udlite-btn-large udlite-btn-secondary udlite-btn-round udlite-heading-md udlite-btn-icon udlite-btn-icon-large udlite-btn-icon-round social-share-button--icon-button--1svAO">
                            <svg aria-hidden="true" focusable="false" class="udlite-icon udlite-icon-medium">
                                <use xlink:href="#icon-email"></use></svg></button>
                    </div>
                    <button type="button" onclick="closeForm()" class="udlite-btn udlite-btn-medium udlite-btn-ghost udlite-heading-sm udlite-btn-icon udlite-btn-icon-medium udlite-modal-close modal--close-button--28QM_" data-purpose="close-popup" data-css-toggle-id="u419-modal--4">
                        <svg aria-label="close modal" focusable="false" class="udlite-icon udlite-icon-small udlite-icon-color-neutral">
                            <use xlink:href="#icon-close"></use></svg></button>
                </div>
            </div>
        </div>
        <div class="modal--dialog-container--3rrJR" id="shareform" style="display: none;">
            <span id="u56-modal--2" class="full-page-overlay-checkbox" data-type="checkbox" data-checked="checked" data-was-aria-hidden="false" aria-hidden="true" style="display: none;"></span>
            <div class="full-page-overlay-container modal--scroll-wrapper--2jvbz modal--desktop-centered--pIirQ">
                <div role="presentation" class="udlite-btn udlite-btn-large udlite-btn-link udlite-heading-md modal--overlay--3iV5X full-page-overlay--full-page-overlay--2EGvi" data-css-toggle-id="u56-modal--2" data-was-aria-hidden="false" aria-hidden="true"></div>
                <div class="udlite-modal modal--dialog--16df1 modal--default-size--cbk60" role="dialog" tabindex="-1" aria-labelledby="u56-modal-title--3" aria-modal="true">
                    <div class="modal--title-spacer--3ZXio">
                        <h2 id="u56-modal-title--3" class="udlite-modal-title udlite-heading-lg">Share via email</h2>
                    </div>
                    <div class="social-share-email-form--email-addresses--1WJdW udlite-form-group">
                        <label for="u411-form-group--70" class="udlite-form-label udlite-heading-sm">Email addresses</label>
                        <asp:TextBox runat="server" ID="txtShareEmail" class="udlite-text-input udlite-text-input-large udlite-text-md"></asp:TextBox>
                    </div>
                    <div class="social-share-email-form--email-body--JLQwn udlite-form-group">
                        <label for="u411-form-group--71" class="udlite-form-label udlite-heading-sm">Why are you recommending this?<span class="udlite-text-xs udlite-form-label-tag">Optional</span></label>
                        <asp:TextBox runat="server" TextMode="MultiLine" ID="txtShareComment" class="udlite-text-input udlite-text-input-large udlite-text-md" Style="resize: none;"></asp:TextBox>
                        <div class="udlite-form-note udlite-text-xs">Make your share more meaningful with a personal note</div>
                    </div>
                    <div class="social-share-email-form--email-submit-btns--3t69o">
                        <div class="udlite-form-note udlite-text-xs social-share-email-form--email-legal-text--2vJ9h">By sending, you confirm that you know the recipients</div>
                        <button type="button" onclick="closeEmailForm()" class="udlite-btn udlite-btn-large udlite-btn-ghost udlite-heading-md social-share-email-form--cancel-button--2zt9Z" data-purpose="email-form-cancel"><span>Cancel</span></button>
                        <asp:Button runat="server" ID="btnShareEmail" OnClick="btnShareEmail_Click" Text="Send" data-purpose="email-form-submit" TabIndex="-1" class="udlite-btn udlite-btn-large udlite-btn-primary udlite-heading-md"></asp:Button>
                    </div>
                    <button type="button" onclick="closeEmailForm()" class="udlite-btn udlite-btn-medium udlite-btn-ghost udlite-heading-sm udlite-btn-icon udlite-btn-icon-medium udlite-modal-close modal--close-button--28QM_" data-purpose="close-popup" data-css-toggle-id="u56-modal--2">
                        <svg aria-label="close modal" focusable="false" class="udlite-icon udlite-icon-small udlite-icon-color-neutral">
                            <use xlink:href="#icon-close"></use></svg></button>
                </div>
            </div>
        </div>
</asp:Content>
