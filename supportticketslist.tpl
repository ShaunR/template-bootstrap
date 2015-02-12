<section>
	<div class="container">
		<h1>{$LANG.clientareanavsupporttickets} <small>{$LANG.supportticketsintro}</small></h1>
		
		<div class="row">
			<div class="col-md-7">
				<a href="submitticket.php" class="btn btn-primary margin-bottom" title="{$LANG.opennewticket}">{$LANG.opennewticket}</a>
				<p>{$numitems} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</p>
			</div>
			<div class="col-md-5">
				<form class="pull-right form-inline well well-sm" action="supporttickets.php" method="post">
					<div class="form-group">
						<input type="text" name="searchterm" class="form-control" value="{if $searchterm}{$searchterm}{/if}" placeholder="{$LANG.searchtickets}" style="min-width: 300px;">
					</div>
					<button type="submit" class="btn btn-success">{$LANG.search}</button>
				</form>
			</div>
		</div>
		
		<div class="panel panel-default">
			<table class="table table-striped">
				<thead>
					<tr>
						<th><a href="supporttickets.php?orderby=date" title="{$LANG.supportticketsdate}">{$LANG.supportticketsdate}{if $orderby eq "date"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th><a href="supporttickets.php?orderby=dept" title="{$LANG.supportticketsdepartment}">{$LANG.supportticketsdepartment}{if $orderby eq "dept"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th><a href="supporttickets.php?orderby=subject" title="{$LANG.supportticketssubject}">{$LANG.supportticketssubject}{if $orderby eq "subject"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th><a href="supporttickets.php?orderby=status" title="{$LANG.supportticketsstatus}">{$LANG.supportticketsstatus}{if $orderby eq "status"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th><a href="supporttickets.php?orderby=lastreply" title="{$LANG.supportticketsticketlastupdated}">{$LANG.supportticketsticketlastupdated}{if $orderby eq "lastreply"} <span class="fa fa-sort-{$sort}"></span>{/if}</a></th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					{foreach key=num item=ticket from=$tickets}
					<tr>
						<td>{$ticket.date}</td>
						<td>{$ticket.department}</td>
						<td><a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}">{if $ticket.unread}<strong>{/if}#{$ticket.tid} - {$ticket.subject}{if $ticket.unread}</strong>{/if}</a></td>
						<td>{$ticket.status}</td>
						<td>{$ticket.lastreply}</td>
						<td class="text-center"><a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}" title="{$LANG.supportticketsviewticket} {$ticket.tid}" class="btn btn-primary">{$LANG.supportticketsviewticket}</a></td>
					</tr>
					{foreachelse}
					<tr>
						<td colspan="7" class="text-center">{$LANG.norecordsfound}</td>
					</tr>
					{/foreach}
				</tbody>
			</table>
		</div>
		
		<form method="post" action="supporttickets.php" class="pull-right">
			<fieldset>
				<select name="itemlimit" onchange="submit()" class="form-control" style="margin-top: 15px">
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
			<li{if !$prevpage} class="disabled"{/if}><a href="{if $prevpage}supporttickets.php?page={$prevpage}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a></li>
			<li{if !$nextpage} class="disabled"{/if}><a href="{if $nextpage}supporttickets.php?page={$nextpage}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a></li>
		</ul>
	</div>
</section>
