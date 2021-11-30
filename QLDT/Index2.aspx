<%@ Page Title="" Language="C#" MasterPageFile="~/Index2.Master" AutoEventWireup="true" CodeBehind="Index2.aspx.cs" Inherits="QLDT.Index21" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

    <link rel="stylesheet" href="style/css/bootstrap.min.css" />
    <link rel="stylesheet" href="style/css/font-awesome.min.css" />
    <link rel="stylesheet" href="style/css/owl.carousel.css" />
    <link rel="stylesheet" href="style/css/owl.theme.default.min.css" />
    <link rel="stylesheet" href="style/css/drop-down.css" />
    <link rel="stylesheet" href="style/css/MainCss.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="main-content">
        <div class="ud-component--topic--topic">

            <!-- HOME -->
            <section id="home">
                <div class="row">

                    <div class="owl-carousel owl-theme home-slider">
                        <div class="item item-first">
                            <div class="caption">
                                <div class="container">
                                    <div class="col-md-6 col-sm-12">
                                        <h1>Distance Learning Education Center</h1>
                                        <h3>Our online courses are designed to fit in your industry supporting all-round with latest technologies.</h3>
                                        <a href="SingleCategory.aspx?categoryid=1" class="section-btn btn btn-default smoothScroll">Discover more</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="item item-second">
                            <div class="caption">
                                <div class="container">
                                    <div class="col-md-6 col-sm-12">
                                        <h1>Start your journey with our practical courses</h1>
                                        <h3>Our online courses are built in partnership with technology leaders and are designed to meet industry demands.</h3>
                                        <a href="#courses" class="section-btn btn btn-default smoothScroll">Take a course</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="item item-third">
                            <div class="caption">
                                <div class="container">
                                    <div class="col-md-6 col-sm-12">
                                        <h1>Efficient Learning Methods</h1>
                                        <h3>Nam eget sapien vel nibh euismod vulputate in vel nibh. Quisque eu ex eu urna venenatis sollicitudin ut at libero. Visit <a rel="nofollow" href="https://www.facebook.com/templatemo">templatemo</a> page.</h3>
                                        <a href="#contact" class="section-btn btn btn-default smoothScroll">Let's chat</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- FEATURE -->
            <section id="feature">
                <div class="container">
                    <div class="row">

                        <div class="col-md-4 col-sm-4">
                            <div class="feature-thumb">
                                <span>01</span>
                                <h3>Trending Courses</h3>
                                <p>Known is free education HTML Bootstrap Template. You can download and use this for your website.</p>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-4">
                            <div class="feature-thumb">
                                <span>02</span>
                                <h3>Books & Library</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing eiusmod tempor incididunt ut labore et dolore magna.</p>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-4">
                            <div class="feature-thumb">
                                <span>03</span>
                                <h3>Certified Teachers</h3>
                                <p>templatemo provides a wide variety of free Bootstrap Templates for you. Please tell your friends about us. Thank you.</p>
                            </div>
                        </div>

                    </div>
                </div>
            </section>

            <!-- ABOUT -->
            <section id="about">
                <div class="container">
                    <div class="row">

                        <div class="col-md-6 col-sm-12">
                            <div class="about-info">
                                <h2>Start your journey to a better life with online practical courses</h2>

                                <figure>
                                    <span><i class="fa fa-users"></i></span>
                                    <figcaption>
                                        <h3>Professional Trainers</h3>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint ipsa voluptatibus.</p>
                                    </figcaption>
                                </figure>

                                <figure>
                                    <span><i class="fa fa-certificate"></i></span>
                                    <figcaption>
                                        <h3>International Certifications</h3>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint ipsa voluptatibus.</p>
                                    </figcaption>
                                </figure>

                                <figure>
                                    <span><i class="fa fa-bar-chart-o"></i></span>
                                    <figcaption>
                                        <h3>Free for 3 months</h3>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint ipsa voluptatibus.</p>
                                    </figcaption>
                                </figure>
                            </div>
                        </div>

                        <div class="col-md-offset-1 col-md-4 col-sm-12">
                            <div class="entry-form">
                                <h2>Signup today</h2>
                                <asp:TextBox runat="server" ID="txtFullname" name="full name" class="form-control" placeholder="Full name"></asp:TextBox>

                                <asp:TextBox runat="server" ID="txtEmail" type="email" name="email" class="form-control" placeholder="Your email address"></asp:TextBox>

                                <asp:TextBox runat="server" ID="txtPassword" type="password" name="password" class="form-control" placeholder="Your password"></asp:TextBox>

                                <asp:TextBox runat="server" ID="txtConfirmPass" type="password" name="password" class="form-control" placeholder="Confirm password"></asp:TextBox>

                                <asp:Button runat="server" ID="btnSubmit" class="submit-btn form-control" Text="Get started" OnClick="btnSubmit_Click"></asp:Button>
                            </div>
                        </div>

                    </div>
                </div>
            </section>

            <!-- TEAM -->
            <section id="team">
                <div class="container">
                    <div class="row">

                        <div class="col-md-12 col-sm-12">
                            <div class="section-title">
                                <h2>Teachers <small>Meet Professional Trainers</small></h2>
                            </div>
                        </div>

                        <asp:Repeater ID="rptTeacher" runat="server">
                            <ItemTemplate>
                                <div class="col-md-3 col-sm-6">
                                    <div class="team-thumb">
                                        <div class="team-image">
                                            <img src="<%# Eval("teacher_image") %>" />
                                        </div>
                                        <div class="team-info">
                                            <h3>
                                                <asp:HyperLink ID="linkView" NavigateUrl='<%# FormatTeacherUrl( (int) Eval("id")) %>' runat="server" Text='<%# Eval("teacher_name") %>' class="link-product-add-cart"></asp:HyperLink></h3>
                                            <span><%# Eval("job") %></span>
                                        </div>
                                        <ul class="social-icon">
                                            <li><a href="https://github.com/" class="fa fa-facebook-square" attr="facebook icon"></a></li>
                                            <li><a href="https://github.com/" class="fa fa-twitter"></a></li>
                                            <li><a href="https://github.com/" class="fa fa-instagram"></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                </div>
            </section>

            <!-- Courses -->
            <section id="courses">
                <div class="container">
                    <div class="row">

                        <div class="col-md-12 col-sm-12">
                            <div class="section-title">
                                <h2>Popular Courses <small>Upgrade your skills with newest courses</small></h2>
                            </div>

                            <div class="owl-carousel owl-theme owl-courses">

                                <asp:Repeater ID="rptCourse" runat="server">
                                    <ItemTemplate>
                                        <div class="col-md-4 col-sm-4">
                                            <div class="item">
                                                <div class="courses-thumb">
                                                    <div class="courses-top">
                                                        <div class="courses-image">
                                                            <img src="<%# Eval("course_image") %>" class="img-responsive" alt="" />
                                                        </div>
                                                        <div class="courses-date">
                                                            <span><i class="fa fa-calendar"></i><%#DataBinder.Eval(Container, "DataItem.date_update", "{0:d}")%></span>
                                                            <span><i class="fa fa-clock-o"></i><%# Eval("hours") %></span>
                                                        </div>
                                                    </div>

                                                    <div class="courses-detail">
                                                        <h3>
                                                            <asp:HyperLink ID="linkView" NavigateUrl='<%# FormatCourseUrl( (int) Eval("id")) %>' runat="server" Text='<%# Eval("course_name") %>' class="link-product-add-cart">Quick View</asp:HyperLink></h3>
                                                        <asp:HyperLink runat="server" NavigateUrl='<%# FormatUrl( (int) Eval("category_id")) %>'><%# Eval("category_name") %></asp:HyperLink>
                                                        <p><%# Eval("description") %></p>
                                                    </div>

                                                    <div class="courses-info">
                                                        <div class="courses-author">
                                                            <img src="<%# Eval("teacher_image") %>" class="img-responsive" alt="" />
                                                            <span><%# Eval("teacher_name") %></span>
                                                        </div>
                                                        <div class="courses-price">
                                                            <a href="#/"><span>USD <%#DataBinder.Eval(Container, "DataItem.price", "{0:c}")%></span></a>
                                                        </div>
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
            </section>

            <!-- TESTIMONIAL -->
            <section id="testimonial">
                <div class="container">
                    <div class="row">

                        <div class="col-md-12 col-sm-12">
                            <div class="section-title">
                                <h2>Student Reviews <small>from around the world</small></h2>
                            </div>

                            <div class="owl-carousel owl-theme owl-client">
                                <div class="col-md-4 col-sm-4">
                                    <div class="item">
                                        <div class="tst-image">
                                            <img src="style/images/tst-image1.jpg" class="img-responsive" alt="" />
                                        </div>
                                        <div class="tst-author">
                                            <h4>Jackson</h4>
                                            <span>Shopify Developer</span>
                                        </div>
                                        <p>You really do help young creative minds to get quality education and professional job search assistance. I’d recommend it to everyone!</p>
                                        <div class="tst-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4 col-sm-4">
                                    <div class="item">
                                        <div class="tst-image">
                                            <img src="style/images/tst-image2.jpg" class="img-responsive" alt="" />
                                        </div>
                                        <div class="tst-author">
                                            <h4>Camila</h4>
                                            <span>Marketing Manager</span>
                                        </div>
                                        <p>Trying something new is exciting! Thanks for the amazing law course and the great teacher who was able to make it interesting.</p>
                                        <div class="tst-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4 col-sm-4">
                                    <div class="item">
                                        <div class="tst-image">
                                            <img src="style/images/tst-image3.jpg" class="img-responsive" alt="" />
                                        </div>
                                        <div class="tst-author">
                                            <h4>Barbie</h4>
                                            <span>Art Director</span>
                                        </div>
                                        <p>Donec erat libero, blandit vitae arcu eu, lacinia placerat justo. Sed sollicitudin quis felis vitae hendrerit.</p>
                                        <div class="tst-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4 col-sm-4">
                                    <div class="item">
                                        <div class="tst-image">
                                            <img src="style/images/tst-image4.jpg" class="img-responsive" alt="" />
                                        </div>
                                        <div class="tst-author">
                                            <h4>Andrio</h4>
                                            <span>Web Developer</span>
                                        </div>
                                        <p>Nam eget mi eu ante faucibus viverra nec sed magna. Vivamus viverra sapien ex, elementum varius ex sagittis vel.</p>
                                        <div class="tst-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- CONTACT -->
            <section id="contact">
                <div class="container">
                    <div class="row">

                        <div class="col-md-6 col-sm-12">
                            <div class="section-title">
                                <h2>Contact us <small>we love conversations. let us talk!</small></h2>
                            </div>

                            <div class="col-md-12 col-sm-12">
                                <asp:TextBox runat="server" ID="txtContactFullName" class="form-control" placeholder="Enter full name" name="name"></asp:TextBox>

                                <asp:TextBox runat="server" ID="txtContactEmail" type="email" class="form-control" placeholder="Enter email address" name="email"></asp:TextBox>

                                <asp:TextBox runat="server" ID="txtMessage" class="form-control" Rows="6" placeholder="Tell us about your message" name="message" TextMode="MultiLine"></asp:TextBox>
                            </div>

                            <div class="col-md-4 col-sm-12">
                                <asp:Button runat="server" ID="btnSendMessage" type="submit" Text="Send message" OnClick="btnSendMessage_Click" class="form-control" name="send message" value="Send Message"></asp:Button>
                            </div>

                        </div>

                        <div class="col-md-6 col-sm-12">
                            <div class="contact-image">
                                <img src="style/images/contact-image.jpg" class="img-responsive" alt="Smiling Two Girls" />
                            </div>
                        </div>

                    </div>
                </div>
            </section>
        </div>
    </div>
    <!-- SCRIPTS -->
    <script src="style/js/jquery.js"></script>
    <script src="style/js/bootstrap.min.js"></script>
    <script src="style/js/owl.carousel.min.js"></script>
    <script src="style/js/smoothscroll.js"></script>
    <script src="style/js/custom.js"></script>
</asp:Content>
