<section>
	<div class="container">
		<h1>{$LANG.clientareanavchangepw}</h1>
		
		<ul class="nav nav-tabs" style="margin-bottom: 30px;">
			<li><a href="clientarea.php?action=details">{$LANG.clientareanavdetails}</a></li>
			{if $condlinks.updatecc}<li><a href="clientarea.php?action=creditcard">{$LANG.clientareanavccdetails}</a></li>{/if}
			<li><a href="clientarea.php?action=contacts">{$LANG.clientareanavcontacts}</a></li>
			<li class="active"><a href="clientarea.php?action=changepw">{$LANG.clientareanavchangepw}</a></li>
			{if $condlinks.security}<li><a href="clientarea.php?action=security">{$LANG.clientareanavsecurity}</a></li>{/if}
		</ul>
		
		{if $successful}
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$LANG.changessavedsuccessfully}
		</div>
		{/if}
		
		{if $errormessage}
		<div class="alert alert-danger alert-dismissable">
			<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
			<ul>
				{$errormessage}
			</ul>
		</div>
		{/if}
		
		<form class="form-horizontal" method="post" action="clientarea.php">
			<input type="hidden" name="action" value="changepw">
			<div class="form-group">
				<label class="col-md-2 control-label" for="existingpw">{$LANG.existingpassword}</label>
				<div class="col-md-4">
					<input type="password" name="existingpw" id="existingpw" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label" for="password">{$LANG.newpassword}</label>
				<div class="col-md-4">
					<input type="password" name="newpw" id="password" class="form-control">
				</div>
				<div class="col-md-6">
					<div class="help-block"></div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label" for="confirmpw">{$LANG.confirmnewpassword}</label>
				<div class="col-md-4">
					<input type="password" name="confirmpw" id="confirmpw" class="form-control">
				</div>
				<div class="col-md-6">
					<div class="help-block"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-4 col-md-offset-2">
					<input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}">
					<input class="btn btn-default" type="reset" value="{$LANG.cancel}">
				</div>
			</div>
		</form>
		
		
		{literal}
		<script type="text/javascript">
			$(function() {
				// Password Strength
				$('#password').keyup(function() {
					$(this).parent().parent().removeClass('has-warning has-error has-success');
					$(this).next().html("");
					if($(this).val().length == 0) {
						$(this).parent().next().children().html("");
						return;
					}
					var pwstrength = passwordStrength($(this).val());
					if(pwstrength > 75) {
						$(this).parent().parent().addClass("has-success");
						$(this).parent().next().children().html("{/literal}{$LANG.pwstrengthstrong}{literal}");
					} else if (pwstrength > 30) {
						$(this).parent().parent().addClass("has-warning");
						$(this).parent().next().children().html("{/literal}{$LANG.pwstrengthmoderate}{literal}");
					} else {
						$(this).parent().parent().addClass("has-error");
						$(this).parent().next().children().html("{/literal}{$LANG.pwstrengthweak}{literal}");
					}
					$('#confirmpw').keyup();
				});
				// Compare passwords
				$('#confirmpw').keyup(function() {
					$(this).parent().parent().removeClass('has-error has-success');
					$(this).next().html("");
					if($(this).val().length < 1) return;
					if($('#password').val() != $(this).val()) {
						$(this).parent().parent().addClass("has-error");
						$(this).parent().next().children().html("{/literal}{$LANG.clientareaerrorpasswordnotmatch}{literal}");
					} else {
						$(this).parent().parent().addClass("has-success");
						$(this).parent().next().children().html("");
					}
				});
			});
		</script>
		{/literal}
	</div>
</section>
