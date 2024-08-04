<%-- 
    Document   : appliedJob
    Created on : Feb 4, 2024, 11:24:39 PM
    Author     : Admin
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
                    <li class="pxp-active"><a href="/ITJob/ManageUser"><span class="fa fa-briefcase"></span>Manage User</a></li>

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
                <h1>Manage User</h1>
                <p class="pxp-text-light">Account management for admin.</p>

                <div class="mt-4 mt-lg-5">
                    <div class="row justify-content-between align-content-center">
                        <div class="col-auto order-2 order-sm-1">
                            <form action="ManageUser">
                                <div class="pxp-company-dashboard-jobs-bulk-actions mb-3">
                                    <select class="form-select" name="role">
                                        <option value="0">All</option>
                                        <option value="2" ${requestScope.role == 2 ? 'selected' : ''}>Job Seeker</option>
                                        <option value="1" ${requestScope.role == 1 ? 'selected' : ''}>Enterprise</option>
                                        <option value="3" ${requestScope.role == 3 ? 'selected' : ''}>Admin</option>
                                    </select>
                                    <button type="submit" class="btn ms-2">Filter</button>
                                </div>
                            </form>
                        </div>
                        <c:set var="size" value="${requestScope.accounts.size()}"/>
                        <div class="col-auto order-1 order-sm-2">
                            <div class="pxp-company-dashboard-jobs-search mb-3">
                                <div class="pxp-company-dashboard-jobs-search-results me-3" >${size} account</div>
                                <div class="pxp-company-dashboard-jobs-search-search-form">
                                    <form action="ManageUser">
                                        <div class="input-group">                                       
                                            <input type="text" name="searchValue" value="${requestScope.searchValue}" class="form-control" placeholder="Search candidates...">
                                            <button type="submit" class="input-group-text"><span class="fa fa-search"></span></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <c:if test="${not empty sessionScope.notification}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            ${sessionScope.notification}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        <%
                            // Clear the notification after displaying it
                            session.removeAttribute("notification");
                        %>
                    </c:if>
                    <c:if test="${not empty sessionScope.notificationErr}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            ${sessionScope.notificationErr}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        <%
                            // Clear the notification after displaying it
                            session.removeAttribute("notificationErr");
                        %>
                    </c:if>

                    <div class="table-responsive">

                        <table class="table table-hover align-middle ">
                            <thead>
                                <tr>
                                    <th style="width: 1%;">#</th>
                                    <th colspan="2" style="width: 20%;">Name</th>
                                    <th style="width: 15%;">Username</th>
                                    <th style="width: 15%;">Role</th>
                                    <th style="width: 20%;">Password</th>
                                    <th style="width: 5%;">Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody> 

                                <c:forEach var="item" items="${requestScope.accounts}" varStatus="cnt">
                                    <tr>
                                        <td>${cnt.count}</td>
                                        <td style="width: 3%;">
                                            <div class="pxp-company-dashboard-candidate-avatar pxp-cover" style="background-image: url(${item.imgUrl});"></div>
                                        </td>
                                        <td>
                                            <a href="#">
                                                <div class="pxp-company-dashboard-job-title">${item.name}</div>
                                            </a>
                                        </td>
                                        <td><div class="pxp-company-dashboard-job-category">${item.username}</div></td>
                                        <td><div class="pxp-company-dashboard-job-status">
                                                <c:choose>
                                                    <c:when test="${item.roleId == 1}">
                                                        <span class="badge rounded-pill bg-warning">Enterprise</span>
                                                    </c:when>
                                                    <c:when test="${item.roleId == 3}">
                                                        <span class="badge rounded-pill bg-info">Admin</span>
                                                    </c:when>
                                                    <c:when test="${item.roleId == 2}">
                                                        <span class="badge rounded-pill bg-success">jobseeker</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge rounded-pill bg-danger">UNKNOWN</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div></td>
                                        <td>
                                            <div class="pxp-company-dashboard-job-date">${item.password}</div>
                                        </td>
                                        <td><div class="pxp-company-dashboard-job-status">
                                                <c:choose>
                                                    <c:when test="${item.statusId == 1}">
                                                        <span class="badge rounded-pill bg-danger">INACTIVE</span>
                                                    </c:when>
                                                    <c:when test="${item.statusId == 2}">
                                                        <span class="badge rounded-pill bg-success">ACTIVE</span>
                                                    </c:when>
                                                    <c:when test="${item.statusId == 3}">
                                                        <span class="badge rounded-pill bg-danger">BLOCKED</span>
                                                    </c:when>
                                                    <c:when test="${item.statusId == 4}">
                                                        <span class="badge rounded-pill bg-danger">DELETED</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge rounded-pill bg-danger">UNKNOWN</span>
                                                    </c:otherwise>
                                                </c:choose></div></td>

                                        <td>
                                            <div class="pxp-dashboard-table-options">
                                                <ul class="list-unstyled">
                                                    <c:choose>
                                                        <c:when test="${item.statusId == 3}"><li>
                                                            <li><button type="button" data-username="${item.username}" title="Unban" class="btn-ban" data-bs-toggle="modal" data-bs-target="#UnbanAccountModal${item.getUsername()}" ><span class="fa fa-check"></span></button></li>
                                                                </c:when>
                                                                <c:otherwise>
                                                            <li><button type="button" data-username="${item.username}" data-bs-toggle="modal" data-bs-target="#banAccountModal${item.getUsername()}" title="Ban" class="btn-ban"><span class="fa fa-ban"></span></button></li>
                                                                </c:otherwise>
                                                            </c:choose>

                                                    <li><button type="button"  data-bs-toggle="modal" data-bs-target="#deleteAccountModal${fn:replace(fn:replace(item.getUsername(), '@', '_at_'), '.', '_dot_')}-${item.roleId}" title="Delete" class="btn-delete"><span class="fa fa-trash-o"></span></button></li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    <!-- Modal Delete Account -->
                                <div class="modal" id="deleteAccountModal${fn:replace(fn:replace(item.getUsername(), '@', '_at_'), '.', '_dot_')}-${item.roleId}"


                                     tabindex="-1" aria-labelledby="deleteAccountModalLabel${item.getUsername()}-${item.roleId}" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form method="POST" action="ManageUser">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="deleteAccountModalLabel">Confirm delete account</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Are you sure, you want to delete this account?</p>
                                                    <input type="hidden" name="roleId" value="${item.roleId}">
                                                    <input type="hidden" name="username" value="${item.getUsername()}">
                                                    <input type="hidden" name="action" value="delete">
                                                    <input type="password" class="form-control" name="adminPassword" placeholder="Nhập mật khẩu admin" required>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <button type="submit" class="btn btn-danger">Delete account</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- Modal Ban Account -->
                                <div class="modal fade modal-dialog-scrollable" id="banAccountModal${item.getUsername()}" tabindex="-1" aria-labelledby="banAccountModalLabel${item.getUsername()}" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form method="POST" action="ManageUser">
                                                <div class="modal-header ">
                                                    <h5 class="modal-title w-100 text-center" id="banAccountModalLabel">Ban ${item.getUsername()}</h5>
                                                    <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <label for="banDurationValue"><p>Are you sure, you want to ban this account?</p></label>
                                                    <input type="hidden" name="action" value="ban">
                                                    <input type="hidden" name="username" value="${item.getUsername()}">

                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <button type="submit" class="btn bg-danger" >Ban</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- Modal Unban Account -->
                                <div class="modal fade modal-dialog-scrollable" id="UnbanAccountModal${item.getUsername()}" tabindex="-1" aria-labelledby="UnbanAccountModalLabel${item.getUsername()}" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form method="POST" action="ManageUser">
                                                <div class="modal-header ">
                                                    <h5 class="modal-title w-100 text-center" id="UnbanAccountModalLabel">Unban ${item.getUsername()}</h5>
                                                    <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <label for="banDurationValue"><p>Are you sure, you want to ban this account?</p></label>
                                                    <div class="input-group">
                                                        <input type="hidden" name="action" value="unban">
                                                        <input type="hidden" name="username" value="${item.getUsername()}">
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <button type="submit" class="btn bg-success" ">Unban</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            </tbody>


                        </table>
                    </div>


                    <div class="row mt-4 mt-lg-5 justify-content-between align-items-center w-100">
                        <div class="col-auto">
                            <nav class="mt-3 mt-sm-0" aria-label="Jobs list pagination">
                                <ul class="pagination pxp-pagination">
                                    <!-- Disable the "Previous" link if on the first page -->
                                    <c:if test="${currentPage > 1}">
                                        <li class="page-item" aria-current="page">
                                            <a class="page-link" href="${pageContext.request.contextPath}/ManageUser?role=${role}&searchValue=${searchValue}&page=${currentPage - 1}">Previous</a>
                                        </li>
                                    </c:if>

                                    <!-- Display the page numbers as links -->
                                    <c:forEach var="pageNum" begin="1" end="${totalPages}">
                                        <li class="page-item <c:if test='${pageNum == currentPage}'>active</c:if>">
                                            <a class="page-link" href="${pageContext.request.contextPath}/ManageUser?role=${role}&searchValue=${searchValue}&page=${pageNum}">${pageNum}</a>
                                        </li>
                                    </c:forEach>

                                    <!-- Disable the "Next" link if on the last page -->
                                    <c:if test="${currentPage < totalPages}">
                                        <li class="page-item">
                                            <a class="page-link" href="${pageContext.request.contextPath}/ManageUser?role=${role}&searchValue=${searchValue}&page=${currentPage + 1}">Next</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                        <div class="col-auto">
                            <a href="#" class="btn rounded-pill pxp-section-cta mt-3 mt-sm-0">Show me more<span class="fa fa-angle-right"></span></a>
                        </div>
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
