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
			
		<div class="alert alert-info alert-block">
			{$LANG.clientareacancelproduct}: <strong>{if $groupname}{$groupname} - {/if}{$productname}</strong>{if $domain} ({$domain}){/if}
		</div>
		
		<form method="post" action="{$smarty.server.PHP_SELF}">
			<input type="hidden" name="sub" value="submit">
			<input type="hidden" name="action" value="cancel">
			<input type="hidden" name="id" value="{$id}">
			<label for="cancellationreason">{$LANG.clientareacancelreason}</label>
			<textarea name="cancellationreason" id="cancellationreason" rows="6" class="col-md-12"></textarea>
			<label for="type">{$LANG.clientareacancellationtype}</label>
			<select name="type" id="type">
				<option value="Immediate">{$LANG.clientareacancellationimmediate}</option>
				<option value="End of Billing Period">{$LANG.clientareacancellationendofbillingperiod}</option>
			</select>
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
