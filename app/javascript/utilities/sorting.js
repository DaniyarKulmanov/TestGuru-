document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('.sort-by-title')

  control.addEventListener('click', sortRowsByTitle)
})


function sortRowsByTitle() {
  let table = document.querySelector('table')

  // Nodelist
  // https://developer.mozilla.org/en-US/docs/Web/API/NodeList
  let rows = table.querySelectorAll('tr')
  let sortedRows = []

  // select all table rows expect first because it is a header
  for (let n = 1; n < rows.length; n++) {
    sortedRows.push(rows[n])
  }

  sortedRows.sort(compareRows)

  let sortedTable = document.createElement('table')
  let thead = document.createElement('thead')
  let tbody = document.createElement('tbody')

  thead.appendChild(rows[0])
  sortedTable.classList.add('table')
  sortedTable.appendChild(thead)

  for (let n = 0; n < sortedRows.length; n++) {
    let tbody = document.createElement('tbody')
    tbody.appendChild(sortedRows[n]) // need to insert tbody? incorrect html
    sortedTable.appendChild(tbody) // need to insert tbody? incorrect html
  }
  console.log(table)
  console.log(sortedTable)
  table.parentNode.replaceChild(sortedTable, table)
}

function compareRows(row1, row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}
