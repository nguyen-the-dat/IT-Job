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
                <h1>View Profile Enterprise</h1>
                <p class="pxp-text-light">View company profile page info.</p>
                <c:set var="eC" value="${requestScope.enterprisesClone}"></c:set>
                    <form action="EditProfile" method="POST" enctype="multipart/form-data">
                        <div class="row mt-4 mt-lg-5">
                            <div class="col-xxl-8">
                                <div class="mb-3">
                                    <label for="pxp-company-name" class="form-label">Full Company name</label>
                                    <input type="text" value="${eC.fullCompanyName}" name="fullCompanyName" id="pxp-company-name"
                                       readonly="true"     class="form-control">
                            </div>

                            <div class="mb-3">
                                <label for="pxp-company-shortName" class="form-label">Short Company name</label>
                                <input type="text" value="${eC.shortName}" name="shortName" id="pxp-company-shortName"
                                       readonly="true"    class="form-control" placeholder="Short Company Name">
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="mb-3">
                                        <label for="pxp-company-email" class="form-label">Email</label>
                                        <input type="email" name="email" value="${eC.emailContact}" id="pxp-company-email"
                                               readonly="true"     class="form-control">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="mb-3">
                                        <label for="pxp-company-phone" class="form-label">Phone number</label>
                                        <input type="tel" name="phoneNumber" value="${eC.phoneContact}" id="pxp-company-phone"
                                               readonly="true"     class="form-control">
                                    </div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="pxp-company-taxcode" class="form-label">Taxcode</label>
                                <input type="text" value="${eC.taxCode}" id="pxp-company-taxcode" class="form-control"
                                       readonly="true"     placeholder="0xxx..." name="taxcode">
                            </div>

                            <!--                        xu li update hinh anh-->



                            <div style="display:flex">
                                <div class="col-sm">
                                    <label for="blFront" class="pxp-cover">Bussiness Lisence Front</label>
                                    <c:if test="${eC.businessLicenseFront != null}">
                                        <img title="Bussiness Lisence Front" src="${eC.businessLicenseFront}" alt="alt" class="img-rounded" onclick="showImage(this)" style="display: flex; border: 1px dashed rgba(0,0,0,.2); border-radius: 30px; width: 50%; height: 120px; justify-content: center; align-items: center; cursor: pointer; font-size: 13px; font-weight: 500; text-align: center;"/>
                                    </c:if>
                                </div>

                                <div class="col-sm">
                                    <label for="blBack" class="pxp-cover">Bussiness Lisence Back</label>
                                    <c:if test="${eC.businessLicenseBack != null}">
                                        <img title="Bussiness Lisence Back" src="${eC.businessLicenseBack}" alt="alt" class="img-rounded" onclick="showImage(this)" style="display: flex; border: 1px dashed rgba(0,0,0,.2); border-radius: 30px; width: 50%; height: 120px; justify-content: center; align-items: center; cursor: pointer; font-size: 13px; font-weight: 500; text-align: center;"/>
                                    </c:if>
                                </div>
                            </div>
                            <br>
                            <div class="mb-3">
                                <label for="pxp-company-website" class="form-label">Website</label>
                                <input type="url" value="${eC.websiteUrl}" id="pxp-company-website" class="form-control"
                                       readonly="true"   placeholder="https://" name="websiteUrl">
                            </div>
                        </div>

                        <!--                        xu li update hinh anh-->

                        <div class="col-xxl-4">
                            <div class="form-label">&nbsp;</div>
                            <div class="pxp-company-cover mb-3" >
                                <c:if test="${eC.logoUrl != null}">
                                    <img title="Logo Company" src="${eC.logoUrl}" alt="alt" class="img-rounded" onclick="showImage(this)" style="display: flex; border: 1px dashed rgba(0,0,0,.2); border-radius: 30px; width: 100%; height: 166px; justify-content: center; align-items: center; cursor: pointer; font-size: 13px; font-weight: 500; text-align: center;"/>
                                </c:if>

                                <c:if test="${eC.logoUrl==null}">
                                    <input readonly="true" name="logoUrl" type="file" id="pxp-company-cover-choose-file" >
                                    <label for="pxp-company-cover-choose-file" class="pxp-cover"><span>Upload Logo Url</span></label>
                                </c:if>

                            </div>



                            <div class="col-sm">

                                <c:if test="${eC.imageUrl != null}">
                                    <img title="Image about company" src="${eC.imageUrl}" alt="alt" class="img-rounded" onclick="showImage(this)" style="display: flex; border: 1px dashed rgba(0,0,0,.2); border-radius: 30px; width: 50%; height: 90px; justify-content: center; align-items: center; cursor: pointer; font-size: 13px; font-weight: 500; text-align: center;"/>

                                </c:if>
                                <c:if test="${eC.imageUrl == null}">
                                    <input type="file" id="pxp-company-logo-choose-file" name="imageUrl">
                                    <label for="pxp-company-logo-choose-file" class="pxp-cover">Image Url</label></c:if>
                                </div>
                            </div>


                        </div>

                        <div class="mb-3">
                            <label for="pxp-company-about" class="form-label">About the company</label>
                            <textarea 
                                  class="form-control" id="pxp-company-about" name="description"
                                  readonly="true">${eC.description}</textarea>
                    </div>

                    <div class="row">

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="pxp-company-founded" class="form-label">Founded in</label>
                                <input value="${eC.foundedYear}" type="number" id="pxp-company-founded" class="form-control"
                                       readonly="true" name="foundedYear">
                            </div>
                        </div>
                        <div class="col-md-6">

                            <div class="mb-3">
                                <label for="pxp-company-size" class="form-label">Enterprise size</label>
                                <select name="enterpriseSize" id="pxp-company-size" class="form-select">
                                    <option value="1" ${eC.enterpriseSizeDetail.id==1 ? "selected" : ""}>&lt; Less than 10</option>
                                    <option value="2" ${eC.enterpriseSizeDetail.id==2 ? "selected" : ""} >From 10 to 50</option>
                                    <option value="3" ${eC.enterpriseSizeDetail.id==3 ? "selected" : ""} >From 50 to 100</option>
                                    <option value="4" ${eC.enterpriseSizeDetail.id==4 ? "selected" : ""} >From 100 to 500</option>
                                    <option value="5" ${eC.enterpriseSizeDetail.id==5 ? "selected" : ""} >&gt; More than 500</option>
                                </select>



                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="pxp-company-enterpriseType" class="form-label">Enterprise Type</label>
                                <select name="enterpriseType" id="pxp-company-enterpriseType" class="form-select">

                                    <option value="1" ${eC.companyTypeDetail.id==1 ? "selected" : ""}>PRODUCT</option>
                                    <option value="2" ${eC.companyTypeDetail.id==1 ? "selected" : ""}>OUTSOURCE</option>

                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="pxp-company-workingDay" class="form-label">Working Day</label>
                                <input value="${eC.workingday}" type="number" name="workingDay" id="pxp-company-workingDay"
                                       readonly="true"    class="form-control" placeholder="E.g. 4">
                            </div>
                        </div>
                    </div>



                    <div class="mt-4 mt-lg-5">
                        <h2>Company Location</h2>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="pxp-company-country" class="form-label">Country/State</label>
                                    <input type="text" value="${eC.country}" name="country" id="pxp-company-country"
                                           readonly="true"     class="form-control" >
                                </div>
                            </div>

                        </div>
                        <div class="mb-3">
                            <label for="pxp-company-address" class="form-label">Address</label>
                            <input type="text" value="${eC.address}" name="fullAddress" id="pxp-company-address"
                                   readonly="true"    class="form-control" >
                        </div>
                    </div>

                    <div class="mt-4 mt-lg-5">
                        <h2>Social Media</h2>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="pxp-company-facebook" class="form-label">Facebook</label>
                                    <input value="${eC.facebookUrl}" type="url" id="pxp-company-facebook" name="facebookLink"
                                           readonly="true"    class="form-control" placeholder="https://">
                                </div>
                            </div>

                        </div>
                    </div>

                    <!--                    <div class="mt-4 mt-lg-5">
                                                                <button type="submit" class="btn rounded-pill pxp-section-cta">Go back</button>
                                            <button title="Go back" onclick="goBack()"><span class="fa fa-arrow-left"></span> Back</button>
                    
                                        </div>-->

                </form>
            </div>
			

            <footer>
                <div class="pxp-footer-copyright pxp-text-light"></div>
            </footer>
        </div>
        <script>
            function checkImageExists(imgUrl, callback) {
                var xhr = new XMLHttpRequest();
                xhr.open('HEAD', imgUrl);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        callback(xhr.status === 200);
                    }
                };
                xhr.send();
            }

            function showImage(img) {
                var originalSrc = img.src;
                checkImageExists(originalSrc, function (exists) {
                    if (exists) {
                        var popup = window.open(originalSrc, 'Image', 'width=auto,height=auto,resizable=yes');
                        if (!popup || popup.closed || typeof popup.closed === 'undefined') {
                            window.location.href = originalSrc;
                        }
                    } else {
                        alert('The image does not exist.');
                    }
                });
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
