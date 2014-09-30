<section>
	<div class="container">
		<h1>{$LANG.clientareacancelrequest}</h1>
		
		{if $invalid}
		<div class="alert alert-warning">{$LANG.clientareacancelinvalid}</div>
		<div class="text-center margin-bottom">
			<a href="clientarea.php?action=productdetails&id={$id}" title="{$LANG.clientareabacklink}" class="btn btn-default">{$LANG.clientareabacklink}</a>
		</div>
		
		{elseif $requested}
		
		<div class="alert alert-success">{$LANG.clientareacancelconfirmation}</div>
		<div class="text-center margin-bottom">
			<a href="clientarea.php?action=productdetails&id={$id}" title="{$LANG.clientareabacklink}" class="btn btn-default">{$LANG.clientareabacklink}</a>
		</div>
		
		{else}
		
			{if $error}
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$LANG.clientareacancelreasonrequired}
		</div>
			{/if}
			
		<form method="post" action="{$smarty.server.PHP_SELF}">
			<input type="hidden" name="sub" value="submit">
			<input type="hidden" name="action" value="cancel">
			<input type="hidden" name="id" value="{$id}">
			<div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<label>{$LANG.clientareacancelproduct}:</label>
						<p class="form-control-static">{$productname}{if $domain} ({$domain}){/if}
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="type">{$LANG.clientareacancellationtype}</label>
						<select name="type" id="type" class="form-control">
							<option value="Immediate">{$LANG.clientareacancellationimmediate}</option>
							<option value="End of Billing Period">{$LANG.clientareacancellationendofbillingperiod}</option>
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="cancellationreason">{$LANG.clientareacancelreason}</label>
				<textarea name="cancellationreason" id="cancellationreason" rows="6" class="form-control"></textarea>
			</div>
			{if $domainid}
			<div class="alert alert-warning alert-block">
				<h4 class="alert-heading">{$LANG.cancelrequestdomain}</h4>
				{$LANG.cancelrequestdomaindesc|sprintf2:$domainnextduedate:$domainprice:$domainregperiod}
				<label class="checkbox-inline"><input type="checkbox" name="canceldomain" id="canceldomain"> {$LANG.cancelrequestdomainconfirm}</label>
			</div>
			{/if}
			<div class="form-actions">
				<input type="submit" name="submit" value="{$LANG.clientareacancelrequestbutton}" class="btn btn-danger">
				<a href="clientarea.php?action=productdetails&id={$id}" class="btn btn-default" title="{$LANG.cancel}">{$LANG.cancel}</a>
			</div>
		</form>
		{/if}
	</div>
</section>
