<div class="page-header">
	<h1>{$LANG.clientareanavdomains} <small>{$LANG.clientareadomainsintro}</small></h1>
</div>

<form class="form-inline well well-small pull-right" action="clientarea.php" method="post">
	<input type="hidden" name="action" value="products"/>
	<input type="text" class="span3" name="q" value="{if $q}{$q}{/if}" placeholder="{$LANG.searchenterdomain}"/>
	<button type="submit" class="btn btn-success">{$LANG.searchfilter}</button>
</form>

<div style="padding-top:9px">{$numitems} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</div>

<form method="post" action="clientarea.php" class="clearfix">
	<input type="hidden" name="action" value="bulkdomain"/>
	<table class="table table-bordered-outside table-striped table-sorted">
		<thead>
			<tr>
				<th class="text-center"><input type="checkbox" class="toggle-checkboxes" data-target=".domids"/></th>
				<th{if $orderby eq "domain"} class="sort-{$sort}"{/if}><a href="clientarea.php?action=domains{if $q}&amp;q={$q}{/if}&amp;orderby=domain" title="{$LANG.clientareahostingdomain}">{$LANG.clientareahostingdomain}</a></th>
				<th{if $orderby eq "regdate"} class="sort-{$sort}"{/if}><a href="clientarea.php?action=domains{if $q}&amp;q={$q}{/if}&amp;orderby=regdate" title="{$LANG.clientareahostingregdate}">{$LANG.clientareahostingregdate}</a></th>
				<th{if $orderby eq "nextduedate"} class="sort-{$sort}"{/if}><a href="clientarea.php?action=domains{if $q}&amp;q={$q}{/if}&amp;orderby=nextduedate" title="{$LANG.clientareahostingnextduedate}">{$LANG.clientareahostingnextduedate}</a></th>
				<th{if $orderby eq "status"} class="sort-{$sort}"{/if}><a href="clientarea.php?action=domains{if $q}&amp;q={$q}{/if}&amp;orderby=status" title="{$LANG.clientareastatus}">{$LANG.clientareastatus}</a></th>
				<th{if $orderby eq "autorenew"} class="sort-{$sort}"{/if}><a href="clientarea.php?action=domains{if $q}&amp;q={$q}{/if}&amp;orderby=autorenew" title="{$LANG.domainsautorenew}">{$LANG.domainsautorenew}</a></th>
				<th>&nbsp;</th>
			</tr>
		</thead>
		<tbody>
{foreach key=num item=domain from=$domains}
			<tr>
				<td class="text-center"><input type="checkbox" name="domids[]" class="domids" value="{$domain.id}"/></td>
				<td><a href="http://{$domain.domain}/" target="_blank">{$domain.domain}</a></td>
				<td>{$domain.registrationdate}</td>
				<td>{$domain.nextduedate}</td>
				<td><span class="label label-{$domain.rawstatus}">{$domain.statustext}</span></td>
				<td>{if $domain.autorenew}{$LANG.domainsautorenewenabled}{else}{$LANG.domainsautorenewdisabled}{/if}</td>
				<td><a href="clientarea.php?action=domaindetails&amp;id={$domain.id}" class="btn" title="{$LANG.managedomain}">{$LANG.managedomain}</a></td>
			</tr>
{foreachelse}
			<tr>
				<td colspan="7" class="text-center">{$LANG.norecordsfound}</td>
			</tr>
{/foreach}
		</tbody>
		<tfoot id="bulkmanagementactions" class="hide">
			<tr>
				<td colspan="7">
					{$LANG.domainbulkmanagement}:
					<input type="submit" name="nameservers" value="{$LANG.domainmanagens}" class="btn btn-inverse btn-small"/>
					<input type="submit" name="autorenew" value="{$LANG.domainautorenewstatus}" class="btn btn-inverse btn-small"/>
					<input type="submit" name="reglock" value="{$LANG.domainreglockstatus}" class="btn btn-inverse btn-small"/>
					<input type="submit" name="contactinfo" value="{$LANG.domaincontactinfoedit}" class="btn btn-inverse btn-small"/>
					<input type="submit" name="renew" value="{$LANG.domainmassrenew}" class="btn btn-inverse btn-small"/>
				</td>
			</tr>
		</tfoot>
	</table>
</form>

<form method="post" action="{$smarty.server.PHP_SELF}" class="pull-right">
	<fieldset>
		<input type="hidden" name="action" value="{$clientareaaction}"/> 
		<select name="itemlimit" onchange="submit()">
			<option>{$LANG.resultsperpage}</option>
			<option value="10"{if $itemlimit==10} selected="selected"{/if}>10</option>
			<option value="25"{if $itemlimit==25} selected="selected"{/if}>25</option>
			<option value="50"{if $itemlimit==50} selected="selected"{/if}>50</option>
			<option value="100"{if $itemlimit==100} selected="selected"{/if}>100</option>
			<option value="all"{if $itemlimit==99999999} selected="selected"{/if}>{$LANG.clientareaunlimited}</option>
		</select>
	</fieldset>
</form>

<div class="pagination">
	<ul>
		<li{if !$prevpage} class="disabled"{/if}><a href="{if $prevpage}clientarea.php?action=domains{if $q}&amp;q={$q}{/if}&amp;page={$prevpage}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a></li>
		<li{if !$nextpage} class="disabled"{/if}><a href="{if $nextpage}clientarea.php?action=domains{if $q}&amp;q={$q}{/if}&amp;page={$nextpage}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a></li>
	</ul>
</div>

{literal}
<script type="text/javascript">
	$(function() {
		$('.domids').change(function() {
			if($('.domids').filter( ":checked" ).length > 0) {
				$('#bulkmanagementactions').fadeIn();
			} else {
				$('#bulkmanagementactions').fadeOut();
			}
		});
	});
</script>
{/literal}