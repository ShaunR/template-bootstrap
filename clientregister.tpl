<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>

<div class="page-header">
	<h1>{$LANG.clientregistertitle} <small>{$LANG.registerintro}</small></h1>
</div>

{if $noregistration}
<div class="alert alert-info">
	{$LANG.registerdisablednotice}
</div>
{else}

{if $errormessage}
<div class="alert alert-error fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
	<ul>
		{$errormessage}
	</ul>
</div>
{/if}

<form method="post" action="{$smarty.server.PHP_SELF}" class="form-horizontal">
	<fieldset>
		<input type="hidden" name="register" value="true"/>
		<div class="row">
			<div class="span6">

				<div class="control-group">
					<label class="control-label" for="firstname">{$LANG.clientareafirstname}</label>
					<div class="controls">
						<input type="text" name="firstname" id="firstname" value="{$clientfirstname}" {if in_array('firstname',$uneditablefields)}disabled="disabled" class="span3 disabled"{else}class="span3"{/if}/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="lastname">{$LANG.clientarealastname}</label>
					<div class="controls">
						<input type="text" name="lastname" id="lastname" value="{$clientlastname}" {if in_array('lastname',$uneditablefields)}disabled="disabled" class="span3 disabled"{else}class="span3"{/if}/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="companyname">{$LANG.clientareacompanyname}</label>
					<div class="controls">
						<input type="text" name="companyname" id="companyname" value="{$clientcompanyname}" {if in_array('companyname',$uneditablefields)}disabled="disabled" class="span3 disabled"{else}class="span3"{/if}/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="email">{$LANG.clientareaemail}</label>
					<div class="controls">
						<input type="text" name="email" id="email" value="{$clientemail}" {if in_array('email',$uneditablefields)}disabled="disabled" class="span3 disabled"{else}class="span3"{/if}/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="phonenumber">{$LANG.clientareaphonenumber}</label>
					<div class="controls">
						<input type="text" name="phonenumber" id="phonenumber" value="{$clientphonenumber}" {if in_array('phonenumber',$uneditablefields)} disabled="disabled" class="span3 disabled"{else}class="span3"{/if}/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="password">{$LANG.clientareapassword}</label>
					<div class="controls">
						<input type="password" name="password" id="password" value="{$clientpassword}" class="span3"/>
						<span class="help-inline"></span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="password2">{$LANG.clientareaconfirmpassword}</label>
					<div class="controls">
						<input type="password" name="password2" id="password2" value="{$clientpassword2}" class="span3"/>
						<span class="help-inline"></span>
					</div>
				</div>
			</div>
			<div class="span6">
				<div class="control-group">
					<label class="control-label" for="address1">{$LANG.clientareaaddress1}</label>
					<div class="controls">
						<input type="text" name="address1" id="address1" value="{$clientaddress1}" {if in_array('address1',$uneditablefields)}disabled="disabled" class="span3 disabled"{else}class="span3"{/if}/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="address2">{$LANG.clientareaaddress2}</label>
					<div class="controls">
						<input type="text" name="address2" id="address2" value="{$clientaddress2}" {if in_array('address2',$uneditablefields)}disabled="disabled" class="span3 disabled"{else}class="span3"{/if}/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="city">{$LANG.clientareacity}</label>
					<div class="controls">
						<input type="text" name="city" id="city" value="{$clientcity}" {if in_array('city',$uneditablefields)}disabled="disabled" class="span3 disabled"{else}class="span3"{/if}/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="state">{$LANG.clientareastate}</label>
					<div class="controls">
						<input type="text" name="state" id="state" value="{$clientstate}" {if in_array('state',$uneditablefields)}disabled="disabled" class="span3 disabled"{else}class="span3"{/if}/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="postcode">{$LANG.clientareapostcode}</label>
					<div class="controls">
						<input type="text" name="postcode" id="postcode" value="{$clientpostcode}" {if in_array('postcode',$uneditablefields)} disabled="disabled" class="span3 disabled"{else}class="span3"{/if}/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="country">{$LANG.clientareacountry}</label>
					<div class="controls">
						{$clientcountriesdropdown}
					</div>
				</div>
			</div>
		</div>

	{if $customfields}
		<div class="row">
		{foreach key=num item=customfield from=$customfields}
		<div class="span6">	
		<div class="control-group">
			<label class="control-label" for="customfield{$customfield.id}">{$customfield.name}</label>
			<div class="controls">
				{$customfield.input} <span class="help-inline">{$customfield.description}</span>
			</div>
		</div>
		</div>
		{/foreach}
		</div>
	{/if}

	{if $securityquestions}
		<div class="alert alert-info alert-block form-inline text-center">
			<label for="securityqans">{$LANG.clientareasecurityquestion}</label>
			<select name="securityqid" id="securityqid">
			{foreach key=num item=question from=$securityquestions}
				<option value={$question.id}>{$question.question}</option>
			{/foreach}
			</select>
			<label for="securityqans">{$LANG.clientareasecurityanswer}</label>
			<input type="password" name="securityqans" id="securityqans"/>
		</div>
	{/if}

	{if $capatacha}
		<div class="well">
			<h3>{$LANG.captchatitle}</h3>
			<p>{$LANG.captchaverify}</p>
			<div class="text-center">
		{if $capatacha eq "recaptcha"}
				{$recapatchahtml}
		{else}
				<img src="includes/verifyimage.php" alt="Captcha"/> <input type="text" name="code" size="10" maxlength="5" class="span2"/>
		{/if}
			</div>
		</div>
	{/if}

	{if $accepttos}
		<div class="text-center marginbottom">
			<label class="checkbox inline"><input type="checkbox" name="accepttos" id="accepttos" value="on" /> {$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a>
		</div>
	{/if}

		<div class="text-center">
			<input class="btn btn-large btn-primary" type="submit" value="{$LANG.clientregistertitle}"/>
		</div>
	</fieldset>
</form>
{/if}

{literal}
<script type="text/javascript">
	$(function() { 
		// Make custom field inputs the correct size
		$('input[type=text]').addClass('span3');
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
			$('#password2').keyup();
		});
		// Compare passwords
		$('#password2').keyup(function() {
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

<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>
