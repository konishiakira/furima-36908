const priceInput = document.getElementById("item-price");
console.log(priceInput);
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

  const sales_commission = document.getElementById("add-tax-price");
  sales_commission.innerHTML = new Intl.NumberFormat().format(Math.floor(inputValue * 0.1));

  const sales_profit = document.getElementById("profit");
  sales_profit.innerHTML = new Intl.NumberFormat().format(Math.round(inputValue - Math.floor(inputValue * 0.1)));
})

});
