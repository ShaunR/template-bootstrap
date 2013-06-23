<div class="row">
	<div class="span6 offset3">
		<div class="page-header">
			<h1>{$LANG.addfunds} <small>{$LANG.addfundsintro}</small></h1>
		</div>
		{if $addfundsdisabled}
		<div class="alert alert-error">
			{$LANG.clientareaaddfundsdisabled}
		</div>
		{else}
		{if $notallowed || $errormessage}
		<div class="alert alert-error">
			<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
			{if $notallowed}{$LANG.clientareaaddfundsnotallowed}{else}{$errormessage}{/if}
		</div>
		{/if}
		<p>{$LANG.addfundsdescription}</p>
		<table class="table table-striped table-bordered">
			<tbody>
				<tr>
					<th class="text-right">{$LANG.addfundsminimum}</th>
					<td>{$minimumamount}</td>
				</tr>
				<tr>
					<th class="text-right">{$LANG.addfundsmaximum}</th>
					<td>{$maximumamount}</td>
				</tr>
				<tr>
					<th class="text-right">{$LANG.addfundsmaximumbalance}</th>
					<td>{$maximumbalance}</td>
				</tr>
			</tbody>
		</table>
		<form method="post" action="{$smarty.server.PHP_SELF}?action=addfunds" class="form-horizontal offset1 span4">
			<div class="control-group">
				<label class="control-label" for="amount">{$LANG.addfundsamount}:</label>
				<div class="controls">
					<input type="text" name="amount" id="amount" value="{$amount}" class="span1"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="paymentmethod">{$LANG.orderpaymentmethod}:</label>
				<div class="controls">
					<select name="paymentmethod" id="paymentmethod">
					{foreach from=$gateways item=gateway}
						<option value="{$gateway.sysname}">{$gateway.name}</option>
					{/foreach}
					</select>
				</div>
			</div>
			<div class="text-center marginbottom"><button class="btn btn-primary">{$LANG.addfunds}</button></div>
			<p class="text-center">{$LANG.addfundsnonrefundable}</p>
		</form>
		{/if}
	</div>
</div>
