function price(){
  const priceInput = document.getElementById("item-price");
  const addTaxDOM = document.getElementById("add-tax-price");
  const profitDOM = document.getElementById("profit");

  if(priceInput){
    priceInput.addEventListener("input",() => {
      const value = parseInt(priceInput.value);
      if(!isNaN(value)){
        const tax = Math.floor(value * 0.1);
        addTaxDOM.innerHTML = tax.toLocaleString();
        profitDOM.innerHTML = (value - tax).toLocaleString();
      }else{
        addTaxDOM.innerHTML = '';
        profitDOM.innerHTML = '';
      }
    });
  }
}


window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);