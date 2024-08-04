<%-- 
    Document   : enterpriselist
    Created on : Feb 4, 2024, 3:18:23 PM
    Author     : thain
--%>

<%@page import="Model.JobSeeker"%>
<%@page import="Model.Enterprise"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Arrays" %>

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

        <title>List of Enterprises</title>
        <style>
            .pxp-companies-card-1-container {
                width: 50%;
            }


        </style>
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

        <section class="pxp-page-header-simple" style="background-color: var(--pxpSecondaryColor);">
            <div class="pxp-container">
                <h1 class="text-center">Search Enterprises</h1>
                <div class="pxp-hero-subtitle pxp-text-light text-center">Work for the best enterprises in the world</div>
            </div>
        </section>
        <form action="Enterprise" method="GET">

            <section class="mt-100">
                <div class="pxp-container">
                    <div class="row">
                        <div class="col-lg-5 col-xl-4 col-xxl-3">
                            <div class="pxp-companies-list-side-filter">
                                <div class="pxp-list-side-filter-header d-flex d-lg-none">
                                    <div class="pxp-list-side-filter-header-label">Filter Jobs</div>
                                    <a role="button"><span class="fa fa-sliders"></span></a>
                                </div>
                                <div class="mt-4 mt-lg-0 d-lg-block pxp-list-side-filter-panel">
                                    <h3>Search by Keywords</h3>
                                    <div class="mt-2 mt-lg-3">
                                        <div class="input-group">
                                            <span class="input-group-text"><span class="fa fa-search"></span></span>
                                            <input name="keyword" type="text" class="form-control" placeholder="Company Name or Keyword">
                                        </div>
                                    </div>

                                    <h3 class="mt-3 mt-lg-4">Location</h3>
                                    <div class="mt-2 mt-lg-3">
                                        <div class="input-group">
                                            <span class="input-group-text"><span class="fa fa-globe"></span></span>
                                            <input name="location" type="text" class="form-control" placeholder="Enter location">
                                        </div>
                                    </div>

                                    <h3 class="mt-3 mt-lg-4">Company Size</h3>
                                    <div class="list-group mt-2 mt-lg-3">
                                        <c:forEach items="${enterpriseSizeDetailsList}" var="detail" varStatus="loop">
                                            <label class="list-group-item d-flex justify-content-between align-items-center" 
                                                   <c:if test="${loop.index > 0}">
                                                       style="margin-top: 10px;"
                                                   </c:if>>
                                                <span class="d-flex">
                                                    <input name="selectedSizes" class="form-check-input me-2" type="checkbox" value="${detail.id}">
                                                    ${detail.size}
                                                </span>
                                                <span class="badge rounded-pill" id="badge_${detail.id}"></span>
                                            </label>
                                        </c:forEach>
                                    </div>

                                    <div style="text-align: center; margin-top: 20px;">
                                        <button style="font-size: 16px;
                                                background-color: var(--pxpMainColor);
                                                border: none;
                                                box-shadow: none;
                                                color: white;
                                                border-radius: 25px;
                                                padding: 11px 20px;
                                                cursor: pointer;
                                                font-family: 'Poppins';
                                                line-height: 1.5;">Find Enterprises</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-xl-8 col-xxl-9">
                            <div class="pxp-companies-list-top mt-4 mt-lg-0">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-auto">
                                        <h2><span class="pxp-text-light">Showing</span> ${enterprises.size()} <span class="pxp-text-light">companies</span></h2>
                                    </div>
                                    <div class="col-auto">
                                        <select class="form-select" name="sortOrder" onchange="this.form.submit()">
                                            <option value="mostRelevant" <%= "mostRelevant".equals(request.getParameter("sortOrder")) ? "selected" : ""%>>Most relevant</option>
                                            <option value="asc" <%= "asc".equals(request.getParameter("sortOrder")) ? "selected" : ""%>>Name Asc</option>
                                            <option value="desc" <%= "desc".equals(request.getParameter("sortOrder")) ? "selected" : ""%>>Name Desc</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <c:forEach items="${enterprises}" var="enterprise">
                                    <div class="col-md-6 col-lg-12 col-xl-6 col-xxl-4 pxp-companies-card-1-container">
                                        <div class="pxp-companies-card-1 pxp-has-border">
                                            <div class="pxp-companies-card-1-top">
                                                <a href="/ITJob/EnterpriseDetail?enterpriseId=${enterprise.id}" class="pxp-companies-card-1-company-logo" style="background-image: url(${enterprise.logoUrl});"></a>
                                                <a href="/ITJob/EnterpriseDetail?enterpriseId=${enterprise.id}" class="pxp-companies-card-1-company-name">${enterprise.shortName}</a>
                                                <div class="pxp-companies-card-1-company-description pxp-text-light">${enterprise.description}</div>
                                            </div>
                                            <div class="pxp-companies-card-1-bottom" style="display: flex; justify-content: space-between; align-items: center;">
                                                <div class="pxp-jobs-card-2-bottom-right">
                                                    <a href="/ITJob/EnterpriseDetail?enterpriseId=${enterprise.id}" class="pxp-companies-card-1-company-jobs" style="margin-right: auto;">
                                                        ${jobCounts[enterprise.id]} jobs
                                                    </a>
                                                </div>
                                                <div class="pxp-jobs-card-2-category">
                                                    <a href="/ITJob/EnterpriseDetail?enterpriseId=${enterprise.id}" class="btn rounded-pill pxp-card-btn" style="font-size: 15px;margin-left: auto; text-decoration: none; color: white; background-color: var(--pxpMainColor);; padding: 5px 10px; border-radius: 50px;">View Detail</a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div class="row mt-4 mt-lg-5 justify-content-between align-items-center">
                                <div class="col-auto">
                                    <nav class="mt-3 mt-sm-0" aria-label="Companies pagination">
                                        <ul class="pagination pxp-pagination">
                                            <% for (int i = 1; i <= (Integer) request.getAttribute("totalPages"); i++) { %>
                                            <% if (i == (Integer) request.getAttribute("currentPage")) {%>
                                            <li class="page-item active" aria-current="page">
                                                <span class="page-link"><%= i%></span>
                                            </li>
                                            <% } else {%>
                                            <li class="page-item">
                                                <a class="page-link" href="?pageIndex=<%= i%>
                                                   &keyword=<%= request.getParameter("keyword") != null ? URLEncoder.encode(request.getParameter("keyword"), "UTF-8") : ""%>
                                                   &location=<%= request.getParameter("location") != null ? URLEncoder.encode(request.getParameter("location"), "UTF-8") : ""%>
                                                   &selectedSizes=<%= request.getParameterValues("selectedSizes") != null ? URLEncoder.encode(String.join(",", request.getParameterValues("selectedSizes")), "UTF-8") : ""%>
                                                   &sortOrder=<%= request.getParameter("sortOrder") != null && !request.getParameter("sortOrder").isEmpty() ? URLEncoder.encode(request.getParameter("sortOrder"), "UTF-8") : "mostRelevant"%>"><%= i%></a>
                                            </li>
                                            <% } %>
                                            <% }%>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </form>

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
        <script>
                                            document.addEventListener("DOMContentLoaded", function () {
            <c:forEach var="enterpriseSizeDetail" items="${enterpriseSizeDetailsList}">
                                                updateEnterpriseCountBySize("${enterpriseSizeDetail.id}", document.getElementById("badge_${enterpriseSizeDetail.id}"));
            </c:forEach>

                                                document.querySelectorAll('.form-check-input').forEach(function (checkbox) {
                                                    checkbox.addEventListener('change', function () {
                                                        var parentLabel = this.closest('.list-group-item');
                                                        if (this.checked) {
                                                            parentLabel.classList.add('pxp-checked');
                                                        } else {
                                                            parentLabel.classList.remove('pxp-checked');
                                                        }
                                                    });
                                                });
                                            });

                                            function updateEnterpriseCountBySize(sizeId, badgeElement) {
                                                var xhr = new XMLHttpRequest();

                                                xhr.onreadystatechange = function () {
                                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                                        var result = JSON.parse(xhr.responseText);

                                                        badgeElement.innerHTML = result.enterpriseCount;
                                                    }
                                                };

                                                xhr.open("GET", "countEnterpriseBySizeServlet?id=" + sizeId, true);
                                                xhr.send();
                                            }
        </script>


    </body>
</html>
