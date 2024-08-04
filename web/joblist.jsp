<%@page import="Model.JobSeeker"%>
<%@page import="Model.Enterprise"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <title>List of Job</title>

        <style>
            .job-listing {
                width: 100%; /* Instead of a fixed width like 300px */
            }
            .pxp-hero-searches-label {
                text-align: center;
                display: block; /* Ensure it's a block-level element to center the text correctly */
                margin-bottom: 20px; /* Adjust as needed for spacing */
            }

            .pxp-hero-searches-items {
                display: flex;
                flex-wrap: wrap;
                justify-content: center; /* Center the items horizontally */
                gap: 10px; /* This adds space between the items, adjust as needed */
            }

            /*            .pxp-hero-searches-items a {
                            flex: 0 0 calc((100% - (10px * 6)) / 8);  Adjust '10px' to match the actual gap 
                             Ensures no more than 7 items per row, considering the gap 
                            text-align: center;
                            margin-bottom: 10px;  Adds space between the rows 
                        }*/

            /*             Optional: Ensure the container is full width 
                        .pxp-hero-searches {
                            width: 100%;
                        }*/
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
                            <a href="index.html" class="dropdown-toggle" data-bs-toggle="dropdown">
                                <div class="pxp-user-nav-avatar pxp-cover" style="background-image: url(<%= imgUrl%>);"></div>
                                <div class="pxp-user-nav-name d-none d-md-block"><%= displayName%></div>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <% if ("enterprise".equals(userRole) || "admin".equals(userRole)) {%>
                                <li><a class="dropdown-item" href="<%= "enterprise".equals(userRole) ? "/ITJob/EnterpriseDashBoard" : "/ITJob/AdminDashboard"%>">Dashboard</a></li>
                                    <% } %>
                                    <% if ("jobseeker".equals(userRole)) { %>
                                <li><a class="dropdown-item" href="/ITJob/EditProfile">Edit Profile</a></li>
                                    <% } else if ("enterprise".equals(userRole)) {%>
                                <li><a class="dropdown-item" href="/ITJob/EnterpriseDashBoard/EditProfile">Edit Profile</a></li>
                                    <%}%>

                                <li><a class="dropdown-item" href="/ITJob/Logout">Logout</a></li>
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
        <form action="Job" method="GET">

            <section class="pxp-page-header-simple" style="background-color: var(--pxpMainColorLight); padding: 60px 0;">
                <div class="pxp-container" style="max-width: 1200px; margin: auto;">
                    <h1>Search Jobs</h1>
                    <div class="pxp-hero-subtitle pxp-text-light">Search your career opportunity through <strong>${size}</strong> jobs</div>
                    <div class="pxp-hero-form pxp-hero-form-round pxp-large mt-3 mt-lg-4" style="background-color: #fff; border-radius: 50px; padding: 16px; box-shadow: none;">
                        <div class="row gx-3 align-items-center">
                            <div class="col-12 col-lg">
                                <div class="input-group mb-3 mb-lg-0">
                                    <span class="input-group-text" style="background: transparent; border: none; position: absolute; right: 0; pointer-events: none;">
                                        <span class="fa fa-chevron-down" style="color: #666; font-size: 10px;"></span> 
                                    </span>
                                    <input name="keyword" type="text" class="form-control" placeholder="Job Title or Keyword" style="border: none; box-shadow: none; padding: 10px 5px 10px 15px; /* Increased left padding */ outline: none; color: var(--pxpTextColor); font-family: 'Segoe UI Symbol'; font-size: 17px; line-height: 1.5;">
                                </div>
                            </div>
                            <div class="col-12 col-lg">
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
                            <div class="col-12 col-lg-auto">
                                <button style="font-size: 16px; background-color: var(--pxpMainColor); border: none; box-shadow: none; color: white; border-radius: 25px; padding: 11px 20px; cursor: pointer; font-family: 'Poppins'; line-height: 1.5;">Find Jobs</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <div style="margin-top:20px" class="pxp-hero-searches-container">
                <div style="font-family: 'Poppins';font-sie:50px" class="pxp-hero-searches-label">Tag Searches</div>
                <div class="pxp-hero-searches">
                    <div class="pxp-hero-searches-items">
                        <c:forEach items="${tags}" var="tag">
                            <a href="/ITJob/Job?tagId=${tag.id}">${tag.tag}</a>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <section style="margin-top:20px" class="mt-100">
                <div class="pxp-container">
                    <div class="row">
                        <div class="col-lg-5 col-xl-4 col-xxl-3">
                            <div class="pxp-jobs-list-side-filter">
                                <div class="pxp-list-side-filter-header d-flex d-lg-none">
                                    <div class="pxp-list-side-filter-header-label">Filter Jobs</div>
                                    <a role="button"><span class="fa fa-sliders"></span></a>
                                </div>
                                <div class="mt-4 mt-lg-0 d-lg-block pxp-list-side-filter-panel">
                                    <h3>Type of Employment</h3>
                                    <div class="list-group mt-2 mt-lg-3">
                                        <c:forEach var="jobTypeDetail" items="${jobTypeDetails}" varStatus="loop">
                                            <label class="list-group-item d-flex justify-content-between align-items-center" 
                                                   <c:if test="${loop.index > 0}">
                                                       style="margin-top: 10px;"
                                                   </c:if>>
                                                <span class="d-flex">
                                                    <input name="employmentTypes" class="form-check-input me-2" type="checkbox" value="${jobTypeDetail.id}">
                                                    ${jobTypeDetail.jobType}
                                                </span>
                                                <span class="badge rounded-pill" id="badge_${jobTypeDetail.id}"></span>
                                            </label>
                                        </c:forEach>
                                    </div>

                                    <script>
                                        document.addEventListener("DOMContentLoaded", function () {
                                        <c:forEach var="jobTypeDetail" items="${jobTypeDetails}">
                                            updateJobCountByType("${jobTypeDetail.id}", document.getElementById("badge_${jobTypeDetail.id}"));
                                        </c:forEach>
                                        });
                                    </script>

                                    <h3 class="mt-3 mt-lg-4">Experience Level</h3>
                                    <div class="list-group mt-2 mt-lg-3">
                                        <c:forEach var="workLevelDetail" items="${workLevelDetails}" varStatus="loop">
                                            <label <c:if test="${loop.index > 0}">
                                                    style="margin-top: 10px;"
                                                </c:if> class="list-group-item d-flex justify-content-between align-items-center">
                                                <span class="d-flex">
                                                    <input name="experienceLevels" class="form-check-input me-2" type="checkbox" value="${workLevelDetail.id}">
                                                    ${workLevelDetail.name}
                                                </span>
                                                <span class="badge rounded-pill" id="badge_workLevel_${workLevelDetail.id}"></span>
                                            </label>
                                        </c:forEach>
                                    </div>

                                    <script>
                                        document.addEventListener("DOMContentLoaded", function () {
                                        <c:forEach var="workLevelDetail" items="${workLevelDetails}">
                                            updateJobCountByWorkLevel("${workLevelDetail.id}", document.getElementById("badge_workLevel_${workLevelDetail.id}"));
                                        </c:forEach>
                                        });
                                    </script>

                                    <h3 class="mt-3 mt-lg-4">Salary Range</h3>
                                    <div class="list-group mt-2 mt-lg-3">
                                        <label class="list-group-item d-flex justify-content-between align-items-center">
                                            <span class="d-flex">
                                                <input class="form-check-input me-2" type="checkbox" name="priceRange" value="under8000">
                                                Under $8000
                                            </span>
                                            <span class="badge rounded-pill" id="badge_under8000"></span>
                                        </label>
                                        <label class="list-group-item d-flex justify-content-between align-items-center mt-2 mt-lg-3">
                                            <span class="d-flex">
                                                <input class="form-check-input me-2" type="checkbox" name="priceRange" value="between8000And12000">
                                                $8000 - $12000
                                            </span>
                                            <span class="badge rounded-pill" id="badge_between8000And12000"></span>
                                        </label>
                                        <label class="list-group-item d-flex justify-content-between align-items-center mt-2 mt-lg-3">
                                            <span class="d-flex">
                                                <input class="form-check-input me-2" type="checkbox" name="priceRange" value="above12000">
                                                Above $12000
                                            </span>
                                            <span class="badge rounded-pill" id="badge_above12000"></span>
                                        </label>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-xl-8 col-xxl-9">
                            <div class="pxp-jobs-list-top mt-4 mt-lg-0">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-auto">
                                        <h2><span class="pxp-text-light">Showing</span> ${jobs.size()} <span class="pxp-text-light">jobs</span></h2>
                                    </div>
                                    <div class="col-auto">
                                        <select class="form-select" name="sortOrder" onchange="this.form.submit()">
                                            <option value="mostRelevant" <%= "mostRelevant".equals(request.getParameter("sortOrder")) ? "selected" : ""%>>Most relevant</option>
                                            <option value="newest" <%= "newest".equals(request.getParameter("sortOrder")) ? "selected" : ""%>>Newest</option>
                                            <option value="oldest" <%= "oldest".equals(request.getParameter("sortOrder")) ? "selected" : ""%>>Oldest</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <c:choose>
                                <c:when test="${totalJobs == 0}">
                                    <div class="text-center mt-4 mt-lg-5">
                                        <p style="color: red;">No jobs found.</p>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${jobs}" var="job" varStatus="loop">
                                        <div class="row">
                                            <div style="width: 100%; flex: 0 0 100%; max-width: 100%;" class="col-xxl-6 pxp-jobs-card-2-container">
                                                <div class="pxp-jobs-card-2 pxp-has-border">
                                                    <div class="pxp-jobs-card-2-top">
                                                        <a href="/ITJob/JobDetail?jobId=${job.id}" class="pxp-jobs-card-2-company-logo">
                                                            <img src="${job.enterprise.logoUrl}" alt="Company Logo" style="max-width: 80px; height: auto;">
                                                        </a>
                                                        <div class="pxp-jobs-card-2-info">
                                                            <a href="/ITJob/JobDetail?jobId=${job.id}" class="pxp-jobs-card-2-title">${job.title}</a>
                                                            <div class="pxp-jobs-card-2-details">
                                                                <a href="#" class="pxp-jobs-card-2-location">
                                                                    <span class="fa fa-globe"></span>${job.address}
                                                                </a>
                                                                <div class="pxp-jobs-card-2-type">${job.jobTypeDetail.jobType}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="pxp-jobs-card-2-bottom">
                                                        <div class="pxp-jobs-card-2-bottom-right">
                                                            <span class="pxp-jobs-card-2-date pxp-text-light">
                                                                ${daysAgoList[loop.index]} days ago by
                                                            </span>
                                                            <a href="/ITJob/EnterpriseDetail?enterpriseId=${job.enterprise.id}" class="pxp-jobs-card-2-company">${job.enterprise.shortName}</a>
                                                        </div>
                                                        <div class="pxp-jobs-card-2-category">
                                                            <a href="/ITJob/JobDetail?jobId=${job.id}" class="btn rounded-pill pxp-card-btn">View Detail</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>


                            <div class="row mt-4 mt-lg-5 justify-content-between align-items-center">
                                <div class="col-auto">
                                    <nav class="mt-3 mt-sm-0" aria-label="Jobs list pagination">
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
                                                   &cityId=<%= request.getParameter("cityId") != null ? URLEncoder.encode(request.getParameter("cityId"), "UTF-8") : ""%>
                                                   &employmentTypes=<%= request.getParameterValues("employmentTypes") != null ? URLEncoder.encode(String.join(",", request.getParameterValues("employmentTypes")), "UTF-8") : ""%>
                                                   &experienceLevels=<%= request.getParameterValues("experienceLevels") != null ? URLEncoder.encode(String.join(",", request.getParameterValues("experienceLevels")), "UTF-8") : ""%>
                                                   &priceRange=<%= request.getParameterValues("priceRange") != null ? URLEncoder.encode(String.join(",", request.getParameterValues("priceRange")), "UTF-8") : ""%>
                                                   &tagId=<%= request.getParameterValues("tagId") != null ? URLEncoder.encode(String.join(",", request.getParameterValues("tagId")), "UTF-8") : ""%>
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


                                            function updateJobCountByType(jobId, badgeElement) {
                                                var xhr = new XMLHttpRequest();

                                                xhr.onreadystatechange = function () {
                                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                                        var result = JSON.parse(xhr.responseText);

                                                        badgeElement.innerHTML = result.jobCount;
                                                    }
                                                };

                                                xhr.open("GET", "countJobByTypeServlet?id=" + jobId, true);
                                                xhr.send();
                                            }

                                            function updateJobCountByWorkLevel(id, badgeElement) {
                                                var xhr = new XMLHttpRequest();

                                                xhr.onreadystatechange = function () {
                                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                                        var result = JSON.parse(xhr.responseText);

                                                        badgeElement.innerHTML = result.jobCount;
                                                    }
                                                };

                                                xhr.open("GET", "countJobByWorkLevelServlet?id=" + id, true);
                                                xhr.send();
                                            }

                                            document.addEventListener("DOMContentLoaded", function () {
                                                updateJobCountBySalaryRange('under8000', document.getElementById('badge_under8000'));
                                                updateJobCountBySalaryRange('between8000And12000', document.getElementById('badge_between8000And12000'));
                                                updateJobCountBySalaryRange('above12000', document.getElementById('badge_above12000'));
                                            });

                                            function updateJobCountBySalaryRange(priceRange, badgeElement) {
                                                var xhr = new XMLHttpRequest();

                                                xhr.onreadystatechange = function () {
                                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                                        var result = JSON.parse(xhr.responseText);
                                                        badgeElement.innerHTML = result.jobCount;
                                                    }
                                                };

                                                xhr.open("GET", "countJobBySalaryRangeServlet?priceRange=" + priceRange, true);
                                                xhr.send();
                                            }


        </script>
    </body>
</html>
