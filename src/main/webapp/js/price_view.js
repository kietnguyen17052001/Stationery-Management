var priceProduct = 0;
var product;
loadImageProduct = (idProduct) => {
	const url = "http://localhost:8080/ProjectDUE/rent?id=" + idProduct;
	fetch(url, {
		method: 'GET'
	})
		.then(res => res.json())
		.then(data => {
			product = data;
			document.getElementById("product-image").setAttribute("src", product.image);
			priceProduct = product.price;
		})
		.catch(err => console.log(err));
}

seePrice = () => {
	let quantity = document.getElementById("number").value;
	let time = document.getElementById("time").value;
	let money = (time > 3) ? (priceProduct + ((priceProduct / quantity) * 10 / 100) * (time - 3))
		: priceProduct * quantity;
	let output = (product.quantity < quantity) ? `<p>Not enough quantity</p>` : `<p>Into money : ${money}</p>`;
	document.getElementById("box-money").innerHTML = output;
}

inputQuantity = () => {
	let quantity = document.getElementById("number").value;
	if (quantity > product.quantity) {
		document.getElementById("btn-add-to-cart").disabled = true;
		document.getElementById("box-money").innerHTML = `<p>Not enough quantity</p>`;
	} else {
		document.getElementById("btn-add-to-cart").disabled = false;
		document.getElementById("box-money").innerHTML = ``;
	}
}