<%@page import="Model.EnterprisesClone"%>
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

        <link rel="shortcut icon" href="../images/favicon.png" type="image/x-icon">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600;700&display=swap" rel="stylesheet">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/owl.carousel.min.css">
        <link rel="stylesheet" href="../css/owl.theme.default.min.css">
        <link rel="stylesheet" href="../css/animate.css">
        <link rel="stylesheet" href="../css/style.css">

        <title>Edit profile</title>
    </head>
    <body style="background-color: var(--pxpMainColorLight);">
        <div class="pxp-preloader"><span>Loading...</span></div>
        <%
            String userRole = (String) request.getAttribute("userRole");
            String displayName = (String) request.getAttribute("displayName");
            String imgUrl = "images/default-avatar.jpg";
            int status = 0;
            if ("enterprise".equals(userRole)) {
                EnterprisesClone enterprise = (EnterprisesClone) request.getAttribute("user");
                imgUrl = enterprise.getLogoUrl();
                status = enterprise.getStatus();
        %>
        <div class="pxp-dashboard-side-panel d-none d-lg-block">
            <div class="pxp-logo">
                <a href="/ITJob/Home" class="pxp-animate"><span style="color: var(--pxpMainColor)">j</span>obster</a>
            </div>

            <nav class="mt-3 mt-lg-4 d-flex justify-content-between flex-column pb-100">
                <div class="pxp-dashboard-side-label">Enterprise tools</div>
                <ul class="list-unstyled">
                    <li><a href="/ITJob/EnterpriseDashBoard"><span class="fa fa-home"></span>Dashboard</a></li>
                    <li class="pxp-active"><a href="/ITJob/EnterpriseDashBoard/EditProfile"><span class="fa fa-pencil"></span>Edit Profile</a></li>

                    <c:if test="<%= status == 2 || status == 3%>">

                        <li><a href="/ITJob/PostJob"><span class="fa fa-file-text-o"></span>New Job Offer</a></li>
                        <li><a href="/ITJob/ManageJob"><span class="fa fa-briefcase"></span>Manage Jobs</a></li>
                        <li><a href="/ITJob/Applicant"><span class="fa fa-user-circle-o"></span>Candidates</a></li>
                        </c:if>

                    <li><a href="/ITJob/profilepass"><span class="fa fa-lock"></span>Change Password</a></li>
                </ul>
                <div class="pxp-dashboard-side-label mt-3 mt-lg-4">Insights</div>
                <ul class="list-unstyled">
                    <li>
                        <a href="company-dashboard-notifications.html" class="d-flex justify-content-between align-items-center">
                            <div><span class="fa fa-bell-o"></span>Notifications</div>
                            <span class="badge rounded-pill">5</span>
                        </a>
                    </li>
                </ul>
            </nav>

            <nav class="pxp-dashboard-side-user-nav-container">

                <div class="dropdown pxp-user-nav-dropdown">
                    <a href="index.html" class="dropdown-toggle" data-bs-toggle="dropdown">

                        <div class="pxp-user-nav-avatar pxp-cover" style="background-image: url(<%= imgUrl%>);"></div>
                        <div style="color: black" class="pxp-user-nav-name d-none d-md-block"><%= displayName%></div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <% if ("jobseeker".equals(userRole) || "enterprise".equals(userRole)) { %>
                        <li><a class="dropdown-item" href="/ITJob/EnterpriseDashBoard/EditProfile">Edit Profile</a></li>
                            <% } %>
                            <% if ("enterprise".equals(userRole) || "admin".equals(userRole)) {%>
                        <li><a class="dropdown-item" href="<%="/ITJob/EnterpriseDashBoard"%>">Dashboard</a></li>
                            <% }%>
                        <li><a class="dropdown-item" href="/ITJob/Logout">Logout</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="pxp-dashboard-content">
            <div class="pxp-dashboard-content-header">
                <div class="pxp-nav-trigger navbar pxp-is-dashboard d-lg-none">
                    <a role="button" data-bs-toggle="offcanvas" data-bs-target="#pxpMobileNav" aria-controls="pxpMobileNav">
                        <div class="pxp-line-1"></div>
                        <div class="pxp-line-2"></div>
                        <div class="pxp-line-3"></div>
                    </a>
                    <div class="offcanvas offcanvas-start pxp-nav-mobile-container pxp-is-dashboard" tabindex="-1" id="pxpMobileNav">
                        <div class="offcanvas-header">
                            <div class="pxp-logo">
                                <a href="index.html" class="pxp-animate"><span style="color: var(--pxpMainColor)">j</span>obster</a>
                            </div>
                            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body">
                            <nav class="pxp-nav-mobile">
                                <ul class="navbar-nav justify-content-end flex-grow-1">
                                    <li class="pxp-dropdown-header">Enterprise tools</li>
                                    <li class="nav-item"><a href="/ITJob/EnterpriseDashBoard"><span class="fa fa-home"></span>Dashboard</a></li>
                                    <li class="nav-item"><a href="/ITJob/EnterpriseDashBoard/EditProfile"><span class="fa fa-pencil"></span>Edit Profile</a></li>
                                    <li class="nav-item"><a href="/ITJob/PostJob"><span class="fa fa-file-text-o"></span>New Job Offer</a></li>
                                    <li class="nav-item"><a href="/ITJob/ManageJob"><span class="fa fa-briefcase"></span>Manage Jobs</a></li>
                                    <li class="nav-item"><a href="/ITJob/Applicant"><span class="fa fa-user-circle-o"></span>Candidates</a></li>
                                    <li class="nav-item"><a href="/ITJob/profilepass"><span class="fa fa-lock"></span>Change Password</a></li>
                                    <li class="pxp-dropdown-header mt-4">Insights</li>
                                    <li class="nav-item">
                                        <a href="company-dashboard-inbox.html" class="d-flex justify-content-between align-items-center">
                                            <div><span class="fa fa-envelope-o"></span>Inbox</div>
                                            <span class="badge rounded-pill">14</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="company-dashboard-notifications.html" class="d-flex justify-content-between align-items-center">
                                            <div><span class="fa fa-bell-o"></span>Notifications</div>
                                            <span class="badge rounded-pill">5</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                <nav class="pxp-user-nav pxp-on-light">
                    <c:if test="<%= status == 2 || status == 3%>">

                        <a href="/ITJob/PostJob" class="btn rounded-pill pxp-nav-btn">Post a Job</a>
                    </c:if>
                    <div class="dropdown pxp-user-nav-dropdown pxp-user-notifications">
                        <a role="button" class="dropdown-toggle" data-bs-toggle="dropdown">
                            <span class="fa fa-bell-o"></span>
                            <div class="pxp-user-notifications-counter">5</div>
                        </a>
                    </div>
                    <div class="dropdown pxp-user-nav-dropdown">
                        <a href="index.html" class="dropdown-toggle" data-bs-toggle="dropdown">
                            <div class="pxp-user-nav-avatar pxp-cover" style="background-image: url(/ITJob/<%= imgUrl%>);"></div>
                            <div class="pxp-user-nav-name d-none d-md-block"><%= displayName%></div>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <% if ("jobseeker".equals(userRole) || "enterprise".equals(userRole)) { %>
                            <li><a class="dropdown-item" href="/ITJob/EnterpriseDashBoard/EditProfile">Edit Profile</a></li>
                                <% } %>
                                <% if ("enterprise".equals(userRole) || "admin".equals(userRole)) {%>
                            <li><a class="dropdown-item" href="<%="/ITJob/EnterpriseDashBoard"%>">Dashboard</a></li>
                                <% } %>
                            <li><a class="dropdown-item" href="/ITJob/Logout">Logout</a></li>
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

            <div class="pxp-dashboard-content-details">
                <h1>Edit Profile</h1>
                <p class="pxp-text-light">Edit your company profile page info.</p>

                <form action="EditProfile" method="POST" enctype="multipart/form-data">
                    <div class="row mt-4 mt-lg-5">
                        <div class="col-xxl-8">
                            <div class="mb-3">
                                <label for="pxp-company-name" class="form-label">Full Company name</label>
                                <input type="text" value="${enterpriseAccount.fullCompanyName}" name="fullCompanyName" id="pxp-company-name" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label for="pxp-company-shortName" class="form-label" >Short Company name</label>
                                <input type="text" value="${enterpriseAccount.shortName}" name="shortName" id="pxp-company-shortName" class="form-control" placeholder="Short Company Name">
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="mb-3">
                                        <label for="pxp-company-email" class="form-label">Email</label>
                                        <input type="email" name="email" value="${enterpriseAccount.emailContact}" id="pxp-company-email" class="form-control" >
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="mb-3">
                                        <label for="pxp-company-phone" class="form-label">Phone number</label>
                                        <input type="tel" name="phoneNumber" value="${enterpriseAccount.phoneContact}" id="pxp-company-phone" class="form-control">
                                    </div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="pxp-company-taxcode" class="form-label">Taxcode</label>
                                <input type="text" value="${enterpriseAccount.taxCode}" id="pxp-company-taxcode" class="form-control" placeholder="0xxx..." name="taxcode">
                            </div>        





                            <div>
                                <div class="col-sm">
                                    <input type="file"  name="blFront" id="blFront">
                                    <label for="blFront" class="pxp-cover">Bussiness Lisence Front</label>


                                </div>
                                <br>
                                <div class="col-sm">
                                    <input type="file"  name="blBack" id="blBack">
                                    <label for="blBack"  class="pxp-cover">Bussiness Lisence Back</label>
                                </div>
                            </div>
                            <br>
                            <div class="mb-3">
                                <label for="pxp-company-website" class="form-label">Website</label>
                                <input type="url" value="${enterpriseAccount.websiteUrl}" id="pxp-company-website" class="form-control" placeholder="https://" name="websiteUrl">
                            </div>
                        </div>


                        <div class="col-xxl-4">
                            <div class="form-label">&nbsp;</div>
                            <div class="pxp-company-cover mb-3">
                                <input  name="logoUrl" type="file" id="pxp-company-cover-choose-file" >
                                <label for="pxp-company-cover-choose-file" class="pxp-cover"><span>Upload Logo Url</span></label>

                            </div>
                            <div class="col-sm">
                                <input type="file" id="pxp-company-logo-choose-file" name="imageUrl">
                                <label for="pxp-company-logo-choose-file" class="pxp-cover">Image Url</label>
                            </div>

                        </div>


                        <div class="mb-3">
                            <label for="pxp-company-about" class="form-label">About the company</label>
                            <textarea  class="form-control" id="pxp-company-about" name="description" placeholder="Type your info here...">${enterpriseAccount.description}</textarea>
                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="pxp-company-founded" class="form-label">Founded in</label>
                                    <input value="${enterpriseAccount.foundedYear}" type="number" id="pxp-company-founded" class="form-control" placeholder="E.g. 2001" name="foundedYear">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="pxp-company-size" class="form-label">Enterprise size</label>
                                    <select name="enterpriseSize" id="pxp-company-size" class="form-select">
                                        <option value="1" ${enterpriseAccount.enterpriseSizeDetail.id==1 ? "selected" : ""}>&lt; Less than 10</option>
                                        <option value="2" ${enterpriseAccount.enterpriseSizeDetail.id==2 ? "selected" : ""}>From 10 to 50</option>
                                        <option value="3" ${enterpriseAccount.enterpriseSizeDetail.id==3 ? "selected" : ""}>From 50 to 100</option>
                                        <option value="4" ${enterpriseAccount.enterpriseSizeDetail.id==4 ? "selected" : ""} >From 100 to 500</option>
                                        <option value="5" ${enterpriseAccount.enterpriseSizeDetail.id==5 ? "selected" : ""}>&gt; More than 500</option>
                                    </select>

                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="pxp-company-enterpriseType" class="form-label">Enterprise Type</label>
                                    <select name="enterpriseType" id="pxp-company-enterpriseType" class="form-select">
                                        <option value="1"  ${enterpriseAccount.companyTypeDetail.id.equals("1") ? "selected" : ""}  >PRODUCT</option>
                                        <option value="2"  ${enterpriseAccount.companyTypeDetail.id.equals("2") ? "selected" : ""} >OUTSOURCE</option>
                                    </select> 
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="pxp-company-workingDay" class="form-label">Working Day</label>
                                    <input value="${enterpriseAccount.getWorkingday()}" type="number" name="workingDay" id="pxp-company-workingDay" class="form-control" placeholder="E.g. 4" >
                                </div>
                            </div>
                        </div>               



                        <div class="mt-4 mt-lg-5">
                            <h2>Company Location</h2>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="pxp-company-country" class="form-label">Country/State</label>
                                        <input type="text" value="${enterpriseAccount.country}" name="country" id="pxp-company-country" class="form-control" placeholder="E.g. VietNam">
                                    </div>
                                </div>

                            </div>
                            <div class="mb-3">
                                <label for="pxp-company-address" class="form-label">Address</label>
                                <input type="text" value="${enterpriseAccount.address}" name="fullAddress" id="pxp-company-address" class="form-control" placeholder="Type full address here...">
                            </div>
                        </div>

                        <div class="mt-4 mt-lg-5">
                            <h2>Social Media</h2>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="pxp-company-facebook" class="form-label">Facebook</label>
                                        <input value="${enterpriseAccount.facebookUrl}" type="url" id="pxp-company-facebook" name="facebookLink" class="form-control" placeholder="https://">
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="mt-4 mt-lg-5">
                            <button type="submit" class="btn rounded-pill pxp-section-cta">Save Profile</button>
                        </div>
                </form>
            </div>

            <footer>
                <div class="pxp-footer-copyright pxp-text-light"></div>
            </footer>
        </div>

        <script src="../js/jquery-3.4.1.min.js"></script>
        <script src="../js/bootstrap.bundle.min.js"></script>
        <script src="../js/owl.carousel.min.js"></script>
        <script src="../js/nav.js"></script>
        <script src="../js/Chart.min.js"></script>
        <script src="../js/main.js"></script>
    </body>
</html>