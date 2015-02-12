<section>
	<div class="container">
		<h1>{$LANG.clientareaproducts} <small>{$LANG.clientareaproductsintro}</small></h1>
		<div class="row">
			<div class="col-md-7">
				<div id="resultsfound" style="padding-top:20px;">{$numitems} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</div>
			</div>
			<div class="col-md-5">
				<form class="form-inline well well-sm pull-right" action="clientarea.php" method="post">
					<input type="hidden" name="action" value="products">
					<div class="form-group">
						<input type="text" class="form-control" name="q" value="{if $q}{$q}{/if}" placeholder="{$LANG.searchenterdomain}" style="min-width: 300px">
					</div>
					<button type="submit" class="btn btn-success">{$LANG.searchfilter}</button>
				</form>
			</div>
		</div>
	
		<div class="panel panel-default">
			<table id="resultslist" class="table table-striped">
				<thead>
					<tr>
						<th><a href="clientarea.php?action=products{if $q}&q={$q}{/if}&orderby=product">{$LANG.orderproduct}{if $orderby eq "product"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th><a href="clientarea.php?action=products{if $q}&q={$q}{/if}&orderby=price">{$LANG.orderprice}{if $orderby eq "price"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th><a href="clientarea.php?action=products{if $q}&q={$q}{/if}&orderby=billingcycle">{$LANG.orderbillingcycle}{if $orderby eq "billingcycle"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th><a href="clientarea.php?action=products{if $q}&q={$q}{/if}&orderby=nextduedate">{$LANG.clientareahostingnextduedate}{if $orderby eq "nextduedate"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th><a href="clientarea.php?action=products{if $q}&q={$q}{/if}&orderby=status">{$LANG.clientareastatus}{if $orderby eq "status"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$services item=service}
					<tr>
						<td>{$service.product}{if $service.domain}<br ><a href="http://{$service.domain}" target="_blank">{$service.domain}</a>{/if}</td>
						<td>{$service.amount}</td>
						<td>{$service.billingcycle}</td>
						<td>{$service.nextduedate}</td>
						<td><span class="label label-{$service.rawstatus}">{$service.statustext}</span></td>
						<td class="text-center">
							<a href="{$smarty.server.PHP_SELF}?action=productdetails&amp;id={$service.id}" class="btn btn-primary" title="{$LANG.clientareaviewdetails}">{$LANG.clientareaviewdetails}</a>
						</td>
					</tr>
					{foreachelse}
					<tr>
						<td colspan="6" class="text-center">{$LANG.norecordsfound}</td>
					</tr>
					{/foreach}
				</tbody>
			</table>
		</div>
	
		<form id="resultslimit" method="post" action="{$smarty.server.PHP_SELF}?action={$clientareaaction}" class="pull-right" style="margin-top: 18px">
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
