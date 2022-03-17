document.addEventListener('turbolinks:load', function() {
    let control = document.getElementById('badge_criteria')

    if (control) { control.addEventListener('click', fillCriteriaParameters) }
})

function fillCriteriaParameters(){
    let criteriaSelected = document.getElementById('badge_criteria').value
    let parameterValues = document.getElementById('badge_parameter')

    let categoryTitles = JSON.parse(document.getElementById('category_titles').value.split(' '))
    let attemptValues = document.getElementById('attempt_values').value.split(' ')
    let testTitles = document.getElementById('test_titles').value.split(' ')
    let testLevels = document.getElementById('test_levels').value.split(' ')

    switch (criteriaSelected) {
        case 'category':
            newOptionsForParametersJson(categoryTitles, parameterValues)
            break
        case 'attempts':
            newOptionsForParameters(attemptValues, parameterValues)
            break
        case 'named':
            newOptionsForParameters(testTitles, parameterValues)
            break
        case 'level':
            newOptionsForParameters(testLevels, parameterValues)
            break
    }
}

function newOptionsForParameters( newOptions, selectOptionParameters ) {
    removeOptions(selectOptionParameters)

    for(let i = 0; i < newOptions.length; i++){
        selectOptionParameters.options.add(new Option(newOptions[i], newOptions[i]));
    }
}

function removeOptions(selectElement) {
    let i, L = selectElement.options.length - 1;
    for(i = L; i >= 0; i--) {
        selectElement.remove(i);
    }
}

function newOptionsForParametersJson(newOptions, selectOptionParameters ) {
    removeOptions(selectOptionParameters)

    for (let [key, value] of newOptions) {
        selectOptionParameters.options.add(new Option(value, key));
    }
}
