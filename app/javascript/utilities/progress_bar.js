document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('.progress-bar')

  if (control) { fillProgressBar(control) }
})

function fillProgressBar(control) {
  let questionsMax = control.dataset.questionsMax
  let currentQuestionNumber = control.dataset.currentQuestionNumber

  let progress = currentQuestionNumber / questionsMax * 100

  control.style.width = progress + "%"
  control.textContent = Math.round(progress) + "%"
}
