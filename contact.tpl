<section>
	<div class="container">
		<h1>{$LANG.contacttitle} <small>{$LANG.contactheader}</small></h1>
		
		{if $sent}
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<strong>{$LANG.contactsent}</strong>
		</div>
		{elseif $errormessage}
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
			<ul>
				{$errormessage}
			</ul>
		</div>
		{/if}
		
		<form method="post" action="contact.php?action=send">
			<fieldset>
				<div class="form-group row">
					<div class="col-md-6">
						<label for="name">{$LANG.supportticketsclientname}</label>
						<input class="form-control" type="text" name="name" id="name" value="{$name}">
					</div>
					<div class="col-md-6">
						<label for="email">{$LANG.supportticketsclientemail}</label>
						<input class="form-control" type="text" name="email" id="email" value="{$email}">
					</div>
				</div>
				<div class="form-group">
					<label for="subject">{$LANG.supportticketsticketsubject}</label>
					<input class="form-control" type="text" name="subject" id="subject" value="{$subject}">
				</div>
				<div class="form-group">
					<label for="message">{$LANG.contactmessage}</label>
					<textarea name="message" id="message" rows="12" class="form-control">{$message}</textarea>
				</div>
		
				{if $capatacha}
				<div class="form-group row">
					<div class="col-md-6 col-md-offset-3">
						<div class="panel panel-default">
							<div class="panel-heading text-center">{$LANG.captchatitle}</div>
							<div class="panel-body text-center">
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
		
				<div class="text-center form-group">
					<button type="submit" class="btn btn-primary">{$LANG.contactsend}</button>
				</div>
			</fieldset>
		</form>
	</div>
</section>
