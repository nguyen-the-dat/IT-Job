<%-- 
    Document   : appliedJob
    Created on : Feb 4, 2024, 11:24:39 PM
    Author     : Admin
--%>
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
                    <li><a href="/ITJob/AdminDashboard"><span class="fa fa-home"></span>Dashboard</a></li>
                    <li><a href="/ITJob/ManageEnterpriseRequest"><span class="fa fa-file-text-o"></span>Enterprise Request</a></li>
                    <li><a href="/ITJob/ManageUser"><span class="fa fa-briefcase"></span>Manage User</a></li>

                    <li><a href="/ITJob/ManageTag"><span class="fa fa-briefcase"></span>Manage Tag</a></li>
                    <li><a href="/ITJob/AdminManageJob"><span class="fa fa-briefcase"></span>Manage Job</a></li>
                    <li class="pxp-active"><a href="/ITJob/ViewReportJob"><span class="fa fa-briefcase"></span>Manage Job Report</a></li>
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
                                    <li class="nav-item"><a href="ViewReportJob"><span class="fa fa-credit-card"></span>Manage Job Report</a></li>
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
                <h1>Reports</h1>
                <p class="pxp-text-light">Report management for admin.</p>

                <div class="mt-4 mt-lg-5">
                    <div class="row justify-content-between align-content-center">
                        <div class="col-auto order-2 order-sm-1">
                            <div class="pxp-company-dashboard-jobs-bulk-actions mb-3">
                                <c:set var="typeId" value="${requestScope.typeId}"></c:set>
                                    <select name="viewby" class="form-select">
                                        <option value="0" ${typeId==0? "selected" : ""} >All</option>
                                    <option value="1" ${typeId==1? "selected" : ""}  >Virtual job or does not exist in reality</option>
                                    <option value="2" ${typeId==2  ? "selected" : ""}>There are signs of fraud</option>
                                    <option value="3" ${typeId==3 ? "selected" : ""}>Impersonate another enterprise</option>
                                    <option value="4" ${typeId==4 ? "selected" : ""} >Violating community guidelines</option>
                                </select>
                                <button class="btn ms-2">Filter</button>

                            </div>
                        </div>
                        <!--                        <div class="col-auto order-1 order-sm-2">
                                                    <div class="pxp-company-dashboard-jobs-search mb-3">
                                                        <div class="pxp-company-dashboard-jobs-search-results me-3">4 accounts</div>
                                                        <div class="pxp-company-dashboard-jobs-search-search-form">
                                                            <div class="input-group">
                                                                <span class="input-group-text"><span class="fa fa-search"></span></span>
                                                                <input type="text" class="form-control" placeholder="Search candidates...">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>-->
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover align-middle ">
                            <thead>
                                <tr>
                                    <th style="width: 1%;">#</th>
                                    <th colspan="2" style="width: 10%;">Author</th>
                                    <th style="width: 25%;">Report</th>
                                    <th style="width: 10%;">Job Link</th>
                                    <th style="width: 10%;">Company Name</th>
                                    <th style="width: 10%;">Report type</th>
                                    <th style="width: 10%;">Time Report</th>
                                    <!--                                    <th style="width: 5%;">Status</th>
                                                                        <th>Action</th>-->
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="count" value="${1}"></c:set>
                                <c:forEach items="${sessionScope.listReport}" var="p">
                                    <tr>
                                        <td>${count}</td>
                                        <c:set var="count" value="${count+1}"></c:set>
                                            <td style="width: 3%;">
                                                <div class="pxp-company-dashboard-candidate-avatar pxp-cover" style="background-image: url(${p.account.imgUrl});"></div>
                                        </td>
                                        <td style="width: 10%;">
                                            <a href="#">
                                                <div class="pxp-company-dashboard-job-title">${p.account.username}</div>
                                            </a>
                                        </td>
                                        <td>
                                            <div class="pxp-company-dashboard-job-category">${p.report.content}</div>
                                        </td>
                                        <td><a href="JobDetail?jobId=${p.job.id}">
                                                <div class="pxp-company-dashboard-job-title">${p.job.title}</div>
                                            </a></td>

                                        <td>
                                            <div class="pxp-company-dashboard-job-date">${p.enterprise.shortName}</div>
                                        </td>
                                        <td><div class="pxp-company-dashboard-job-category">
                                                <c:choose>

                                                    <c:when test = "${p.report.reportTypeId==1}">
                                                        Virtual job or does not exist in reality
                                                    </c:when>

                                                    <c:when test = "${p.report.reportTypeId==2}">
                                                        There are signs of fraud
                                                    </c:when>
                                                    <c:when test = "${p.report.reportTypeId==3}">
                                                        Impersonate another enterprise
                                                    </c:when>
                                                    <c:when test = "${p.report.reportTypeId==4}">
                                                        Violating community guidelines
                                                    </c:when>
                                                    <c:otherwise>
                                                        No comment sir...
                                                    </c:otherwise>
                                                </c:choose>
                                            </div></td>

                                        <td><div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-success">${p.time}</span></div></td>
                                        <td>
                                            <div class="pxp-dashboard-table-options">
                                                <ul class="list-unstyled">
                                                    <li><button type="button" data-username="${count}" title="Unban" class="btn-ban" data-bs-toggle="modal" data-bs-target="#ViewReport${count}" ><span class="fa fa-eye"></span></button></li>

                                                </ul>
                                            </div>
                                        </td>
                                <div class="modal fade modal-dialog-scrollable" id="ViewReport${count}" tabindex="-1" aria-labelledby="ViewReportLabel${count}" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">

                                            <div class="modal-header ">
                                                <h5 class="modal-title w-100 text-center" id="banAccountModalLabel">Report Detail</h5>
                                                <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <label for="banDurationValue"><p>${p.report.content}</p></label>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                                </tr>

                            </c:forEach>

                            <!--                                <tr>
                                                                <td>1</td>
                                                                <td style="width: 3%;">
                                                                    <div class="pxp-company-dashboard-candidate-avatar pxp-cover" style="background-image: url(images/avatar-1.jpg);"></div>
                                                                </td>
                                                                <td>
                                                                    <a href="#">
                                                                        <div class="pxp-company-dashboard-job-title">Nguyen Van A</div>
                                                                    </a>
                                                                </td>
                                                                <td>
                                                                    <div class="pxp-company-dashboard-job-category">nguyenvana</div>
                                                                </td>
                                                                <td><div class="pxp-company-dashboard-job-category">Job Seeker</div></td>
                                                                <td><div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-info">Basic</span></div></td>
                                                                <td>
                                                                    <div class="pxp-company-dashboard-job-date">01/01/2024 06:08:00</div>
                                                                </td>
                                                                <td><div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-success">Active</span></div></td>
                                                                <td>
                                                                    <div class="pxp-dashboard-table-options">
                                                                        <ul class="list-unstyled">
                                                                            <li><button title="View details"><span class="fa fa-eye"></span></button></li>
                                                                            <li><button title="Ban"><span class="fa fa-ban"></span></button></li>
                                                                            <li><button title="Delete"><span class="fa fa-trash-o"></span></button></li>
                                                                        </ul>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>2</td>
                                                                <td style="width: 3%;">
                                                                    <div class="pxp-company-dashboard-candidate-avatar pxp-cover" style="background-image: url(images/avatar-2.jpg);"></div>
                                                                </td>
                                                                <td>
                                                                    <a href="#">
                                                                        <div class="pxp-company-dashboard-job-title">Nguyen Van B</div>
                                                                    </a>
                                                                </td>
                                                                <td>
                                                                    <div class="pxp-company-dashboard-job-category">nguyenvanb</div>
                                                                </td>
                                                                <td><div class="pxp-company-dashboard-job-category">Enterprise</div></td>
                                                                <td><div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-warning">Premium</span></div></td>
                                                                <td>
                                                                    <div class="pxp-company-dashboard-job-date">01/01/2024 06:08:00</div>
                                                                </td>
                                                                <td><div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-danger">Banned</span></div></td>
                                                                <td>
                                                                    <div class="pxp-dashboard-table-options">
                                                                        <ul class="list-unstyled">
                                                                            <li><button title="View details"><span class="fa fa-eye"></span></button></li>
                                                                            <li><button title="Unban"><span class="fa fa-check"></span></button></li>
                                                                            <li><button title="Delete"><span class="fa fa-trash-o"></span></button></li>
                                                                        </ul>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>3</td>
                                                                <td style="width: 3%;">
                                                                    <div class="pxp-company-dashboard-candidate-avatar pxp-cover" style="background-image: url(images/avatar-3.jpg);"></div>
                                                                </td>
                                                                <td>
                                                                    <a href="#">
                                                                        <div class="pxp-company-dashboard-job-title">Nguyen Van C</div>
                                                                    </a>
                                                                </td>
                                                                <td>
                                                                    <div class="pxp-company-dashboard-job-category">nguyenvanc</div>
                                                                </td>
                                                                <td><div class="pxp-company-dashboard-job-category">Admin</div></td>
                                                                <td><div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-warning">Premium</span></div></td>
                                                                <td>
                                                                    <div class="pxp-company-dashboard-job-date">01/01/2024 06:08:00</div>
                                                                </td>
                                                                <td><div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-success">Active</span></div></td>
                                                                <td>
                                                                    <div class="pxp-dashboard-table-options">
                                                                        <ul class="list-unstyled">
                                                                            <li><button title="View details"><span class="fa fa-eye"></span></button></li>
                                                                            <li><button title="Ban"><span class="fa fa-ban"></span></button></li>
                                                                            <li><button title="Delete"><span class="fa fa-trash-o"></span></button></li>
                                                                        </ul>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>4</td>
                                                                <td style="width: 3%;">
                                                                    <div class="pxp-company-dashboard-candidate-avatar pxp-cover" style="background-image: url(images/avatar-4.jpg);"></div>
                                                                </td>
                                                                <td>
                                                                    <a href="#">
                                                                        <div class="pxp-company-dashboard-job-title">Nguyen Van D</div>
                                                                    </a>
                                                                </td>
                                                                <td>
                                                                    <div class="pxp-company-dashboard-job-category">nguyenvand</div>
                                                                </td>
                                                                <td><div class="pxp-company-dashboard-job-category">Enterprise</div></td>
                                                                <td><div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-info">Basic</span></div></td>
                                                                <td>
                                                                    <div class="pxp-company-dashboard-job-date">01/01/2024 06:08:00</div>
                                                                </td>
                                                                <td><div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-success">Active</span></div></td>
                                                                <td>
                                                                    <div class="pxp-dashboard-table-options">
                                                                        <ul class="list-unstyled">
                                                                            <li><button title="View details"><span class="fa fa-eye"></span></button></li>
                                                                            <li><button title="Unban"><span class="fa fa-check"></span></button></li>
                                                                            <li><button title="Delete"><span class="fa fa-trash-o"></span></button></li>
                                                                        </ul>
                                                                    </div>
                                                                </td>
                                                            </tr>-->
                            </tbody>
                        </table>

                        <div class="row mt-4 mt-lg-5 justify-content-between align-items-center w-100">
                            <div class="col-auto">
                                <nav class="mt-3 mt-sm-0" aria-label="Accounts pagination">
                                    <ul class="pagination pxp-pagination">
                                        <c:set var="totalPage" value="${requestScope.totalPages}"></c:set>
                                        <c:set var="currentIndex" value="${requestScope.currentPage}"></c:set>
                                        <c:forEach var="page" begin="1" end="${totalPage}">

                                            <c:if test="${currentIndex==page}">
                                                <li class="page-item active" aria-current="page">
                                                    <a class="page-link" href="ViewReportJob?pageIndex=${page}">${page}</a>
                                                </li>
                                            </c:if>

                                            <c:if test="${currentIndex!=page}">

                                                <li class="page-item"><a class="page-link" href="ViewReportJob?pageIndex=${page}">${page}</a></li>
                                                </c:if>
                                            </c:forEach>

                                    </ul>
                                </nav>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <footer>
                <div class="pxp-footer-copyright pxp-text-light"></div>
            </footer>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var filterButton = document.querySelector(".pxp-company-dashboard-jobs-bulk-actions button.btn");
                filterButton.addEventListener("click", function () {
                    var selectElement = document.querySelector(".pxp-company-dashboard-jobs-bulk-actions select[name='viewby']");
                    var selectedValue = selectElement.value;
                    var url = "ViewReportJob?viewby=" + selectedValue;
                    window.location.href = url;
                });
            });

        </script>                           
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/nav.js"></script>
        <script src="js/Chart.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
