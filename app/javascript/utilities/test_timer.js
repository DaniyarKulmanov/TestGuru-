function startTimer(duration, display) {
    let timer = duration, minutes, seconds;

    setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
            window.location.href = document.getElementById('attempt_url').value
        }
    }, 1000);
}

window.onload = function () {
    let testMinutes = 60 * Number(document.getElementById('test_timer').value),
        display = document.getElementById('timer');
    startTimer(testMinutes, display);
};