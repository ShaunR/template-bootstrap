{literal}
<script>
jQuery(document).ready(function(){
	jQuery("#password").keyup(function () {
		var pw = jQuery("#password").val();
		var pwlength=(pw.length);
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
		jQuery("#pwstrengthbox").children().addClass("hide");
		console.log(pwstrength);
		if(pwstrength<30) jQuery("#pwstrengthbox .bar-danger").removeClass("hide");
		if(pwstrength>=30 && pwstrength<75) jQuery("#pwstrengthbox .bar-warning").removeClass("hide");
		if(pwstrength>=75) jQuery("#pwstrengthbox .bar-success").removeClass("hide");
	});
});
</script>
{/literal}
<div class="progress" id="pwstrengthbox">
	<div class="bar bar-danger hide" style="width: 33%">{$LANG.pwstrengthweak}</div>
	<div class="bar bar-warning hide" style="width: 66%">{$LANG.pwstrengthmoderate}</div>
	<div class="bar bar-success hide" style="width: 100%">{$LANG.pwstrengthstrong}</div>
</div>