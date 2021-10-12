window.addEventListener('load', () => {
  console.log("OK");

  // 金額を入力した数値をpriceInputという変数に格納する
const priceInput = document.getElementById("item-price");
console.log(priceInput);
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

  const sales_commission = document.getElementById("add-tax-price");
  // sales_commission.innerHTML = inputValue * 0.1;
  sales_commission.innerHTML = new Intl.NumberFormat().format(Math.floor(inputValue * 0.1));

  const sales_profit = document.getElementById("profit");
  sales_profit.innerHTML = new Intl.NumberFormat().format(Math.round(inputValue - Math.floor(inputValue * 0.1)));
})

});

// ex1) Math.round(123.456) // 出力：123
// ex2) Math.round(123.567) // 出力：124
// const text = document.getElementById('text');

// const numberWithComma = new Intl.NumberFormat();
// const price = "512345600";

// const number = numberWithComma.format(price);

// text.innerText = number;

// new Intl.NumberFormat().format(price)