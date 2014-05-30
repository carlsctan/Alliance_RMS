function deleteRow(row)
{
	var a = confirm("Are you sure you want to delete Project " + row + "?");
	
	if(a == true)
		location.href = "deleteProject?projectname=" + row;
	else
		location.reload();
}

function deleteUser(user)
{
	var a = confirm("Are you sure you want to delete User " + user + "?");
	
	if(a == true)
		location.href = "deleteUser?username=" + user;
	else
		location.reload();
}