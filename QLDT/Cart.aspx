<%@ Page Title="" Language="C#" MasterPageFile="~/Index2.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="QLDT.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="server">
    <link type="text/css" href="singleCart/staticx/udemy/js/webpack/entry-main-legacy.0202725b20b74e5e0f39.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="singleCart/staticx/udemy/js/webpack/udlite-common-css.7e7a54ce45c998398614.css" />
    <script type="text/javascript" src="singleCart/staticx/udemy/js/webpack/udlite-common-css.567d2eefb9a153cd2e2a.js" defer="">
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="main-content">
        <div class="ud-app-loader ud-component--cart--app ud-app-loaded" data-module-id="cart/pages/cart" data-module-args="{&quot;message&quot;:null}">
            <div class="styles--sc-wrapper--3ncS2">
                <section class="style--jumbotron-header-bar--cart--3GsX0 jumbotron jumbotron-header-bar">
                    <div class="container">
                        <div class="jumbotron-header-bar__inner">
                            <div>
                                <h1 data-purpose="shopping-cart-title">
                                    <span class="">Shopping Cart</span>
                                </h1>
                            </div>
                        </div>
                    </div>
                </section>
                <div>
                    <div class="container styles--shopping-container--1aPCP" style="display: flex; align-items: center; margin-top: 20px; max-width: 100%;">
                        <div class="styles--sc-lists-pane--1jENW" style="flex: 1; margin-bottom: 30px; width: 100%;">
                            <div class="styles--sc-shopping-list--2_s4L">
                                <h3 class="styles--sc-shopping-list__title--3giMp" data-purpose="cart-list-title"><asp:Label runat="server" ID="lblNumCartItem"></asp:Label> Courses in Cart</h3>
                                <div>
                                    <ul class="styles--sc-shopping-list__items--h-1Zf styles--sc-shopping-list__items--cart-page--33suQ">
                                        <asp:Repeater ID="rptCart" runat="server" OnItemCommand="rptCart_ItemCommand">
                                            <ItemTemplate>
                                                <li class="styles--sc-shopping-list__item--26SKJ">
                                                    <div class="styles--sc-card--3imwn">
                                                        <div class="styles--sc-card__thumbnail--1rTuN" data-purpose="cart-thumbnail">
                                                            <a href='SingleCourse.aspx?courseid=<%# Eval("course_id") %>' target="_self">
                                                                <asp:Image runat="server" ID="imgCartCourse" src='<%# Eval("course_image") %>' class="styles--sc-card__image--2xyJE styles--sc-card__image--lg--J8lG8" data-purpose="card-thumbnail-lg" alt="" width="240" height="135"></asp:Image>
                                                            </a>
                                                            &nbsp;&nbsp;
                                                             <asp:HiddenField ID="hdfCart" runat="server" Value='<%# Eval("course_id") %>' />
                                                        </div>
                                                        <div class="styles--sc-card__column-wrapper--1pCwq">
                                                            <a href='SingleCourse.aspx?courseid=<%# Eval("course_id") %>' data-purpose="shopping-course-card-title" target="_self">
                                                                <div class="styles--sc-card__title--L-qWv"><%# Eval("course_name") %></div>
                                                                <span class="styles--sc-card__instructors--DCi03" data-purpose="">By <%# Eval("teacher_name") %>, <%# Eval("job") %></span>
                                                            </a>
                                                            <div>
                                                                <a href="/course/the-complete-javascript-course/" target="_self">
                                                                    <div class="styles--sc-card__prices--1-_t8">
                                                                        <div class="price-text-container price-text--base-price__container--Xwk8v price-text--right--2oqMm price-text--vertical--2g5Zg" data-purpose="price-text-container">
                                                                            <div class="course-price-text price-text--base-price__discount--1J7vF price-text--primary--XsxpO price-text--small--2nfxe price-text--bold--ldWad" data-purpose="course-price-text">
                                                                                <span class="sr-only">Current price</span>
                                                                                <span>
                                                                                    <span><%#DataBinder.Eval(Container, "DataItem.price", "{0:c}")%></span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="styles--sc-card__actions--3C_uV" data-purpose="actions">
                                                            <span class="styles--sc-card__action--1kP0W">
                                                                <asp:LinkButton runat="server" ID="btnRemove" CommandName="Remove" Text="Remove"></asp:LinkButton>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <span style="font-size: 0px;"></span>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="styles--sc-checkout-pane--71SP_ styles--sc-checkout-pane--vertical--1Z5xx" style="border-top: none; width: 270px; flex: 0 1 auto; width: 20%; z-index: 2;">
                            <div data-purpose="total-price" class="styles--sc-checkout-box__total--346Yo styles--sc-checkout-box__total--cartPage--2quEj">
                                <div class="price-text-container price-text--base-price__container--Xwk8v price-text--left--35Rdx price-text--vertical--2g5Zg" data-purpose="price-text-container">
                                    <div class="price-text--base-price__total-label--3FVgr price-text--lighter--1OoLd price-text--medium--2clK9 price-text--regular--2D_Ii" data-purpose="course-price-total-label">Total:</div>
                                    <div class="course-price-text price-text--base-price__discount--1J7vF price-text--black--1qJbH price-text--xlarge--LEWuO price-text--semibold--DLyJV" data-purpose="course-price-text">
                                        <span class="sr-only">Current price</span>
                                        <span>
                                            <span><asp:Label runat="server" ID="lblTotalPrice"></asp:Label></span>
                                        </span>
                                    </div>
                                    <div class="original-price-container price-text--base-price__original--98W0j price-text--lighter--1OoLd price-text--small--2nfxe price-text--regular--2D_Ii" data-purpose="original-price-container">
                                    </div>
                                </div>
                            </div>
                            <div>
                                <asp:Button ID="btnPurchase" runat="server" CssClass="btn btn-lg btn-primary btn-block" OnClick="btnPurchase_Click" Text="Momo" />
                                <asp:Button runat="server" ID="btnTest" CssClass="btn btn-lg btn-primary btn-block" BackColor="Blue" Text="Paypal" OnClick="btnPayPal_Click" />
                            </div>
                            <hr>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
