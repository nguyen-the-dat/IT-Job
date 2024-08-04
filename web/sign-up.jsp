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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-zJi2jLof6UEIaTRb+tq51tukfFGoNjWT+Tzo2gkpkhuTfMprI+0yZ3+XZ2yn5Nzn" crossorigin="anonymous">

        <title>Jobster - Sign up</title>
        <style>
            .nav-item-large{
                font-size: 20px !important;
                font-weight: 600 !important;
            }
        </style>
    </head>

    <body>
        <div class="pxp-preloader"><span>Loading...</span></div>

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
                        </ul>
                    </nav>
                    <nav class="pxp-user-nav pxp-on-light ">
                        <a class="btn rounded-pill pxp-user-nav-trigger pxp-on-light" href="/ITJob/Login">Sign in</a>
                    </nav>
                </div>
            </div>
        </header>

        <section class="pxp-hero vh-100" style="background-color: var(--pxpMainColorLight);">
            <div class="row align-items-center pxp-sign-hero-container">
                <div class="col-xl-6 pxp-column">
                    <div class="pxp-sign-hero-fig text-center pb-100 pt-100">
                        <img src="images/signup-big-fig.png" alt="Sign up">
                        <h1 class="mt-4 mt-lg-5">Create an account</h1>
                    </div>
                </div>
                <div class="col-xl-6 pxp-column pxp-is-light">
                    <div class="pxp-sign-hero-form pb-100 pt-100">
                        <div class="row justify-content-center">
                            <div class="col-lg-6 col-xl-7 col-xxl-5">
                                <div class="pxp-sign-hero-form-content">
                                    <h5 class="text-center">Sign Up</h5>

                                    <!-- form dang ki cho jobseeker -->
                                    <form class="mt-4" action="Register" method="post">
                                        <div class="form-floating mb-3">
                                            <input type="text" name="email" class="form-control" id="pxp-signup-page-email" placeholder="Email address" required="">
                                            <label for="pxp-signup-page-email">Email address</label>
                                            <span class="fa fa-envelope-o"></span>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input type="text" name="username" class="form-control" id="pxp-signup-page-password" placeholder="Username" required="">
                                            <label for="pxp-signup-page-password">Username</label>
                                            <span class="fa fa-user" aria-hidden="true"></span>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input type="text" name="fullName" class="form-control" id="pxp-signup-page-password" placeholder="Enter Your Fullname" required="">
                                            <label for="pxp-signup-page-password">Your Fullname</label>
                                            <span class="fa fa-user" aria-hidden="true"></span>
                                        </div>


                                        <div class="form-check form-check-inline mb-3">
                                            <input type="radio" class="form-check-input" id="pxp-signup-page-gender-male" checked="" name="gender" value="1" >
                                            <label class="form-check-label" for="pxp-signup-page-gender-male">Male</label>
                                        </div>
                                        <div class="form-check form-check-inline mb-3">
                                            <input type="radio" class="form-check-input" id="pxp-signup-page-gender-female" name="gender" value="0">
                                            <label class="form-check-label" for="pxp-signup-page-gender-female">Female</label>
                                        </div><!-- comment -->



                                        <div class="form-floating mb-3">
                                            <input type="password" name="password" class="form-control" id="pxp-signup-page-password" placeholder="Password">
                                            <label for="pxp-signup-page-password">Password</label>
                                            <span class="fa fa-lock"></span>


                                        </div>


                                        <p style="color:red">${error}</p>
                                        <button style="width: 335px" type="submit" class="btn rounded-pill pxp-sign-hero-form-cta">Continue</button>

                                        <!--                                        <a href="#" class="btn rounded-pill pxp-sign-hero-form-cta">Continue</a>-->
                                        <div class="mt-4 text-center pxp-sign-hero-form-small">
                                            Already have an account? <a href="Login">Sign in</a>
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

        <div class="modal fade pxp-user-modal" id="pxp-signin-modal" aria-hidden="true" aria-labelledby="signinModal"
             tabindex="-1">
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
                                New to Jobster? <a role="button" class="" data-bs-target="#pxp-signup-modal"
                                                   data-bs-toggle="modal" data-bs-dismiss="modal">Create an account</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade pxp-user-modal" id="pxp-signup-modal" aria-hidden="true" aria-labelledby="signupModal"
             tabindex="-1">
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
                                <input type="password" class="form-control" id="pxp-signup-password"
                                       placeholder="Create password">
                                <label for="pxp-signup-password">Create password</label>
                                <span class="fa fa-lock"></span>
                            </div>
                            <a href="#" class="btn rounded-pill pxp-modal-cta">Continue</a>
                            <div class="mt-4 text-center pxp-modal-small">
                                Already have an account? <a role="button" class="" data-bs-target="#pxp-signin-modal"
                                                            data-bs-toggle="modal">Sign in</a>
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