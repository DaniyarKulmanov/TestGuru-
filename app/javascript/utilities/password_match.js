// TODO: add to registraion edit
document.addEventListener('turbolinks:load', function() {
  let userPasswordConfirm = document.querySelector('#user_password_confirmation')

  if (userPasswordConfirm) { userPasswordConfirm.addEventListener('input', passwordMathCheck) }

})

function passwordMathCheck() {
  let password = document.querySelector('#user_password')
  let passwordConfirmation = document.querySelector('#user_password_confirmation')

  if (password.value == passwordConfirmation.value) {
    console.log('match')
  } else if (passwordConfirmation.textLength == 0) {
    console.log('empty configmation')
  } else {
    console.log('not match')
  }

}
