<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <title>Jobster - Company dashboard - Accounts</title>
    </head>
    <body style="background-color: var(--pxpMainColorLight);">
        <div class="pxp-preloader"><span>Loading...</span></div>

        <div class="pxp-dashboard-side-panel d-none d-lg-block">
            <div class="pxp-logo">
                <a href="/ITJob/Home" class="pxp-animate"><span style="color: var(--pxpMainColor)">j</span>obster</a>
            </div>

            <nav class="mt-3 mt-lg-4 d-flex justify-content-between flex-column pb-100">
                <div class="pxp-dashboard-side-label">Admin tools</div>
                <ul class="list-unstyled">
                    <li class="pxp-active"><a href="/ITJob/AdminDashboard"><span class="fa fa-home"></span>Dashboard</a></li>
                    <li><a href="/ITJob/ManageEnterpriseRequest"><span class="fa fa-file-text-o"></span>Enterprise Request</a></li>
                    <li><a href="/ITJob/ManageUser"><span class="fa fa-briefcase"></span>Manage User</a></li>

                    <li><a href="/ITJob/ManageTag"><span class="fa fa-briefcase"></span>Manage Tag</a></li>
                    <li><a href="/ITJob/AdminManageJob"><span class="fa fa-briefcase"></span>Manage Job</a></li>
                    <li><a href="/ITJob/ViewReportJob"><span class="fa fa-briefcase"></span>Manage Job Report</a></li>
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
                <div class="pxp-dashboard-side-user-nav">
                    <div class="dropdown pxp-dashboard-side-user-nav-dropdown dropup">
                        <a role="button" class="dropdown-toggle" data-bs-toggle="dropdown">
                            <div class="pxp-dashboard-side-user-nav-avatar pxp-cover" style="background-image: url(images/admin.png);"></div>
                            <div class="pxp-dashboard-side-user-nav-name">${sessionScope.account.username}</div>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/ITJob/AdminDashboard">Dashboard</a></li>
                            <li><a class="dropdown-item" href="company-dashboard-profile.html">Edit profile</a></li>
                            <li><a class="dropdown-item" href="/ITJob/Logout">Logout</a></li>
                        </ul>
                    </div>
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
                                <a href="/ITJob/Home" class="pxp-animate"><span style="color: var(--pxpMainColor)">j</span>obster</a>
                            </div>
                            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body">
                            <nav class="pxp-nav-mobile">
                                <ul class="navbar-nav justify-content-end flex-grow-1">
                                    <li class="pxp-dropdown-header">Admin tools</li>
                                    <li class="nav-item pxp-active"><a href="/ITJob/AdminDashboard"><span class="fa fa-home"></span>Dashboard</a></li>
                                    <li class="nav-item"><a href="/ITJob/ManageEnterpriseRequest"><span class="fa fa-pencil"></span>Enterprise Request</a></li>
                                    <li class="nav-item"><a href="/ITJob/ManageUser"><span class="fa fa-file-text-o"></span>Manage User</a></li>
                                    <li class="nav-item"><a href="#"><span class="fa fa-briefcase"></span>Manage Tag</a></li>
                                    <li class="nav-item"><a href="#"><span class="fa fa-user-circle-o"></span>Manage Job</a></li>
                                    <li class="nav-item"><a href="#"><span class="fa fa-credit-card"></span>Manage Job Report</a></li>
                                    <li class="nav-item"><a href="#"><span class="fa fa-credit-card"></span>Edit Profile</a></li>
                                    <li class="nav-item"><a href="/ITJob/profilepass"><span class="fa fa-lock"></span>Change Password</a></li>
                                    <li class="pxp-dropdown-header mt-4">Insights</li>
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
                    <div class="dropdown pxp-user-nav-dropdown pxp-user-notifications">

                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="company-dashboard-notifications.html"><strong>Scott Goodwin</strong> applied for <strong>Software Engineer</strong>. <span class="pxp-is-time">20m</span></a></li>
                            <li><a class="dropdown-item" href="company-dashboard-notifications.html"><strong>Alayna Becker</strong> sent you a message. <span class="pxp-is-time">1h</span></a></li>
                            <li><a class="dropdown-item" href="company-dashboard-notifications.html"><strong>Erika Tillman</strong> applied for <strong>Team Leader</strong>. <span class="pxp-is-time">2h</span></a></li>
                            <li><a class="dropdown-item" href="company-dashboard-notifications.html"><strong>Scott Goodwin</strong> applied for <strong>Software Engineer</strong>. <span class="pxp-is-time">5h</span></a></li>
                            <li><a class="dropdown-item" href="company-dashboard-notifications.html"><strong>Alayna Becker</strong> sent you a message. <span class="pxp-is-time">1d</span></a></li>
                            <li><a class="dropdown-item" href="company-dashboard-notifications.html"><strong>Erika Tillman</strong> applied for <strong>Software Engineer</strong>. <span class="pxp-is-time">3d</span></a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item pxp-link" href="company-dashboard-notifications.html">Read All</a></li>
                        </ul>
                    </div>
                    <div class="dropdown pxp-user-nav-dropdown">
                        <a role="button" class="dropdown-toggle" data-bs-toggle="dropdown">
                            <div class="pxp-user-nav-avatar pxp-cover" style="background-image: url(images/admin.png);"></div>
                            <div class="pxp-user-nav-name d-none d-md-block">${sessionScope.account.username}</div>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="/ITJob/AdminDashboard">Dashboard</a></li>
                            <li><a class="dropdown-item" href="company-dashboard-profile.html">Edit profile</a></li>
                            <li><a class="dropdown-item" href="/ITJob/Logout">Logout</a></li>
                        </ul>
                    </div>
                </nav>
            </div>

            <div class="pxp-dashboard-content-details">
                <h1>Dashboard</h1>
                <p class="pxp-text-light">Welcome to Jobster!</p>

                <div class="row mt-4 mt-lg-5 align-items-center">
                    <div class="col-sm-6 col-xxl-3">
                        <div class="pxp-dashboard-stats-card bg-primary bg-opacity-10 mb-3 mb-xxl-0">
                            <div class="pxp-dashboard-stats-card-icon text-primary">
                                <span class="fa fa-file-text-o"></span>
                            </div>
                            <div class="pxp-dashboard-stats-card-info">
                                <div class="pxp-dashboard-stats-card-info-number">${requestScope.numJob}</div>
                                <div class="pxp-dashboard-stats-card-info-text pxp-text-light">Jobs posted</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xxl-3">
                        <div class="pxp-dashboard-stats-card bg-primary bg-opacity-10 mb-3 mb-xxl-0">
                            <div class="pxp-dashboard-stats-card-icon text-success">
                                <span class="fa fa-book"></span>
                            </div>
                            <div class="pxp-dashboard-stats-card-info">
                                <div class="pxp-dashboard-stats-card-info-number">${requestScope.numApp}</div>
                                <div class="pxp-dashboard-stats-card-info-text pxp-text-light">Applications</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xxl-3">
                        <div class="pxp-dashboard-stats-card bg-primary bg-opacity-10 mb-3 mb-xxl-0">
                            <div class="pxp-dashboard-stats-card-icon text-warning">
                                <span class="fa fa-user-circle-o"></span>
                            </div>
                            <div class="pxp-dashboard-stats-card-info">
                                <div class="pxp-dashboard-stats-card-info-number">${requestScope.numJobseeker}</div>
                                <div class="pxp-dashboard-stats-card-info-text pxp-text-light">Jobseekers</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xxl-3">
                        <div class="pxp-dashboard-stats-card bg-primary bg-opacity-10 mb-3 mb-xxl-0">
                            <div class="pxp-dashboard-stats-card-icon text-danger">
                                <span class="fa fa-building-o"></span>
                            </div>
                            <div class="pxp-dashboard-stats-card-info">
                                <div class="pxp-dashboard-stats-card-info-number">${requestScope.numEnterprise}</div>
                                <div class="pxp-dashboard-stats-card-info-text pxp-text-light">Enterprises</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-4 mt-lg-5">
                    <div class="col-xl-6">
                        <h2>Company Profile Visits</h2>
                        <div class="mt-3 mt-lg-4 pxp-dashboard-chart-container">
                            <div class="row justify-content-between align-content-center mb-4">
                                <div class="col-auto">
                                    <span class="pxp-dashboard-chart-value">154</span><span class="pxp-dashboard-chart-percent text-success"><span class="fa fa-long-arrow-up"></span> 34%</span><span class="pxp-dashboard-chart-vs">vs last 7 days</span>
                                </div>
                                <div class="col-auto">
                                    <select class="form-select">
                                        <option value="-7 days">Last 7 days</option>
                                        <option value="-30 days">Last 30 days</option>
                                        <option value="-60 days">Last 60 days</option>
                                        <option value="-90 days">Last 90 days</option>
                                        <option value="-12 months">Last 12 months</option>
                                    </select>
                                </div>
                            </div>
                            <canvas id="pxp-company-dashboard-visits-chart"></canvas>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <h2 class="mt-4 mt-lg-5 mt-xl-0">Applications</h2>
                        <div class="mt-3 mt-lg-4 pxp-dashboard-chart-container">
                            <div class="row justify-content-between align-content-center mb-4">
                                <div class="col-auto">
                                    <span class="pxp-dashboard-chart-value">280</span><span class="pxp-dashboard-chart-percent text-success"><span class="fa fa-long-arrow-up"></span> 56%</span><span class="pxp-dashboard-chart-vs">vs last 7 days</span>
                                </div>
                                <div class="col-auto">
                                    <select class="form-select">
                                        <option value="-7 days">Last 7 days</option>
                                        <option value="-30 days">Last 30 days</option>
                                        <option value="-60 days">Last 60 days</option>
                                        <option value="-90 days">Last 90 days</option>
                                        <option value="-12 months">Last 12 months</option>
                                    </select>
                                </div>
                            </div>
                            <canvas id="pxp-company-dashboard-app-chart"></canvas>
                        </div>
                    </div>
                </div>

                

                
            </div>

            <footer>
                <div class="pxp-footer-copyright pxp-text-light"></div>
            </footer>
        </div>

        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/nav.js"></script>
        <script src="js/Chart.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
