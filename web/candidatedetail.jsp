<%@page import="Model.Enterprise"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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

        <title>Jobster - Candidate Detail</title>
    </head>
    <body>
        <div class="pxp-preloader"><span>Loading...</span></div>

        <header class="pxp-header fixed-top pxp-no-bg pxp-bigger">
            <div class="pxp-container">
                <div class="pxp-header-container">
                    <div class="pxp-logo-nav-container">
                        <div class="pxp-logo">
                            <a href="/ITJob/Home" class="pxp-animate"><span style="color: var(--pxpMainColor)">j</span>obster</a>
                        </div>
                        <div class="pxp-nav-trigger navbar d-xl-none flex-fill">
                            <a role="button" data-bs-toggle="offcanvas" data-bs-target="#pxpMobileNav" aria-controls="pxpMobileNav">
                                <div class="pxp-line-1"></div>
                                <div class="pxp-line-2"></div>
                                <div class="pxp-line-3"></div>
                            </a>
                            <div class="offcanvas offcanvas-start pxp-nav-mobile-container" tabindex="-1" id="pxpMobileNav">
                                <div class="offcanvas-header">
                                    <div class="pxp-logo">
                                        <a href="/ITJob/Home" class="pxp-animate"><span style="color: var(--pxpMainColor)">j</span>obster</a>
                                    </div>
                                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                </div>
                                <div class="offcanvas-body">
                                    <nav class="pxp-nav-mobile">
                                        <ul class="navbar-nav justify-content-end flex-grow-1">
                                            <li class="nav-item dropdown">
                                                <a role="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Home</a>

                                            </li>
                                            <li class="nav-item dropdown">
                                                <a role="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Find Jobs</a>

                                            </li>
                                            <li class="nav-item dropdown">
                                                <a role="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Companies</a>
                                                <ul class="dropdown-menu">
                                                    <li class="nav-item dropdown">
                                                        <a role="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Companies List</a>

                                                    </li>
                                                    <li class="nav-item dropdown">
                                                        <a role="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Single Company</a>

                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="nav-item dropdown">
                                                <a role="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Candidates</a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <nav class="pxp-nav dropdown-hover-all d-none d-xl-block">
                            <ul>
                                <li class="dropdown">
                                    <a href="/ITJob/Home">Home</a>

                                </li>
                                <li class="dropdown">
                                    <a href="/ITJob/Job">Find Jobs</a>

                                </li>
                                <li class="dropdown">
                                    <a href="/ITJob/Enterprise">Enterprises</a>

                                </li>
                                <c:if test="${sessionScope.account.roleId == 1}">
                                    <li class="dropdown">
                                        <a href="/ITJob/Candidate">Candidates</a>
                                    </li>                
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                    <nav class="pxp-user-nav pxp-on-light">
                        <a href="PostJob" class="btn rounded-pill pxp-nav-btn">Post a Job</a>
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
            </div>
        </header>

        <section>
            <div class="pxp-container">
                <div class="pxp-single-candidate-container">
                    <div class="row justify-content-center">
                        <div class="col-xl-9">
                            <div class="pxp-single-candidate-hero pxp-cover pxp-boxed" style="background-image: url(images/candidate-cover-1.jpg);">
                                <div class="pxp-hero-opacity"></div>
                                <div class="pxp-single-candidate-hero-caption">
                                    <div class="pxp-single-candidate-hero-content d-block text-center">
                                        <div class="pxp-single-candidate-hero-avatar d-inline-block" style="background-image: url(${jobSeeker.imageUrl});"></div>
                                        <div class="pxp-single-candidate-hero-name ms-0 mt-3">
                                            <h1>${jobSeeker.name}</h1>
                                            <!--                                            <div class="pxp-single-candidate-hero-title">UX/UI Designer</div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row mt-4 mt-lg-5">
                                <div class="col-lg-7 col-xxl-8">
                                    <div class="pxp-single-candidate-content">
                                        <h2>About ${jobSeeker.name}</h2>
                                        <p>${jobSeeker.description}</p>

                                        <div class="mt-4 mt-lg-5">
                                            <h2>Skills</h2>
                                            <div class="pxp-single-candidate-skills">
                                                <ul class="list-unstyled">
                                                    <c:forEach var="skill" items="${skillsMap[jobSeeker.id]}">
                                                        <li>${skill.skillName}</li>
                                                        </c:forEach>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="mt-4 mt-lg-5">
                                            <h2>Work Experience</h2>
                                            <div class="pxp-single-candidate-timeline">
                                                <c:forEach var="exp" items="${workExperiencesMap[jobSeeker.id]}">
                                                    <div class="pxp-single-candidate-timeline-item">
                                                        <div class="pxp-single-candidate-timeline-dot"></div>
                                                        <div class="pxp-single-candidate-timeline-info ms-3">
                                                            <div class="pxp-single-candidate-timeline-time">
                                                                <span class="me-3">
                                                                    <fmt:formatDate value="${exp.startTime}" pattern="yyyy" />
                                                                    <c:if test="${exp.endTime != null}">
                                                                        - <fmt:formatDate value="${exp.endTime}" pattern="yyyy" />
                                                                    </c:if>
                                                                </span>
                                                            </div>

                                                            <div class="pxp-single-candidate-timeline-position mt-2">${exp.title}</div>
                                                            <!--                                                            <div class="pxp-single-candidate-timeline-company pxp-text-light">Adobe Corporation</div>-->
                                                            <div class="pxp-single-candidate-timeline-about mt-2 pb-4">${exp.description}</div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <div class="mt-4 mt-lg-5">
                                            <h2>Education & Training</h2>
                                            <div class="pxp-single-candidate-timeline">
                                                <c:forEach var="edu" items="${educationsMap[jobSeeker.id]}">
                                                    <div class="pxp-single-candidate-timeline-item">
                                                        <div class="pxp-single-candidate-timeline-dot"></div>
                                                        <div class="pxp-single-candidate-timeline-info ms-3">
                                                            <div class="pxp-single-candidate-timeline-time">
                                                                <span class="me-3">
                                                                    <fmt:formatDate value="${edu.startTime}" pattern="yyyy" />
                                                                    <c:if test="${edu.endTime != null}">
                                                                        - <fmt:formatDate value="${edu.endTime}" pattern="yyyy" />
                                                                    </c:if>
                                                                </span>
                                                            </div>                      
                                                            <div class="pxp-single-candidate-timeline-position mt-2">${edu.major}</div>
                                                            <div class="pxp-single-candidate-timeline-company pxp-text-light">${edu.schoolName}: ${edu.degree}</div>
                                                            <div class="pxp-single-candidate-timeline-about mt-2 pb-4">${edu.description}</div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-5 col-xxl-4">
                                    <div class="pxp-single-candidate-side-panel mt-5 mt-lg-0">
                                        <div>
                                            <div class="pxp-single-candidate-side-info-label pxp-text-light">Email</div>
                                            <div class="pxp-single-candidate-side-info-data">${jobSeeker.emailContact}</div>
                                        </div>
                                        <div class="mt-4">
                                            <div class="pxp-single-candidate-side-info-label pxp-text-light">Location</div>
                                            <div class="pxp-single-candidate-side-info-data">${jobSeeker.country}</div>
                                        </div>
                                        <div class="mt-4">
                                            <div class="pxp-single-candidate-side-info-label pxp-text-light">Phone</div>
                                            <div class="pxp-single-candidate-side-info-data">${jobSeeker.phoneContact}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <footer class="pxp-main-footer mt-100">
            <div class="pxp-main-footer-top pt-100 pb-100" style="background-color: var(--pxpMainColorLight);">
                
            </div>
        </footer>

        <div class="modal fade pxp-user-modal" id="pxp-signin-modal" aria-hidden="true" aria-labelledby="signinModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="pxp-user-modal-fig text-center">
                            <img src="images/signin-fig.png" alt="Sign in">
                        </div>
                        <h5 class="modal-title text-center mt-4" id="signinModal">Welcome back!</h5>
                        <form class="mt-4">
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="pxp-signin-email" placeholder="Email address">
                                <label for="pxp-signin-email">Email address</label>
                                <span class="fa fa-envelope-o"></span>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="pxp-signin-password" placeholder="Password">
                                <label for="pxp-signin-password">Password</label>
                                <span class="fa fa-lock"></span>
                            </div>
                            <a href="#" class="btn rounded-pill pxp-modal-cta">Continue</a>
                            <div class="mt-4 text-center pxp-modal-small">
                                <a href="#" class="pxp-modal-link">Forgot password</a>
                            </div>
                            <div class="mt-4 text-center pxp-modal-small">
                                New to Jobster? <a role="button" class="" data-bs-target="#pxp-signup-modal" data-bs-toggle="modal" data-bs-dismiss="modal">Create an account</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade pxp-user-modal" id="pxp-signup-modal" aria-hidden="true" aria-labelledby="signupModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="pxp-user-modal-fig text-center">
                            <img src="images/signup-fig.png" alt="Sign up">
                        </div>
                        <h5 class="modal-title text-center mt-4" id="signupModal">Create an account</h5>
                        <form class="mt-4">
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="pxp-signup-email" placeholder="Email address">
                                <label for="pxp-signup-email">Email address</label>
                                <span class="fa fa-envelope-o"></span>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="pxp-signup-password" placeholder="Create password">
                                <label for="pxp-signup-password">Create password</label>
                                <span class="fa fa-lock"></span>
                            </div>
                            <a href="#" class="btn rounded-pill pxp-modal-cta">Continue</a>
                            <div class="mt-4 text-center pxp-modal-small">
                                Already have an account? <a role="button" class="" data-bs-target="#pxp-signin-modal" data-bs-toggle="modal">Sign in</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/nav.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
