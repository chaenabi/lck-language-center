<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>LCK Language Center</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom -->
        <link href="css/custom.css" rel="stylesheet">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
          <![endif]-->


    <!-- Bootstrap CSS File -->
    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Libraries CSS Files -->
    <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="lib/animate/animate.min.css" rel="stylesheet" />
    <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet" />
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet" />

        <!-- fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
       

        <link rel="stylesheet" href="font-awesome-4.0.3/css/font-awesome.min.css">

        <!-- CSS STYLE-->
        <link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />

        <!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
        <link rel="stylesheet" type="text/css" href="rs-plugin/css/settings.css" media="screen" />


        <style>
            
            body a {
                font-size: 14px;
            }    

            .progress {
                height: 31px;
            }
        </style>

    </head>
    <body>

        
   <!--==========================
  Header
  ============================-->
  <header id="header">
    <div id="topbar">
      <div class="container">
        <div class="social-links">
          <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
          <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
          <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
          <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="logo float-left">
        <!-- Uncomment below if you prefer to use an image logo -->
        <h1 class="text-light">
          <a href="index.jsp" class="scrollto" style="font-size: 36px;"><span>LCK</span></a>
        </h1>
        <!-- <a href="#header" class="scrollto"><img src="img/logo.png" alt="" class="img-fluid"></a> -->
      </div>

      <nav class="main-nav float-right d-none d-lg-block">
        <ul>
          <li><a href="index.jsp">Home</a></li>
          <li><a href="aboutus.jsp">About Us</a></li>
          <li><a href="service.jsp">Services</a></li>
          
          <li><a href="index.jsp#team">Team</a></li>
          <li><a href="univ.jsp">University</a></li>
          <li><a href="index.jsp#footer">Contact Us</a></li>
          <li class="active"><a href="forum.jsp">Forum</a></li>
          <li><a href="affiliation.jsp">affiliation</a></li>
        </ul>
      </nav>
      <!-- .main-nav -->
    </div>
  </header>

  <br /><br /><br /><br /><br />
  <br /><br /><br /><br /><br />
  <!-- #header -->
  <div class="container-fluid">
      
    <!-- ë°°ê²½ ë³´ë¥ -->
            <!-- Slider -->
           <div class="tp-banner-container">
                <div class="tp-banner">
                 
                            <img src="img/forum/background_1.png"  
                            data-bgrepeat="no-repeat"  style="width: 100%; max-height: 480px;">
                  
                </div>
            </div>  
            <!-- //Slider -->
        
            <div class="headernav">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-1 col-xs-3 col-sm-2 col-md-2 logo "><a href="index.jsp"><img src="images/logo.jpg" alt=""  /></a></div>
                        <div class="col-lg-3 col-xs-9 col-sm-5 col-md-3 selecttopic">
                            <div class="dropdown">
                                <a data-toggle="dropdown" href="#" >Regions</a> <b class="caret"></b>
                                <ul class="dropdown-menu" role="menu">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Busan</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-2" href="#">Gumi</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-3" href="#">Cheonan</a></li>

                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 search hidden-xs hidden-sm col-md-3">
                            <div class="wrap">
                                <form action="#" method="post" class="form">
                                    <div class="pull-left txt"><input type="text" class="form-control" placeholder="Search Topics"></div>
                                    <div class="pull-right"><button class="btn btn-default" type="button"><i class="fa fa-search"></i></button></div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-4 col-xs-12 col-sm-5 col-md-4 avt">
                            <div class="stnt pull-left">                            
                                <form action="03_new_topic.jsp" method="post" class="form">
                                    <button class="btn btn-primary">Start New Topic</button>
                                </form>
                            </div>
                            <div class="env pull-left"><i class="fa fa-envelope"></i></div>

                            <div class="avatar pull-left dropdown">
                                <a data-toggle="dropdown" href="#"><img src="images/avatar.jpg" alt="" /></a> <b class="caret"></b>
                                <div class="status green">&nbsp;</div>
                                <ul class="dropdown-menu" role="menu">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">My Profile</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-2" href="#">Inbox</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-3" href="#">Log Out</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-4" href="new_account.jsp">Create account</a></li>
                                </ul>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>


            <section class="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-xs-12 col-md-8">
                            <div class="pull-left"><a href="#" class="prevnext"><i class="fa fa-angle-left"></i></a></div>
                            <div class="pull-left">
                                <ul class="paginationforum">
                                    <li class="hidden-xs"><a href="#">1</a></li>
                                    <li class="hidden-xs"><a href="#">2</a></li>
                                    <li class="hidden-xs"><a href="#">3</a></li>
                                    <li class="hidden-xs"><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">6</a></li>
                                    <li><a href="#" class="active">7</a></li>
                                    <li><a href="#">8</a></li>
                                    <li class="hidden-xs"><a href="#">9</a></li>
                                    <li class="hidden-xs"><a href="#">10</a></li>
                                    <li class="hidden-xs hidden-md"><a href="#">11</a></li>
                                    <li class="hidden-xs hidden-md"><a href="#">12</a></li>
                                    <li class="hidden-xs hidden-sm hidden-md"><a href="#">13</a></li>
                                    <li><a href="#">1586</a></li>
                                </ul>
                            </div>
                            <div class="pull-left"><a href="#" class="prevnext last"><i class="fa fa-angle-right"></i></a></div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>


                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-8">
                            <!-- POST -->
                             <div class="post">
                                <div class="wrap-ut pull-left">
                                    <div class="userinfo pull-left">
                                        <div class="avatar">
                                            <img src="images/avatar.jpg" alt="" />
                                            <div class="status green">&nbsp;</div>
                                        </div>

                                        <div class="icons">
                                            <img src="images/icon1.jpg" alt="" /><img src="images/icon4.jpg" alt="" />
                                        </div>
                                    </div>
                                    <div class="posttext pull-left">
                                        <h2><a href="02_topic.jsp"></a></h2>
                                        <p>It's one thing to subject yourself to be workers.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="postinfo pull-left">
                                    <div class="comments">
                                        <div class="commentbg">
                                            560
                                            <div class="mark"></div>
                                        </div>

                                    </div>
                                    <div class="views"><i class="fa fa-eye"></i> 1,568</div>
                                    <div class="time"><i class="fa fa-clock-o"></i> 24 min</div>                                    
                                </div>
                                <div class="clearfix"></div>
                            </div> <!-- POST -->


                            <!-- POST -->
                            <!-- <div class="post">
                                <div class="wrap-ut pull-left">
                                    <div class="userinfo pull-left">
                                        <div class="avatar">
                                            <img src="images/avatar2.jpg" alt="" />
                                            <div class="status red">&nbsp;</div>
                                        </div>

                                        <div class="icons">
                                            <img src="images/icon3.jpg" alt="" /><img src="images/icon4.jpg" alt="" /><img src="images/icon5.jpg" alt="" /><img src="images/icon6.jpg" alt="" />
                                        </div>
                                    </div>
                                    <div class="posttext pull-left">
                                        <h2><a href="02_topic.jsp">What Instagram Ads Will Look Like</a></h2>
                                        <p>Instagram offered a first glimpse at what its ads will look like in a blog post Thursday. The sample ad, which you can see below.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="postinfo pull-left">
                                    <div class="comments">
                                        <div class="commentbg">
                                            89
                                            <div class="mark"></div>
                                        </div>

                                    </div>
                                    <div class="views"><i class="fa fa-eye"></i> 1,568</div>
                                    <div class="time"><i class="fa fa-clock-o"></i> 15 min</div>                                    
                                </div>
                                <div class="clearfix"></div>
                            </div>POST


                            POST
                            <div class="post">
                                <div class="wrap-ut pull-left">
                                    <div class="userinfo pull-left">
                                        <div class="avatar">
                                            <img src="images/avatar3.jpg" alt="" />
                                            <div class="status red">&nbsp;</div>
                                        </div>

                                        <div class="icons">
                                            <img src="images/icon2.jpg" alt="" /><img src="images/icon4.jpg" alt="" />
                                        </div>
                                    </div>
                                    <div class="posttext pull-left">
                                        <h2><a href="02_topic.jsp">The Future of Magazines Is on Tablets</a></h2>
                                        <p>Eric Schmidt has seen the future of magazines, and it's on the tablet. At a Magazine Publishers Association.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="postinfo pull-left">
                                    <div class="comments">
                                        <div class="commentbg">
                                            456
                                            <div class="mark"></div>
                                        </div>

                                    </div>
                                    <div class="views"><i class="fa fa-eye"></i> 1,568</div>
                                    <div class="time"><i class="fa fa-clock-o"></i> 2 days</div>                                    
                                </div>
                                <div class="clearfix"></div>
                            </div>POST


                            POST
                            <div class="post">
                                <div class="wrap-ut pull-left">
                                    <div class="userinfo pull-left">
                                        <div class="avatar">
                                            <img src="images/avatar4.jpg" alt="" />
                                            <div class="status yellow">&nbsp;</div>
                                        </div>

                                        <div class="icons">
                                            <img src="images/icon1.jpg" alt="" /><img src="images/icon4.jpg" alt="" /><img src="images/icon6.jpg" alt="" />
                                        </div>
                                    </div>
                                    <div class="posttext pull-left">
                                        <h2><a href="02_topic.jsp">Pinterest Now Worth $3.8 Billion</a></h2>
                                        <p>Pinterest's valuation is closing in on $4 billion after its latest funding round of $225 million, according to a report.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="postinfo pull-left">
                                    <div class="comments">
                                        <div class="commentbg">
                                            78
                                            <div class="mark"></div>
                                        </div>

                                    </div>
                                    <div class="views"><i class="fa fa-eye"></i> 1,568</div>
                                    <div class="time"><i class="fa fa-clock-o"></i> 24 min</div>                                    
                                </div>
                                <div class="clearfix"></div>
                            </div>POST



                            POST
                            <div class="post">
                                <div class="wrap-ut pull-left">
                                    <div class="userinfo pull-left">
                                        <div class="avatar">
                                            <img src="images/avatar.jpg" alt="" />
                                            <div class="status green">&nbsp;</div>
                                        </div>

                                        <div class="icons">
                                            <img src="images/icon1.jpg" alt="" /><img src="images/icon4.jpg" alt="" />
                                        </div>
                                    </div>
                                    <div class="posttext pull-left">
                                        <h2><a href="02_topic.jsp">10 Kids Unaware of Their Halloween Costume</a></h2>
                                        <p>It's one thing to subject yourself to a Halloween costume mishap because, hey, that's your prerogative.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="postinfo pull-left">
                                    <div class="comments">
                                        <div class="commentbg">
                                            560
                                            <div class="mark"></div>
                                        </div>

                                    </div>
                                    <div class="views"><i class="fa fa-eye"></i> 1,568</div>
                                    <div class="time"><i class="fa fa-clock-o"></i> 24 min</div>                                    
                                </div>
                                <div class="clearfix"></div>
                            </div>POST


                            POST
                            <div class="post">
                                <div class="wrap-ut pull-left">
                                    <div class="userinfo pull-left">
                                        <div class="avatar">
                                            <img src="images/avatar2.jpg" alt="" />
                                            <div class="status red">&nbsp;</div>
                                        </div>

                                        <div class="icons">
                                            <img src="images/icon3.jpg" alt="" /><img src="images/icon4.jpg" alt="" /><img src="images/icon5.jpg" alt="" /><img src="images/icon6.jpg" alt="" />
                                        </div>
                                    </div>
                                    <div class="posttext pull-left">
                                        <h2><a href="02_topic.jsp">What Instagram Ads Will Look Like</a></h2>
                                        <p>Instagram offered a first glimpse at what its ads will look like in a blog post Thursday. The sample ad, which you can see below.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="postinfo pull-left">
                                    <div class="comments">
                                        <div class="commentbg">
                                            89
                                            <div class="mark"></div>
                                        </div>

                                    </div>
                                    <div class="views"><i class="fa fa-eye"></i> 1,568</div>
                                    <div class="time"><i class="fa fa-clock-o"></i> 15 min</div>                                    
                                </div>
                                <div class="clearfix"></div>
                            </div>POST


                            POST
                            <div class="post">
                                <div class="wrap-ut pull-left">
                                    <div class="userinfo pull-left">
                                        <div class="avatar">
                                            <img src="images/avatar3.jpg" alt="" />
                                            <div class="status red">&nbsp;</div>
                                        </div>

                                        <div class="icons">
                                            <img src="images/icon2.jpg" alt="" /><img src="images/icon4.jpg" alt="" />
                                        </div>
                                    </div>
                                    <div class="posttext pull-left">
                                        <h2><a href="02_topic.jsp">The Future of Magazines Is on Tablets</a></h2>
                                        <p>Eric Schmidt has seen the future of magazines, and it's on the tablet. At a Magazine Publishers Association.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="postinfo pull-left">
                                    <div class="comments">
                                        <div class="commentbg">
                                            456
                                            <div class="mark"></div>
                                        </div>

                                    </div>
                                    <div class="views"><i class="fa fa-eye"></i> 1,568</div>
                                    <div class="time"><i class="fa fa-clock-o"></i> 2 days</div>                                    
                                </div>
                                <div class="clearfix"></div>
                            </div>POST
 -->
                        </div>
                        <div class="col-lg-4 col-md-4">

                            <!-- -->
                            <div class="sidebarblock">
                                <h3>Categories</h3>
                                <div class="divline"></div>
                                <div class="blocktxt">
                                    <ul class="cats">
                                        <li><a href="#">Trading for Money <span class="badge pull-right">20</span></a></li>
                                        <li><a href="#">Vault Keys Giveway <span class="badge pull-right">10</span></a></li>
                                        <li><a href="#">Misc Guns Locations <span class="badge pull-right">50</span></a></li>
                                        <li><a href="#">Looking for Players <span class="badge pull-right">36</span></a></li>
                                        <li><a href="#">Stupid Bugs &amp; Solves <span class="badge pull-right">41</span></a></li>
                                        <li><a href="#">Video &amp; Audio Drivers <span class="badge pull-right">11</span></a></li>
                                        <li><a href="#">2K Official Forums <span class="badge pull-right">5</span></a></li>
                                    </ul>
                                </div>
                            </div>

                            <!-- -->
                            <div class="sidebarblock">
                                <h3>Poll of the Week</h3>
                                <div class="divline"></div>
                                <div class="blocktxt">
                                    <p>Which place you are going this week?</p>
                                    <form action="#" method="post" class="form">
                                        <table class="poll">
                                            <tr>
                                                <td>
                                                    <div class="progress">
                                                        <div class="progress-bar color1" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 90%">
                                                            Seoul
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="chbox">
                                                    <input id="opt1" type="radio" name="opt" value="1">  
                                                    <label for="opt1"></label>  
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="progress">
                                                        <div class="progress-bar color2" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 63%">
                                                            Daegu
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="chbox">
                                                    <input id="opt2" type="radio" name="opt" value="2" checked>  
                                                    <label for="opt2"></label>  
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="progress">
                                                        <div class="progress-bar color3" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 75%">
                                                            Daejeon
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="chbox">
                                                    <input id="opt3" type="radio" name="opt" value="3">  
                                                    <label for="opt3"></label>  
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                    <p class="smal">Voting ends on 19th of October</p>
                                </div>
                            </div>

                            <!-- -->
                            <div class="sidebarblock">
                                <h3>My Active Threads</h3>
                                <div class="divline"></div>
                                <div class="blocktxt">
                                    <a href="#">This Dock Turns Your iPhone Into a Bedside Lamp</a>
                                </div>
                                <div class="divline"></div>
                                <div class="blocktxt">
                                    <a href="#">Who Wins in the Battle for Power on the Internet?</a>
                                </div>
                                <div class="divline"></div>
                                <div class="blocktxt">
                                    <a href="#">Sony QX10: A Funky, Overpriced Lens Camera for Your Smartphone</a>
                                </div>
                                <div class="divline"></div>
                                <div class="blocktxt">
                                    <a href="#">FedEx Simplifies Shipping for Small Businesses</a>
                                </div>
                                <div class="divline"></div>
                                <div class="blocktxt">
                                    <a href="#">Loud and Brave: Saudi Women Set to Protest Driving Ban</a>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>



                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-xs-12">
                            <div class="pull-left"><a href="#" class="prevnext"><i class="fa fa-angle-left"></i></a></div>
                            <div class="pull-left">
                                <ul class="paginationforum">
                                    <li class="hidden-xs"><a href="#">1</a></li>
                                    <li class="hidden-xs"><a href="#">2</a></li>
                                    <li class="hidden-xs"><a href="#">3</a></li>
                                    <li class="hidden-xs"><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">6</a></li>
                                    <li><a href="#" class="active">7</a></li>
                                    <li><a href="#">8</a></li>
                                    <li class="hidden-xs"><a href="#">9</a></li>
                                    <li class="hidden-xs"><a href="#">10</a></li>
                                    <li class="hidden-xs hidden-md"><a href="#">11</a></li>
                                    <li class="hidden-xs hidden-md"><a href="#">12</a></li>
                                    <li class="hidden-xs hidden-sm hidden-md"><a href="#">13</a></li>
                                    <li><a href="#">1586</a></li>
                                </ul>
                            </div>
                            <div class="pull-left"><a href="#" class="prevnext last"><i class="fa fa-angle-right"></i></a></div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>


            </section>

            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-1 col-xs-3 col-sm-2 logo "><a href="#"><img src="images/logo.jpg" alt=""  /></a></div>
                        <div class="col-lg-8 col-xs-9 col-sm-5 ">Copyrights 2020, websitename.com</div>
                        <div class="col-lg-3 col-xs-12 col-sm-5 sociconcent">
                            <ul class="socialicons">
                                <li><a href="#"><i class="fa fa-facebook-square"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="#"><i class="fa fa-cloud"></i></a></li>
                                <li><a href="#"><i class="fa fa-rss"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </footer>
        </div>

        <!-- get jQuery from the google apis -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.js"></script>
 

        <!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
        <script type="text/javascript" src="rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
        <script type="text/javascript" src="rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

        <script src="js/bootstrap.min.js"></script>


        <!-- LOOK THE DOCUMENTATION FOR MORE INFORMATIONS -->
        <script type="text/javascript">
            
            var revapi;

            jQuery(document).ready(function() {
                "use strict";
                revapi = $('.tp-banner').revolution(
                        {
                            delay: 15000,
                            startwidth: 1200,
                            startheight: 278,
                            hideThumbs: 10,
                            fullWidth: "on"
                        });

            });	//ready

        </script>

        <!-- END REVOLUTION SLIDER -->

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        <!-- Uncomment below i you want to use a preloader -->
        <!-- <div id="preloader"></div> -->
    
        <!-- JavaScript Libraries -->
        <script src="lib/jquery/jquery.min.js"></script>
        <script src="lib/jquery/jquery-migrate.min.js"></script>
        <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/mobile-nav/mobile-nav.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/isotope/isotope.pkgd.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <!-- Contact Form JavaScript File -->
        <script src="contactform/contactform.js"></script>
    
        <!-- Template Main Javascript File -->
        <script src="js/main.js"></script>
    </body>
</html>