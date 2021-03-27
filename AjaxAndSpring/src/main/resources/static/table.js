function deleting(id){
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "/deleteThroughAjax/"+id,
		dataType : 'json', 
		cache :false,
		timeout : 600000,
		success : function(data) {
			console.log(data);
			var html="<tr> <th>First Name</th><th>Last Name</th>  <th>Email</th>   </tr>";
			$.each( data, function( key, value ) {
				html+="<tr> <td>"+value.fname+"</td><td>"+value.lname+"</td>  <td>"+value.email+"</td> <td><button onclick=deleting("+value.id+")>Delete</Button></td>  </tr>";
				});
			$("#tableData").empty().append(html);
		},
		error : function(e) {
			console.log(e);
		}
	});
}