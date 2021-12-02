// TODO: only on registration views
document.addEventListener('turbolinks:load', function() {
  let userPasswordConfirm = document.querySelector('#user_password_confirmation')

  if (userPasswordConfirm) { userPasswordConfirm.addEventListener('input', passwordMathCheck) }

})

function passwordMathCheck() {

  if (document.getElementById('user_password').value ==
      document.getElementById('user_password_confirmation').value) {
      console.log('match')
    } else {
      console.log('not match')
    }
}
