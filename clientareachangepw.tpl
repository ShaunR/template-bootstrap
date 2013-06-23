<div class="page-header">
	<h1>{$LANG.clientareanavchangepw}</h1>
</div>

<div class="tabbable">
	<ul class="nav nav-tabs">
		<li><a href="clientarea.php?action=details">{$LANG.clientareanavdetails}</a></li>
{if $condlinks.updatecc}
		<li><a href="clientarea.php?action=creditcard">{$LANG.clientareanavccdetails}</a></li>
{/if}
		<li><a href="clientarea.php?action=contacts">{$LANG.clientareanavcontacts}</a></li>
		<li class="active"><a href="clientarea.php?action=changepw">{$LANG.clientareanavchangepw}</a></li>
		{if $condlinks.security}<li><a href="clientarea.php?action=security">{$LANG.clientareanavsecurity}</a></li>{/if}
	</ul>
</div>

{if $successful}
<div class="alert alert-success fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$LANG.changessavedsuccessfully}
</div>
{/if}

{if $errormessage}
<div class="alert alert-error fade in">
	<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
	<ul>
		{$errormessage}
	</ul>
</div>
{/if}

<form class="form-horizontal" method="post" action="clientarea.php">
	<input type="hidden" name="action" value="changepw"/>
	<div class="control-group">
		<label class="control-label" for="existingpw">{$LANG.existingpassword}</label>
		<div class="controls">
			<input type="password" name="existingpw" id="existingpw" class="span3"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="password">{$LANG.newpassword}</label>
		<div class="controls">
			<input type="password" name="newpw" id="password" class="span3"/>
			<span class="help-inline"></span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="confirmpw">{$LANG.confirmnewpassword}</label>
		<div class="controls">
			<input type="password" name="confirmpw" id="confirmpw" class="span3"/>
			<span class="help-inline"></span>
		</div>
	</div>
	<div class="form-actions">
		<input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}"/>
		<input class="btn" type="reset" value="{$LANG.cancel}"/>
	</div>
</form>

{literal}
<script type="text/javascript">
	$(function() {
		// Password Strength
		$('#password').keyup(function() {
			$(this).parent().parent().removeClass('warning error success');
			$(this).next().html("");
			if($(this).val().length == 0) return;
			var pwstrength = passwordStrength($(this).val());
			if(pwstrength > 75) {
				$(this).parent().parent().addClass("success");
				$(this).next().html("{/literal}{$LANG.pwstrengthstrong}{literal}");
			} else if (pwstrength > 30) {
				$(this).parent().parent().addClass("warning");
				$(this).next().html("{/literal}{$LANG.pwstrengthmoderate}{literal}");
			} else {
				$(this).parent().parent().addClass("error");
				$(this).next().html("{/literal}{$LANG.pwstrengthweak}{literal}");
			}
			$('#confirmpw').keyup();
		});
		// Compare passwords
		$('#confirmpw').keyup(function() {
			$(this).parent().parent().removeClass('error success');
			$(this).next().html("");
			if($(this).val().length < 1) return;
			if($('#password').val() != $(this).val()) {
				$(this).parent().parent().addClass('error');
			} else {
				$(this).parent().parent().addClass('success');
			}
		});
	});
</script>
{/literal}