<%-- 
    Document   : enterprisedetail
    Created on : Feb 5, 2024, 11:05:27 AM
    Author     : thain
--%>

<%@page import="Model.JobSeeker"%>
<%@page import="Model.Enterprise"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

        <title>Enterprise Detail</title>
    </head>
    <body>
        <div class="pxp-preloader"><span>Loading...</span></div>

        <header class="pxp-header fixed-top pxp-no-bg">
            <div class="pxp-container">
                <div class="pxp-header-container">
                    <div class="pxp-logo-nav-container">
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
                                                <a role="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Companies</a>
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
                    </div>
                    <nav class="pxp-user-nav pxp-on-light">
                        <%
                            String userRole = (String) request.getAttribute("userRole");
                            String displayName = (String) request.getAttribute("displayName");
                            String imgUrl = "images/default-avatar.jpg";

                            if ("enterprise".equals(userRole)) {
                                Enterprise enterprise = (Enterprise) request.getAttribute("user");
                                imgUrl = enterprise.getLogoUrl();
                                // Nút "Post a Job" chỉ hiển thị cho enterprise
                        %><a href="/ITJob/PostJob" class="btn rounded-pill pxp-nav-btn">Post a Job</a><%
                            } else if ("jobseeker".equals(userRole)) {
                                JobSeeker jobSeeker = (JobSeeker) request.getAttribute("user");
                                imgUrl = jobSeeker.getImageUrl();
                            }

                            if (displayName != null && !displayName.isEmpty()) {
                        %>
                        <div class="dropdown pxp-user-nav-dropdown">
                            <a href="/ITJob/Home" class="dropdown-toggle" data-bs-toggle="dropdown">
                                <div class="pxp-user-nav-avatar pxp-cover" style="background-image: url(<%= imgUrl%>);"></div>
                                <div class="pxp-user-nav-name d-none d-md-block"><%= displayName%></div>
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
                        <a href="/ITJob/Login" style="text-decoration: none; background-color: transparent; color: black; padding: 5px 18px; border: 1px solid black; border-radius: 25px;font-size: 15px; font-weight: 500; display: inline-block; text-align: center;">Sign in</a>
                        <%
                            }
                        %>
                    </nav>
                </div>
            </div>
        </header>

        <section>
            <div class="pxp-container">
                <div class="pxp-single-company-container pxp-has-columns">
                    <c:if test="${not empty enterprise}">
                        <div class="row">
                            <div class="col-lg-7 col-xl-8 col-xxl-9">
                                <div class="pxp-single-company-hero pxp-cover pxp-boxed" style="background-image: url(${enterprise.imageUrl});">
                                    <div class="pxp-hero-opacity"></div>
                                    <div class="pxp-single-company-hero-caption">
                                        <div class="pxp-container">
                                            <div class="pxp-single-company-hero-content">
                                                <div class="pxp-single-company-hero-logo" style="background-image: url(${enterprise.imageUrl});"></div>
                                                <div class="pxp-single-company-hero-title">
                                                    <h1>${enterprise.fullCompanyName}</h1>
                                                    <div class="pxp-single-company-hero-location"><span class="fa fa-globe"></span>${enterprise.address}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <section class="mt-4 mt-lg-5">
                                    <div class="pxp-single-company-content">
                                        <h2>About ${enterprise.shortName}</h2>
                                        <p>${enterprise.description}</p>
                                        <div class="pxp-single-company-gallery mt-3 mt-lg-4">
                                            <div class="row">
                                                <div class="col-md-6 col-lg-12 col-xl-6 col-xxl-3">
                                                    <a href="images/company-hero-1.jpg" class="pxp-single-company-gallery-item">
                                                        <div class="pxp-single-company-gallery-item-fig pxp-cover" style="background-image: url(images/company-hero-1.jpg);"></div>
                                                        <div class="pxp-single-company-gallery-item-caption">Photo gallery caption 1</div>
                                                    </a>
                                                    <a href="images/company-hero-3.jpg" class="pxp-single-company-gallery-item">
                                                        <div class="pxp-single-company-gallery-item-fig pxp-cover" style="background-image: url(images/company-hero-3.jpg);"></div>
                                                        <div class="pxp-single-company-gallery-item-caption">Photo gallery caption 2</div>
                                                    </a>
                                                </div>
                                                <div class="col-md-6 col-lg-12 col-xl-6 col-xxl-3">
                                                    <a href="images/company-hero-2.jpg" class="pxp-single-company-gallery-item pxp-is-tall">
                                                        <div class="pxp-single-company-gallery-item-fig pxp-cover" style="background-image: url(images/company-hero-2.jpg);"></div>
                                                        <div class="pxp-single-company-gallery-item-caption">Photo gallery caption 3</div>
                                                    </a>
                                                </div>
                                                <div class="col-xl-12 col-xxl-6">
                                                    <a href="images/company-hero-4.jpg" class="pxp-single-company-gallery-item">
                                                        <div class="pxp-single-company-gallery-item-fig pxp-cover" style="background-image: url(images/company-hero-4.jpg);"></div>
                                                        <div class="pxp-single-company-gallery-item-caption">Photo gallery caption 4</div>
                                                    </a>
                                                    <div class="row">
                                                        <div class="col-6">
                                                            <a href="images/company-hero-5.jpg" class="pxp-single-company-gallery-item">
                                                                <div class="pxp-single-company-gallery-item-fig pxp-cover" style="background-image: url(images/company-hero-5.jpg);"></div>
                                                                <div class="pxp-single-company-gallery-item-caption">Photo gallery caption 5</div>
                                                            </a>
                                                        </div>
                                                        <div class="col-6">
                                                            <a href="images/company-hero-3.jpg" class="pxp-single-company-gallery-item">
                                                                <div class="pxp-single-company-gallery-item-fig pxp-cover" style="background-image: url(images/company-hero-3.jpg);"></div>
                                                                <div class="pxp-single-company-gallery-item-caption">Photo gallery caption 6</div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                            <div class="col-lg-5 col-xl-4 col-xxl-3">
                                <div class="pxp-single-company-side-panel mt-5 mt-lg-0">
                                    <div class="mt-4">
                                        <div class="pxp-single-company-side-info-label pxp-text-light">Industry</div>
                                        <div class="pxp-single-company-side-info-data">Information Technology</div>
                                    </div>
                                    <div class="mt-4">
                                        <div class="pxp-single-company-side-info-label pxp-text-light">Company size</div>
                                        <div class="pxp-single-company-side-info-data">${enterprise.enterpriseSizeDetail.size}</div>
                                    </div>
                                    <div class="mt-4">
                                        <div class="pxp-single-company-side-info-label pxp-text-light">Founded in</div>
                                        <div class="pxp-single-company-side-info-data">${enterprise.foundedYear}</div>
                                    </div>
                                    <div class="mt-4">
                                        <div class="pxp-single-company-side-info-label pxp-text-light">Phone</div>
                                        <div class="pxp-single-company-side-info-data">${enterprise.phoneContact}</div>
                                    </div>
                                    <div class="mt-4">
                                        <div class="pxp-single-company-side-info-label pxp-text-light">Email</div>
                                        <div class="pxp-single-company-side-info-data">${enterprise.emailContact}</div>
                                    </div>
                                    <div class="mt-4">
                                        <div class="pxp-single-company-side-info-label pxp-text-light">Location</div>
                                        <div class="pxp-single-company-side-info-data">${enterprise.address}</div>
                                    </div>
                                    <div class="mt-4">
                                        <div class="pxp-single-company-side-info-label pxp-text-light">Website</div>
                                        <div class="pxp-single-company-side-info-data"><a href="${enterprise.websiteUrl}">${enterprise.websiteUrl}</a></div>
                                    </div>
                                    <div class="mt-4">
                                        <div class="pxp-single-company-side-info-data">
                                            <ul class="list-unstyled pxp-single-company-side-info-social">
                                                <li><a href="${enterprise.facebookUrl}"><span class="fa fa-facebook"></span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </section>

        <section class="mt-100">
            <div class="pxp-container">
                <h2 class="pxp-subsection-h2">Available Jobs</h2>
                <p class="pxp-text-light">Jobs list posted by ${enterprise.shortName}</p>

                <div class="row mt-3 mt-md-4 pxp-animate-in pxp-animate-in-top pxp-in">
                    <c:forEach items="${availableJobs}" var="avaiJob" varStatus="loop">
                        <div class="col-xl-6 pxp-jobs-card-2-container">
                            <div class="pxp-jobs-card-2 pxp-has-border">
                                <div class="pxp-jobs-card-2-top">
                                    <a href="/ITJob/JobDetail?jobId=${avaiJob.id}" class="pxp-jobs-card-2-company-logo">
                                        <img src="${avaiJob.enterprise.logoUrl}" alt="Company Logo" style="max-width: 80px; height: auto;">
                                    </a>
                                    <div class="pxp-jobs-card-2-info">
                                        <a href="/ITJob/JobDetail?jobId=${avaiJob.id}" class="pxp-jobs-card-2-title">${avaiJob.title}</a>
                                        <div class="pxp-jobs-card-2-details">
                                            <a href="#" class="pxp-jobs-card-2-location">
                                                <span class="fa fa-globe"></span>${avaiJob.address}
                                            </a>
                                            <div class="pxp-jobs-card-2-type">${avaiJob.jobTypeDetail.jobType}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="pxp-jobs-card-2-bottom">
                                    <div class="pxp-jobs-card-2-bottom-right">
                                        <span class="pxp-jobs-card-2-date pxp-text-light">
                                            ${loop.index + 1} days ago by
                                        </span>
                                        <a href="/ITJob/EnterpriseDetail?enterpriseId=${avaiJob.enterprise.id}" class="pxp-jobs-card-2-company">${avaiJob.enterprise.shortName}</a>
                                    </div>
                                    <div class="pxp-jobs-card-2-category">
                                        <a href="/ITJob/JobDetail?jobId=${avaiJob.id}" class="btn rounded-pill pxp-card-btn">View Detail</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
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
                                New to Jobster? <a role="button" class="" data-bs-target="#pxp-signup-modal" data-bs-toggle="modal" data-bs-dismiss="modal">Create an account</a>
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
    </body>
</html>
