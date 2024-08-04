

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
        <title>Jobster - Company dashboard - Manage Tags</title>
    </head>
    <body style="background-color: var(--pxpMainColorLight);">
        <div class="pxp-preloader"><span>Loading...</span></div>

        <div class="pxp-dashboard-side-panel d-none d-lg-block">
            <div class="pxp-logo">
                <a href="Home" class="pxp-animate"><span style="color: var(--pxpMainColor)">j</span>obster</a>
            </div>

            <nav class="mt-3 mt-lg-4 d-flex justify-content-between flex-column pb-100">
                <div class="pxp-dashboard-side-label">Enterprise tools</div>
                <ul class="list-unstyled">
                    <li><a href="/ITJob/AdminDashboard"><span class="fa fa-home"></span>Dashboard</a></li>
                    <li><a href="/ITJob/ManageEnterpriseRequest"><span class="fa fa-file-text-o"></span>Enterprise Request</a></li>
                    <li><a href="/ITJob/ManageUser"><span class="fa fa-briefcase"></span>Manage User</a></li>
                    <li  class="pxp-active" ><a href="/ITJob/ManageTag"><span class="fa fa-briefcase"></span>Manage Tag</a></li>
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
                <div class="dropdown pxp-user-nav-dropdown">
                    <a href="index.html" class="dropdown-toggle" data-bs-toggle="dropdown">
                        <div class="pxp-user-nav-avatar pxp-cover" style="background-image: url(${requestScope.eDAO.getEnterpriseByAccountId(sessionScope.account.username).logoUrl});"></div>
                        <div style="color: black" class="pxp-user-nav-name d-none d-md-block">${requestScope.eDAO.getEnterpriseByAccountId(sessionScope.account.username).shortName}</div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="/ITJob/EnterpriseDashBoard/EditProfile">Edit Profile</a></li>
                        <li><a class="dropdown-item" href="/ITJob/EnterpriseDashBoard">Dashboard</a></li>
                        <li><a class="dropdown-item" href="Logout">Logout</a></li>
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
                                    <li class="pxp-dropdown-header">Admin tools</li>
                                    <li class="nav-item"><a href="company-dashboard.html"><span class="fa fa-home"></span>Dashboard</a></li>
                                    <li class="nav-item"><a href="company-dashboard-profile.html"><span class="fa fa-pencil"></span>Edit Profile</a></li>
                                    <li class="nav-item"><a href="PostJob"><span class="fa fa-file-text-o"></span>New Job Offer</a></li>
                                    <li class="nav-item"><a href="company-dashboard-jobs.html"><span class="fa fa-briefcase"></span>Manage Jobs</a></li>
                                    <li class="nav-item"><a href="company-dashboard-candidates.html"><span class="fa fa-user-circle-o"></span>Candidates</a></li>
                                    <li class="nav-item"><a href="company-dashboard-subscriptions.html"><span class="fa fa-credit-card"></span>Subscriptions</a></li>
                                    <li class="nav-item"><a href="company-dashboard-password.html"><span class="fa fa-lock"></span>Change Password</a></li>
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

                    <div class="dropdown pxp-user-nav-dropdown pxp-user-notifications">
                        <a role="button" class="dropdown-toggle" data-bs-toggle="dropdown">
                            <span class="fa fa-bell-o"></span>
                            <div class="pxp-user-notifications-counter">5</div>
                        </a>
                    </div>
                    <div class="dropdown pxp-user-nav-dropdown">
                        <a href="index.html" class="dropdown-toggle" data-bs-toggle="dropdown">
                            <div class="pxp-user-nav-avatar pxp-cover" style="background-image: url(${requestScope.eDAO.getEnterpriseByAccountId(sessionScope.account.username).logoUrl});"></div>
                            <div style="color: black" class="pxp-user-nav-name d-none d-md-block">${requestScope.eDAO.getEnterpriseByAccountId(sessionScope.account.username).shortName}</div>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="/ITJob/EnterpriseDashBoard">Dashboard</a></li>
                            <li><a class="dropdown-item" href="/ITJob/EnterpriseDashBoard/EditProfile">Edit Profile</a></li>
                            <li><a class="dropdown-item" href="Logout">Logout</a></li>
                        </ul>
                    </div>
                </nav>
            </div>


            <div class="pxp-dashboard-content-details">
                <h1>Manage Tags</h1>
                <p class="pxp-text-light">Detailed list with all your job offers.</p>
                <div class="pxp-hero-form pxp-hero-form-round mt-3 mt-lg-4">
                    <form class="row gx-3 align-items-center" action="ManageTag" method="GET">
                        <div class="col-12 col-sm">
                            <div class="mb-3 mb-sm-0">
                                <input name="search" value="${param.search}" type="text" class="form-control" placeholder="Enter tag name to search" style="border: none; box-shadow: none; padding: 10px 5px 10px 15px;  outline: none; color: var(--pxpTextColor); font-family: 'Segoe UI Symbol'; font-size: 17px; line-height: 1.5;">
                                <input type="hidden" name="page" value="${currentPage}">
                            </div>
                        </div>
                        <div class="col-12 col-sm-auto">
                            <button><span class="fa fa-search"></span></button>
                        </div>
                    </form>
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
                <div class="mt-4 mt-lg-5">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <button type="button"  data-bs-toggle="modal" data-bs-target="#AddtagModal" title="Add new tag" class="btn-delete"><span class="fa fa-plus-circle"></span></button>
                            <thead>
                                <tr>
                                    <th style="width: 25%;">No</th>
                                    <th style="width: 75%;">Tag name</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listT}" var="t" varStatus="loop">
                                    <tr>
                                        <td>
                                            <a href="#">
                                                <div class="pxp-company-dashboard-job-title">${loop.index + 1}</div>
                                                <div class="pxp-company-dashboard-job-location"><span class="fa fa-globe me-1"></span></div>
                                            </a>
                                        </td>
                                        <td><div class="pxp-company-dashboard-job-category">${t.tag}</div></td>
                                        <td>
                                            <div class="pxp-dashboard-table-options">
                                                <ul class="list-unstyled">
                                                    <li><button type="button" data-bs-toggle="modal" data-bs-target="#banAccountModal${t.id}" title="Edit" class="btn-ban"><span class="fa fa-pencil-square-o"></span></button></li>

                                                    <li><button type="button"  data-bs-toggle="modal" data-bs-target="#deleteTagModal${t.id}" title="Delete" class="btn-delete"><span class="fa fa-trash-o"></span></button></li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    <!-- Modal Add Tag -->
                                <div class="modal fade modal-dialog-scrollable" id="banAccountModal${t.id}" tabindex="-1" aria-labelledby="banAccountModalLabel${t.id}" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <form action="ManageTag" method="POST">
                                            <div class="modal-content">
                                                <div class="modal-header ">
                                                    <h5 class="modal-title w-100 text-center" id="banAccountModalLabel${t.id}">Edit Tag</h5>
                                                    <span aria-hidden="true">&times;</span>
                                                </div>
                                                <div class="modal-body">
                                                    <label for="banDurationValue">Tag name:</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control"name="tag"  value="${t.tag}" required>
                                                        <input type="hidden" class="form-control"name="id"  value="${t.id}">
                                                        <input type="hidden" class="form-control"name="action"  value="edit">
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <button type="submit" class="btn bg-danger" ">Update</button>
                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!--Modal delete tag-->
                                <div class="modal " id="deleteTagModal${t.id}" tabindex="-1" aria-labelledby="deleteTagModalLabel${t.id}" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form method="POST" action="ManageTag">
                                                <div class="modal-header">
                                                    <h5 class="modal-title w-100 text-center" id="deleteTagModalLabel${t.id}">Xác nhận Xóa Tag</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <input type="hidden" name="id" value="${t.id}">
                                                <input type="hidden" name="action" value="delete">
                                                <div class="modal-body">
                                                    <p>Bạn có chắc chắn muốn xóa tag khoản này không?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                    <button type="submit" class="btn btn-danger">Xóa</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="modal fade modal-dialog-scrollable" id="AddtagModal" tabindex="-1" aria-labelledby="AddtagModalLable" aria-hidden="true">
                            <div class="modal-dialog">
                                <form action="ManageTag" method="POST">
                                    <div class="modal-content">
                                        <div class="modal-header ">
                                            <h5 class="modal-title w-100 text-center" id="banAccountModalLabel${t.id}">Add Tag</h5>
                                            <span aria-hidden="true">&times;</span>
                                        </div>
                                        <div class="modal-body">
                                            <label for="banDurationValue">Tag name:</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control"name="tag" required>
                                                <input type="hidden" class="form-control"name="action"  value="add">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                            <button type="submit" class="btn bg-danger" ">Add</button>
                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="row mt-4 mt-lg-5 justify-content-between align-items-center">
                            <div class="col-auto">

                                <nav class="mt-3 mt-sm-0" aria-label="Jobs list pagination">
                                    <ul class="pagination pxp-pagination">
                                        <!-- Disable the "Previous" link if on the first page -->
                                        <c:if test="${currentPage > 1}">
                                            <li class="page-item" aria-current="page">
                                                <a class="page-link" href="?search=${param.search}&amp;page=${currentPage - 1}">Previous</a>
                                            </li>
                                        </c:if>

                                        <!-- Display the page numbers as links -->
                                        <c:forEach var="pageNum" begin="1" end="${totalPages}">
                                            <li class="page-item <c:if test='${pageNum == currentPage}'>active</c:if>">
                                                <a class="page-link" href="?search=${param.search}&amp;page=${pageNum}">${pageNum}</a>
                                            </li>
                                        </c:forEach>

                                        <!-- Disable the "Next" link if on the last page -->
                                        <c:if test="${currentPage < totalPages}">
                                            <li class="page-item">
                                                <a class="page-link" href="?search=${param.search}&amp;page=${currentPage + 1}">Next</a>
                                            </li>
                                        </c:if>
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
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/nav.js"></script>
        <script src="js/Chart.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
