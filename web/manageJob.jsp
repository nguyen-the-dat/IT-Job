<%-- 
    Document   : manageJob
    Created on : Feb 5, 2024, 7:39:38 PM
    Author     : ngoba
--%>

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

        <title>Jobster - Company dashboard - Manage jobs</title>
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
                    <li><a href="/ITJob/EnterpriseDashBoard"><span class="fa fa-home"></span>Dashboard</a></li>
                    <li><a href="/ITJob/EnterpriseDashBoard/EditProfile"><span class="fa fa-pencil"></span>Edit Profile</a></li>
                    <li><a href="/ITJob/PostJob"><span class="fa fa-file-text-o"></span>New Job Offer</a></li>
                    <li class="pxp-active"><a href="/ITJob/ManageJob"><span class="fa fa-briefcase"></span>Manage Jobs</a></li>
                    <li><a href="/ITJob/Applicant"><span class="fa fa-user-circle-o"></span>Candidates</a></li>
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
                <h1>Manage Jobs</h1>
                <p class="pxp-text-light">Detailed list with all your job offers.</p>

                <div class="mt-4 mt-lg-5">

                    <form action="/ITJob/ManageJob" method="GET">
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
                                                <c:if test="${job.statusJobDetail.id != 2 && job.statusJobDetail.id !=3}">
                                                    <ul class="list-unstyled" style="justify-content: flex-start;">
                                                        <li><a href="UpdateJob?id=${job.id}"><button title="Edit"><span class="fa fa-pencil"></span></button></a></li>
                                                        <li><a href="JobDetail?jobId=${job.id}"><button title="Preview"><span class="fa fa-eye"></span></button></a></li>
                                                        <li><a onclick="deleteConfirm(${job.id})"><button title="Delete"><span class="fa fa-trash-o"></span></button></a></li>
                                                    </ul>
                                                </c:if>
                                                <c:if test="${job.statusJobDetail.id == 2}">
                                                    <div class="pxp-company-dashboard-job-date mt-1"> Delete time:</div>
                                                    <div class="pxp-company-dashboard-job-date mt-1">
                                                        <fmt:formatDate value="${job.deletedTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <div class="row mt-4 mt-lg-5 justify-content-between align-items-center">
                            <div class="col-auto">
                                <nav class="mt-3 mt-sm-0" aria-label="Jobs list pagination">
                                    <ul class="pagination pxp-pagination">
                                        <li class="page-item active" aria-current="page">
                                            <span class="page-link">1</span>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
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
            function deleteConfirm(id) {
                var deleteUrl = "/ITJob/DeleteJob?id=" + id;
                var result = confirm("Are you sure you want to delete the job?");
                if (result) {
                    window.location.href = deleteUrl;
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
