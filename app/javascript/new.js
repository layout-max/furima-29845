function memo() {
  const input = document.getElementById("item-price")
  const cost = document.getElementById("add-tax-price")
  const get = document.getElementById("profit")

  input.addEventListener("change", function() {
    let item_price = input.value;
    let cost_price = item_price * 0.1;
    let profit = item_price - cost_price;
  
    cost.textContent = cost_price
    get.textContent = profit
  })
}

window.addEventListener('load', memo);