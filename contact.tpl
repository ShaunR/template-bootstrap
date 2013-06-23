<div class="page-header">
	<h1>{$LANG.contacttitle} <small>{$LANG.contactheader}</small></h1>
</div>

{if $sent}
<div class="alert alert-success fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	<strong>{$LANG.contactsent}</strong>
</div>
{elseif $errormessage}
<div class="alert alert-error fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
	<ul>
		{$errormessage}
	</ul>
</div>
{/if}

<form method="post" action="contact.php?action=send">
	<fieldset>
		<div class="row">
			<div class="span4">
				<label for="name">{$LANG.supportticketsclientname}</label>
				<input class="span4" type="text" name="name" id="name" value="{$name}"/>
			</div>
			<div class="span4">
				<label for="email">{$LANG.supportticketsclientemail}</label>
				<input class="span4" type="text" name="email" id="email" value="{$email}"/>
			</div>
		</div>
		<div class="row">
			<div class="span12">
				<label for="subject">{$LANG.supportticketsticketsubject}</label>
				<input class="span12" type="text" name="subject" id="subject" value="{$subject}"/>
			</div>
		</div>
		<div class="row">
			<div class="span12">
				<label for="message">{$LANG.contactmessage}</label>
				<textarea name="message" id="message" rows="12" class="span12">{$message}</textarea>
			</div>
		</div>
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
		<div class="text-center">
			<input type="submit" value="{$LANG.contactsend}" class="btn btn-primary"/>
		</div>
	</fieldset>
</form>
