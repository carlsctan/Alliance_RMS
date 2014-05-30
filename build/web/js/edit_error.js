var W3CDOM = (document.getElementsByTagName && document.createElement);

function validate() {
	validForm = true;
	firstError = null;
	errorstring = '';
	var x = document.forms['edit'].elements;
	//for (var i=0;i<x.length;i++) {
	//	if (!x[i].value)
	//		writeError(x[i],'This field is required');
	//}
	//if (x['email'].value.indexOf('@') == -1)
	//	writeError(x['email'],'This is not a valid email address');
	if (!x['project-name'].value)
		writeError(x['p-name'], 'This field is required!');
	if (!x['from'].value)
		writeError(x['p-from'], 'This field is required!');
	if (!x['to'].value)
		writeError(x['p-to'], 'This field is required!');
	if (x['status'].value == "null")
		writeError(x['p-status'], 'This field is required!');
	if (x['business-unit'].value == "null")
		writeError(x['p-unit'], 'This field is required!');
	if (!W3CDOM)
		alert(errorstring);
	if (firstError)
		firstError.focus();
	//if (validForm)
	//	alert('All data is valid!');
	return false; // I return false anyway to prevent actual form submission. Don't do this at home!
}

function writeError(obj,message) {
	validForm = false;
	if (obj.hasError) return;
	if (W3CDOM) {
		obj.className += ' error';
		obj.onchange = removeError;	
		var sp = document.createElement('span');
		sp.className = 'error';
		sp.appendChild(document.createTextNode(message));
		obj.parentNode.appendChild(sp);
		obj.hasError = sp;
	}
	else {
		errorstring += obj.name + ': ' + message + '\n';
		obj.hasError = true;
	}
	if (!firstError)
		firstError = obj;
}

function removeError() {
	this.className = this.className.substring(0,this.className.lastIndexOf(' '));
	this.parentNode.removeChild(this.hasError);
	this.hasError = null;
	this.onchange = null;
}