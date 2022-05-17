searchCustomer = () => {
	let input = document.getElementById("input-search-customer").value;
	const url = "http://localhost:8080/ProjectDUE/customers?content=" + input;
	fetch(url, {
		method: 'GET'
	})
		.then(res => res.json())
		.then(data => {
			loadData(data);
		})
		.catch(err => console.log(err));
}

deleteCustomer = (idCustomer) => {
	let input = document.getElementById("input-search-customer").value;
	const url = "http://localhost:8080/ProjectDUE/customers?id=" + idCustomer + "&content=" + input;
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
	var output = data.map((customer) => {
		return `<tr>
						<th scope="row">${index++}</th>
						<td>${customer.id}</td>
						<td>${customer.name}</td>
						<td>${customer.cmnd}</td>
						<td>${customer.phone}</td>
						<td>${customer.address}</td>
						<td>${customer.gender}</td>
						<td><button onClick="deleteCustomer(${customer.id})" id="btn-delete-invoice">
								<img src="img/remove.png" width="30" height="30">
							</button></td>
					</tr>`;
	});
	document.getElementById("tbody-customers").innerHTML = output;
}
