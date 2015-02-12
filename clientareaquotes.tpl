<section>
	<div class="container">
		<h1>{$LANG.quotestitle} <small>{$LANG.quotesintro}</small></h1>
		
		<p>{$numitems} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</p>
		
		<div class="panel panel-default">
			<table class="table table-striped">
				<thead>
					<tr>
						<th><a href="clientarea.php?action=quotes&orderby=id" title="{$LANG.quotenumber}">{$LANG.quotenumber}{if $orderby eq "id"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th><a href="clientarea.php?action=quotes&orderby=subject" title="{$LANG.quotesubject}">{$LANG.quotesubject}{if $orderby eq "subject"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th><a href="clientarea.php?action=quotes&orderby=datecreated" title="{$LANG.quotedatecreated}">{$LANG.quotedatecreated}{if $orderby eq "datecreated"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th><a href="clientarea.php?action=quotes&orderby=validuntil" title="{$LANG.quotevaliduntil}">{$LANG.quotevaliduntil}{if $orderby eq "validuntil"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th><a href="clientarea.php?action=quotes&orderby=stage" title="{$LANG.quotestage}">{$LANG.quotestage}{if $orderby eq "stage"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$quotes item=quote}
					<tr>
						<td><a href="dl.php?type=q&id={$quote.id}" target="_blank" title="{$LANG.quotenumber} {$quote.id}">{$quote.id}</a></td>
						<td>{$quote.subject}</td>
						<td>{$quote.datecreated}</td>
						<td>{$quote.validuntil}</td>
						<td>{$quote.stage}</td>
						<td class="text-center">
							<a href="viewquote.php?id={$quote.id}" class="btn btn-primary" title="{$LANG.quoteview}">{$LANG.quoteview}</a> 
							<a href="dl.php?type=q&id={$quote.id}" class="btn btn-primary" title="{$LANG.quotedownload}">{$LANG.quotedownload}</a>
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
		
		<form method="post" action="{$smarty.server.PHP_SELF}?action={$clientareaaction}" class="pull-right">
			<fieldset>
				<select name="itemlimit" onchange="submit()" class="form-control" style="margin-top: 18px;">
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
