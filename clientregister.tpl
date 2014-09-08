<section>
	<div class="container">
		<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>
		
		<h1>{$LANG.clientregistertitle} <small>{$LANG.registerintro}</small></h1>
		
		{if $noregistration}
		<div class="alert alert-info">
			{$LANG.registerdisablednotice}
		</div>
		{else}
		
		{if $errormessage}
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
			<ul>
				{$errormessage}
			</ul>
		</div>
		{/if}
		
		<form method="post" action="{$smarty.server.PHP_SELF}" class="form-horizontal">
			<fieldset>
				<input type="hidden" name="register" value="true">
				<div class="row">
					<div class="col-md-6">
		
						<div class="form-group">
							<label class="col-md-4 control-label" for="firstname">{$LANG.clientareafirstname}</label>
							<div class="col-md-8">
								<input type="text" name="firstname" id="firstname" value="{$clientfirstname}" {if in_array('firstname',$uneditablefields)}disabled="disabled" class="form-control disabled"{else}class="form-control"{/if}>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="lastname">{$LANG.clientarealastname}</label>
							<div class="col-md-8">
								<input type="text" name="lastname" id="lastname" value="{$clientlastname}" {if in_array('lastname',$uneditablefields)}disabled="disabled" class="form-control disabled"{else}class="form-control"{/if}>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="companyname">{$LANG.clientareacompanyname}</label>
							<div class="col-md-8">
								<input type="text" name="companyname" id="companyname" value="{$clientcompanyname}" {if in_array('companyname',$uneditablefields)}disabled="disabled" class="form-control disabled"{else}class="form-control"{/if}>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="email">{$LANG.clientareaemail}</label>
							<div class="col-md-8">
								<input type="text" name="email" id="email" value="{$clientemail}" {if in_array('email',$uneditablefields)}disabled="disabled" class="form-control disabled"{else}class="form-control"{/if}>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="phonenumber">{$LANG.clientareaphonenumber}</label>
							<div class="col-md-8">
								<input type="text" name="phonenumber" id="phonenumber" value="{$clientphonenumber}" {if in_array('phonenumber',$uneditablefields)} disabled="disabled" class="form-control disabled"{else}class="form-control"{/if}>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="password">{$LANG.clientareapassword}</label>
							<div class="col-md-5">
								<input type="password" name="password" id="password" value="{$clientpassword}" class="form-control">
							</div>
							<div class="col-md-3">
								<div class="help-block"></div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="password2">{$LANG.clientareaconfirmpassword}</label>
							<div class="col-md-5">
								<input type="password" name="password2" id="password2" value="{$clientpassword2}" class="form-control">
							</div>
							<div class="col-md-3">
								<div class="help-block"></div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="col-md-4 control-label" for="address1">{$LANG.clientareaaddress1}</label>
							<div class="col-md-8">
								<input type="text" name="address1" id="address1" value="{$clientaddress1}" {if in_array('address1',$uneditablefields)}disabled="disabled" class="form-control disabled"{else}class="form-control"{/if}>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="address2">{$LANG.clientareaaddress2}</label>
							<div class="col-md-8">
								<input type="text" name="address2" id="address2" value="{$clientaddress2}" {if in_array('address2',$uneditablefields)}disabled="disabled" class="form-control disabled"{else}class="form-control"{/if}>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="city">{$LANG.clientareacity}</label>
							<div class="col-md-8">
								<input type="text" name="city" id="city" value="{$clientcity}" {if in_array('city',$uneditablefields)}disabled="disabled" class="form-control disabled"{else}class="form-control"{/if}>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="state">{$LANG.clientareastate}</label>
							<div class="col-md-8">
								<input type="text" name="state" id="state" value="{$clientstate}" {if in_array('state',$uneditablefields)}disabled="disabled" class="form-control disabled"{else}class="form-control"{/if}>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="postcode">{$LANG.clientareapostcode}</label>
							<div class="col-md-8">
								<input type="text" name="postcode" id="postcode" value="{$clientpostcode}" {if in_array('postcode',$uneditablefields)} disabled="disabled" class="form-control disabled"{else}class="form-control"{/if}>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="country">{$LANG.clientareacountry}</label>
							<div class="col-md-8">
								{$clientcountriesdropdown}
							</div>
						</div>
					</div>
				</div>
		
			{if $customfields}
				{foreach key=num item=customfield from=$customfields}
				{if $customfield.type == "tickbox"}
				<div class="form-group">
					<div class="col-md-10 col-md-offset-2">
						<div class="checkbox">
							<label>
								{$customfield.input} {$customfield.description}
							</label>
						</div>
					</div>
				</div>
				{else}
				<div class="form-group">
					<label class="col-md-2 control-label" for="customfield{$customfield.id}">{$customfield.name}</label>
					<div class="col-md-4">{$customfield.input}</div>
					<div class="col-md-6">
						<div class="form-control-static">
							{$customfield.description}
						</div>
					</div>
				</div>
				{/if}
				{/foreach}
			{/if}
		
			{if $securityquestions}
				<hr>
				<div class="form-group">
					<label for="securityqans" class="col-md-4 control-label">{$LANG.clientareasecurityquestion}</label>
					<div class="col-md-6">
						<select name="securityqid" id="securityqid" class="form-control">
							{foreach key=num item=question from=$securityquestions}
							<option value={$question.id}>{$question.question}</option>
							{/foreach}
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="securityqans" class="col-md-4 control-label">{$LANG.clientareasecurityanswer}</label>
					<div class="col-md-6">
						<input type="password" name="securityqans" id="securityqans" class="form-control">
					</div>
				</div>
			{/if}
		
			{if $capatacha}
				<hr>
				<div class="form-group row">
					<div class="col-md-6 col-md-offset-3">
						<div class="panel panel-default">
							<div class="panel-body text-center">
								<h3>{$LANG.captchatitle}</h3>
								<p>{$LANG.captchaverify}</p>
								<div class="text-center">
									{if $capatacha eq "recaptcha"}
									{$recapatchahtml}
									{else}
									<div class="col-md-3 col-md-offset-3">
										<input type="text" name="code" class="form-control input-sm" maxlength="5">
									</div>
									<div class="col-md-6 text-left">
										<img src="includes/verifyimage.php" alt="captcha" style="margin-bottom: 20px;">
									</div>
									{/if}
								</div>
							</div>
						</div>
					</div>
				</div>
			{/if}
		
			{if $accepttos}
				<div class="text-center form-group">
					<label class="checkbox-inline"><input type="checkbox" name="accepttos" id="accepttos" value="on" > {$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a>
				</div>
			{/if}
		
				<div class="text-center form-group">
					<input class="btn btn-lg btn-primary" type="submit" value="{$LANG.clientregistertitle}">
				</div>
			</fieldset>
		</form>
		{/if}
		
		{literal}
		<script type="text/javascript">
			$(function() {
				// Make custom field inputs the correct size
				$('input[type=text]').addClass('form-control');
				$('select').addClass('form-control');
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
					$('#password2').keyup();
				});
				// Compare passwords
				$('#password2').keyup(function() {
					$(this).parent().parent().removeClass('has-error has-success');
					$(this).next().html("");
					if($(this).val().length < 1) return;
					if($('#password').val() != $(this).val()) {
						$(this).parent().parent().addClass("has-error");
					} else {
						$(this).parent().parent().addClass("has-success");
					}
				});
			});
		</script>
		{/literal}
	</div>
</section>
