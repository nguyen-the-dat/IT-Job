<%-- 
    Document   : home
    Created on : Jan 26, 2024, 8:19:52 PM
    Author     : thain
--%>

<%@page import="Model.JobSeeker"%>
<%@page import="Model.Enterprise"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en" class="pxp-root">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600;700&display=swap" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/style.css">

        <title>Home</title>

        <style>
            .pxp-user-nav-name.scrolled {
                color: black;
            }
        </style>
    </head>
    <body>
        <div class="pxp-preloader"><span>Loading...</span></div>
        <header class="pxp-header fixed-top">
            <div class="pxp-container">
                <div class="pxp-header-container">
                    <div class="pxp-logo">
                        <a href="/ITJob/Home" class="pxp-animate"><span style="color: var(--pxpMainColor)">j</span>obster</a>
                    </div>
                    <div class="pxp-nav-trigger navbar d-xl-none flex-fill">
                        <a role="button" data-bs-toggle="offcanvas" data-bs-target="#pxpMobileNav" aria-controls="pxpMobileNav">
                            <div class="pxp-line-1"></div>
                            <div class="pxp-line-2"></div>
                            <div class="pxp-line-3"></div>
                        </a>
                        <div class="offcanvas offcanvas-start pxp-nav-mobile-container" tabindex="-1" id="pxpMobileNav">
                            <div class="offcanvas-header">
                                <div class="pxp-logo">
                                    <a href="/ITJob/Home" class="pxp-animate"><span style="color: var(--pxpMainColor)">j</span>obster</a>
                                </div>
                                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                            </div>
                            <div class="offcanvas-body">
                                <nav class="pxp-nav-mobile">
                                    <ul class="navbar-nav justify-content-end flex-grow-1">
                                        <li class="nav-item dropdown">
                                            <a role="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Home</a>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a role="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Find Jobs</a>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a role="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Enterprises</a>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a role="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Candidates</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <nav class="pxp-nav dropdown-hover-all d-none d-xl-block">
                        <ul>
                            <li class="dropdown">
                                <a href="/ITJob/Home">Home</a>
                            </li>
                            <li class="dropdown">
                                <a href="/ITJob/Job">Find Jobs</a>
                            </li>
                            <li class="dropdown">
                                <a href="/ITJob/Enterprise">Enterprises</a>
                            </li>
                            <c:if test="${userRole == 'enterprise'}">
                                <li class="dropdown">
                                    <a href="/ITJob/Candidate">Candidates</a>
                                </li>                
                            </c:if>
                        </ul>
                    </nav>
                    <nav class="pxp-user-nav pxp-on-light">
                        <%
                            String userRole = (String) request.getAttribute("userRole");
                            String displayName = (String) request.getAttribute("displayName");
                            String imgUrl = "images/default-avatar.jpg";

                            if ("enterprise".equals(userRole)) {
                                Enterprise enterprise = (Enterprise) request.getAttribute("user");
                                imgUrl = enterprise.getLogoUrl();

                        %><a href="PostJob" class="btn rounded-pill pxp-nav-btn">Post a Job</a><%                            } else if ("jobseeker".equals(userRole)) {
                                JobSeeker jobSeeker = (JobSeeker) request.getAttribute("user");
                                imgUrl = jobSeeker.getImageUrl();
                            }

                            if (displayName != null && !displayName.isEmpty()) {
                        %>
                        <div class="dropdown pxp-user-nav-dropdown">
                            <a href="/ITJob/Home" class="dropdown-toggle" data-bs-toggle="dropdown">
                                <div class="pxp-user-nav-avatar pxp-cover" style="background-image: url(<%= imgUrl%>);"></div>
                                <div style="color: white" class="pxp-user-nav-name d-none d-md-block"><%= displayName%></div>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <% if ("jobseeker".equals(userRole) || "enterprise".equals(userRole)) {%>
                                <li><a class="dropdown-item" href="<%= "enterprise".equals(userRole) ? "/ITJob/EnterpriseDashBoard/EditProfile" : "/ITJob/EditProfile"%>">Edit Profile</a></li>
                                    <% } %>
                                    <% if ("enterprise".equals(userRole) || "admin".equals(userRole)) {%>
                                <li><a class="dropdown-item" href="<%= "enterprise".equals(userRole) ? "/ITJob/EnterpriseDashBoard" : "/ITJob/AdminDashboard"%>">Dashboard</a></li>
                                    <% } %>
                                    <% if ("jobseeker".equals(userRole)) {%>
                                <li><a class="dropdown-item" href="AppliedList">Applied List</a></li>
                                    <%}%>
                                <li><a class="dropdown-item" href="Logout">Logout</a></li>
                            </ul>
                        </div>
                        <%
                        } else {
                        %>
                        <a href="/ITJob/Login" style="text-decoration: none; background-color: transparent; color: white; padding: 5px 18px; border: 1px solid white; border-radius: 25px;font-size: 15px; font-weight: 500; display: inline-block; text-align: center;">Sign in</a>
                        <%
                            }
                        %>
                    </nav>

                </div>
            </div>
        </header>
        <section class="pxp-hero vh-100" style="background-color: var(--pxpMainColorLight);">
            <div class="pxp-hero-caption">
                <div class="pxp-container">
                    <div class="row pxp-pl-80 align-items-center justify-content-between">
                        <div class="col-12 col-xl-6 col-xxl-5">
                            <h1>Find the perfect<br><span style="color: var(--pxpMainColor);">job</span> for you</h1>
                            <div class="pxp-hero-subtitle mt-3 mt-lg-4">Search your career opportunity through <strong>${countAllJobs}</strong> jobs</div>

                            <div class="pxp-hero-form pxp-hero-form-round mt-3 mt-lg-4">
                                <form class="row gx-3 align-items-center" action="Job" method="GET">
                                    <div class="col-12 col-sm">
                                        <div class="mb-3 mb-sm-0">
                                            <input name="keyword" type="text" class="form-control" placeholder="Job Title or Keyword" style="border: none; box-shadow: none; padding: 10px 5px 10px 15px; /* Increased left padding */ outline: none; color: var(--pxpTextColor); font-family: 'Segoe UI Symbol'; font-size: 17px; line-height: 1.5;">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm pxp-has-left-border">
                                        <div class="input-group mb-3 mb-lg-0">
                                            <span class="input-group-text" style="background: transparent; border: none;"><span class="fa fa-globe" style="color: #333;"></span></span>
                                            <select name="cityId" class="form-select" style="color: var(--pxpTextColor);font-size: 17px; font-family: 'Segoe UI Symbol'; border: none; box-shadow: none; outline: none; -webkit-appearance: none; -moz-appearance: none; appearance: none; background: transparent; position: relative; z-index: 2; line-height: 1.5;">
                                                <option value="0">All cities</option>
                                                <c:forEach var="city" items="${cities}">
                                                    <option value="${city.id}">${city.name}</option>
                                                </c:forEach>
                                            </select>
                                            <span class="input-group-text" style="background: transparent; border: none; position: absolute; right: 0; pointer-events: none;"><span class="fa fa-chevron-down" style="color: #333;"></span></span>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-auto">
                                        <button><span class="fa fa-search"></span></button>
                                    </div>
                                </form>
                            </div>

                            <div class="pxp-hero-searches-container">
                                <div class="pxp-hero-searches-label">Tags Searches</div>
                                <div class="pxp-hero-searches">
                                    <div class="pxp-hero-searches-items">
                                        <c:forEach items="${tags}" var="tag">
                                            <a href="/ITJob/Job?tagId=${tag.id}">${tag.tag}</a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="d-none d-xl-block col-xl-5 position-relative">
                            <div class="pxp-hero-cards-container pxp-animate-cards pxp-mouse-move" data-speed="160">
                                <div class="pxp-hero-card pxp-cover pxp-cover-top" style="background-image: url(images/background-image.jpg);"></div>
                                <div class="pxp-hero-card-dark"></div>
                                <div class="pxp-hero-card-light"></div>
                            </div>

                            <div class="pxp-hero-card-info-container pxp-mouse-move" data-speed="60">
                                <div class="pxp-hero-card-info pxp-animate-bounce">
                                    <div class="pxp-hero-card-info-item">
                                        <div class="pxp-hero-card-info-item-number">286<span>job offers</span></div>
                                        <div class="pxp-hero-card-info-item-description">in Business Development</div>
                                    </div>
                                    <div class="pxp-hero-card-info-item">
                                        <div class="pxp-hero-card-info-item-number">154<span>job offers</span></div>
                                        <div class="pxp-hero-card-info-item-description">in Marketing & Communication</div>
                                    </div>
                                    <div class="pxp-hero-card-info-item">
                                        <div class="pxp-hero-card-info-item-number">319<span>job offers</span></div>
                                        <div class="pxp-hero-card-info-item-description">in Human Resources</div>
                                    </div>
                                    <div class="pxp-hero-card-info-item">
                                        <div class="pxp-hero-card-info-item-number">120<span>job offers</span></div>
                                        <div class="pxp-hero-card-info-item-description">in Project Management</div>
                                    </div>
                                    <div class="pxp-hero-card-info-item">
                                        <div class="pxp-hero-card-info-item-number">176<span>job offers</span></div>
                                        <div class="pxp-hero-card-info-item-description">in Customer Service</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="pxp-hero-logos-carousel-container">
                <div class="pxp-container">
                    <div class="row pxp-pl-80">
                        <div class="col-12 col-xl-6">
                            <div class="pxp-hero-logos-carousel owl-carousel">
                                <img src="images/hero-logo-1.svg" alt="Logo 1">
                                <img src="images/hero-logo-2.svg" alt="Logo 2">
                                <img src="images/hero-logo-3.svg" alt="Logo 3">
                                <img src="images/hero-logo-4.svg" alt="Logo 4">
                                <img src="images/hero-logo-5.svg" alt="Logo 5">
                                <img src="images/hero-logo-6.svg" alt="Logo 6">
                                <img src="images/hero-logo-7.svg" alt="Logo 7">
                                <img src="images/hero-logo-1.svg" alt="Logo 8">
                                <img src="images/hero-logo-2.svg" alt="Logo 9">
                                <img src="images/hero-logo-3.svg" alt="Logo 10">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="pxp-hero-right-bg-card pxp-has-animation"></div>
        </section>

        <section class="mt-100 pt-100 pb-100" style="background-color: var(--pxpSecondaryColorLight);">
            <div class="pxp-container">
                <h2 class="pxp-section-h2 text-center">Featured Job Offers</h2>
                <c:if test="${userRole == 'guest' || userRole == 'jobseeker'}">
                    <p class="pxp-text-light text-center">Search your career opportunity through ${countAllJobs} jobs</p>
                </c:if>
                <div class="row mt-4 mt-md-5 pxp-animate-in pxp-animate-in-top">
                    <c:forEach items="${jobs}" var="job" varStatus="loop">

                        <div class="col-md-6 col-xl-4 col-xxl-3 pxp-jobs-card-1-container">
                            <div class="pxp-jobs-card-1 pxp-has-shadow">
                                <div class="pxp-jobs-card-1-top">
                                    <a href="/ITJob/JobDetail?jobId=${job.id}" class="pxp-jobs-card-1-title">${job.title}</a>
                                    <div class="pxp-jobs-card-1-details">
                                        <a href="#" class="pxp-jobs-card-1-location">
                                            <span class="fa fa-globe"></span>${job.address}
                                        </a>
                                        <div class="pxp-jobs-card-1-type">${job.jobTypeDetail.jobType}</div>
                                    </div>
                                </div>
                                <div class="pxp-jobs-card-1-bottom">
                                    <div class="pxp-jobs-card-1-bottom-right">
                                        <span class="pxp-jobs-card-1-date pxp-text-light">
                                            ${daysAgoList[loop.index]} days ago by
                                        </span>
                                        <a href="/ITJob/EnterpriseDetail?enterpriseId=${job.enterprise.id}" class="pxp-jobs-card-2-company">${job.enterprise.shortName}</a>
                                    </div>
                                    <a href="/ITJob/EnterpriseDetail?enterpriseId=${job.enterprise.id}" class="pxp-jobs-card-1-company-logo" style="background-image: url(${job.enterprise.logoUrl});"></a>
                                </div>
                            </div>
                        </div>

                    </c:forEach>
                </div>

                <div class="mt-4 mt-md-5 text-center pxp-animate-in pxp-animate-in-top">
                    <a href="/ITJob/Job" class="btn rounded-pill pxp-section-cta">All Job Offers<span class="fa fa-angle-right"></span></a>
                </div>
            </div>
        </section>

        <section class="mt-100">
            <div class="pxp-container">
                <c:if test="${userRole == 'guest' || userRole == 'jobseeker'}">
                    <h2 class="pxp-section-h2 text-center">Find Best Enterprises</h2>
                    <p class="pxp-text-light text-center">Work for the best enterprises in the world</p>              
                </c:if>
                <c:if test="${userRole == 'enterprise'}">
                    <h2 class="pxp-section-h2 text-center">Best Enterprises</h2>
                </c:if>


                <div class="row mt-4 mt-md-5 pxp-animate-in pxp-animate-in-top">
                    <c:forEach items="${enterprises}" var="enterprise">

                        <div class="col-md-6 col-xl-4 col-xxl-3 pxp-companies-card-1-container">
                            <div class="pxp-companies-card-1 pxp-has-border">
                                <div class="pxp-companies-card-1-top">
                                    <a href="/ITJob/EnterpriseDetail?enterpriseId=${enterprise.id}" class="pxp-companies-card-1-company-logo" style="background-image: url(${enterprise.logoUrl});"></a>
                                    <a href="/ITJob/EnterpriseDetail?enterpriseId=${enterprise.id}" class="pxp-companies-card-1-company-name">${enterprise.shortName}</a>
                                    <div class="pxp-companies-card-1-company-description pxp-text-light">${enterprise.description}</div>
                                </div>
                                <div class="pxp-companies-card-1-bottom">
                                    <a href="/ITJob/EnterpriseDetail?enterpriseId=${enterprise.id}" class="pxp-companies-card-1-company-jobs">${jobCounts[enterprise.id]} jobs</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="mt-4 mt-md-5 text-center pxp-animate-in pxp-animate-in-top">
                    <a href="/ITJob/Enterprise" class="btn rounded-pill pxp-section-cta">All Companies<span class="fa fa-angle-right"></span></a>
                </div>
            </div>
        </section>



        <footer class="pxp-main-footer mt-100">
            <div class="pxp-main-footer-top pt-100 pb-100" style="background-color: var(--pxpMainColorLight);">
                
            </div>
        </footer>

        <div class="modal fade pxp-user-modal" id="pxp-signin-modal" aria-hidden="true" aria-labelledby="signinModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="pxp-user-modal-fig text-center">
                            <img src="images/signin-fig.png" alt="Sign in">
                        </div>
                        <h5 class="modal-title text-center mt-4" id="signinModal">Welcome back!</h5>
                        <form class="mt-4">
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="pxp-signin-email" placeholder="Email address">
                                <label for="pxp-signin-email">Email address</label>
                                <span class="fa fa-envelope-o"></span>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="pxp-signin-password" placeholder="Password">
                                <label for="pxp-signin-password">Password</label>
                                <span class="fa fa-lock"></span>
                            </div>
                            <a href="#" class="btn rounded-pill pxp-modal-cta">Continue</a>
                            <div class="mt-4 text-center pxp-modal-small">
                                <a href="#" class="pxp-modal-link">Forgot password</a>
                            </div>
                            <div class="mt-4 text-center pxp-modal-small">
                                New to Jobster? <a href ="Register" role="button" class="" data-bs-target="#pxp-signup-modal" data-bs-toggle="modal" data-bs-dismiss="modal">Create an account</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade pxp-user-modal" id="pxp-signup-modal" aria-hidden="true" aria-labelledby="signupModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="pxp-user-modal-fig text-center">
                            <img src="images/signup-fig.png" alt="Sign up">
                        </div>
                        <h5 class="modal-title text-center mt-4" id="signupModal">Create an account</h5>
                        <form class="mt-4">
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="pxp-signup-email" placeholder="Email address">
                                <label for="pxp-signup-email">Email address</label>
                                <span class="fa fa-envelope-o"></span>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="pxp-signup-password" placeholder="Create password">
                                <label for="pxp-signup-password">Create password</label>
                                <span class="fa fa-lock"></span>
                            </div>
                            <a href="#" class="btn rounded-pill pxp-modal-cta">Continue</a>
                            <div class="mt-4 text-center pxp-modal-small">
                                Already have an account? <a role="button" class="" data-bs-target="#pxp-signin-modal" data-bs-toggle="modal">Sign in</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/nav.js"></script>
        <script src="js/main.js"></script>

        <style>
            .scrolled {
                color: black !important;
                border-color: black !important;
            }
            .header-scrolled {
                background-color: white !important;
            }

        </style>
        <script>
            window.onscroll = function () {
                var signInButtons = document.querySelectorAll('a');
                signInButtons.forEach(function (button) {
                    if (button.textContent.trim() === 'Sign in') {
                        if (document.body.scrollTop > 880 || document.documentElement.scrollTop > 880) {
                            button.classList.add('scrolled');
                        } else {
                            button.classList.remove('scrolled');
                        }
                    }
                });
            };
        </script>

        <script>
            window.addEventListener('scroll', function () {
                var displayNameElement = document.querySelector('.pxp-user-nav-name');

                if (window.scrollY > 880) {
                    displayNameElement.classList.add('scrolled');
                } else {
                    displayNameElement.classList.remove('scrolled');
                }
            });

            window.onscroll = function () {
                var header = document.querySelector('.pxp-header'); // Adjust this if your header has a different class or ID
                var scrollTrigger = 100; // Set the scroll trigger in pixels

                if (document.body.scrollTop > scrollTrigger || document.documentElement.scrollTop > scrollTrigger) {
                    header.classList.add('header-scrolled');
                } else {
                    header.classList.remove('header-scrolled');
                }
            };
            window.addEventListener('scroll', function () {
                var header = document.querySelector('.pxp-header'); // Adjust this if your header has a different class or ID
                var signInButtons = document.querySelectorAll('a');
                var displayNameElement = document.querySelector('.pxp-user-nav-name');
                var scrollTrigger = 100; // Set the scroll trigger in pixels

                // Header background change
                if (document.body.scrollTop > scrollTrigger || document.documentElement.scrollTop > scrollTrigger) {
                    header.classList.add('header-scrolled');
                } else {
                    header.classList.remove('header-scrolled');
                }

                // Sign in button color change
                signInButtons.forEach(function (button) {
                    if (button.textContent.trim() === 'Sign in') {
                        if (document.body.scrollTop > scrollTrigger || document.documentElement.scrollTop > scrollTrigger) {
                            button.classList.add('scrolled');
                        } else {
                            button.classList.remove('scrolled');
                        }
                    }
                });

                // Display name color change
                if (window.scrollY > scrollTrigger) {
                    displayNameElement.classList.add('scrolled');
                } else {
                    displayNameElement.classList.remove('scrolled');
                }
            });

        </script>
    </body>
</html>