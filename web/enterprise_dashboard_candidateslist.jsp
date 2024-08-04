<%-- 
    Document   : company_dashboard_candidateslist
    Created on : Jan 31, 2024, 9:51:29 PM
    Author     : thain
--%>

<%@page import="Model.Enterprise"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



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

        <title>List of Applicants</title>
        <style>
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
            }

            .modal-content {
                background-color: #fefefe;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }

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
            .close1 {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close1:hover,
            .close1:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
    </head>
    <body style="background-color: var(--pxpMainColorLight);">
        <div class="pxp-preloader"><span>Loading...</span></div>

        <div class="pxp-dashboard-side-panel d-none d-lg-block">
            <div class="pxp-logo">
                <a href="/ITJob/Home" class="pxp-animate"><span style="color: var(--pxpMainColor)">j</span>obster</a>
            </div>

            <nav class="mt-3 mt-lg-4 d-flex justify-content-between flex-column pb-100">
                <div class="pxp-dashboard-side-label">Enterprise tools</div>
                <ul class="list-unstyled">
                    <li><a href="/ITJob/EnterpriseDashBoard"><span class="fa fa-home"></span>Dashboard</a></li>
                    <li><a href="/ITJob/EnterpriseDashBoard/EditProfile"><span class="fa fa-pencil"></span>Edit Profile</a></li>
                    <li><a href="/ITJob/PostJob"><span class="fa fa-file-text-o"></span>New Job Offer</a></li>
                    <li><a href="/ITJob/ManageJob"><span class="fa fa-briefcase"></span>Manage Jobs</a></li>
                    <li class="pxp-active"><a href="/ITJob/Applicant"><span class="fa fa-user-circle-o"></span>Candidates</a></li>
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
                <%
                    String userRole = (String) request.getAttribute("userRole");
                    String displayName = (String) request.getAttribute("displayName");
                    String imgUrl = "images/default-avatar.jpg";

                    if ("enterprise".equals(userRole)) {
                        Enterprise enterprise = (Enterprise) request.getAttribute("user");
                        imgUrl = enterprise.getLogoUrl();
                %>
                <div class="dropdown pxp-user-nav-dropdown">
                    <a href="index.html" class="dropdown-toggle" data-bs-toggle="dropdown">
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
                                    <li class="nav-item"><a href="company-dashboard-new-job.html"><span class="fa fa-file-text-o"></span>New Job Offer</a></li>
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
                    <a href="/ITJob/PostJob" class="btn rounded-pill pxp-nav-btn">Post a Job</a>
                    <div class="dropdown pxp-user-nav-dropdown pxp-user-notifications">
                        <a role="button" class="dropdown-toggle" data-bs-toggle="dropdown">
                            <span class="fa fa-bell-o"></span>
                            <div class="pxp-user-notifications-counter">5</div>
                        </a>
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
                <h1>Candidates</h1>
                <p class="pxp-text-light">Detailed list of candidates that applied for your job offers.</p>
                <div class="mt-4 mt-lg-5">
                    <form action="Applicant" method="GET">
                        <div style="display:flex; flex-direction: row; gap: 2%">
                            <div class="col-auto order-2 order-sm-1">
                                <div class="pxp-company-dashboard-jobs-bulk-actions mb-3">
                                    <select class="form-select" style="width: 200px" name="filterValue">
                                        <option value="0" ${curFilter == 0 ? 'selected' : ''}>All</option>
                                        <option value="1" ${curFilter == 1 ? 'selected' : ''}>Processing</option>
                                        <option value="2" ${curFilter == 2 ? 'selected' : ''}>Fail</option>
                                        <option value="3" ${curFilter == 3 ? 'selected' : ''}>Pass</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-auto order-1 order-sm-2">
                                <div class="pxp-company-dashboard-jobs-search mb-3" style="flex-grow: 2">
                                    <div class="pxp-company-dashboard-jobs-bulk-actions mb-3">
                                        <select class="form-select" style="width: 300px" name="filterValueJob">
                                            <option value="0" ${curFilterJob == 0 ? 'selected' : ''}>All</option>
                                            <c:forEach items="${requestScope.jobOfEnterprise}" var="jobEnterprise">
                                                <option value="${jobEnterprise.id}" ${jobEnterprise.id == curFilterJob ? 'selected' : ''}>${jobEnterprise.title}</option>
                                            </c:forEach>
                                        </select>
                                        <button class="btn ms-2" name="btnFilter" type="submit" value="1">Apply</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="pxp-company-dashboard-jobs-search-results me-3">${applications.size()} candidates</div>

                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead>
                                <tr>
                                    <th colspan="2" style="width: 30%;">Name</th>
                                    <th style="width: 20%;">Applied for</th>
                                    <th style="width: 32%;">Status</th>
                                    <th style="width: 15%;">Date<span class="fa fa-angle-up ms-3"></span></th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${applications}" var="application" varStatus="status">
                                    <tr>
                                        <td style="width: 3%;">
                                            <div class="pxp-company-dashboard-candidate-avatar pxp-cover" style="background-image: url(${application.jobSeeker.imageUrl});"></div>
                                        </td>
                                        <td style="width: 30%;">
                                            <a href="#">
                                                <div class="pxp-company-dashboard-job-title">${application.jobSeeker.name} </div>
                                                <div class="pxp-company-dashboard-job-location"><span class="fa fa-globe me-1"></span>${application.jobSeeker.country}</div>
                                            </a>
                                        </td>
                                        <td style="width: 20%;"><div class="pxp-company-dashboard-job-category">${application.job.title}</div></td>
                                        <td style="width: 32%;">

                                            <c:if test="${fn:contains(application.statusApplicationDetail.statusApplication, 'FAIL')}">
                                                <div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-danger">${application.statusApplicationDetail.statusApplication}</span></div>
                                                </c:if>
                                                <c:if test="${fn:contains(application.statusApplicationDetail.statusApplication, 'PASS')}">
                                                <div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-success">${application.statusApplicationDetail.statusApplication}</span></div>
                                                </c:if>
                                                <c:if test="${fn:contains(application.statusApplicationDetail.statusApplication, 'PROCESSING')}">
                                                <div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-warning">${application.statusApplicationDetail.statusApplication}</span></div>
                                                </c:if>
                                                <c:if test="${fn:contains(application.statusApplicationDetail.statusApplication, 'CANCEL')}">
                                                <div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-dark">${application.statusApplicationDetail.statusApplication}</span></div>
                                                </c:if>
                                        </td>
                                        <td style="width: 15%;">
                                            <div class="pxp-company-dashboard-job-date">
                                                <fmt:formatDate value="${application.applyTime}" pattern="yyyy-MM-dd"/><br/>
                                                <fmt:formatDate value="${application.applyTime}" pattern="HH:mm:ss"/>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="pxp-dashboard-table-options">
                                                <ul class="list-unstyled">
                                                    <li><button title="View Profile"><span class="fa fa-eye"></span></button></li>
                                                    <li><button title="View Application" class="reviewBtn" data-applied-id="${application.id}" data-apply-job-id="${application.job.id}" id="btnReview${application.job.id}"><span class="fa fa-file-text-o" ></span></button></li>
                                                    <li style="width: 26px;">

                                                        <c:if test="${application.statusApplicationDetail.id>=3 && application.statusApplicationDetail.id != 6}">
                                                            <button title="Schedule Interview" class="scheduleButton" data-modal-id="datetimeModal${application.id}">
                                                                <span class="fa fa-calendar"></span>
                                                            </button>
                                                        </c:if>

                                                    </li>
                                                    <div id="datetimeModal${application.id}" class="modal">
                                                        <form method="post" action="addInterview">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Add interview</h5>
                                                                    <span class="close">&times;</span>
                                                                </div>
                                                                <p>Select interview time:</p>
                                                                <input class="form-control" ${application.interviews!=null?"readonly":""} required name="time" value="${application.interviews.meetingTime}" type="datetime-local">
                                                                <input type="hidden" value="${application.id}" name="aId" >
                                                                <p>Meeting url:</p>
                                                                <input class="form-control" ${application.interviews!=null?"readonly":""} required="" value="${application.interviews.meetingUrl}" type="text" name="meet">
                                                                <c:if test="${application.interviews!=null}">
                                                                    <p>Status: <b style="font-weight: bold;">${application.interviews.statusName}</b></p>
                                                                    </c:if>
                                                                <div class="modal-footer">
                                                                    <c:if test="${application.interviews==null}">
                                                                        <button type="submit"  class="btn btn-primary" style="width: 100px;height: 50px;">Add</button>
                                                                    </c:if>

                                                                    <c:if test="${application.interviews!=null}">
                                                                        <c:if test="${application.interviews.status == 1}">

                                                                            <div class="modal-footer">
                                                                                <a id="button-3" href="./EnterpriseChangeInterviewSs?id=${application.interviews.id}&ss=3&aid=${applied.id}" style="width: 100px;height: 35px;" class="btn btn-success">Done</a>
                                                                                <a id="button-3" href="./EnterpriseChangeInterviewSs?id=${application.interviews.id}&ss=4&aid=${applied.id}" style="width: 100px;height: 35px;background-color: red" class="btn btn-danger" >Cancel</a>
                                                                            </div>
                                                                        </c:if>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </form>


                                                        <c:if test="${fn:contains(application.statusApplicationDetail.statusApplication, 'FAIL')}">
                                                            <div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-danger">${application.statusApplicationDetail.statusApplication}</span></div>
                                                            </c:if>
                                                            <c:if test="${fn:contains(application.statusApplicationDetail.statusApplication, 'PASS')}">
                                                            <div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-success">${application.statusApplicationDetail.statusApplication}</span></div>
                                                            </c:if>
                                                            <c:if test="${fn:contains(application.statusApplicationDetail.statusApplication, 'PROCESSING')}">
                                                            <div class="pxp-company-dashboard-job-status"><span class="badge rounded-pill bg-warning">${application.statusApplicationDetail.statusApplication}</span></div>
                                                            </c:if>
                                                    </div>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="row mt-4 mt-lg-5 justify-content-between align-items-center">
                            <div class="col-auto">
                                <nav class="mt-3 mt-sm-0" aria-label="Candidates pagination">
                                    <ul class="pagination pxp-pagination">
                                        <li class="page-item active" aria-current="page">
                                            <span class="page-link">1</span>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    </ul>
                                </nav>
                            </div>
                            <!--                            <div class="col-auto">
                                                            <a href="#" class="btn rounded-pill pxp-section-cta mt-3 mt-sm-0">Show me more<span class="fa fa-angle-right"></span></a>
                                                        </div>-->
                        </div>
                    </div>
                </div>
            </div>

            <footer>
                <div class="pxp-footer-copyright pxp-text-light"></div>
            </footer>
        </div>
        <!--POPUPPPPPPPPPPPPPPPPPP-->         
        <div id="reviewPopup" class="popup" style="display:none;">
            <!-- Nội dung Popup -->
            <div class="popup-content">
                <span class="close1">&times;</span>
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
                        <form action="ChangeStatus" method="POST" id="formChangeStatus">
                            <c:if test="${sessionScope.account.roleId == 1}">
                                <div class="change-form">
                                    <div class="select">
                                        <select class="custom-font" name="selectStatusId">
                                        </select>
                                    </div>
                                    <div class="btnLeft">
                                        <button id="button-3" role="button" onclick="confirmSubmitFormStatus(event)">SAVE</button>
                                    </div>
                                    <input type="text" name="jobChangedId" hidden id="_jobChangedId">
                                    <input type="text" name="applyChangedId" hidden id="_applyChangedId">
                                    <input type="hidden" name="btnSave" value="1">
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

                    .custom-font {
                        font-family: 'Arial', sans-serif;
                        font-size: 13px;
                        color: black;
                        font-weight: 600;
                    }

                    select {
                        /* Reset Select */
                        appearance: none;
                        outline: 10px red;
                        border: 0;
                        box-shadow: none;
                        /* Personalize */
                        flex: 1;
                        padding: 0 1em;
                        color: #fff;
                        background-color: #ebd5acb8;
                        background-image: none;
                        cursor: pointer;
                    }

                    /* Remove IE arrow */
                    select::-ms-expand {
                        display: none;
                    }

                    /* Custom Select wrapper */
                    .select {
                        position: relative;
                        display: flex;
                        width: 17em;
                        height: 3em;
                        border-radius: .25em;
                        overflow: hidden;
                    }

                    /* Arrow */
                    .select::after {
                        content: '\25BC';
                        position: absolute;
                        top: 0;
                        right: 0;
                        padding: 1em;
                        background-color: #dbbe64;
                        transition: .25s all ease;
                        pointer-events: none;
                    }

                    /* Transition */
                    .select:hover::after {
                        color: #f39c12;
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
                        width: 100%;
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
                        height: 920px;
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
    </div>


    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/nav.js"></script>
    <script src="js/Chart.min.js"></script>
    <script src="js/main.js"></script>
    <script>

                                            document.querySelectorAll('.scheduleButton').forEach(button => {
                                                button.onclick = function () {
                                                    var modalId = this.getAttribute('data-modal-id');
                                                    document.getElementById(modalId).style.display = 'block';
                                                }
                                            });

                                            document.querySelectorAll('.modal .close').forEach(closeButton => {
                                                closeButton.onclick = function () {
                                                    this.closest('.modal').style.display = 'none';
                                                }
                                            });

                                            window.onclick = function (event) {
                                                if (event.target.classList.contains('modal')) {
                                                    event.target.style.display = 'none';
                                                }
                                                if (event.target == document.getElementById("reviewPopup")) {
                                                    document.getElementById("reviewPopup").style.display = "none";
                                                }
                                                ;
                                            }

                                            //LamNB HOC VIET JS :((
                                            var reviewButtons = document.getElementsByClassName("reviewBtn");
                                            for (var i = 0; i < reviewButtons.length; i++) {
                                                var appliedId = reviewButtons[i].getAttribute("data-applied-id");
                                                var applyJobId = reviewButtons[i].getAttribute("data-apply-job-id");
                                                reviewButtons[i].onclick = createClickHandler(appliedId, applyJobId);
                                            }

                                            function createClickHandler(appliedId, applyJobId) {
                                                return function () {
                                                    document.getElementById("reviewPopup").style.display = "block";
                                                    document.getElementById("_jobChangedId").value = applyJobId;
                                                    document.getElementById("_applyChangedId").value = appliedId;
                                                    var xhr = new XMLHttpRequest();
                                                    xhr.open("POST", "AutoFillApplication", true);
                                                    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                                                    var data = 'appliedId=' + encodeURIComponent(appliedId) + '&applyJobId=' + encodeURIComponent(applyJobId);
                                                    xhr.onreadystatechange = function () {
                                                        if (xhr.readyState === 4 && xhr.status === 200) {
                                                            let data = JSON.parse(xhr.responseText);
                                                            let titleJob = data.titleJob;
                                                            let coverLetter = data.coverLetter || "";
                                                            let fullName = data.fullName;
                                                            let cvURL = data.cvUrl;
                                                            let statusDetail = data.statusDetail;
                                                            let statusAppliedId = data.statusAppliedId;
                                                            if (statusAppliedId == 6) {
                                                                document.getElementById('formChangeStatus').style.display = 'none';
                                                            }
                                                            else 
                                                            {
                                                                document.getElementById('formChangeStatus').style.display = 'block';
                                                            }
                                                            let selectElement = document.querySelector('.custom-font');
                                                            selectElement.innerHTML = "";
                                                            statusDetail.forEach(function (detail) {
                                                                if (detail.id != 6) {
                                                                    let option = new Option(detail.statusApplication, detail.id);
                                                                    selectElement.add(option);
                                                                    if (statusAppliedId == detail.id) {
                                                                        option.selected = true;
                                                                    }
                                                                    constrainStatus(statusAppliedId, option);
                                                                }
                                                            });
                                                            document.getElementById("cvPreview").src = cvURL;
                                                            document.getElementById("name").value = fullName;
                                                            document.getElementById("letter").value = coverLetter;
                                                            document.getElementById("jobTitle").innerHTML = titleJob;
                                                        }
                                                    };
                                                    xhr.send(data);
                                                };
                                            }
                                            document.getElementsByClassName("close1")[0].onclick = function () {
                                                document.getElementById("reviewPopup").style.display = "none";
                                            };

                                            function constrainStatus(statusId, option)
                                            {
                                                document.getElementById("button-3").hidden = false;
                                                if (statusId == 2)
                                                {
                                                    if (option.value == 1 || option.value == 3 || option.value == 4 || option.value == 5) {
                                                        option.disabled = true;
                                                    }
                                                } else if (statusId == 3)
                                                {
                                                    if (option.value == 1 || option.value == 2) {
                                                        option.disabled = true;
                                                    }
                                                } else if (statusId == 4)
                                                {
                                                    if (option.value == 1 || option.value == 2 || option.value == 3 || option.value == 5)
                                                    {
                                                        option.disabled = true;
                                                        document.getElementById("button-3").hidden = true;
                                                    }
                                                } else if (statusId == 5)
                                                {
                                                    if (option.value == 1 || option.value == 2 || option.value == 3 || option.value == 4)
                                                    {
                                                        option.disabled = true;
                                                        document.getElementById("button-3").hidden = true;
                                                    }
                                                } else if (statusId == 1)
                                                {
                                                    if (option.value == 4 || option.value == 5)
                                                    {
                                                        option.disabled = true;
                                                    }
                                                }
                                            }

                                            function confirmSubmitFormStatus(event) {
                                                event.preventDefault();
                                                var confirmAction = confirm("Are you sure you want to change the status of the job application?");

                                                if (confirmAction) {
                                                    document.getElementById("formChangeStatus").submit();
                                                } else {
                                                    console.log("Canceled!");
                                                }
                                            }
    </script>
</body>
</html>
