
searchInvoice = () => {
	let input = document.getElementById("input-search-invoices").value;
	const url = "http://localhost:8080/ProjectDUE/invoices?content=" + input;
	fetch(url, {
		method: 'GET'
	})
		.then(res => res.json())
		.then(data => {
			loadData(data);
		})
		.catch(err => console.log(err));
}

deleteInvoice = (idInvoice) => {
	let input = document.getElementById("input-search-invoices").value;
	const url = "http://localhost:8080/ProjectDUE/invoices?id=" + idInvoice + "&content=" + input;
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
	var output = data.map((invoice) => {
		return `<tr>
						<th scope="row">${index++}</th>
						<td>${invoice.id}</td>
						<td>${invoice.customer.name}</td>
						<td>${invoice.time}</td>
						<td>${invoice.totalMoney}</td>
						<td><a href="detail?id=${invoice.id}"><img src="img/detail.png" width="30"
								height="30"></a></td>
						<td><button onClick="deleteInvoice(${invoice.id})" id="btn-delete-invoice">
								<img src="img/remove.png" width="30" height="30">
							</button></td>
					</tr>`
	});
	document.getElementById("tbody-invoices").innerHTML = output;
}