		<div class="progress" id="pwstrengthbox">
			<div class="progress-bar"></div>
		</div>
		
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
				jQuery("#pwstrengthbox .progress-bar").width(pwstrength + "%");
				if(pwstrength<30) jQuery("#pwstrengthbox .progress-bar").removeClass("progress-bar-warning").removeClass("progress-bar-success").addClass("progress-bar-danger").html("{/literal}{$LANG.pwstrengthweak}{literal}");
				if(pwstrength>=30 && pwstrength<75) jQuery("#pwstrengthbox .progress-bar").removeClass("progress-bar-danger").removeClass("progress-bar-success").addClass("progress-bar-warning").html("{/literal}{$LANG.pwstrengthmoderate}{literal}");
				if(pwstrength>=75) jQuery("#pwstrengthbox .progress-bar").removeClass("progress-bar-danger").removeClass("progress-bar-warning").addClass("progress-bar-success").html("{/literal}{$LANG.pwstrengthstrong}{literal}");
			});
		});
		</script>
		{/literal}
