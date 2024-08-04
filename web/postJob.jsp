<%@page import="Model.JobSeeker"%>
<%@page import="Model.Enterprise"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="pxp-root">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />

        <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600;700&display=swap"
            rel="stylesheet"
            />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/font-awesome.min.css" />
        <link rel="stylesheet" href="css/owl.carousel.min.css" />
        <link rel="stylesheet" href="css/owl.theme.default.min.css" />
        <link rel="stylesheet" href="css/animate.css" />
        <link rel="stylesheet" href="css/style.css" />
        <style>
            .input-text {
                border: 1px solid #f0f5f7 !important;
                border-radius: 8px !important;
                color: #696969 !important;
                background-color: #f0f5f7 !important;
            }

            .tag-container {
                align-items: flex-start; /* Align items to the start for checkbox next to text */
                height: 8rem; /* Fixed height as requested */
                padding: 10px; /* Adds some spacing inside the container */
                border: 1px solid #ccc; /* Matches the style of input and textarea elements */
                overflow-x: auto;
                border-radius: 4px; /* Rounded corners to match other form elements */
                background-color: #f9f9f9; /* Slightly different background to distinguish area */
                gap: 5px; /* Space between each checkbox for better readability */
            }

        </style>
        <title>New job offer</title>
    </head>
    <body style="background-color: var(--pxpMainColorLight)">
        <div class="pxp-preloader"><span>Loading...</span></div>

        <div class="pxp-dashboard-side-panel d-none d-lg-block">
            <div class="pxp-logo">
                <a href="/ITJob/Home" class="pxp-animate"
                   ><span style="color: var(--pxpMainColor)">j</span>obster</a
                >
            </div>

            <nav
                class="mt-3 mt-lg-4 d-flex justify-content-between flex-column pb-100"
                >
                <div class="pxp-dashboard-side-label">Enterprise tools</div>
                <ul class="list-unstyled">
                    <li>
                        <a href="/ITJob/EnterpriseDashBoard"
                           ><span class="fa fa-home"></span>Dashboard</a
                        >
                    </li>
                    <li>
                        <a href="/ITJob/EnterpriseDashBoard/EditProfile"
                           ><span class="fa fa-pencil"></span>Edit Profile</a
                        >
                    </li>
                    <li class="pxp-active">
                        <a href="/ITJob/PostJob"
                           ><span class="fa fa-file-text-o"></span>New Job Offer</a
                        >
                    </li>
                    <li>
                        <a href="/ITJob/ManageJob"
                           ><span class="fa fa-briefcase"></span>Manage Jobs</a
                        >
                    </li>
                    <li>
                        <a href="/ITJob/Applicant"
                           ><span class="fa fa-user-circle-o"></span>Candidates</a
                        >
                    </li>
                    <li>
                        <a href="/ITJob/profilepass"
                           ><span class="fa fa-lock"></span>Change Password</a
                        >
                    </li>
                </ul>
                <div class="pxp-dashboard-side-label mt-3 mt-lg-4">Insights</div>
                <ul class="list-unstyled">
                    <li>
                        <a
                            href="company-dashboard-notifications.html"
                            class="d-flex justify-content-between align-items-center"
                            >
                            <div><span class="fa fa-bell-o"></span>Notifications</div>
                            <span class="badge rounded-pill">5</span>
                        </a>
                    </li>
                </ul>
            </nav>

            <nav class="pxp-dashboard-side-user-nav-container">
                <%
                    String userRole = (String) request.getAttribute("userRole");
                    String displayName = (String) request.getAttribute("displayName");
                    String imgUrl = "images/default-avatar.jpg";

                    if ("enterprise".equals(userRole)) {
                        Enterprise enterprise = (Enterprise) request.getAttribute("user");
                        imgUrl = enterprise.getLogoUrl();
                %>
                <div class="dropdown pxp-user-nav-dropdown">
                    <a href="/ITJob/Home" class="dropdown-toggle" data-bs-toggle="dropdown">
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
                    <a
                        role="button"
                        data-bs-toggle="offcanvas"
                        data-bs-target="#pxpMobileNav"
                        aria-controls="pxpMobileNav"
                        >
                        <div class="pxp-line-1"></div>
                        <div class="pxp-line-2"></div>
                        <div class="pxp-line-3"></div>
                    </a>
                    <div
                        class="offcanvas offcanvas-start pxp-nav-mobile-container pxp-is-dashboard"
                        tabindex="-1"
                        id="pxpMobileNav"
                        >
                        <div class="offcanvas-header">
                            <div class="pxp-logo">
                                <a href="index.html" class="pxp-animate"
                                   ><span style="color: var(--pxpMainColor)">j</span>obster</a
                                >
                            </div>
                            <button
                                type="button"
                                class="btn-close text-reset"
                                data-bs-dismiss="offcanvas"
                                aria-label="Close"
                                ></button>
                        </div>
                        <div class="offcanvas-body">
                            <nav class="pxp-nav-mobile">
                                <ul class="navbar-nav justify-content-end flex-grow-1">
                                    <li class="pxp-dropdown-header">Enterprise tools</li>
                                    <li class="nav-item">
                                        <a href="/ITJob/EnterpriseDashBoard"
                                           ><span class="fa fa-home"></span>Dashboard</a
                                        >
                                    </li>
                                    <li class="nav-item">
                                        <a href="/ITJob/EnterpriseDashBoard/EditProfile"
                                           ><span class="fa fa-pencil"></span>Edit Profile</a
                                        >
                                    </li>
                                    <li class="nav-item">
                                        <a href="/ITJob/PostJob"
                                           ><span class="fa fa-file-text-o"></span>New Job Offer</a
                                        >
                                    </li>
                                    <li class="nav-item">
                                        <a href="/ITJob/ManageJob"
                                           ><span class="fa fa-briefcase"></span>Manage Jobs</a
                                        >
                                    </li>
                                    <li class="nav-item">
                                        <a href="/ITJob/Applicant"
                                           ><span class="fa fa-user-circle-o"></span>Candidates</a
                                        >
                                    </li>
                                    <li class="nav-item">
                                        <a href="/ITJob/profilepass"
                                           ><span class="fa fa-lock"></span>Change Password</a
                                        >
                                    </li>
                                    <li class="pxp-dropdown-header mt-4">Insights</li>
                                    <li class="nav-item">
                                        <a
                                            href="company-dashboard-notifications.html"
                                            class="d-flex justify-content-between align-items-center"
                                            >
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
                        </ul>
                    </div>
                    <div class="dropdown pxp-user-nav-dropdown">
                        <a href="index.html" class="dropdown-toggle" data-bs-toggle="dropdown">
                            <div class="pxp-user-nav-avatar pxp-cover" style="background-image: url(<%= imgUrl%>);"></div>
                            <div class="pxp-user-nav-name d-none d-md-block"><%= displayName%></div>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <% if ("jobseeker".equals(userRole) || "enterprise".equals(userRole)) { %>
                            <li><a class="dropdown-item" href="/ITJob/EnterpriseDashBoard/EditProfile">Edit Profile</a></li>
                                <% } %>
                                <% if ("enterprise".equals(userRole) || "admin".equals(userRole)) {%>
                            <li><a class="dropdown-item" href="<%="/ITJob/EnterpriseDashBoard"%>">Dashboard</a></li>
                                <% } %>
                            <li><a class="dropdown-item" href="Logout">Logout</a></li>
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
                <h1>New Job Offer</h1>
                <p class="pxp-text-light">Add a new job to your company's jobs list.</p>
                <form method="POST">
                    <div class="row">
                        <div class="col-md-12">
                            <label class="pt-2">Job Title</label>
                            <input
                                required
                                name="title"
                                type="text"
                                class="input-text form-control"
                                placeholder="Title"
                                />
                        </div>
                    </div>
                    <div class="mt-3 row">
                        <div class="col-md-12">
                            <label>Overview</label>
                            <textarea
                                required
                                name="overview"
                                class="form-control input-text"
                                rows="2"
                                ></textarea>
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label>Address</label>
                            <input
                                required
                                name="address"
                                type="text"
                                class="form-control input-text"
                                />
                        </div>
                        <div class="col-md-6">
                            <label>Job Type</label>
                            <select
                                name="jobType"
                                class="form-select input-text"
                                style="border-radius: 16px"
                                >
                                <c:forEach items="${requestScope.JobType}" var="jt">
                                    <option value="${jt.id}">${jt.jobType}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label>Expired Time</label>
                            <input
                                required
                                id="expiredTimeID"
                                name="expiredTime"
                                type="date"
                                class="form-control input-text"
                                />
                        </div>
                        <div class="col-md-6">
                            <label>City</label>
                            <select name="city" class="form-select input-text">
                                <c:forEach items="${requestScope.cities}" var="city">
                                    <option value="${city.id}">${city.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label>Gender Required</label>
                            <select name="genderRequired" class="form-select input-text">
                                <option value="Any">Any</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label>Work Level</label>
                            <select name="workLevel" class="form-select input-text">
                                <c:forEach items="${requestScope.WorkLevel}" var="wl">
                                    <option value="${wl.id}">${wl.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label>Salary Min</label>
                            <input
                                required
                                id="salaMin"
                                name="salaMin"
                                type="number"
                                class="form-control input-text"
                                />
                        </div>
                        <div class="col-md-6">
                            <label>Salary Max</label>
                            <input
                                required
                                id="salaMax"
                                name="salaMax"
                                type="number"
                                class="form-control input-text"
                                />
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label>Number of Recruit</label>
                            <input
                                required
                                name="numRecruit"
                                type="number"
                                class="form-control input-text"
                                />
                        </div>
                        <div class="col-md-6">
                            <label>Experience Required</label>
                            <input
                                required
                                name="expRequired"
                                type="number"
                                class="form-control input-text"
                                />
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label>Skills</label>
                            <textarea
                                required
                                name="skill"
                                class="form-control input-text"
                                rows="3"
                                style="height: 8rem"
                                ></textarea>
                        </div>
                        <div class="col-md-6">
                            <label>Responsibilities</label>
                            <textarea
                                required
                                name="responsibilities"
                                class="form-control input-text"
                                rows="2"
                                style="height: 8rem"
                                ></textarea>
                        </div>

                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label>Requirements</label>
                            <textarea
                                required
                                name="requirement"
                                class="form-control input-text"
                                rows="2"
                                style="height: 8rem"
                                ></textarea>
                        </div>
                        <div class="col-md-6">
                            <label>Tag</label>
                            <div class="input-group tag-container" style="background-color: #f0f5f7;justify-content: space-between">
                                <c:forEach items="${requestScope.tags}" var="tag">
                                    <div style="padding: 0;width: 23%">
                                        <label style="width: 100%">
                                            <input class="form-check-input" type="checkbox" name="tags" value="${tag.id}"> ${tag.tag}
                                        </label>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-3">
                            <label>Status</label>
                            <select name="status" class="form-select input-text" style="font-weight: 600">
                                <option value="1">Published</option>                                    
                                <option value="4">Draft</option>
                            </select>
                        </div>
                    </div>
                    <div class="mt-4 mt-lg-5">
                        <input
                            id="submitBtn"
                            type="submit"
                            value="Publish Job"
                            class="btn rounded-pill pxp-section-cta"
                            />
                    </div>
                </form>
            </div>
                <h2>${requestScope.jobtest.id}</h2>
            <footer>
                <div class="pxp-footer-copyright pxp-text-light">
                </div>
            </footer>
        </div>

        <script src="js/jquery-3.4.1.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
            crossorigin="anonymous"
        ></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/nav.js"></script>
        <script src="js/Chart.min.js"></script>
        <script src="js/main.js"></script>
        <script>
            function validateFormExpiredTime() {
                var expiredTimeInput = document.getElementById("expiredTimeID");
                var enteredDate = new Date(expiredTimeInput.value);
                var currentDate = new Date();

                // Kiểm tra nếu ngày đã nhập là trước ngày hiện tại
                if (enteredDate <= currentDate) {
                    alert("The expiration time must be greater than the current date.");
                    return false; // Ngăn chặn việc submit form
                }

                return true; // Cho phép submit form
            }

            function validateFormSalary() {
                var salaMin = parseFloat(document.getElementById("salaMin").value);
                var salaMax = parseFloat(document.getElementById("salaMax").value);
                if (salaMin > salaMax) {
                    alert("Maximum salary must be greater than or equal to minimum salary.");
                    return false;
                }

                return true;
            }

            document.getElementById("submitBtn").addEventListener("click", function (event) {
                // Call the validateForm function when the submit button is clicked
                if (!validateFormExpiredTime()) {
                    event.preventDefault(); // Ngăn chặn việc submit form nếu validation không thành công
                }

                if (!validateFormSalary()) {
                    event.preventDefault();
                }
            });
        </script>
    </body>
</html>

