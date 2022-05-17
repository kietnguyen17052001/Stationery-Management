changeName = () => {
	let name = document.getElementById("name").value;
	const url = "http://localhost:8080/ProjectDUE/admin?newName=" + name;
	if (name === "") {
		document.getElementById("info-change-name").innerHTML = `<p style="color: #e74c3c;">Invalid input<p>`
	}
	
	else{
		fetch(url, {method: 'GET'})
			.then(res => res.json())
			.then(data => {
				if (data.status == true){
					document.getElementById("info-change-name").innerHTML = `<p style="color: #2980b9;">${data.message}<p>`
				}
			})
			.catch(err => console.log(err));
	}
}

changePassword = () => {
	let cur = document.getElementById("cur-password").value;
	let newP = document.getElementById("new-password").value;
	const url = "http://localhost:8080/ProjectDUE/admin?currentPassword=" + cur + "&newPassword=" + newP;
	if (newP === "" || cur === "") {
		document.getElementById("info-change-password").innerHTML = `<p style="color: #e74c3c;">Invalid input<p>`
	}
	else{
		fetch(url, {method: 'GET'})
			.then(res => res.json())
			.then(data => {
				const color = (data.status) ? "#2980b9" : "#e74c3c";
				document.getElementById("info-change-password").innerHTML = `<p style="color: ${color}">${data.message}<p>`;
				document.getElementById("cur-password").value = "";
				document.getElementById("new-password").value = "";
			})
			.catch(err => console.log(err));
	}
}