<div class="page-header">
	<h1>{$LANG.upgradedowngradepackage}</h1>
</div>

<div class="alert alert-info">
	<span class="lead">{$LANG.orderproduct}: <strong>{if $groupname}{$groupname} - {/if}{$productname}</strong>{if $domain} ({$domain}){/if}</span>
</div>

<table class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>{$LANG.orderdesc}</th>
			<th>{$LANG.orderprice}</th>
		</tr>
	</thead>
	<tbody>
	{foreach key=num item=upgrade from=$upgrades}
		{if $type eq "package"}
		<tr>
			<td>
				<input type="hidden" name="pid" value="{$upgrade.newproductid}"/>
				<input type="hidden" name="billingcycle" value="{$upgrade.newproductbillingcycle}"/>
				{$upgrade.oldproductname} <i class="icon icon-arrow-right"></i> {$upgrade.newproductname}
			</td>
			<td>{$upgrade.price}</td>
		</tr>
	 	{elseif $type eq "configoptions"}
		<tr>
			<td>{$upgrade.configname}: {$upgrade.originalvalue} <i class="icon icon-arrow-right"></i> {$upgrade.newvalue}</td>
			<td>{$upgrade.price}</td>
		</tr>
		{/if}
	{/foreach}
	<tbody>
	<tfoot>
		<tr>
			<td class="text-right">{$LANG.ordersubtotal}</td>
			<td>{$subtotal}</td>
		</tr>
		{if $promodesc}
		<tr>
			<td class="text-right">{$promodesc}</td>
			<td>{$discount}</td>
		</tr>
		{/if}
		{if $taxrate}
		<tr>
			<td class="text-right">{$taxname} @ {$taxrate}%</td>
			<td>{$tax}</td>
		</tr>
		{/if}
		{if $taxrate2}
		<tr>
			<td class="text-right">{$taxname2} @ {$taxrate2}%</td>
			<td>{$tax2}</td>
		</tr>
		{/if}
		<tr>
			<td class="text-right">{$LANG.ordertotalduetoday}</td>
			<td>{$total} {if $type eq "package"}<i class="icon icon-question-sign" onmouseover="$(this).popover('show');" onmouseout="$(this).popover('hide');" data-original-title="{$LANG.ordertotalduetoday}" data-content="{$LANG.upgradeproductlogic} ({$upgrade.daysuntilrenewal} {$LANG.days})"></i>{/if}</td>
		</tr>
	</tfoot>
</table>

{if $promorecurring}
<div class="alert alert-info">
	{$LANG.recurringpromodesc|sprintf2:$promorecurring}
</div>
{/if}

{if $promoerror}
<div class="alert alert-error fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$promoerror}
</div>
{/if}

<form method="post" action="upgrade.php" class="form-inline text-center well well-small">
	<input type="hidden" name="step" value="2"/>
	<input type="hidden" name="type" value="{$type}"/>
	<input type="hidden" name="id" value="{$id}"/>
	{if $type eq "package"}
	<input type="hidden" name="pid" value="{$upgrades.0.newproductid}"/>
	<input type="hidden" name="billingcycle" value="{$upgrades.0.newproductbillingcycle}"/>
	{/if}
	{foreach from=$configoptions key=cid item=value}<input type="hidden" name="configoption[{$cid}]" value="{$value}"/>{/foreach}
	{$LANG.orderpromotioncode}: 
	{if $promocode}{$promocode} - {$promodesc} <input type="submit" name="removepromo" value="{$LANG.orderdontusepromo}" class="btn btn-danger"/>
	{else}<input type="text" name="promocode" class="span3"/> <input type="submit" value="{$LANG.orderpromovalidatebutton}" class="btn btn-success"/>{/if}
</form>

<form method="post" action="upgrade.php">
	<input type="hidden" name="step" value="3"/>
	<input type="hidden" name="type" value="{$type}"/>
	<input type="hidden" name="id" value="{$id}"/>
	{if $type eq "package"}
	<input type="hidden" name="pid" value="{$upgrades.0.newproductid}"/>
	<input type="hidden" name="billingcycle" value="{$upgrades.0.newproductbillingcycle}"/>
	{/if}
	{foreach from=$configoptions key=cid item=value}<input type="hidden" name="configoption[{$cid}]" value="{$value}"/>{/foreach}
	{if $promocode}<input type="hidden" name="promocode" value="{$promocode}"/>{/if}
	<div class="page-header">
		<h2>{$LANG.orderpaymentmethod}</h2>
	</div>
	{foreach key=num item=gateway from=$gateways}
	<label class="radio"><input type="radio" name="paymentmethod" value="{$gateway.sysname}" {if $selectedgateway eq $gateway.sysname} checked="checked"{/if}/> {$gateway.name} </label>
	{/foreach}

	<div class="text-center">
		<input type="submit" value="{$LANG.ordercontinuebutton}" class="btn btn-primary btn-large"/>
	</div>
</form>
