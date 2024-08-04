<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en" class="pxp-root">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="../images/favicon.png" type="image/x-icon">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600;700&display=swap" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/style.css">

        <title>Jobster - Sign in</title>
        <style>
            .welcome-container {
                text-align: center;
                padding: 0px;
                display: none;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                z-index: 9999;
                background-color: #fff;
                border: 1px solid #ccc;


            }

            .close-button {
                position: absolute;
                top: 10px;
                right: 10px;
                cursor: pointer;
            }

            .welcome-message {
                margin-bottom: 20px;
            }

            .option-container {
                display: flex;
                justify-content: center;
                gap: 50px;
                margin-top: 20px;
            }

            .option {
                border: #ccc;

                width: auto;
                height: auto;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
            }

            .option img {
                width: auto;
                /* Adjust as needed */
                height: auto;
                /* Adjust as needed */
                border-radius: 50%;
            }

            .button {
                display: inline-block;
                padding: 10px 20px;
                margin-top: 10px;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }
            .nav-item-large{
                font-size: 20px !important;
                font-weight: 600 !important;
            }
        </style>
    </head>
    <body>
        <div class="pxp-preloader"><span>Loading...</span></div>
        <c:if test="${not empty loginMessage}">
            <script>alert('${loginMessage}');</script>
        </c:if>
        <header class="pxp-header fixed-top">
            <div class="pxp-container">
                <div class="pxp-header-container">
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
                                    <a href="index.html" class="pxp-animate"><span style="color: var(--pxpMainColor)">j</span>obster</a>
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
                                            <a role="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Enterprises</a>
                                        <li class="nav-item dropdown">
                                            <a role="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Candidates</a>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a role="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Blog</a>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a role="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <nav class="pxp-nav dropdown-hover-all d-none d-xl-block" style="margin-left: -50rem; ">
                        <ul>
                            <li class="dropdown">
                                <a href="/ITJob/Home" class="nav-item-large">Home</a>
                            </li>
                            <li class="dropdown">
                                <a href="/ITJob/Job" class="nav-item-large">Find Jobs</a>
                            </li>
                            <li class="dropdown">
                                <a href="/ITJob/Enterprise" class="nav-item-large">Enterprises</a>
                            </li>
                            <c:if test="${userRole == 'enterprise'}">
                                <li class="dropdown">
                                    <a href="/ITJob/Candidate" class="nav-item-large">Candidates</a>
                                </li>                
                            </c:if>
                        </ul>
                    </nav>
                    <nav class="pxp-user-nav pxp-on-light d-none d-sm-flex">
                        <!--                        <a href="company-dashboard-new-job.html" class="btn rounded-pill pxp-nav-btn">Post a Job</a>-->

                    </nav>
                </div>
            </div>
        </header>

        <section class="pxp-hero vh-100" style="background-color: var(--pxpMainColorLight);">
            <div class="row align-items-center pxp-sign-hero-container">
                <div class="col-xl-6 pxp-column">
                    <div class="pxp-sign-hero-fig text-center pb-100 pt-100">
                        <img src="images/signin-big-fig.png" alt="Sign In">
                        <h1 class="mt-4 mt-lg-5">Welcome back!</h1>
                    </div>
                </div>
                <div class="col-xl-6 pxp-column pxp-is-light">
                    <div class="pxp-sign-hero-form pb-100 pt-100">
                        <div class="row justify-content-center">
                            <div class="col-lg-6 col-xl-7 col-xxl-5">
                                <div class="pxp-sign-hero-form-content">
                                    <h5 class="text-center">Sign In</h5>
                                    <form class="mt-4" action="Login" method="POST">

                                        <p style="color:blue">${mess}</p>
                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" id="pxp-signin-page-email" placeholder="Username" name="Username" required>
                                            <label for="pxp-signin-page-email">Username</label>
                                            <span class="fa fa-envelope-o"></span>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input type="password" class="form-control" id="pxp-signin-page-password" placeholder="Password" name="Password">
                                            <label for="pxp-signin-page-password">Password</label>
                                            <span class="fa fa-lock"></span>
                                        </div>

                                      

                                        <input type="hidden"  name="jobId" class="form-control" id="pxp-signin-page-password" value="${sessionScope.jobId}">
                                        


                                        <p style="color:red">${requestScope.error}</p>
                                        <button style="width: 335px" type="submit" class="btn rounded-pill pxp-sign-hero-form-cta">Continue</button>
                                        <div class="google-btn" style="width: 335px;
                                             height: 53px;
                                             background-color: #4285f4;
                                             border-radius: 50px;
                                             box-shadow: 0 3px 4px 0 rgba(0,0,0,.25);
                                             display: flex;
                                             align-items: center;
                                             justify-content: center;
                                             cursor: pointer;
                                             margin-top: 18px;"
                                             onmouseover="this.style.boxShadow = '0 0 6px #4285f4'"
                                             onmouseout="this.style.boxShadow = '0 3px 4px 0 rgba(0,0,0,.25)'"
                                             onmousedown="this.style.backgroundColor = '#1669F2'"
                                             onmouseup="this.style.backgroundColor = '#4285f4'"
                                             onfocus="this.style.boxShadow = '0 0 6px #4285f4'"
                                             onblur="this.style.boxShadow = '0 3px 4px 0 rgba(0,0,0,.25)'">
                                            <div class="google-icon-wrapper" style="width: 40px;
                                                 height: 40px;
                                                 border-radius: 50%;
                                                 background-color: white;
                                                 display: flex;
                                                 align-items: center;
                                                 justify-content: center;
                                                 margin-right: 16px;">
                                                <img class="google-icon" style="width: 30px; height: 30px;border-radius: 50%;" src="images/google-icon.jpg" alt="Google sign-in"/>
                                            </div>
                                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8080/ITJob/LoginGoogleHandler&response_type=code&client_id=107009318948-7kvllbf8vujnkml8ei8ibkg03f0jq7su.apps.googleusercontent.com&approval_prompt=force" 
                                               style="color: white;
                                               font-size: 16px;
                                               letter-spacing: 0.2px;
                                               font-family: 'Poppins', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Helvetica Neue', Arial, 'Noto Sans', sans-serif;
                                               font-weight: 500;
                                               line-height: 53px;">Sign in with Google</a>
                                        </div>
                                        <div class="mt-4 text-center pxp-sign-hero-form-small">
                                            <a href="forgotpass" id="forgot-pass-link" class="pxp-modal-link">Forgot password</a>
                                        </div>
                                        <div class="mt-4 text-center pxp-sign-hero-form-small">
                                            New to Jobster? <button id="showButton" type="button" class="btn btn-secondary" style="
                                                                    padding: 2px 4px;
                                                                    margin-left: 1rem;
                                                                    border-radius: 8px;">Create an account</button>
                                            <!--                                            <a href="Register">Create an account</a>-->
                                        </div>
                                    </form>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <footer class="pxp-main-footer">
            <div class="pxp-main-footer-top pt-100 pb-100" style="background-color: var(--pxpMainColorLight);">
            </div>
        </footer>



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
                                <input type="email" class="form-control" id="pxp-signup-email" placeholder="Username">
                                <label for="pxp-signup-email">Username</label>
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
        <div class="welcome-container">
            <div class="close-button">&times;</div>

            <div class="welcome-message">
                <h1>Hey guys,</h1>
                <p>Please take a few seconds to confirm the information below!👋</p>
            </div>

            <div class="option-container">
                <div class="option">
                    <img src="https://tuyendung.topcv.vn/app/_nuxt/img/bussiness.efbec2d.png" alt="Recruiter">
                    <a style="background-color: #0969c3;" href="Register/Enterprise" class="button">I am Enterprise</a>
                </div>
                <div class="option">
                    <img src="https://tuyendung.topcv.vn/app/_nuxt/img/student.c1c39ee.png" alt="Job Seeker">
                    <a style="background-color: #0969c3;" href="Register" class="button">I am Jobseekers</a>
                </div>
            </div>
        </div>
        <script>
            document.getElementById("showButton").addEventListener("click", function () {
                var welcomeContainer = document.querySelector(".welcome-container");
                if (welcomeContainer.style.display === "none") {
                    welcomeContainer.style.display = "block";
                } else {
                    welcomeContainer.style.display = "none";
                }

            });

            document.querySelector('.close-button').addEventListener('click', function () {
                document.querySelector('.welcome-container').style.display = 'none';
            });
        </script>
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/nav.js"></script>
        <script src="js/main.js"></script>



    </body>
</html>
