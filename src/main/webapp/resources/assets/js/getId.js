
function getid(id) {
	$.ajax({
		type: "GET",
		contentType: "application/json",
		url: root+ "/recruitment/detail/"+id,
		cache: false,
		timeout: 600000,
		success: function (data) {
			console.log("SUCCESS : ", data);
		},
		error: function (e) {
			console.log("ERROR : ", e);
		}
	});

}