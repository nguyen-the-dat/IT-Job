
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

        <title>Jobster - Candidate dashboard - Edit profile</title>
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
                    <li class="pxp-active"><a href="/ITJob/EditProfile"><span class="fa fa-home"></span>Profile</a></li>
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
                                    <li class="nav-item"><a href="/ITJob/EditProfile"><span class="fa fa-home"></span>Dashboard</a></li>
                                    <li class="nav-item"><a href="/ITJob/EditResume"><span class="fa fa-pencil"></span>Edit Profile</a></li>
                                    <li><a href="/ITJob/AppliedList"><span class="fa fa-file-text-o"></span>Apllications</a></li>
                                    <li><a href="/ITJob/FavouriteJob"><span class="fa fa-heart-o"></span>Favourite Jobs</a></li>
                                    <li><a href="/ITJob/profilepass"><span class="fa fa-lock"></span>Change Password</a></li>
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
                <p class="pxp-text-light">Edit your candidate profile page info.</p>
                <p>${requestScope.mess}</p>
                <form action="EditResume" method="post" enctype="multipart/form-data">
                    <div class="row mt-4 mt-lg-5">
                        <div class="col-xxl-8">
                            <input type="hidden" id="id" name="id" value="${sessionScope.jobseeker.id}">
                            <div class="mb-3">
                                <label for="pxp-candidate-name" class="form-label">Name</label>
                                <input type="text" id="pxp-candidate-name" class="form-control" placeholder="Add your name" name="Name" value="${sessionScope.jobseeker.name}">
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="mb-3">
                                        <label for="pxp-candidate-dob" class="form-label">Date of Birth</label>
                                        <fmt:parseDate value="${sessionScope.jobseeker.getDOB()}" pattern="yyyy-MM-dd" var="myDate"/>
                                        <fmt:formatDate value="${myDate}" var="startFormat" pattern="yyyy-MM-dd"/>
                                        <input type="date" id="pxp-candidate-dob" class="form-control" name="DOB" value="${startFormat}">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="mb-3">
                                        <label for="pxp-candidate-country" class="form-label">Country</label>
                                        <input type="text" id="pxp-candidate-country" class="form-control" placeholder="Country" name="Country" value="${sessionScope.jobseeker.country}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="mb-3">
                                        <label for="pxp-candidate-gender" class="form-label">Gender</label>
                                        <select id="pxp-candidate-gender" class="form-control" name="Gender">
                                            <option value="Male" ${sessionScope.jobseeker.gender eq true? 'selected' : ''}>Male</option>
                                            <option value="Female" ${sessionScope.jobseeker.gender eq false? 'selected' : ''}>Female</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="mb-3">
                                        <label for="pxp-candidate-account-id" class="form-label">User Name</label>
                                        <input type="text" id="pxp-candidate-account-id" class="form-control" placeholder="User Name" name="username" readonly value="${sessionScope.jobseeker.accountId}">
                                    </div>
                                </div>


                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="mb-3">
                                        <label for="pxp-candidate-email" class="form-label">Email</label>
                                        <input type="email" id="pxp-candidate-email" class="form-control" name="EmailContact" value="${sessionScope.jobseeker.getEmailContact()}">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="mb-3">
                                        <label for="pxp-candidate-phone" class="form-label">Phone</label>
                                        <input type="tel" id="pxp-candidate-phone" class="form-control"  name="PhoneContact" value="${sessionScope.jobseeker.phoneContact}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xxl-4">
                            <div class="form-label">&nbsp;</div>
                            <div class="pxp-candidate-cover mb-3">
                                <c:if test="${not empty sessionScope.jobseeker.getImageUrl()}">
                                    <img src="${sessionScope.jobseeker.getImageUrl()}" alt="Cover Image" style="max-width: 100%; height: auto;"/>
                                </c:if>
                                <input type="file" id="pxp-candidate-cover-choose-file" name="coverImage" accept="image/*">
                                <label for="pxp-candidate-cover-choose-file" class="pxp-cover"><span>Upload Cover Image</span></label>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="pxp-candidate-about" class="form-label">About you</label>
                        <textarea class="form-control" id="pxp-candidate-about" placeholder="Type your info here..." name="Description" >${sessionScope.jobseeker.getDescription()}</textarea>
                    </div>
                    <div class="mt-4 mt-lg-5">
                        <button class="btn rounded-pill pxp-section-cta" type="submit">Save Profile</button>
                    </div>
                </form>
                <div class="mt-4 mt-lg-5">
                    <h2>Skills</h2>
                    <p style="color:red;">${requestScope.error}</p>
                    <div class="pxp-candidate-dashboard-skills mb-3">
                        <ul class="list-unstyled">
                            <c:forEach items="${sessionScope.skillList}" var="skill">
                                <li>${skill.skillName} -- Level ${skill.skillLevel}<a href="deleteSkill?id=${skill.id}"><span class="fa fa-trash-o"></span></a></li>
                                    </c:forEach>
                        </ul>
                    </div>
                    <form action="addSkill">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Skill" name="skillName">
                            <select class="form-select" name="level">
                                <option value="1">Level 1</option>
                                <option value="2">Level 2</option>
                                <option value="3">Level 3</option>
                                <option value="4">Level 4</option>
                                <option value="5">Level 5</option>
                            </select>
                            <button class="btn" type="submit">Add Skill</button>
                        </div>
                    </form>
                </div>

                <!--                    chua lam-->

                <div class="mt-4 mt-lg-5">
                    <h2>Work Experience</h2>
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <c:forEach items="${sessionScope.expList}" var="exp">  
                                <tr>
                                    <td style="width: 30%;"><div class="pxp-candidate-dashboard-experience-title">${exp.title}</div></td>
                                    <td style="width: 25%;"><div class="pxp-candidate-dashboard-experience-company">${exp.companyName}</div></td>
                                    <td style="width: 25%;"><div class="pxp-candidate-dashboard-experience-time">${exp.startTime}</div></td>
                                    <td style="width: 25%;"><div class="pxp-candidate-dashboard-experience-time">${exp.endTime}</div></td>
                                    <td>
                                        <div class="pxp-dashboard-table-options">
                                            <ul class="list-unstyled">
                                                <li><button title="Edit" data-bs-toggle="modal" data-bs-target="#editExperience${exp.id}"><span class="fa fa-pencil"></span></button></li>
                                                <li><button title="Delete" onclick="window.location.href = '${pageContext.request.contextPath}/deleteExperience?id=${exp.id}'"><span class="fa fa-trash-o"></span></button></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <div class="modal fade" id="editExperience${exp.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Edit Work Experience</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="editExperience" method="post" onsubmit="return validateEditForm()">
                                                    <input type="hidden" id="id" name="id" value="${exp.id}">
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="col-form-label">Job title</label>
                                                        <input type="text" name="title" value="${exp.title}" required="" class="form-control" id="recipient-name">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="col-form-label">Company</label>
                                                        <input type="text" name="company" value="${exp.companyName}" required="" class="form-control" id="recipient-name">
                                                    </div>
                                                    <fmt:parseDate value="${exp.startTime}" pattern="yyyy-MM-dd" var="startDate"/>
                                                    <fmt:formatDate value="${startDate}" var="startFormat" pattern="yyyy-MM-dd"/>
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="col-form-label">Start Time</label>
                                                        <input type="date" name="start" value="${startFormat}" required="" class="form-control" id="startDateEdit">
                                                    </div>
                                                    <fmt:parseDate value="${exp.endTime}" pattern="yyyy-MM-dd" var="endDate"/>
                                                    <fmt:formatDate value="${endDate}" var="endFormat" pattern="yyyy-MM-dd"/>
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="col-form-label">End Time</label>
                                                        <input type="date" name="end" value="${endFormat}" required="" class="form-control" id="endDateEdit">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="message-text" class="col-form-label">Descriptions</label>
                                                        <textarea name="description" class="form-control" id="message-text" required="" placeholder="Type a short description here...">${exp.description}</textarea>
                                                    </div>
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Save</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </table>
                    </div>
                    <form action="addExperience" method="post" onsubmit="return validateForm()">
                        <div class="row mt-3 mt-lg-4">
                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label for="pxp-candidate-work-title" class="form-label">Job title</label>
                                    <input type="text" name="title" id="pxp-candidate-work-title" class="form-control" placeholder="E.g. Web Designer" required="">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label for="pxp-candidate-work-company" class="form-label">Company</label>
                                    <input type="text" name="company" id="pxp-candidate-work-company" class="form-control" placeholder="Company name" required="">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label for="pxp-candidate-work-time" class="form-label">Start Time</label>
                                    <input type="date" name="start" id="startDate" class="form-control" required="">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label for="pxp-candidate-work-time" class="form-label">End Time</label>
                                    <input type="date" name="end" id="endDate" class="form-control" required="">
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="pxp-candidate-work-about" class="form-label">Description</label>
                            <textarea class="form-control pxp-smaller" name="description" id="pxp-candidate-work-about" required="" placeholder="Type a short description here..."></textarea>
                        </div>
                        <button class="btn rounded-pill pxp-subsection-cta">Add Experience</button>
                    </form>
                </div>
                <div class="mt-4 mt-lg-5">
                    <h2>Education & Training</h2>
                    <div class="table-responsive">

                        <table class="table align-middle">
                            <c:forEach items="${sessionScope.eduList}" var="item">
                                <tr>
                                    <td style="width: 30%;"><div class="pxp-candidate-dashboard-experience-title">${item.major}</div></td>
                                    <td style="width: 14%;"><div class="pxp-candidate-dashboard-experience-school">${item.schoolName}</div></td>
                                    <td style="width: 14%;"><div class="pxp-candidate-dashboard-experience-school">${item.degree}</div></td>
                                    <td style="width: 14%;"><div class="pxp-candidate-dashboard-experience-time">${item.startTime}</div></td>
                                    <td style="width: 14%;"><div class="pxp-candidate-dashboard-experience-time">${item.endTime}</div></td>
                                    <td>
                                        <div class="pxp-dashboard-table-options">
                                            <ul class="list-unstyled">
                                                <li><button title="Edit" data-bs-toggle="modal" data-bs-target="#editEducaton${item.id}"><span class="fa fa-pencil"></span></button></li>
                                                <li><button title="Delete" onclick="window.location.href = '${pageContext.request.contextPath}/deleteEdu?id=${item.id}'"><span class="fa fa-trash-o"></span></button></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <div class="modal fade" id="editEducaton${item.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Edit Education Training</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="editEducation" method="post" onsubmit="return validateEditEduForm()">
                                                    <input type="hidden" id="id" name="id" value="${item.id}">
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="col-form-label">Major</label>
                                                        <input type="text" name="title" value="${item.major}" required="" class="form-control" id="recipient-name">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="col-form-label">School Name</label>
                                                        <input type="text" name="school" value="${item.schoolName}" required="" class="form-control" id="recipient-name">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="col-form-label">Degree</label>
                                                        <input type="text" name="degree" value="${item.degree}" required="" class="form-control" id="recipient-name">
                                                    </div>
                                                    <fmt:parseDate value="${item.startTime}" pattern="yyyy-MM-dd" var="startDate"/>
                                                    <fmt:formatDate value="${startDate}" var="startFormat" pattern="yyyy-MM-dd"/>
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="col-form-label">Start Time</label>
                                                        <input type="date" name="start" value="${startFormat}" required="" class="form-control" id="startEduDateEdit">
                                                    </div>
                                                    <fmt:parseDate value="${item.endTime}" pattern="yyyy-MM-dd" var="endDate"/>
                                                    <fmt:formatDate value="${endDate}" var="endFormat" pattern="yyyy-MM-dd"/>
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="col-form-label">End Time</label>
                                                        <input type="date" name="end" value="${endFormat}" required="" class="form-control" id="endEduDateEdit">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="message-text" class="col-form-label">Descriptions</label>
                                                        <textarea name="description" class="form-control" id="message-text" required="" placeholder="Type a short description here...">${item.description}</textarea>
                                                    </div>
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Save</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </table>
                    </div>
                    <form action="addEducation" method="post" onsubmit="return validateAddEduForm()">
                        <div class="row mt-3 mt-lg-4">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="pxp-candidate-edu-title" class="form-label">Major</label>
                                    <input type="text" name="title" required="" id="pxp-candidate-edu-title" class="form-control" placeholder="E.g. Architecure">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="pxp-candidate-edu-school" class="form-label">School</label>
                                    <input type="text" name="school" required="" id="pxp-candidate-edu-school" class="form-control" placeholder="School name">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="pxp-candidate-edu-time" class="form-label">Degree</label>
                                    <input type="text" name="degree" id="pxp-candidate-edu-time" required="" class="form-control" placeholder="Degree">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="pxp-candidate-edu-time" class="form-label">Start Time</label>
                                    <input type="date" name="start" id="startEdu" required="" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="pxp-candidate-edu-time" class="form-label">End Time</label>
                                    <input type="date" name="end" id="endEdu" required="" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="pxp-candidate-edu-about" class="form-label">Description</label>
                            <textarea name="description" required="" class="form-control pxp-smaller" id="pxp-candidate-edu-about" placeholder="Type a short description here..."></textarea>
                        </div>
                        <button class="btn rounded-pill pxp-subsection-cta" type="submit">Add Education</button>
                    </form>
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
        <script type="text/javascript">
                        function validateForm() {
                            var startDate = new Date(document.getElementById('startDate').value);
                            var endDate = new Date(document.getElementById('endDate').value);

                            if (startDate >= endDate) {
                                alert("Ngày bắt đầu phải nhỏ hơn ngày kết thúc!");
                                return false;
                            }
                            return true;
                        }

                        function validateEditForm() {
                            var startDate = new Date(document.getElementById('startDateEdit').value);
                            var endDate = new Date(document.getElementById('endDateEdit').value);

                            if (startDate >= endDate) {
                                alert("Ngày bắt đầu phải nhỏ hơn ngày kết thúc!");
                                return false;
                            }
                            return true;
                        }

                        function validateAddEduForm() {
                            var startDate = new Date(document.getElementById('startEdu').value);
                            var endDate = new Date(document.getElementById('endEdu').value);

                            if (startDate >= endDate) {
                                alert("Ngày bắt đầu phải nhỏ hơn ngày kết thúc!");
                                return false;
                            }
                            return true;
                        }
                        
                        function validateEditEduForm() {
                            var startDate = new Date(document.getElementById('startEduDateEdit').value);
                            var endDate = new Date(document.getElementById('endEduDateEdit').value);

                            if (startDate >= endDate) {
                                alert("Ngày bắt đầu phải nhỏ hơn ngày kết thúc!");
                                return false;
                            }
                            return true;
                        }
        </script>
    </body>
</html>