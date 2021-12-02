// TODO: only on registration views
document.addEventListener('turbolinks:load', function() {
  let control = []
  control.push(document.querySelector('#user_password'))
  control.push(document.querySelector('#user_password_confirmation'))

  console.log(`Hello! from addEventListener ${control[0]}`)

  for (i = 0; i < control.length; i++) {
    if (control[i]) {
      control[i].addEventListener('input', passwordMathCheck)
    }
  }

})

function passwordMathCheck() {
  console.log('Hello! from passwordMathCheck')
}
