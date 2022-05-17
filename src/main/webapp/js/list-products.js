
searchProducts = () => {
	let input = document.getElementById("home-btn-search").value;
	const url = "http://localhost:8080/ProjectDUE/search?content=" + input;
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
	var products = data.map((product) => {
		const status = (product.quantity > 0) ? "Stocking" : "Sold out";
		return `<div id="${product.id}" class="item item-grid">
									<div class="item-wrap">
										<div class="work-item">
											<div class="work-pic">
												<img src="${product.image}" alt="image">
											</div>
											<div class="hover-content">
												<div class="hover-text text-center">
													<a href="img/${product.image}" data-lightbox="roadtrip"><span
														class="ti-fullscreen"></span></a>
												</div>
												<div class="project-description text-uppercase ul-li">
													<h3>
														<a href="#">${product.name}</a>
													</h3>
													<ul class="project-catagorry text-capitalize">
														<li><a href="product?id=${product.id}">See detail</a></li>
														<br>
														<li><a href="#">${product.price}VNĐ </a></li>
														<br>
														<li><a href="#">
														${status}
														</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>`;
	});
	document.getElementById("posts").innerHTML = products.join("");
}