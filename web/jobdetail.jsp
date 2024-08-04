<%-- 
    Document   : jobdetail
    Created on : Jan 23, 2024, 4:53:45 PM
    Author     : thain
--%>

<%@page import="Model.Job"%>
<%@page import="Model.Account"%>
<%@page import="DAL.ReportDAO"%>
<%@page import="Model.JobSeeker"%>
<%@page import="Model.Enterprise"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!doctype html>
<html lang="en" class="pxp-root">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/report.css">
        <title>Job Detail</title>
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
                                    <a href="/ITJob/Home" >Home</a>
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


            <!--            <div class="modall hidee">
                            <div class="modall_inner">
                                <div class="modall_header">
                                    <p>REPORT JOB POSTING</p>
                                    <i class="fa-regular fa-circle-xmark"></i>
                                </div>
                                <div class="modall_body">
                                    <h2>Welcome</h2>
                                    <p>
                                        This is a feature to report to the website management board that this employer is defrauding candidates: collecting fees, appropriating labor, arranging work incorrectly according to the posted content,...
                                    </p>
                                </div>
                                <div style="padding-left:15px; padding-bottom: 15px; padding-right: 15px">
                                    <div>
                                        <b>Reason for bad news <span class="text-danger">*</span></b>
                                    </div>
                                    <br>
                                    <div>
                                        <div>
                                            <form id="reportForm" action="ReportJob" method="post">
                                                <textarea id="jobDescription" style="width: 80%;height: 80px;" placeholder="Job description does not match reality" required="true"></textarea>
                                                <input type="hidden" id="jobIdValue" name="jobId" value="${job.id}">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modall_footer">
                                <button >Report ne hihi</button>
                            </div>
                        </div>-->


            <div class="modall hidee">
                <div class="modall_inner">
                    <div class="modall_header">
                        <p>REPORT JOB POSTING</p>
                        <i class="fa-regular fa-circle-xmark"></i>
                    </div>
                    <div class="modall_body">
                        <h2>Welcome ${sessionScope.account.username}</h2>
                        <p>This is a feature to report to the website management board that this employer is defrauding
                            candidates: collecting fees, appropriating labor, arranging work incorrectly according to the posted
                            content,...
                        </p>
                    </div>
                    <div style="padding-left:15px; padding-bottom: 15px; padding-right: 15px">
                        <div ><b>Reason for bad news
                                <span
                                    class="text-danger">*</span></b>
                        </div>
                        <br>
                        <div>
                            <div >
                                <form id="reportForm" action="ReportJob" method="post">

                                    <div  style="padding-bottom:10px">
                                        <select name="typeOfReportDetail">
                                            <c:forEach  items="${sessionScope.detailReport}" var="dR">
                                                <option value="${dR.id}">${dR.detail}</option>
                                            </c:forEach>
                                        </select>

                                    </div>

                                    <textarea id="jobDescription"  style="width: 80%;height: 80px;" placeholder="Please describe in more detail the issue you want to report for this job" required="true"></textarea>
                                    <input type="hidden" id="jobIdValue" name="jobId" value="${job.id}">

                                </form>
                            </div>
                        </div>

                    </div>
                    <div class="modall_footer">
                        <button id="reportButton">Report</button>
                    </div>
                </div>









        </header>

        <section>
            <div class="pxp-container">
                <div class="pxp-single-job-cover pxp-cover" style="background-image: url(${job.enterprise.imageUrl});"></div>
                <div class="pxp-single-job-cover-logo" style="background-image: url(${job.enterprise.logoUrl});"></div>
                <c:if test="${not empty job}">
                    <div class="pxp-single-job-content mt-4 mt-lg-5">
                        <div class="row">
                            <div class="col-lg-7 col-xl-8 col-xxl-9">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-xl-8 col-xxl-6">
                                        <h1>${job.title}</h1>

                                        <div class="pxp-single-job-company-location">
                                            by <a href="/ITJob/EnterpriseDetail?enterpriseId=${job.enterprise.id}">${job.enterprise.shortName}</a> in 
                                            <a href="#">${job.address}</a>
                                        </div>
                                    </div>
                                    <c:if test="${not empty loginMessage}">
                                        <script>alert('${loginMessage}');</script>
                                    </c:if>
                                    <c:if test="${not empty saveJobMessage}">
                                        <script>alert('${saveJobMessage}');</script>
                                    </c:if>

                                    <div class="col-auto">
                                        <div class="pxp-single-job-options mt-4 col-xl-0">
                                            <c:if test="${userRole != 'enterprise' && userRole != 'admin'}">
                                                <form action="FavouriteJob" method="post">
                                                    <input type="hidden" id="jobIdValue" name="jobId" value="${job.id}">
                                                    <input type="hidden" name="username" value="${sessionScope.account.username}">
                                                    <button type="submit" class="btn pxp-single-job-save-btn" title="Save Job">
                                                        <span class="fa fa-heart-o"></span>
                                                    </button>
                                                    <input type="hidden" id="accountValue" value="${sessionScope.account.roleId}" />

                                                    <c:if test="${userRole == 'jobseeker'}">

                                                        <%
                                                            HttpSession sessionS = request.getSession();
                                                            ReportDAO rd = new ReportDAO();
                                                            String username = ((Account) sessionS.getAttribute("account")).getUsername();
                                                            int jobId = ((Job) request.getAttribute("job")).getId();
                                                            System.out.println("username la " + username + " job la " + jobId);
                                                            if (!rd.isReport(username, jobId)) {
                                                        %>
                                                        <button type="button" class="pxp-single-job-save-btn test-report" title="Report Job">
                                                            <span ><i class="fa-regular fa-flag"></i></span>
                                                        </button>
                                                        <%
                                                            }
                                                        %>


                                                    </c:if>



                                                </form>
                                            </c:if>

                                            <div class="dropdown ms-2">
                                                <button class="btn pxp-single-job-share-btn dropdown-toggle" type="button" id="socialShareBtn" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <span class="fa fa-share-alt">
                                                    </span></button>
                                                <ul class="dropdown-menu pxp-single-job-share-dropdown" aria-labelledby="socialShareBtn">
                                                    <li><a class="dropdown-item" href="${job.enterprise.facebookUrl}"><span class="fa fa-facebook"></span> Facebook</a></li>
                                                </ul>
                                            </div>
                                            <!--Apply for JOB-->
                                            <!--hidden data-->
                                            <c:if test="${sessionScope.account.roleId == 2}">
                                                <c:set var="applied" value="${false}" />
                                                <c:forEach var="appliedJobId" items="${sessionScope.appliedJobIds}">
                                                    <c:if test="${appliedJobId == job.id}">
                                                        <c:set var="applied" value="${true}" />
                                                    </c:if>
                                                </c:forEach>
                                                <c:choose>
                                                    <c:when test="${applied}">
                                                        <button class="btn ms-2 pxp-single-job-apply-btn rounded-pill" disabled>Applied</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <form action="/ITJob/ApplyJob?jobId=${job.id}" method="post" id="form1">
                                                            <input type="hidden" name="jobTitle" value="${job.title}">
                                                        </form>
                                                        <c:if test="${sessionScope.account != null}">
                                                            <button class="btn ms-2 pxp-single-job-apply-btn rounded-pill" onclick="myFunction()" type="submit">Apply Now</button>
                                                        </c:if>
                                                        <c:if test="${sessionScope.account == null}">
                                                            <button class="btn ms-2 pxp-single-job-apply-btn rounded-pill" onclick="deniFunction()" type="submit">Apply Now</button>
                                                        </c:if>

                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>

                                            <!--------------->
                                        </div>
                                    </div>
                                </div>

                                <div class="row mt-4 justify-content-between align-items-center">
                                    <div class="col-md-6">
                                        <h4 style="font-weight: 600; font-size: 18px">Tags</h4>
                                        <div class="pxp-hero-searches">
                                            <div class="pxp-hero-searches-items">
                                                <c:forEach items="${tags}" var="tag">
                                                    <a href="/ITJob/Job?tagId=${tag.id}">${tag.tag}</a>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <div class="pxp-single-job-date pxp-text-light">${daysAgo} days ago</div>
                                        <div class="pxp-single-job-date pxp-text-light">Expire in ${daysExpire} days</div>

                                    </div>
                                </div>

                                <div class="pxp-single-job-content-details mt-4 mt-lg-5">
                                    <c:if test="${not empty job.overview}">
                                        <h4>Overview</h4>
                                        <p>${job.overview}</p>
                                    </c:if>
                                    <c:if test="${not empty job.responsabilities}">
                                        <div class="mt-4">
                                            <h4>Responsaibilities</h4>
                                            <p>${job.responsabilities}</p>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty job.requirements}">
                                        <div class="mt-4">
                                            <h4>Requirements</h4>
                                            <p>${job.requirements}</p>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty job.skills}">
                                        <div class="mt-4">
                                            <h4>Skills</h4>
                                            <p>${job.skills}</p>
                                        </div>
                                    </c:if>
                                    <div class="mt-4 mt-lg-5">
                                        <!--<a href="#" class="btn rounded-pill pxp-section-cta">Apply Now</a>-->
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5 col-xl-4 col-xxl-3">
                                <div class="pxp-single-job-side-panel mt-5 mt-lg-0">
                                    <div>
                                        <div class="pxp-single-job-side-info-label pxp-text-light">Experience</div>
                                        <div class="pxp-single-job-side-info-data">Minimum ${job.expYearRequire} years</div>
                                    </div>
                                    <div class="mt-4">
                                        <div class="pxp-single-job-side-info-label pxp-text-light">Number</div>
                                        <div class="pxp-single-job-side-info-data">${job.numRecruit} people</div>
                                    </div>
                                    <div class="mt-4">
                                        <div class="pxp-single-job-side-info-label pxp-text-light">Work Level</div>
                                        <div class="pxp-single-job-side-info-data">${job.workLevelDetail.name}</div>
                                    </div>
                                    <div class="mt-4">
                                        <div class="pxp-single-job-side-info-label pxp-text-light">Employment Type</div>
                                        <div class="pxp-single-job-side-info-data">${job.jobTypeDetail.jobType}</div>
                                    </div>
                                    <div class="mt-4">
                                        <div class="pxp-single-job-side-info-label pxp-text-light">Salary</div>
                                        <div id="salary-range" class="pxp-single-job-side-info-data"></div>
                                    </div>
                                </div>
                                <div class="mt-3 mt-lg-4 pxp-single-job-side-panel">
                                    <div class="pxp-single-job-side-company">
                                        <a style="width:95px; margin-bottom: 15px" href="single-company-1.html" class="pxp-single-job-side-company-logo pxp-cover">
                                            <img src="${job.enterprise.logoUrl}" alt="Company Logo" style="max-width: 80px; height: auto;">
                                        </a>
                                        <div class="pxp-single-job-side-company-profile">
                                            <div class="pxp-single-job-side-company-name">${job.enterprise.shortName}</div>
                                            <a href="single-company-1.html">View profile</a>
                                        </div>
                                    </div>
                                    <!--                                    <div class="mt-4">
                                                                            <div class="pxp-single-job-side-info-label pxp-text-light">Industry</div>
                                                                            <div class="pxp-single-job-side-info-data">Software</div>
                                                                        </div>-->
                                    <div class="mt-4">
                                        <div class="pxp-single-job-side-info-label pxp-text-light">Company size</div>
                                        <div class="pxp-single-job-side-info-data">${job.enterprise.enterpriseSizeDetail.size}</div>
                                    </div>
                                    <div class="mt-4">
                                        <div class="pxp-single-job-side-info-label pxp-text-light">Founded in</div>
                                        <div class="pxp-single-job-side-info-data">${job.enterprise.foundedYear}</div>
                                    </div>
                                    <div class="mt-4">
                                        <div class="pxp-single-job-side-info-label pxp-text-light">Phone</div>
                                        <div class="pxp-single-job-side-info-data">${job.enterprise.phoneContact}</div>
                                    </div>
                                    <div class="mt-4">
                                        <div class="pxp-single-job-side-info-label pxp-text-light">Email</div>
                                        <div class="pxp-single-job-side-info-data">${job.enterprise.emailContact}</div>
                                    </div>
                                    <div class="mt-4">
                                        <div class="pxp-single-job-side-info-label pxp-text-light">Location</div>
                                        <div class="pxp-single-job-side-info-data">${job.enterprise.address}</div>
                                    </div>
                                    <div class="mt-4">
                                        <div class="pxp-single-job-side-info-label pxp-text-light">Website</div>
                                        <div class="pxp-single-job-side-info-data"><a href="${job.enterprise.websiteUrl}">${job.enterprise.websiteUrl}</a></div>
                                    </div>
                                    <div class="mt-4">
                                        <div class="pxp-single-job-side-info-data">
                                            <ul class="list-unstyled pxp-single-job-side-info-social">
                                                <li><a href="${job.enterprise.facebookUrl}"><span class="fa fa-facebook"></span></a></li>
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
                <h2 class="pxp-subsection-h2">Related Jobs</h2>
                <p class="pxp-text-light">Other similar jobs that might interest you</p>

                <div class="row mt-3 mt-md-4 pxp-animate-in pxp-animate-in-top pxp-in">
                    <c:forEach items="${top4RandomJob}" var="top4Job" varStatus="loop">
                        <div class="col-xl-6 pxp-jobs-card-2-container">
                            <div class="pxp-jobs-card-2 pxp-has-border">
                                <div class="pxp-jobs-card-2-top">
                                    <a href="/ITJob/EnterpriseDetail?enterpriseId=${top4Job.enterprise.id}" class="pxp-jobs-card-2-company-logo">
                                        <img src="${top4Job.enterprise.logoUrl}" alt="Company Logo" style="max-width: 80px; height: auto;">
                                    </a>
                                    <div class="pxp-jobs-card-2-info">
                                        <a href="/ITJob/JobDetail?jobId=${top4Job.id}" class="pxp-jobs-card-2-title">${top4Job.title}</a>
                                        <div class="pxp-jobs-card-2-details">
                                            <a href="#" class="pxp-jobs-card-2-location">
                                                <span class="fa fa-globe"></span>${top4Job.address}
                                            </a>
                                            <div class="pxp-jobs-card-2-type">${top4Job.jobTypeDetail.jobType}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="pxp-jobs-card-2-bottom">
                                    <div class="pxp-jobs-card-2-bottom-right">
                                        <span class="pxp-jobs-card-2-date pxp-text-light">
                                            ${loop.index + 1} days ago by
                                        </span>
                                        <a href="/ITJob/JobDetail?jobId=${top4Job.id}" class="pxp-jobs-card-2-company">${top4Job.enterprise.shortName}</a>
                                    </div>
                                    <div class="pxp-jobs-card-2-category">
                                        <a href="/ITJob/JobDetail?jobId=${top4Job.id}" class="btn rounded-pill pxp-card-btn">View Detail</a>
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
        <script>
                                                                var job = {
                                                                    salaryMin: ${job.salaryMin},
                                                                    salaryMax: ${job.salaryMax}
                                                                };

                                                                function formatSalary(salary) {
                                                                    return Math.floor(salary);
                                                                }

                                                                var formattedSalaryMin = formatSalary(job.salaryMin);
                                                                var formattedSalaryMax = formatSalary(job.salaryMax);

                                                                document.getElementById('salary-range').innerHTML = '$' + formattedSalaryMin + ' - $' + formattedSalaryMax + ' / year';


        </script>
        <script>
            function myFunction() {
                document.getElementById("form1").submit();
            }
            function deniFunction() {
                alert("Access Denied! You must login before!");
            }
        </script>
    </body>
    <script src="js/report.js"></script>

</html>
