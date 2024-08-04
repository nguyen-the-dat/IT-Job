var btnOpen = document.querySelector('.test-report');
var modal = document.querySelector('.modall');
var iconClose = document.querySelector('.modall_header i');
function toggleModal() {
    modal.classList.toggle('hidee');
}

btnOpen.addEventListener('click', toggleModal);
iconClose.addEventListener('click', toggleModal);
modal.addEventListener('click', function (e) {
    if (e.target === e.currentTarget) {
        toggleModal();
    }
});

document.addEventListener("DOMContentLoaded", function () {
    var reportButton = document.getElementById('reportButton');
    var reportForm = document.getElementById('reportForm');
    var jobDescriptionTextarea = document.getElementById('jobDescription');
    var jobIdInput = document.getElementById('jobIdValue');
    var reportTypeId = document.getElementById('reportTypeId');
    reportButton.addEventListener('click', function (event) {
        confirmReport();
    });






    function sendReport(jobDescription, selectedValue) {
        var jobId = jobIdInput.value;
        fetch('ReportJob', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'jobDescription=' + encodeURIComponent(jobDescription) + '&jobId=' + encodeURIComponent(jobId)
                    + '&typeOfReportDetail=' + encodeURIComponent(selectedValue)
        })
                .then(response => {
                    if (response.ok) {

                        console.log('Report sent successfully ne' + selectedValue + ' day');
                        window.location.reload();
                    } else {
                        console.error('Error sending report');
                    }
                })
                .catch(error => {
                    console.error('Error sending report:', error);
                });
    }

    function confirmReport() {
        let text = "Submit report?\nEither OK or Cancel.";
        if (confirm(text) === true) {
            var jobDescription = document.getElementById('jobDescription').value;
            var selectElement = document.querySelector('select[name="typeOfReportDetail"]');
            var selectedValue = selectElement.value;
            console.log("Selected value:", selectedValue);
            sendReport(jobDescription, selectedValue);

            jobDescriptionTextarea.value = "";
            toggleModal();
        } else {
            toggleModal();
        }

    }
});
