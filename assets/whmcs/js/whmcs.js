// Password Strength Meter
function passwordStrength(pw) {
	var pwlength = pw.length;
	if(pwlength>5)pwlength=5;
	var numnumeric=pw.replace(/[0-9]/g,"");
	var numeric=(pw.length-numnumeric.length);
	if(numeric>3)numeric=3;
	var symbols=pw.replace(/\W/g,"");
	var numsymbols=(pw.length-symbols.length);
	if(numsymbols>3)numsymbols=3;
	var numupper=pw.replace(/[A-Z]/g,"");
	var upper=(pw.length-numupper.length);
	if(upper>3)upper=3;
	var pwstrength=((pwlength*10)-20)+(numeric*10)+(numsymbols*15)+(upper*10);
	if(pwstrength<0){pwstrength=0}
	if(pwstrength>100){pwstrength=100}
	return pwstrength;
}

// READY
$(function(){
	// tooltips
	$('a[rel=tooltip]').tooltip();

	// toggle checkboxes
	$('#toggler').change( function() {
		var target = this.checked;
		if (target == true)
		{$('.invids').prop('checked','checked').attr('checked','checked');}
		else
		{$('.invids').removeAttr('checked');}
	});

	// Language Selector Styling fix
	$('#languagefrm').addClass('form-inline');
});

