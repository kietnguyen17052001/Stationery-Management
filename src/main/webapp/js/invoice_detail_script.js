
deleteDetailInvoice = (id_invoice, id_product) => {
	const url = "http://localhost:8080/ProjectDUE/detail?idInvoice=" + id_invoice + "&idProduct=" + id_product;
	fetch(url, {
		method: 'GET'
	})
		.then(res => res.json())
		.then(data => {
			loadData(data);
		})
		.catch(err => console.log(err));
}

loadData = (data) => {
	let index = 1;
	let output = data.map((detail) => {
		return `<tr>
						<th scope="row">${index++}</th>
						<td>${detail.idInvoice}</td>
						<td>${detail.product.name}</td>
						<td>${detail.quantity}</td>
						<td>${detail.time}</td>
						<td>${detail.intoMoney}</td>
						<td><button
								onClick="deleteDetailInvoice(${detail.idInvoice}, ${detail.product.id})"
								id="btn-delete-detailinvoice">
								<img src="img/remove.png" width="30" height="30">
							</button></td>
					</tr>`
	});
	document.getElementById("tbody-detailinvoice").innerHTML = output;
}