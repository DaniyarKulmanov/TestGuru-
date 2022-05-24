document.addEventListener('turbolinks:load', function() {
    let control = document.getElementById('timer')

    if (control) {
        let timerData = control, duration = timerData.dataset.duration
        startTimer(control);
    }
})

// save current duration to timer
function startTimer(timerData) {
    let timer = timerData.dataset.duration, minutes, seconds;
    let countDownDate = Math.floor(new Date(timerData.dataset.countDownDate).getTime() / 1000) + parseInt(timer);

    setInterval(function () {

        // Get today's date and time
        let now = Math.floor(new Date().getTime() / 1000);

        // Find the distance between now and the count down date
        let distance = countDownDate - now;

        minutes = parseInt(distance / 60, 10);
        seconds = parseInt(distance % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        timerData.textContent = minutes + ":" + seconds;

        if ( Math.floor(distance) <= 0 ) {
            let attempt_url = timerData.dataset.attemptUrl
            updateTest( attempt_url )
            window.location.href = attempt_url
        }
    }, 1000);
}

function updateTest(url) {
    let http = new XMLHttpRequest();

    http.open('GET', url, true);
    http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

    http.onreadystatechange = function() {
        if(http.readyState === 4 && http.status === 200) {
            alert(http.responseText);
        }
    }
    http.send();
}