<div class="page-header">
	<h1>{$LANG.masspaytitle} <small>{$LANG.masspayintro}</small></h1>
</div>

<form method="post" action="clientarea.php?action=masspay">
	<input type="hidden" name="geninvoice" value="true"/>
	<table class="table table-bordered table-striped">
		<thead>
			<tr>
				<th>{$LANG.invoicesdescription}</th>
				<th>{$LANG.invoicesamount}</th>
			</tr>
		</thead>
		<tbody>
		{foreach from=$invoiceitems key=invid item=invoiceitem}
			<tr>
				<td colspan="2"><strong>{$LANG.invoicenumber} {$invid}</strong> <input type="hidden" name="invoiceids[]" value="{$invid}"/></td>
			</tr>
			{foreach from=$invoiceitem item=item}
			<tr>
				<td>{$item.description}</td>
				<td>{$item.amount}</td>
			</tr>
			{/foreach}
		{foreachelse}
			<tr>
				<td colspan="2" class="text-center">{$LANG.norecordsfound}</td>
			</tr>
		{/foreach}
		</tbody>
		<tfoot>
			<tr>
				<td class="text-right">{$LANG.invoicessubtotal}:</td>
				<td>{$subtotal}</td>
			</tr>
			<tr>
			{if $tax}
			<tr>
				<td class="text-right">{$LANG.invoicestax}:</td>
				<td>{$tax}</td>
			</tr>
			{/if}
			{if $tax2}
			<tr>
				<td class="text-right">{$LANG.invoicestax} 2:</td>
				<td>{$tax2}</td>
			</tr>
			{/if}
			{if $credit}
			<tr>
				<td class="text-right">{$LANG.invoicescredit}:</td>
				<td>{$credit}</td>
			</tr>
			{/if}
			{if $partialpayments}
			<tr>
				<td class="text-right">{$LANG.invoicespartialpayments}:</td>
				<td>{$partialpayments}</td>
			</tr>
			{/if}
			<tr>
				<td class="text-right">{$LANG.invoicestotaldue}:</td>
				<td>{$total}</td>
			</tr>
		</tfoot>
	</table>

	<div class="well text-center">
		<h3>{$LANG.orderpaymentmethod}</h3>
		<select name="paymentmethod">
		{foreach from=$gateways key=num item=gateway}<option value="{$gateway.sysname}"{if $gateway.sysname eq $defaultgateway} selected="selected"{/if}>{$gateway.name}</option>{/foreach}
		</select>
		<div><button class="btn btn-primary btn-large">{$LANG.masspaymakepayment}</button></div>
	</div>
</form>
