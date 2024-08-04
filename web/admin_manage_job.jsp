<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <li><a href="/ITJob/AdminDashboard"><span class="fa fa-home"></span>Dashboard</a></li>
                    <li><a href="/ITJob/ManageEnterpriseRequest"><span class="fa fa-file-text-o"></span>Enterprise Request</a></li>
                    <li><a href="/ITJob/ManageUser"><span class="fa fa-briefcase"></span>Manage User</a></li>

                    <li><a href="/ITJob/ManageTag"><span class="fa fa-briefcase"></span>Manage Tag</a></li>
                    <li  class="pxp-active"><a href="/ITJob/AdminManageJob"><span class="fa fa-briefcase"></span>Manage Job</a></li>
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

                <h1>Manage Jobs</h1>
                <p class="pxp-text-light">Detailed list with all your job offers.</p>

                <div class="mt-4 mt-lg-5">

                    <form action="/ITJob/AdminManageJob" method="GET">
                        <div style="display:flex; flex-direction: row; gap: 2%">
                            <div class="col-auto order-2 order-sm-1">
                                <div class="pxp-company-dashboard-jobs-bulk-actions mb-3">
                                    <select class="form-select" style="width: 200px" name="filterType">
                                        <option value="0" ${curFilterType == 0 ? 'selected' : ''}>All</option>
                                        <option value="1" ${curFilterType == 1 ? 'selected' : ''}>FULL TIME</option>
                                        <option value="2" ${curFilterType == 2 ? 'selected' : ''}>PART TIME</option>
                                        <option value="3" ${curFilterType == 3 ? 'selected' : ''}>INTERN</option>
                                        <option value="4" ${curFilterType == 4 ? 'selected' : ''}>REMOTE</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-auto order-1 order-sm-2">
                                <div class="pxp-company-dashboard-jobs-search mb-3" style="flex-grow: 2">
                                    <div class="pxp-company-dashboard-jobs-bulk-actions mb-3">
                                        <select class="form-select" style="width: 300px" name="filterStatus">
                                            <option value="0" ${curFilterStatus == 0 ? 'selected' : ''}>All</option>
                                            <option value="1" ${curFilterStatus == 1 ? 'selected' : ''}>Published</option>
                                            <option value="2" ${curFilterStatus == 2 ? 'selected' : ''}>Pending Deletion</option>
                                            <option value="3" ${curFilterStatus == 3 ? 'selected' : ''}>Rejected</option>
                                            <option value="4" ${curFilterStatus == 4 ? 'selected' : ''}>Draft</option>
                                        </select>
                                        <button class="btn ms-2" name="btnFilter" type="submit" value="1">Apply</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead>
                                <tr>
                                    <th style="width: 25%;">Job</th>
                                    <th style="width: 20%;">Skills</th>
                                    <th style="width: 8%;">Type</th>
                                    <th style="width: 12%;">Applications</th>
                                    <th style="width: 12%;">Date<span class="fa fa-angle-up ms-3"></span></th>
                                    <th style="width: 10%;">Status</th>
                                    <th style="width: 18%;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listJobs}" var="job">
                                    <tr>
                                        <td>
                                            <a href="#">
                                                <div class="pxp-company-dashboard-job-title">${job.title}</div>
                                                <div class="pxp-company-dashboard-job-location"><span class="fa fa-globe me-1"></span>${job.address}</div>
                                            </a>
                                        </td>
                                        <td><div class="pxp-company-dashboard-job-category">${job.skills}</div></td>
                                        <td><div class="pxp-company-dashboard-job-type">${job.jobTypeDetail.jobType}</div></td>
                                        <td><div href="#" class="pxp-company-dashboard-job-applications">${requestScope.ad.getNumApplicationById(job.id)} Candidates</div></td>
                                        <td>
                                            <div class="pxp-company-dashboard-job-date mt-1">${job.createdTime}</div>
                                        </td>
                                        <td>
                                            <c:if test="${job.statusJobDetail.id == 1}">
                                                <div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-success">${job.statusJobDetail.statusJob}</span></div>
                                                </c:if>
                                                <c:if test="${job.statusJobDetail.id == 2}">
                                                <div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-warning">${job.statusJobDetail.statusJob}</span></div>
                                                </c:if>
                                                <c:if test="${job.statusJobDetail.id == 3}">
                                                <div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-danger">${job.statusJobDetail.statusJob}</span></div>
                                                </c:if>    
                                                <c:if test="${job.statusJobDetail.id == 4}">
                                                <div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-secondary">${job.statusJobDetail.statusJob}</span></div>
                                                </c:if>
                                        </td>

                                        <td>
                                            <div class="pxp-dashboard-table-options">
                                                <c:if test="${job.statusJobDetail.id == 1 || job.statusJobDetail.id == 4}">
                                                    <ul class="list-unstyled" style="justify-content: flex-start;">
                                                        <li><a onclick="changeConfirm(${job.id})"><button title="Change"><span class="fa fa-ban"></span></button></a></li>

                                                        <c:if test="${job.statusJobDetail.id == 1}">
                                                            <li><a href="JobDetail?jobId=${job.id}"><button title="Preview"><span class="fa fa-eye"></span></button></a></li>
                                                                    </c:if>
                                                    </ul>
                                                </c:if>
                                                <c:if test="${job.statusJobDetail.id == 2}">
                                                    <div class="pxp-company-dashboard-job-date mt-1"> Delete time:</div>
                                                    <div class="pxp-company-dashboard-job-date mt-1">
                                                        <fmt:formatDate value="${job.deletedTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                    </div>
                                                </c:if>
                                                <c:if test="${job.statusJobDetail.id == 3}">
                                                    <ul class="list-unstyled" style="justify-content: flex-start;">
                                                        <li><a onclick="changeConfirm(${job.id})"><button title="Change"><span class="fa fa-check-circle"></span></button></a></li>
                                                    </ul>
                                                </c:if>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

            <footer>
                <div class="pxp-footer-copyright pxp-text-light"></div>
            </footer>
        </div>

        <script>
            function changeConfirm(id) {
                var url = "/ITJob/ChangeStatusJob?id=" + id;
                var result = confirm("Are you sure you want to change status the job?");
                if (result) {
                    window.location.href = url;
                }
            }
        </script>                              
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/nav.js"></script>
        <script src="js/Chart.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
