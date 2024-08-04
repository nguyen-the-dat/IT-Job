<%@page import="Model.JobSeeker"%>
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
                    <li><a href="/ITJob/EditProfile"><span class="fa fa-home"></span>Profile</a></li>
                    <li><a href="/ITJob/AppliedList"><span class="fa fa-file-text-o"></span>Applications</a></li>
                    <li><a href="/ITJob/FavouriteJob"><span class="fa fa-heart-o"></span>Favourite Jobs</a></li>
                    <li class="pxp-active"><a href="/ITJob/manageCV"><span class="fa fa-pencil"></span>Manage CV</a></li>
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
            <style>
                .border-cv {
                    border: 1px solid grey;
                    border-radius: 10px;
                }
                .contain-all {
                    display: flex;
                    flex-direction: column;
                }
                .contain-icon-name {
                    display: flex;
                    flex-direction: row;
                }
                .icon {
                    width: 10%;
                }
                .name {
                    width: 90%;
                }
                .contain-all {
                    padding: 15px;
                }
                .content-cover-letter {
                    margin-top: 30px;
                }
                .formbold-textarea {
                    width: 100%;
                    height: 30%;
                }
                .formbold-form-input {
                    width: 100%;
                    height: 30%;
                }
                .formbold-btn {
                    font-size: 16px;
                    border-radius: 12px;
                    padding: 12px 20px;
                    border: none;
                    font-weight: 500;
                    background-color: #6A64F1;
                    color: white;
                    cursor: pointer;
                    margin-top: 18px;
                    width: 20%;
                    justify-content: flex-end;
                }
                .formbold-btn:hover {
                    box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
                }
                .content {
                    margin-left: 10%;
                }
                .form-contain {
                    display: flex;
                    flex-direction: column;
                    justify-content: flex-end;
                }
            </style>
            <div class="pxp-dashboard-content-details">
                <h1>Manage CV</h1>
                <p class="pxp-text-light">Upload your CV below to use throughout the job search process</p>
                <form action="manageCV" method="POST">
                    <div class="border-cv">
                        <div class="contain-all">
                            <div class="contain-icon-name">
                                <div class="icon">
                                    <div><img src="images/resume.png" style="width: 50%; height:50%"></div>
                                </div>
                                <div class="name">
                                    <h6>Your CV</h6>
                                    <div id="nameCV" style="font-size: 13px; font-style: italic" class="formbold-filename">${requestScope.uploadFromServlet}</div>
                                </div>
                            </div>
                            <div class="content">
                                <div style="font-size: 13px" id="time-update">Update Date:</div>
                                <div><input type="file" name="upload" id="upload" onchange="myFunction()" accept=".doc,.docx,.pdf"><div style="font-size: 13px">
                                        (Use a .doc, .docx or .pdf file, not password protected and under 3MB)</div></div>
                            </div>
                        </div>
                    </div>
                    <div class="content-cover-letter">
                        <div class="header-cover-letter">
                            <h2 class="header-cover">Cover Letter</h2>
                        </div>
                        <div>
                            <p class="pxp-text-light">Introduce yourself and why you would be a great hire</p>
                        </div>
                        <div class="form-contain">
                            <div class="hidden-cover">
                                <div class="formbold-textarea">
                                    <textarea
                                        rows="6"
                                        name="letter"
                                        id="letter"
                                        placeholder="Details and specific examples will make your application stronger..."
                                        class="formbold-form-input"
                                        >${requestScope.letterFromServlet}</textarea>
                                </div>
                            </div>
                            <button class="formbold-btn" type="submit">SAVE</button>
                        </div>
                    </div>
                </form>
            </div>
            <footer>
                <div class="pxp-footer-copyright pxp-text-light"></div>
            </footer>
        </div>

        <script>
            function myFunction() {
                var fileInput = document.getElementById('upload');
                var filePath = fileInput.value;
                var allowedExtensions = /(\.doc|\.docx|\.pdf)$/i;
                var maxSize = 3 * 1024 * 1024; // 3MB

                if (!allowedExtensions.exec(filePath)) {
                    alert('Chỉ chấp nhận các file có định dạng .doc, .docx hoặc .pdf.');
                    fileInput.value = ''; // Xóa lựa chọn file
                    return false;
                }

                if (fileInput.files && fileInput.files[0].size > maxSize) {
                    alert('File must smaller than 3MB.');
                    fileInput.value = ''; // Xóa lựa chọn file
                    return false;
                }

                if (filePath) {
                    var fileName = filePath.split('\\').pop();
                    document.querySelector(".formbold-filename").innerHTML = fileName;
                    const now = new Date();
                    const options = {
                        year: 'numeric', month: '2-digit', day: '2-digit',
                        hour: '2-digit', minute: '2-digit', second: '2-digit',
                        hour12: false,
                        timeZone: 'Asia/Ho_Chi_Minh'
                    };
                    const formatter = new Intl.DateTimeFormat('vi-VN', options);
                    const vietnamDateTime = formatter.format(now);
                    document.getElementById("time-update").innerHTML = vietnamDateTime;
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
