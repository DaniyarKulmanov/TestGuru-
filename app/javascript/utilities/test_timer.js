document.addEventListener('turbolinks:load', function() {
    let control = document.getElementById('test_timer')

    if (control) {
        window.onload = function () {
            let testMinutes = 60 * Number(document.getElementById('test_timer').value),
                display = document.getElementById('timer');
            startTimer(testMinutes, display);
        };
    }
})

// save current duration to timer
function startTimer(duration, display) {
    let timer = duration, minutes, seconds;

    setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        document.getElementById('timer').value = display.textContent / 60

        if (--timer < 0) {
            let attempt_url = document.getElementById('attempt_url').value
            updateTest( attempt_url )
            window.location.href = attempt_url
        }
    }, 1000);
}

function updateTest(url) {
    let http = new XMLHttpRequest();
    http.open('GET', url, true);

    http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

    http.onreadystatechange = function() {//Call a function when the state changes.
        if(http.readyState === 4 && http.status === 200) {
            alert(http.responseText);
        }
    }
    http.send();
}