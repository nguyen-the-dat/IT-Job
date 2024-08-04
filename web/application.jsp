<%-- 
    Document   : appplication.jsp
    Created on : Jan 31, 2024, 11:22:28 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
        <div class="formbold-main-wrapper">
            <div style="position: absolute; top: 3%;">Jobster</div>
            <div class="back-btn"><a href="/ITJob/JobDetail?jobId=${param.jobId}" style="color: white; text-decoration: none">Back</a></div>
            <div class="formbold-form-wrapper">
                <div>
                    <div>
                        <p class="formbold-form-input" style="font-size: 20px; font-weight: 600;">${requestScope.jobTitle}</p>
                    </div>
                </div>
                <form action="ApplyJob?jobId=${param.jobId}" method="POST" id="jobApplicationForm">

                    <div class="formbold-input-flex">
                        <div>
                            <input
                                type="text"
                                name="name"
                                id="name"
                                class="formbold-form-input"
                                value= "${requestScope.JobseekerDAO.getJobSeekerByAccountId(sessionScope.account.username).name}"
                                style="padding-bottom: 0px; padding-top: 5px;"
                                required
                                />
                            <label for="name" class="formbold-form-label">Name</label>
                        </div>
                    </div>

                    <label class="radio-button formbold-form-label">Use your current CV
                        <div class="border-radio">
                            <input type="radio" name="option" value="option1" id="option" onclick="toggleRadio(this)">
                            <div class="radio-circle"></div>
                            <span class="radio-label" id="nameCV">
                                <c:if test="${requestScope.resumeUrl != null}">
                                    ${requestScope.resumeUrl}
                                </c:if>
                                <c:if test="${requestScope.resumeUrl == null}">
                                    No current CV in manage CV
                                </c:if>
                            </span>
                        </div>
                    </label>

                    <div class="formbold-textarea">
                        <textarea
                            rows="6"
                            name="letter"
                            id="letter"
                            placeholder="Details and specific examples will make your application stronger..."
                            class="formbold-form-input"
                            ></textarea>
                        <div style="padding: 10px; padding-left: 0; font-size: 13px;">What skills, work projects or achievements make you a strong candidate?</div>
                        <label for="letter" class="formbold-form-label"> Cover Letter (Optional) </label>
                    </div>

                    <p style="font-size: 13px; padding-top: 10px; opacity: 0.5;">500 of 500 characters remaining</p>
                    <p class="formbold-form-label">Your CV</p>
                    <div class="formbold-input-file">
                        <div class="formbold-filename-wrapper">
                            <span class="formbold-filename">
                                <g clip-path="url(#clip0_1670_1541)">
                                <path d="M9.00005 7.93906L12.7126 4.22656L13.7731 5.28706L10.0606 8.99956L13.7731 12.7121L12.7126 13.7726L9.00005 10.0601L5.28755 13.7726L4.22705 12.7121L7.93955 8.99956L4.22705 5.28706L5.28755 4.22656L9.00005 7.93906Z" fill="#536387"/>
                                </g>
                                <defs>
                                <clipPath id="clip0_1670_1541">
                                    <rect width="18" height="18" fill="white"/>
                                </clipPath>
                                </defs>
                                </svg>
                            </span>
                        </div>
                        <label for="upload" class="formbold-input-label">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_1670_1531)">
                            <path d="M12.3568 6.4644L7.64349 11.1786C7.5639 11.2554 7.50041 11.3474 7.45674 11.4491C7.41307 11.5507 7.39008 11.6601 7.38912 11.7707C7.38815 11.8814 7.40924 11.9911 7.45114 12.0935C7.49304 12.1959 7.55492 12.289 7.63316 12.3672C7.71141 12.4455 7.80445 12.5073 7.90686 12.5492C8.00928 12.5912 8.11901 12.6122 8.22966 12.6113C8.34031 12.6103 8.44966 12.5873 8.55133 12.5436C8.653 12.5 8.74495 12.4365 8.82182 12.3569L13.536 7.64356C14.0049 7.17468 14.2683 6.53875 14.2683 5.87565C14.2683 5.21255 14.0049 4.57661 13.536 4.10773C13.0671 3.63885 12.4312 3.37544 11.7681 3.37544C11.105 3.37544 10.469 3.63885 10.0002 4.10773L5.28599 8.8219C4.89105 9.20701 4.57652 9.6667 4.36062 10.1743C4.14473 10.6819 4.03178 11.2274 4.02832 11.779C4.02487 12.3306 4.13097 12.8774 4.34049 13.3877C4.55 13.8979 4.85876 14.3615 5.24884 14.7516C5.63892 15.1416 6.10256 15.4503 6.61287 15.6597C7.12318 15.8692 7.67 15.9752 8.2216 15.9717C8.77321 15.9681 9.31862 15.8551 9.82621 15.6391C10.3338 15.4232 10.7934 15.1086 11.1785 14.7136L15.8927 10.0002L17.071 11.1786L12.3568 15.8927C11.8151 16.4344 11.172 16.8641 10.4643 17.1573C9.75649 17.4505 8.99791 17.6014 8.23182 17.6014C7.46574 17.6014 6.70716 17.4505 5.99939 17.1573C5.29162 16.8641 4.64853 16.4344 4.10682 15.8927C3.56512 15.351 3.13542 14.7079 2.84225 14.0002C2.54908 13.2924 2.39819 12.5338 2.39819 11.7677C2.39819 11.0016 2.54908 10.2431 2.84225 9.5353C3.13542 8.82753 3.56512 8.18443 4.10682 7.64273L8.82182 2.9294C9.60767 2.17041 10.6602 1.75043 11.7527 1.75992C12.8451 1.76942 13.8902 2.20762 14.6627 2.98015C15.4353 3.75269 15.8735 4.79774 15.883 5.89023C15.8925 6.98271 15.4725 8.03522 14.7135 8.82106L10.0002 13.5369C9.76794 13.7691 9.49226 13.9532 9.18887 14.0788C8.88548 14.2045 8.56032 14.2691 8.23195 14.2691C7.90357 14.269 7.57843 14.2043 7.27507 14.0786C6.97171 13.9529 6.69607 13.7687 6.46391 13.5365C6.23174 13.3043 6.04759 13.0286 5.92196 12.7252C5.79633 12.4218 5.7317 12.0966 5.73173 11.7683C5.73177 11.4399 5.79649 11.1148 5.92219 10.8114C6.04788 10.508 6.2321 10.2324 6.46432 10.0002L11.1785 5.28606L12.3568 6.4644Z" fill="#07074D"/>
                            </g>
                            <defs>
                            <clipPath id="clip0_1670_1531">
                                <rect width="20" height="20" fill="white"/>
                            </clipPath>
                            </defs>
                            </svg>
                            Attach files
                            <input type="file" name="upload" id="upload" onchange="myFunction()" accept=".doc,.docx,.pdf">
                            <p style="font-size: 13px; padding-top: 10px; opacity: 0.5; padding-left: 2%; padding-bottom: 1%;" id="noblank2">No file chosen</p>
                        </label>
                        <p style="font-size: 13px;opacity: 1; color: red" id="noblank">Can't be blank</p>
                        <p style="font-size: 13px; padding-top: 10px; opacity: 0.5;">We accept .doc .docx, .pdf files, no password protected, up to 3MB</p>
                    </div>
                    <input type="hidden" name="formSubmitted" value="false" id="formSubmitted">
                    <input type="hidden" name="fileNameAlter" id="fileNameAlter">
                    <input type="hidden" name="isCheck" id="isCheck" value="0">
                    <button class="formbold-btn" onclick="confirmSubmission()" type="button" name="btnSubmit">
                        Apply Job
                    </button>
                </form>
            </div>
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
                    alert('File không được lớn hơn 3MB.');
                    fileInput.value = ''; // Xóa lựa chọn file
                    return false;
                }

                if (filePath) {
                    var fileName = filePath.split('\\').pop();
                    document.getElementById("noblank").innerHTML = "";
                    document.getElementById("noblank2").innerHTML = "";
                    document.querySelector(".formbold-filename").innerHTML = fileName;
                } else {
                    document.getElementById("noblank").innerHTML = "Can't be blank";
                }
            }

            function confirmSubmission() {
                var fileInput = document.getElementById('upload');
                var option = document.getElementById('option');
                if (!fileInput.value && !option.value) {
                    alert("Please select a file to upload.");
                    return false;
                }
                const confirmation = confirm("Are you sure you want to submit? Please double-check before submitting.");
                if (confirmation) {
                    document.getElementById("formSubmitted").value = "true";
                    document.getElementById("jobApplicationForm").submit();
                }
            }
            function toggleRadio(radio) {
                if (radio.checked && radio.getAttribute('data-checked') === 'true') {
                    radio.checked = false;

                    radio.setAttribute('data-checked', 'false');
                    handleRadioUnchecked();
                } else {
                    radio.checked = true;
                    var formDiv = document.querySelector('.formbold-input-file');
                    formDiv.classList.add('disabled-div');
                    radio.setAttribute('data-checked', 'true');
                    changeContent();
                }
            }

            function handleRadioUnchecked() {
                var isCheck = document.getElementById('isCheck');
                isCheck.value = "0";
                var formDiv = document.querySelector('.formbold-input-file');
                formDiv.classList.remove('disabled-div');
                var element = document.getElementById('letter');
                if (element) {
                    element.textContent = "";
                }
            }

            function changeContent() {
                var element = document.getElementById('letter');
                var fileNameAlter = document.getElementById('fileNameAlter');
                var isCheck = document.getElementById('isCheck');
                if (element) {
                    element.textContent = "${fn:escapeXml(requestScope.resumeCoverLetter)}";
                    fileNameAlter.value = "${fn:escapeXml(requestScope.resumeUrl)}";
                    isCheck.value = "1";

                }
            }
        </script>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .back-btn {
                position: absolute;
                top: 5%;
                left: 0;
                width: 120px;
                height: 40px;
                text-align: center;
                padding: 10px;
                background-color: #2480d6;
                border-radius: 0px 15px 15px 0px;
                color: white;
                font-weight: 600;
            }

            .back-btn:hover
            {
                width: 150px;
            }

            body {
                font-family: "Inter", sans-serif;
            }
            .formbold-main-wrapper {
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 70px;
                padding-top:3%;
                background-color: #E6F0F9;
                border-radius: 10px 0 0 10px;
            }

            .formbold-form-wrapper {
                margin: 0 auto;
                max-width: 700px;
                width: 100%;
                background: white;
                padding: 3%;
                border-radius: 15px;
                box-shadow: 0px 4px 20px rgba(0,0,0,.06);
                margin-top: 2%;
            }

            .formbold-input-flex {
                display: flex;
                gap: 20px;
                margin-bottom: 22px;
            }
            .formbold-input-flex > div {
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
            .formbold-form-input:focus + .formbold-form-label {
                color: #6A64F1;
            }

            .formbold-input-file {
                border: 1.5px solid #2480d6;
                border-radius: 10px;
                padding: 20px;
                margin-top: 10px;
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

            .radio-buttons {
                display: flex;
                flex-direction: column;
                color: white;
            }

            .radio-button {
                /*display: flex;*/
                align-items: center;
                margin-bottom: 10px;
                cursor: pointer;
            }

            .radio-button input[type="radio"] {
                display: none;
            }

            .radio-circle {
                margin-top: 10px;
                width: 20px;
                height: 20px;
                border-radius: 50%;
                border: 2px solid #aaa;
                position: relative;
                margin-right: 10px;
            }

            .radio-circle::before {
                content: "";
                display: block;
                width: 12px;
                height: 12px;
                border-radius: 50%;
                background-color: #ddd;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%) scale(0);
                transition: all 0.2s ease-in-out;
            }

            .radio-button input[type="radio"]:checked + .radio-circle::before {
                transform: translate(-50%, -50%) scale(1);
            }

            .radio-button:nth-of-type(1) input[type="radio"]:checked + .radio-circle::before {
                background-color: #ff6600;
            }

            .radio-button:nth-of-type(2) input[type="radio"]:checked + .radio-circle::before {
                background-color: #ffffff;
            }

            .radio-button:nth-of-type(3) input[type="radio"]:checked + .radio-circle::before {
                background-color: #26be00;
            }

            .radio-label {
                font-size: 15px;
                font-weight: bold;
                margin-top: 10px;
            }

            .radio-button:hover .radio-circle {
                border-color: #555;
            }

            .radio-button:hover input[type="radio"]:checked + .radio-circle::before {
                background-color: #555;
            }

            .border-radio {
                border: 1.5px solid #2480d6;
                border-radius: 10px;
                padding: 10px;
                padding-top: 5px;
            }
            .disabled-div {
                opacity: 0.5;
                pointer-events: none;
            }
        </style>
    </body>
</html>
