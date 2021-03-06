document.addEventListener('turbolinks:load', function() {
  let userPasswordConfirm = document.querySelector('#user_password_confirmation')
  let userPassword = document.querySelector('#user_password')

  if (userPasswordConfirm) { userPasswordConfirm.addEventListener('input', passwordMathCheck) }
  if (userPassword) { userPassword.addEventListener('input', passwordMathCheck) }

})

function passwordMathCheck() {
  let password = document.querySelector('#user_password')
  let passwordConfirm = document.querySelector('#user_password_confirmation')

  // read all icon for positive and negative
  let circleSlash = document.querySelectorAll('.octicon-circle-slash')
  let checkCircle = document.querySelectorAll('.octicon-check-circle')

  if ((password.value === passwordConfirm.value) && (passwordConfirm.textLength !== 0 && password.textLength !== 0)) {
    circleSlash.forEach(icon => { icon.classList.add('hide') })
    checkCircle.forEach(icon => { icon.classList.remove('hide') })
  } else if (passwordConfirm.textLength === 0 || password.textLength === 0) {
    circleSlash.forEach(icon => { icon.classList.add('hide') })
    checkCircle.forEach(icon => { icon.classList.add('hide') })
  } else {
    circleSlash.forEach(icon => { icon.classList.remove('hide') })
    checkCircle.forEach(icon => { icon.classList.add('hide') })
  }

}
