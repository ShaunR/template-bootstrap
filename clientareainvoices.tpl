<section>
	<div class="container">
		<h1>{$LANG.invoices} <small>{$LANG.invoicesintro}</small></h1>
		
		<div class="row">
			<div class="col-md-7">
				<p style="margin-top:20px;">{$numitems} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</p>
			</div>
			<div class="col-md-5">
				{if !$nobalance}
				<div class="alert alert-danger pull-right text-center lead">
					{$LANG.invoicesoutstandingbalance}: {$totalbalance}
					{if $masspay}<a href="clientarea.php?action=masspay&all=true" class="btn btn-danger">{$LANG.masspayall}</a>{/if}
				</div>
				{/if}
			</div>
		</div>
		
		<div class="panel panel-default">
			<table class="table table-striped">
				<thead>
					<tr>
						<th><a href="clientarea.php?action=invoices&orderby=id" title="{$LANG.invoicestitle}">{$LANG.invoicestitle}{if $orderby eq "id"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th><a href="clientarea.php?action=invoices&orderby=date" title="{$LANG.invoicesdatecreated}">{$LANG.invoicesdatecreated}{if $orderby eq "date"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th><a href="clientarea.php?action=invoices&orderby=duedate" title="{$LANG.invoicesdatedue}">{$LANG.invoicesdatedue}{if $orderby eq "duedate"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th><a href="clientarea.php?action=invoices&orderby=total" title="{$LANG.invoicestotal}">{$LANG.invoicestotal}{if $orderby eq "total"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th><a href="clientarea.php?action=invoices&orderby=status" title="{$LANG.invoicesstatus}">{$LANG.invoicesstatus}{if $orderby eq "status"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$invoices item=invoice}
					<tr>
						<td><a href="viewinvoice.php?id={$invoice.id}" target="_blank" title="{$LANG.invoicestitle} {$invoice.invoicenum}">{$invoice.invoicenum}</a></td>
						<td>{$invoice.datecreated}</td>
						<td>{$invoice.datedue}</td>
						<td>{$invoice.total}</td>
						<td><span class="label label-{$invoice.rawstatus}">{$invoice.statustext}</span></td>
						<td class="text-center"><a href="viewinvoice.php?id={$invoice.id}" target="_blank" class="btn btn-primary" title="{$LANG.invoicesview} {$invoice.invoicenum}">{$LANG.invoicesview}</a></td>
					</tr>
					{foreachelse}
					<tr>
						<td colspan="6" class="text-center">{$LANG.norecordsfound}</td>
					</tr>
					{/foreach}
				</tbody>
			</table>
		</div>
		
		<form method="post" action="{$smarty.server.PHP_SELF}?action={$clientareaaction}" class="pull-right" style="margin-top: 18px;">
			<fieldset>
				<select name="itemlimit" onchange="submit()" class="form-control">
					<option>{$LANG.resultsperpage}</option>
					<option value="10"{if $itemlimit==10} selected="selected"{/if}>10</option>
					<option value="25"{if $itemlimit==25} selected="selected"{/if}>25</option>
					<option value="50"{if $itemlimit==50} selected="selected"{/if}>50</option>
					<option value="100"{if $itemlimit==100} selected="selected"{/if}>100</option>
					<option value="all"{if $itemlimit==99999999} selected="selected"{/if}>{$LANG.clientareaunlimited}</option>
				</select>
			</fieldset>
		</form>
		
		<ul class="pagination">
			<li{if !$prevpage} class="disabled"{/if}><a href="{if $prevpage}clientarea.php?action={$clientareaaction}{if $q}&amp;q={$q}{/if}&amp;page={$prevpage}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a></li>
			<li{if !$nextpage} class="disabled"{/if}><a href="{if $nextpage}clientarea.php?action={$clientareaaction}{if $q}&amp;q={$q}{/if}&amp;page={$nextpage}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a></li>
		</ul>
	</div>
</section>
