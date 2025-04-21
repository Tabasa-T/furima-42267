document.addEventListener("turbo:load", () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput) {
    priceInput.addEventListener("input", function () {
      this.value = this.value.replace(/[^\d]/g, ''); 
    });
  }
});
