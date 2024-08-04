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
        <style>
            /* Style cho Popup */
            .popup {
                position: fixed;
                z-index: 99;
                padding-top: 2%;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
            }

            /* Style cho nội dung Popup */
            .popup-content {
                background-color: #FFF8EC;
                margin: auto;
                border: 1px solid #888;
                width: 50%;
                border-radius: 10px;
                padding-left: 20px;
            }

            /* Nút đóng (x) */
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
        <title>Jobster - Candidate dashboard - Applications</title>
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
                    <li class="pxp-active"><a href="/ITJob/AppliedList"><span class="fa fa-file-text-o"></span>Applications</a></li>
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
                            <div class="pxp-user-nav-avatar pxp-cover" style="background-image: url(${requestScope.jobseekerDAO.getJobSeekerByAccountId(sessionScope.account.username).imageUrl});"></div>
                            <div class="pxp-user-nav-name d-none d-md-block" style="color: black">${requestScope.jobseekerDAO.getJobSeekerByAccountId(sessionScope.account.username).name}</div>
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
                                <a href="index.html" class="pxp-animate"><span style="color: var(--pxpMainColor)">j</span>obster</a>
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
                                        <a href="candidate-dashboard-inbox.html" class="d-flex justify-content-between align-items-center">
                                            <div><span class="fa fa-envelope-o"></span>Inbox</div>
                                            <span class="badge rounded-pill">14</span>
                                        </a>
                                    </li>
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
                            <div class="pxp-user-nav-avatar pxp-cover" style="background-image: url(${requestScope.jobseekerDAO.getJobSeekerByAccountId(sessionScope.account.username).imageUrl});"></div>
                            <div class="pxp-user-nav-name d-none d-md-block">${requestScope.jobseekerDAO.getJobSeekerByAccountId(sessionScope.account.username).name}</div>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="/ITJob/EditProfile">Edit profile</a></li>
                            <li><a class="dropdown-item" href="/ITJob/Logout">Logout</a></li>
                        </ul>
                    </div>
                </nav>
            </div>

            <div class="pxp-dashboard-content-details">
                <h1>Applications</h1>
                <p class="pxp-text-light">Detailed list of your job applications.</p>

                <div class="mt-4 mt-lg-5">
                    <div class="row justify-content-between align-content-center">
                        <!--                        <div class="col-auto order-2 order-sm-1">
                                                    <div class="pxp-candidate-dashboard-jobs-bulk-actions mb-3">
                                                    </div>
                                                </div>-->
                        <div class="col-auto order-1 order-sm-2">
                            <div class="pxp-candidate-dashboard-jobs-search mb-3">
                                <div class="pxp-candidate-dashboard-jobs-search-results me-3">${requestScope.appliedJob.size()} job applications</div>
                                <div class="pxp-candidate-dashboard-jobs-search-search-form">
                                    <div class="input-group">
                                        <span class="input-group-text"><span class="fa fa-search"></span></span>
                                        <input type="text" class="form-control" placeholder="Search jobs...">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead>
                                <tr>
                                    <th style="width: 25%;">Job</th>
                                    <th style="width: 15%;">Company</th>
                                    <th style="width: 12%;">Job Type</th>
                                    <th style="width: 20%;">Status</th>
                                    <th>Date<span class="fa fa-angle-up ms-3"></span></th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="applied" items="${requestScope.appliedJob}">
                                    <tr>
                                        <td>
                                            <a href="/ITJob/JobDetail?jobId=${applied.job.id}">
                                                <div class="pxp-candidate-dashboard-job-title">${applied.job.title}</div>
                                                <div class="pxp-candidate-dashboard-job-location"><span class="fa fa-globe me-1"></span>${applied.job.address}</div>
                                            </a>
                                        </td>
                                        <td><a href="/ITJob/EnterpriseDetail?enterpriseId=${applied.job.enterprise.id}" class="pxp-candidate-dashboard-job-company">${applied.job.enterprise.shortName}</a></td>
                                        <td><div class="pxp-candidate-dashboard-job-type">${applied.job.jobTypeDetail.jobType}</div></td>
                                            <c:if test="${fn:contains(applied.statusApplicationDetail.statusApplication, 'FAIL')}">
                                            <td><div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-danger">${applied.statusApplicationDetail.statusApplication}</span></div></td>
                                                </c:if>
                                                <c:if test="${fn:contains(applied.statusApplicationDetail.statusApplication, 'PASS')}">
                                            <td><div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-success">${applied.statusApplicationDetail.statusApplication}</span></div></td>
                                                </c:if>
                                                <c:if test="${fn:contains(applied.statusApplicationDetail.statusApplication, 'PROCESSING')}">
                                            <td><div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-warning">${applied.statusApplicationDetail.statusApplication}</span></div></td>
                                                </c:if>
                                                <c:if test="${fn:contains(applied.statusApplicationDetail.statusApplication, 'CANCEL')}">
                                            <td><div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-dark">${applied.statusApplicationDetail.statusApplication}</span></div></td>
                                                </c:if>
                                        <td><div class="pxp-candidate-dashboard-job-date mt-1">${applied.applyTime}</div></td>
                                        <td>
                                            <div class="pxp-dashboard-table-options">
                                                <ul class="list-unstyled" style="justify-content: center;">
                                                    <li><button title="Preview" id="jobDetailButton"><span class="fa fa-eye"></span></button></li>
                                                            <c:if test="${applied.statusApplicationDetail.id == 1}">
                                                        <li><button title="CancelApplication" name="btnCancel" value="${applied.job.id}" class="cancelApplication"><span class="fa fa-trash-o"></span></button></li>
                                                            </c:if>

                                                    <script>
                                                        document.getElementById('jobDetailButton').addEventListener('click', function () {
                                                            var jobId = ${applied.job.id};
                                                            window.location.href = '/ITJob/JobDetail?jobId=' + jobId;
                                                        });
                                                    </script>
                                                    <li>
                                                        <c:if test="${applied.interviews !=null}">
                                                            <button title="Schedule Interview" onclick="OpenModal${applied.id}()" class="scheduleButton" data-modal-id="datetimeModal${applied.id}">
                                                                <span class="fa fa-calendar"></span>
                                                            </button>
                                                        </c:if>
                                                    </li>

                                                    <div id="datetimeModal${applied.id}" style="width: 40%; margin-left: 30%; margin-top: 75px;padding: 25px;" class="modal">
                                                        <div class="modal-content" style="padding: 15px; box-shadow: 0 0 15px 15px lightgray;">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Congratulations on being invited to an interview!</h5>
                                                                <span  onclick="CloseModal${applied.id}()" style="font-size: 20px; font-weight: bold; cursor: pointer;">&times;</span>
                                                            </div>
                                                            <p>Interview time:</p>
                                                            <input readonly="" class="form-control" required name="time" value="${applied.interviews.meetingTime}" type="datetime-local">
                                                            <p>Meeting url:</p>
                                                            <input readonly="" class="form-control" required="" value="${applied.interviews.meetingUrl}" type="text" name="meet">
                                                            <c:if test="${applied.interviews.status == 1}">

                                                                <div class="modal-footer">
                                                                    <a id="button-3" href="./ChangeStatusInterview?id=${applied.interviews.id}&ss=2&aid=${applied.id}" class="btn btn-success">Accept</a>
                                                                    <a id="button-3" href="./ChangeStatusInterview?id=${applied.interviews.id}&ss=4&aid=${applied.id}" class="btn btn-danger" style="background-color: red">Cancel</a>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${applied.interviews.status != 1}">
                                                                <p>Status: <b style="font-weight: bold;">${applied.interviews.statusName}</b></p>
                                                                </c:if>
                                                        </div>
                                                    </div>
                                                    <script>
                                                        function CloseModal${applied.id}() {
                                                            var ele = document.getElementById("datetimeModal${applied.id}");
                                                            ele.style.display = "none";
                                                        }
                                                    </script>
                                                    <script>
                                                        function OpenModal${applied.id}() {
                                                            var ele = document.getElementById("datetimeModal${applied.id}");
                                                            ele.style.display = "Block";
                                                        }
                                                    </script>
                                                    <!--chua lam-->
                                                    <li><button title="review" class="reviewBtn" data-applied-id="${applied.id}" data-apply-job-id="${applied.job.id}" id="btnReview${applied.job.id}"><span class="fa fa-file-text-o" ></span></button></li>

                                                    <!--POPUP-->
                                                    <div id="reviewPopup" class="popup" style="display:none;">
                                                        <!-- Nội dung Popup -->
                                                        <div class="popup-content">
                                                            <span class="close">&times;</span>
                                                            <div class="formbold-main-wrapper">
                                                                <div class="formbold-form-wrapper">
                                                                    <div>
                                                                        <div>
                                                                            <p class="formbold-form-input" style="font-size: 20px; font-weight: 600;" id="jobTitle">
                                                                            </p>
                                                                        </div>
                                                                    </div>

                                                                    <div class="formbold-input-flex">
                                                                        <div>
                                                                            <input type="text" name="name" id="name" class="formbold-form-input"
                                                                                   value=""
                                                                                   style="padding-bottom: 0px; padding-top: 5px;" required disabled/>
                                                                            <label for="name" class="formbold-form-label">Name</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="formbold-textarea">
                                                                        <textarea rows="4" name="letter" id="letter"
                                                                                  placeholder="Details and specific examples will make your application stronger..."
                                                                                  class="formbold-form-input" disabled></textarea>
                                                                        <div style="padding: 10px; padding-left: 0; font-size: 13px;">What skills, work projects or
                                                                            achievements make you a strong candidate?</div>
                                                                        <label for="letter" class="formbold-form-label"> Cover Letter (Optional) </label>
                                                                    </div>

                                                                    <p style="font-size: 13px; padding-top: 10px; opacity: 0.5;">500 of 500 characters remaining</p>
                                                                    <p class="formbold-form-label">Candidate CV</p>
                                                                    <iframe src="cvs/p1.pdf" class="myCV" id="cvPreview"></iframe>
                                                                    <form action="">
                                                                        <c:if test="${sessionScope.account.roleId == 1}">
                                                                            <div class="change-form">
                                                                                <button id="button-3" role="button">PASS</button>
                                                                                <button id="button-3" role="button" style="background-color: red;">FAIL</button>
                                                                            </div>
                                                                        </c:if>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                            <style>
                                                                * {
                                                                    margin: 0;
                                                                    padding: 0;
                                                                    box-sizing: border-box;
                                                                }

                                                                .change-form
                                                                {
                                                                    display: flex;
                                                                    justify-content: space-around;
                                                                    align-items: center;
                                                                    margin-top: 3%;
                                                                }

                                                                /* CSS */
                                                                #button-3 {
                                                                    appearance: none;
                                                                    background-color: #2ea44f;
                                                                    border: 1px solid rgba(27, 31, 35, .15);
                                                                    border-radius: 6px;
                                                                    box-shadow: rgba(27, 31, 35, .1) 0 1px 0;
                                                                    box-sizing: border-box;
                                                                    color: #fff;
                                                                    cursor: pointer;
                                                                    display: inline-block;
                                                                    font-family: -apple-system, system-ui, "Segoe UI", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji";
                                                                    font-size: 14px;
                                                                    font-weight: 600;
                                                                    line-height: 20px;
                                                                    padding: 6px 16px;
                                                                    position: relative;
                                                                    text-align: center;
                                                                    text-decoration: none;
                                                                    user-select: none;
                                                                    -webkit-user-select: none;
                                                                    touch-action: manipulation;
                                                                    vertical-align: middle;
                                                                    white-space: nowrap;
                                                                    width: 25%;
                                                                    height: 40px;
                                                                }

                                                                #button-3:focus:not(:focus-visible):not(.focus-visible) {
                                                                    box-shadow: none;
                                                                    outline: none;
                                                                }

                                                                #button-3:hover {
                                                                    background-color: #2c974b;
                                                                }

                                                                #button-3:focus {
                                                                    box-shadow: rgba(46, 164, 79, .4) 0 0 0 3px;
                                                                    outline: none;
                                                                }

                                                                #button-3:disabled {
                                                                    background-color: #94d3a2;
                                                                    border-color: rgba(27, 31, 35, .1);
                                                                    color: rgba(255, 255, 255, .8);
                                                                    cursor: default;
                                                                }

                                                                #button-3:active {
                                                                    background-color: #298e46;
                                                                    box-shadow: rgba(20, 70, 32, .2) 0 1px 0 inset;
                                                                }

                                                                .myCV {
                                                                    width: 100%;
                                                                    height: 400px;
                                                                }

                                                                body {
                                                                    font-family: "Inter", sans-serif;
                                                                }

                                                                .formbold-main-wrapper {
                                                                    display: flex;
                                                                    align-items: center;
                                                                    justify-content: center;
                                                                    padding-top: 3%;
                                                                    background-color: #FFF8EC;
                                                                    border-radius: 10px 0 0 10px;
                                                                    padding: 3%;
                                                                }

                                                                .formbold-form-wrapper {
                                                                    /*margin: 0 auto;*/
                                                                    max-width: 700px;
                                                                    width: 100%;
                                                                    background: white;
                                                                    padding: 3%;
                                                                    border-radius: 15px;
                                                                    box-shadow: 0px 4px 20px rgba(0, 0, 0, .06);
                                                                    margin-top: 2%;
                                                                    height: 890px;
                                                                }

                                                                .formbold-input-flex {
                                                                    display: flex;
                                                                    gap: 20px;
                                                                    margin-bottom: 22px;
                                                                }

                                                                .formbold-input-flex>div {
                                                                    width: 100%;
                                                                    display: flex;
                                                                    flex-direction: column-reverse;
                                                                }

                                                                .formbold-textarea {
                                                                    display: flex;
                                                                    flex-direction: column-reverse;
                                                                }

                                                                .formbold-form-input {
                                                                    padding-bottom: 20px;
                                                                    border: none;
                                                                    border-bottom: 1px solid #DDE3EC;
                                                                    background: #FFFFFF;
                                                                    font-weight: 500;
                                                                    font-size: 16px;
                                                                    color: #07074D;
                                                                    outline: none;
                                                                    resize: none;
                                                                    padding-top: 0px;
                                                                }

                                                                .formbold-form-input {
                                                                    width: 100%;
                                                                    padding-bottom: 10px;
                                                                    border: none;
                                                                    border-bottom: 1px solid #DDE3EC;
                                                                    background: #FFFFFF;
                                                                    font-weight: 500;
                                                                    font-size: 16px;
                                                                    color: #07074D;
                                                                    outline: none;
                                                                    resize: none;
                                                                    padding-top: 0px;
                                                                }

                                                                .formbold-form-input::placeholder {
                                                                    color: #536387;
                                                                }

                                                                .formbold-form-input:focus {
                                                                    border-color: #6A64F1;
                                                                }

                                                                .formbold-form-label {
                                                                    color: #07074D;
                                                                    font-weight: 500;
                                                                    font-size: 16px;
                                                                    line-height: 24px;
                                                                    display: block;
                                                                    margin-bottom: 0px;
                                                                    margin-top: 20px;
                                                                    font-weight: 600;
                                                                }

                                                                .formbold-form-input:focus+.formbold-form-label {
                                                                    color: #6A64F1;
                                                                }

                                                                .formbold-input-file input[type="file"] {
                                                                    position: absolute;
                                                                    top: 6px;
                                                                    left: 0;
                                                                    z-index: -1;
                                                                }

                                                                .formbold-input-file .formbold-input-label {
                                                                    display: flex;
                                                                    align-items: center;
                                                                    gap: 10px;
                                                                    position: relative;
                                                                }

                                                                .formbold-filename-wrapper {
                                                                    display: flex;
                                                                    flex-direction: column;
                                                                    gap: 6px;
                                                                    margin-bottom: 22px;
                                                                }

                                                                .formbold-filename {
                                                                    display: flex;
                                                                    align-items: center;
                                                                    justify-content: space-between;
                                                                    font-size: 14px;
                                                                    line-height: 24px;
                                                                    color: #536387;
                                                                }

                                                                .formbold-filename svg {
                                                                    cursor: pointer;
                                                                }

                                                                .formbold-btn {
                                                                    font-size: 16px;
                                                                    border-radius: 12px;
                                                                    padding: 12px 25px;
                                                                    border: none;
                                                                    font-weight: 500;
                                                                    background-color: #6A64F1;
                                                                    color: white;
                                                                    cursor: pointer;
                                                                    margin-top: 25px;
                                                                    width: 100%;
                                                                }

                                                                .formbold-btn:hover {
                                                                    box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
                                                                }
                                                            </style>
                                                        </div>
                                                    </div>
                                                    <!---------------------------------->
                                                    <!--<li><button title="Delete" id="removeAppliedJob"><span class="fa fa-trash-o"></span></button></li>-->
                                                    <!--//-->
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <div class="row mt-4 mt-lg-5 justify-content-between align-items-center">
                            <div class="col-auto">
                                <nav class="mt-3 mt-sm-0" aria-label="Applications list pagination">
                                    <ul class="pagination pxp-pagination">
                                        <li class="page-item active" aria-current="page">
                                            <span class="page-link">1</span>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    </ul>
                                </nav>
                            </div>
                            <div class="col-auto">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script src="js/jquery-3.4.1.min.js"></script>
            <script src="js/bootstrap.bundle.min.js"></script>
            <script src="js/owl.carousel.min.js"></script>
            <script src="js/nav.js"></script>
            <script src="js/Chart.min.js"></script>
            <script src="js/main.js"></script>

            <script>
                                                        document.querySelectorAll('.cancelApplication').forEach(function (button) {
                                                            button.addEventListener('click', function () {
                                                                var jobId = this.value;
                                                                var confirmCancel = confirm("Are you sure you want to cancel? Your reputation with the employer may be affected.");
                                                                if (confirmCancel) {
                                                                    var form = document.createElement('form');
                                                                    form.method = 'POST';
                                                                    form.action = '/ITJob/AppliedList'; 

                                                                    var input = document.createElement('input');
                                                                    input.type = 'hidden';
                                                                    input.name = 'jobId';
                                                                    input.value = jobId;
                                                                    form.appendChild(input);
                                                                    document.body.appendChild(form);
                                                                    form.submit();
                                                                }
                                                            });
                                                        });
                                                        
                                                        function createClickHandler(appliedId, applyJobId) {
                                                            return function () {
                                                                document.getElementById("reviewPopup").style.display = "block";
                                                                console.log("HELLO", appliedId, applyJobId);
                                                                var xhr = new XMLHttpRequest();
                                                                xhr.open("POST", "AutoFillApplication", true);
                                                                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                                                                var data = 'appliedId=' + encodeURIComponent(appliedId) + '&applyJobId=' + encodeURIComponent(applyJobId);
                                                                xhr.onreadystatechange = function () {
                                                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                                                        let data = JSON.parse(xhr.responseText);
                                                                        let titleJob = data.titleJob;
                                                                        let coverLetter = data.coverLetter;
                                                                        let fullName = data.fullName;
                                                                        let cvURL = data.cvUrl;
                                                                        document.getElementById("cvPreview").src = cvURL;
                                                                        document.getElementById("name").value = fullName;
                                                                        document.getElementById("letter").value = coverLetter;
                                                                        document.getElementById("jobTitle").innerHTML = titleJob;
                                                                    }
                                                                };
                                                                xhr.send(data);
                                                            };
                                                        }
                                                        var reviewButtons = document.getElementsByClassName("reviewBtn");
                                                        for (var i = 0; i < reviewButtons.length; i++) {
                                                            var appliedId = reviewButtons[i].getAttribute("data-applied-id");
                                                            var applyJobId = reviewButtons[i].getAttribute("data-apply-job-id");
                                                            reviewButtons[i].onclick = createClickHandler(appliedId, applyJobId);
                                                        }
                                                        document.getElementsByClassName("close")[0].onclick = function () {
                                                            document.getElementById("reviewPopup").style.display = "none";
                                                        };
                                                        window.onclick = function (event) {
                                                            if (event.target == document.getElementById("reviewPopup")) {
                                                                document.getElementById("reviewPopup").style.display = "none";
                                                            }
                                                            ;
                                                        };

            </script>
    </body>
</html>
