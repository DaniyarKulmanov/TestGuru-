document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('.sort-by-title')

  if (control) { control.addEventListener('click', sortRowsByTitle) }
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

  sortedRows.sort(compareRowsAsc)

  let sortedTable = document.createElement('table')
  let thead = document.createElement('thead')

  thead.appendChild(rows[0])
  sortedTable.classList.add('table')
  sortedTable.appendChild(thead)

  for (let n = 0; n < sortedRows.length; n++) {
    let tbody = document.createElement('tbody')
    tbody.appendChild(sortedRows[n])
    sortedTable.appendChild(tbody)
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDsc(row1, row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
