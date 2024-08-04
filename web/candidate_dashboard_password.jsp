<%@page import="Model.JobSeeker"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

        <title>Change password</title>
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
                    <li><a href="/ITJob/EditProfile"><span class="fa fa-home"></span>Profile</a></li>
                    <li><a href="/ITJob/AppliedList"><span class="fa fa-file-text-o"></span>Applications</a></li>
                    <li><a href="/ITJob/FavouriteJob"><span class="fa fa-heart-o"></span>Favourite Jobs</a></li>
                    <li><a href="/ITJob/manageCV"><span class="fa fa-pencil"></span>Manage CV</a></li>
                    <li class="pxp-active"><a href="/ITJob/profilepass"><span class="fa fa-lock"></span>Change Password</a></li>
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
                    <%
                        String userRole = (String) request.getAttribute("userRole");
                        String displayName = (String) request.getAttribute("displayName");
                        String imgUrl = "images/default-avatar.jpg"; // Default image URL

                        if ("jobseeker".equals(userRole)) {
                            JobSeeker jobSeeker = (JobSeeker) request.getAttribute("user");
                            if (jobSeeker != null) {
                                imgUrl = jobSeeker.getImageUrl(); // Set the image URL from the job seeker
                                displayName = jobSeeker.getName(); // Set the display name from the job seeker
                            }
                    %>
                    <div class="dropdown pxp-dashboard-side-user-nav-dropdown dropup">
                        <a role="button" class="dropdown-toggle" data-bs-toggle="dropdown">
                            <div class="pxp-dashboard-side-user-nav-avatar pxp-cover" style="background-image: url(<%= imgUrl%>);"></div>
                            <div class="pxp-dashboard-side-user-nav-name"><%= displayName%></div>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/ITJob/EditProfile">Edit profile</a></li>
                            <li><a class="dropdown-item" href="/ITJob/Logout">Logout</a></li>
                        </ul>
                    </div>
                    <%
                        }
                    %>
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
                                    <li class="pxp-dropdown-header">Jobseeker tools</li>
                                    <li class="nav-item"><a href="/ITJob/EditProfile"><span class="fa fa-home"></span>Dashboard</a></li>
                                    <li class="nav-item"><a href="/ITJob/EditResume"><span class="fa fa-pencil"></span>Edit Profile</a></li>
                                    <li><a href="/ITJob/AppliedList"><span class="fa fa-file-text-o"></span>Apllications</a></li>
                                    <li><a href="/ITJob/FavouriteJob"><span class="fa fa-heart-o"></span>Favourite Jobs</a></li>
                                    <li><a href="/ITJob/profilepass"><span class="fa fa-lock"></span>Change Password</a></li>
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
                    <%
                        if ("jobseeker".equals(userRole)) {
                            JobSeeker jobSeeker = (JobSeeker) request.getAttribute("user");
                            if (jobSeeker != null) {
                                imgUrl = jobSeeker.getImageUrl(); // Get the image URL from the job seeker
                                displayName = jobSeeker.getName(); // Get the display name from the job seeker
                            }
                    %>
                    <div class="dropdown pxp-user-nav-dropdown">
                        <a role="button" class="dropdown-toggle" data-bs-toggle="dropdown">
                            <div class="pxp-user-nav-avatar pxp-cover" style="background-image: url(<%= imgUrl%>);"></div>
                            <div class="pxp-user-nav-name d-none d-md-block"><%= displayName%></div>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="/ITJob/EditProfile">Edit profile</a></li>
                            <li><a class="dropdown-item" href="/ITJob/Logout">Logout</a></li>
                        </ul>
                    </div>
                    <%
                        }
                    %>
                </nav>
            </div>

            <div class="pxp-dashboard-content-details">
                <h1>Change Password</h1>
                <p class="pxp-text-light">Choose a new account password.</p>

                <form action="profilepass" method="post">
                    <div class="row mt-4 mt-lg-5">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="pxp-candidate-old-password" class="form-label">Old password</label>
                                <input type="password" id="pxp-candidate-old-password" class="form-control" placeholder="Enter old password" name="pass" value="${requestScope.pass}">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="pxp-candidate-new-password" class="form-label">New password</label>
                                <input type="password" id="pxp-candidate-new-password" class="form-control" placeholder="Enter new password" name="newpass" value="${requestScope.newpass}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="pxp-candidate-new-password-repeat" class="form-label">New password repeat</label>
                                <input type="password" id="pxp-candidate-new-password-repeat" class="form-control" placeholder="Repeat new password" name="check" value="${requestScope.check}">
                            </div>
                        </div>
                    </div>

                    <div class="mt-4 mt-lg-5">
                        <!--                       <button class="btn rounded-pill pxp-section-cta">Save New Password</button>
                                            </div>-->
                        <button class="btn btn-primary" type="submit">Save New Password</button>
                        <input type="text" name="passc" value="${requestScope.passc}" hidden>
                        <input type="text" name="userName" value="${requestScope.user}" hidden>
                        </form>
                        <c:choose>
                            <c:when test="${requestScope.mess == 'Update Success!'}">
                                <p style="color:red"><a href="Home">${requestScope.mess}</a></p>
                                </c:when>
                                <c:otherwise>
                                <p style="color:red">${requestScope.mess}</p>
                            </c:otherwise>
                        </c:choose>
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