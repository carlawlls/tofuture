fetchProducts(query); {
  fetch(`http://www.omdbapi.com/?s=${query}&apikey=adf1f2d7`)
    .then(response => response.json())
    .then(data => this.insertProduct(data))
}

insertProducts(data); {
  data.Search.forEach((result) => {
    const productTag = `<li class="list-group-item border-0">

    </li>`
    this.resultsTarget.insertAdjacentHTML("beforeend", productTag)
  })
}
