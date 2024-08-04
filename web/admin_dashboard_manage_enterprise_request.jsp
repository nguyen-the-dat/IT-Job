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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

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
                    <li class="pxp-active"><a href="/ITJob/ManageEnterpriseRequest"><span class="fa fa-file-text-o"></span>Enterprise Request</a></li>
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
                <h1>Enterprise Request</h1>
                <p class="pxp-text-light">Account management for admin.</p>

                <div class="mt-4 mt-lg-5">

                    <div class="table-responsive">
                        <table class="table table-hover align-middle ">
                            <thead>
                                <tr>
                                    <th style="width: 1%;">#</th>
                                    <th colspan="2" style="width: 20%;">Company Name</th>
                                    <th style="width: 15%;">Username</th>
                                    <th style="width: 15%;">Email Contact</th>
                                    <th style="width: 20%;">Status</th>
                                    <th style="width: 10%;">Time</th>
                                    <!--                                    <th style="width: 5%;">Action</th>-->
                                    <th style="text-align: right">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="counter" value="1" />
                                <c:forEach items="${sessionScope.listEnterprisesClone}" var="p">
                                    <tr>
                                        <td>${counter}</td>
                                        <c:set var="counter" value="${counter + 1}" />
                                        <td style="width: 3%;">
                                            <div class="pxp-company-dashboard-candidate-avatar pxp-cover" style="background-image: url(${p.logoUrl});"></div>
                                        </td>
                                        <td>
                                            <a href="#">
                                                <div class="pxp-company-dashboard-job-title">${p.fullCompanyName}</div>
                                            </a>
                                        </td>
                                        <td>
                                            <div class="pxp-company-dashboard-job-category">${p.accountId}</div>
                                        </td>
                                        <td><div class="pxp-company-dashboard-job-category">${p.emailContact}</div></td>

                                        <c:if test="${p.status==1}">
                                            <td><div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-info">New Register</span></div></td>
                                        </c:if>
                                        <c:if test="${p.status==2}">
                                            <td><div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-success">New Update</span></div></td>
                                        </c:if>
                                        <c:if test="${p.status==3}">
                                            <td><div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-warning">Successfully</span></div></td>
                                        </c:if>

                                        <td>
                                            <div class="pxp-company-dashboard-job-date">01/01/2024 06:08:00</div>
                                        </td>
                                        <!--                                        <td><div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-success">Active</span></div></td>-->
                                        <td>
                                            <div class="pxp-dashboard-table-options">
                                                <ul class="list-unstyled">
                                                    <c:if test="${p.status!=3}">
                                                        <li>
                                                            <input type="hidden" value="${p.accountId}" id="eAccountId" />
                                                            <button title="Accept" onclick="accept('${p.accountId}')"><span class="fa-solid fa-check"></span></button>
                                                            <button title="Delete" onclick="deny('${p.accountId}')"><span class="fa-solid fa-delete-left"></span></button>
                                                        </li>
                                                    </c:if>
                                                    <li><button title="View details" onclick="redirectToView(${p.id})"><span class="fa fa-eye"></span></button></li>

                                                </ul>
                                            </div>
                                        </td>

                                    </tr>                                
                                </c:forEach>

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
                                                    <a class="page-link" href="ManageEnterpriseRequest?pageIndex=${page}">${page}</a>
                                                </li>
                                            </c:if>

                                            <c:if test="${currentIndex!=page}">

                                                <li class="page-item"><a class="page-link" href="ManageEnterpriseRequest?pageIndex=${page}">${page}</a></li>
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
            function redirectToView(id) {
                // Chuyển hướng đến trang view với tham số id được chỉ định
                window.location.href = 'AdminEnterpriseDetail?id=' + id;
            }
            function accept(accountId) {
                let text = "Confirm accept?\nEither OK or Cancel.";
                if (confirm(text) === true) {
                    fetch('ManageEnterpriseRequest', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: 'action=accept' + '&accountId=' + encodeURIComponent(accountId)
                    })
                            .then(response => {
                                 
                                if (response.ok) {
                                    console.log('Accept sent successfully');
                                    window.location.reload();
                                } else {
                                    throw new Error('Server returned error: ' + response.status);
                                }
                            })
                            .catch(error => {
                                console.error('Error sending accept:', error);
                                // Hiển thị thông báo lỗi cho người dùng (ví dụ: thông báo modal)
                                console.log(accountId);
                                alert('An error occurred while sending accept. Please try again later.');
                            });
                } else {
                    // Người dùng đã chọn hủy bỏ
                    // Thực hiện các hành động phù hợp nếu cần
                }
            }


            function deny(accountId) {
                let text = "Confirm deny?\nEither OK or Cancel.";
                if (confirm(text) === true) {
                    fetch('ManageEnterpriseRequest', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: 'action=deny' + '&accountId=' + encodeURIComponent(accountId)
                    })
                            .then(response => {
                                if (response.ok) {

                                    console.log('Accept sent successfully');
                                    window.location.reload();
                                } else {
                                    console.error('Error sending accept');
                                }
                            })
                            .catch(error => {
                                console.error('Error sending accept:', error);
                            });
                } else {

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
