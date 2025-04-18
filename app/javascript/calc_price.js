function calcTax() {
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  if (price) {
    price.addEventListener("keyup", () => {
      const inputValue = parseInt(price.value);

      if (!isNaN(inputValue)) {
        const taxValue = Math.floor(inputValue * 0.1);
        const profitValue = inputValue - taxValue;

        tax.textContent = taxValue;
        profit.textContent = profitValue;
      } else {
        tax.textContent = '';
        profit.textContent = '';
      }
    });
  }
};

window.addEventListener("DOMContentLoaded", calcTax);