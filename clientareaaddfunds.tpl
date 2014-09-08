<section>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h1>{$LANG.addfunds} <small>{$LANG.addfundsintro}</small></h1>
				{if $addfundsdisabled}
				<div class="alert alert-danger">
					{$LANG.clientareaaddfundsdisabled}
				</div>
				{else}
				{if $notallowed || $errormessage}
				<div class="alert alert-danger">
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
				<form method="post" action="{$smarty.server.PHP_SELF}?action=addfunds" class="form-horizontal">
					<div class="form-group">
						<label class="col-lg-6 control-label" for="amount">{$LANG.addfundsamount}:</label>
						<div class="col-lg-6">
							<input type="text" name="amount" id="amount" value="{$amount}" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-6 control-label" for="paymentmethod">{$LANG.orderpaymentmethod}:</label>
						<div class="col-lg-6">
							<select name="paymentmethod" id="paymentmethod" class="form-control">
							{foreach from=$gateways item=gateway}
								<option value="{$gateway.sysname}">{$gateway.name}</option>
							{/foreach}
							</select>
						</div>
					</div>
					<div class="text-center form-group">
						<button class="btn btn-primary">{$LANG.addfunds}</button>
					</div>
					<p class="text-center">{$LANG.addfundsnonrefundable}</p>
				</form>
				{/if}
			</div>
		</div>
	</div>
</section>
