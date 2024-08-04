
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        <title>Jobster - Candidate dashboard</title>
    </head>
    <body style="background-color: var(--pxpSecondaryColorLight);">
        <div class="pxp-preloader"><span>Loading...</span></div>

        <div class="pxp-dashboard-side-panel d-none d-lg-block">
            <div class="pxp-logo">
                <a href="/ITJob/Home" class="pxp-animate"><span style="color: var(--pxpMainColor)">j</span>obster</a>
            </div>

            <nav class="mt-3 mt-lg-4 d-flex justify-content-between flex-column pb-100">
                <div class="pxp-dashboard-side-label">Jobseeker tools</div>
                <ul class="list-unstyled">
                    <li class="pxp-active"><a href="/ITJob/EditResume"><span class="fa fa-home"></span>Profile</a></li>
                    <li><a href="/ITJob/AppliedList"><span class="fa fa-file-text-o"></span>Applications</a></li>
                    <li><a href="/ITJob/FavouriteJob"><span class="fa fa-heart-o"></span>Favourite Jobs</a></li>
                    <li><a href="/ITJob/manageCV"><span class="fa fa-pencil"></span>Manage CV</a></li>
                    <li><a href="/ITJob/profilepass"><span class="fa fa-lock"></span>Change Password</a></li>
                </ul>
                <div class="pxp-dashboard-side-label mt-3 mt-lg-4">Insights</div>
                <ul class="list-unstyled">
                    <li>
                        <a href="candidate-dashboard-notifications.html" class="d-flex justify-content-between align-items-center">
                            <div><span class="fa fa-bell-o"></span>Notifications</div>
                            <span class="badge rounded-pill">5</span>
                        </a>
                    </li>
                </ul>
            </nav>

            <nav class="pxp-dashboard-side-user-nav-container pxp-is-candidate">
                <div class="pxp-dashboard-side-user-nav">
                    <div class="dropdown pxp-dashboard-side-user-nav-dropdown dropup">
                        <a role="button" class="dropdown-toggle" data-bs-toggle="dropdown">
                            <div class="pxp-user-nav-avatar pxp-cover" style="background-image: url(${sessionScope.jobseeker.imageUrl});"></div>
                            <div class="pxp-user-nav-name d-none d-md-block" style="color: black">${sessionScope.jobseeker.name}</div>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/ITJob/EditProfile">Edit profile</a></li>
                            <li><a class="dropdown-item" href="/ITJob/Logout">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </nav>

        </div>
        <div class="pxp-dashboard-content">
            <div class="pxp-dashboard-content-header pxp-is-candidate">
                <div class="pxp-nav-trigger navbar pxp-is-dashboard d-lg-none">
                    <a role="button" data-bs-toggle="offcanvas" data-bs-target="#pxpMobileNav" aria-controls="pxpMobileNav">
                        <div class="pxp-line-1"></div>
                        <div class="pxp-line-2"></div>
                        <div class="pxp-line-3"></div>
                    </a>
                    <div class="offcanvas offcanvas-start pxp-nav-mobile-container pxp-is-dashboard pxp-is-candidate" tabindex="-1" id="pxpMobileNav">
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
                                    <li class="nav-item"><a href="candidate-dashboard.html"><span class="fa fa-home"></span>Dashboard</a></li>
                                    <li class="nav-item"><a href="candidate-dashboard-profile.html"><span class="fa fa-pencil"></span>Edit Profile</a></li>
                                    <li class="nav-item"><a href="candidate-dashboard-applications.html"><span class="fa fa-file-text-o"></span>Apllications</a></li>
                                    <li class="nav-item"><a href="candidate-dashboard-fav-jobs.html"><span class="fa fa-heart-o"></span>Favourite Jobs</a></li>
                                    <li class="nav-item"><a href="candidate-dashboard-password.html"><span class="fa fa-lock"></span>Change Password</a></li>
                                    <li class="pxp-dropdown-header mt-4">Insights</li>
                                    <li class="nav-item">
                                        <a href="candidate-dashboard-notifications.html" class="d-flex justify-content-between align-items-center">
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
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="candidate-dashboard-notifications.html"><strong>Artistre Studio</strong> viewed your profile. <span class="pxp-is-time">20m</span></a></li>
                            <li><a class="dropdown-item" href="candidate-dashboard-notifications.html"><strong>CoderBotics</strong> sent you a message. <span class="pxp-is-time">1h</span></a></li>
                            <li><a class="dropdown-item" href="candidate-dashboard-notifications.html"><strong>Illuminate Studio</strong> viewed your profile. <span class="pxp-is-time">2h</span></a></li>
                            <li><a class="dropdown-item" href="candidate-dashboard-notifications.html"><strong>Syspresoft</strong> sent you a message. <span class="pxp-is-time">5h</span></a></li>
                            <li><a class="dropdown-item" href="candidate-dashboard-notifications.html"><strong>Artistre Studio</strong> viewed your profile. <span class="pxp-is-time">1d</span></a></li>
                            <li><a class="dropdown-item" href="candidate-dashboard-notifications.html"><strong>Illuminate Studio</strong> viewed your profile. <span class="pxp-is-time">3d</span></a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item pxp-link" href="candidate-dashboard-notifications.html">Read All</a></li>
                        </ul>
                    </div>
                    <div class="dropdown pxp-user-nav-dropdown">
                        <a role="button" class="dropdown-toggle" data-bs-toggle="dropdown">
                            <div class="pxp-user-nav-avatar pxp-cover" style="background-image: url(${sessionScope.jobseeker.imageUrl});"></div>
                            <div class="pxp-user-nav-name d-none d-md-block">${sessionScope.jobseeker.name}</div>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="/ITJob/EditProfile">Edit profile</a></li>
                            <li><a class="dropdown-item" href="/ITJob/Logout">Logout</a></li>
                        </ul>
                    </div>
                </nav>
            </div>

            <div class="pxp-dashboard-content-details">
                <h1>Profile</h1>
                <form>
                    <div class="row mt-4 mt-lg-5">
                        <div class="col-xxl-8">
                            <div class="mb-3">
                                <label for="pxp-candidate-name" class="form-label">Name</label>
                                <input readonly type="text" id="pxp-candidate-name" class="form-control" placeholder="Add your name" name="Name" value="${requestScope.jobseeker.name}">
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="mb-3">
                                        <label for="pxp-candidate-dob" class="form-label">Date of Birth</label>
                                        <input readonly type="date" id="pxp-candidate-dob" class="form-control" name="DOB" value="${requestScope.jobseeker.getDOB()}">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="mb-3">
                                        <label for="pxp-candidate-country" class="form-label">Country</label>
                                        <input readonly type="text" id="pxp-candidate-country" class="form-control" placeholder="Country" name="Country" value="${requestScope.jobseeker.country}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="mb-3">
                                        <label for="pxp-candidate-gender" class="form-label">Gender</label>
                                        <input readonly type="text"class="form-control"value="${requestScope.jobseeker.gender eq true? 'Male' : 'Female'}">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="mb-3">
                                        <label for="pxp-candidate-account-id" class="form-label">User Name</label>
                                        <input  type="text" id="pxp-candidate-account-id" class="form-control" placeholder="User Name" name="username" readonly value="${requestScope.jobseeker.accountId}">
                                    </div>
                                </div>


                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="mb-3">
                                        <label for="pxp-candidate-email" class="form-label">Email</label>
                                        <input readonly type="email" id="pxp-candidate-email" class="form-control" name="EmailContact" value="${requestScope.jobseeker.getEmailContact()}">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="mb-3">
                                        <label for="pxp-candidate-phone" class="form-label">Phone</label>
                                        <input readonly type="tel" id="pxp-candidate-phone" class="form-control"  name="PhoneContact" value="${requestScope.jobseeker.phoneContact}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xxl-4">
                            <div class="form-label">&nbsp;</div>
                            <div class="pxp-candidate-cover mb-3">
                                <c:if test="${not empty requestScope.jobseeker.getImageUrl()}">
                                    <img src="${requestScope.jobseeker.getImageUrl()}" alt="Cover Image" style="max-width: 100%; height: auto;"/>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="pxp-candidate-about" class="form-label">About you</label>
                        <textarea readonly class="form-control" id="pxp-candidate-about" placeholder="Type your info here..." name="Description" >${requestScope.jobseeker.getDescription()}</textarea>
                    </div>
                    <div class="mt-4 mt-lg-5">
                        <h2>Skills</h2>
                        <div class="pxp-candidate-dashboard-skills mb-3">
                            <ul class="list-unstyled">
                                <c:forEach items="${requestScope.skillList}" var="skill">
                                    <li>${skill.skillName}</li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </div>

                    <div class="mt-4 mt-lg-5">
                        <h2>Work Experience</h2>
                        <div class="table-responsive">
                            <table class="table align-middle">
                                <tr>
                                    <td style="width: 30%;"><div class="pxp-candidate-dashboard-experience-title">Title</div></td>
                                    <td style="width: 25%;"><div class="pxp-candidate-dashboard-experience-company">Company</div></td>
                                    <td style="width: 25%;"><div class="pxp-candidate-dashboard-experience-time">Start time</div></td>
                                    <td style="width: 25%;"><div class="pxp-candidate-dashboard-experience-time">End time</div></td>
                                </tr>
                                <c:forEach items="${requestScope.expList}" var="exp">  
                                    <tr>
                                        <td style="width: 30%;"><div class="pxp-candidate-dashboard-experience-title">${exp.title}</div></td>
                                        <td style="width: 25%;"><div class="pxp-candidate-dashboard-experience-company">${exp.companyName}</div></td>
                                        <td style="width: 25%;"><div class="pxp-candidate-dashboard-experience-time">${exp.startTime}</div></td>
                                        <td style="width: 25%;"><div class="pxp-candidate-dashboard-experience-time">${exp.endTime}</div></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>

                    <div class="mt-4 mt-lg-5">
                        <h2>Education & Training</h2>
                        <div class="table-responsive">

                            <table class="table align-middle">
                                <c:forEach items="${requestScope.eduList}" var="item">
                                    <tr>
                                        <td style="width: 30%;"><div class="pxp-candidate-dashboard-experience-title">${item.major}</div></td>
                                        <td style="width: 14%;"><div class="pxp-candidate-dashboard-experience-school">${item.schoolName}</div></td>
                                        <td style="width: 14%;"><div class="pxp-candidate-dashboard-experience-school">${item.degree}</div></td>
                                        <td style="width: 14%;"><div class="pxp-candidate-dashboard-experience-time">${item.startTime}</div></td>
                                        <td style="width: 14%;"><div class="pxp-candidate-dashboard-experience-time">${item.endTime}</div></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>

                    <div class="mt-4 mt-lg-5">
                        <a href="/ITJob/EditResume" class="btn rounded-pill pxp-section-cta">Edit Profile</a>
                    </div>

                </form>
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
