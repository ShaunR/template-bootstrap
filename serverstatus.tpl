<div class="page-header">
	<h1>{$LANG.networkstatusintro}</h1>
</div>

<div class="alert alert-block alert-warning text-center">
	<div class="row-fluid">
		<div class="span4"><a class="lead" href="{$smarty.server.PHP_SELF}?view=open">{$opencount} {$LANG.networkissuesstatusopen}</a></div>
		<div class="span4"><a class="lead" href="{$smarty.server.PHP_SELF}?view=scheduled">{$scheduledcount} {$LANG.networkissuesstatusscheduled}</a></div>
		<div class="span4"><a class="lead" href="{$smarty.server.PHP_SELF}?view=resolved">{$resolvedcount} {$LANG.networkissuesstatusresolved}</a></div>
	</div>
</div>

<div class="accordion">
{foreach from=$issues item=issue}
	<div class="accordion-group">
		<div class="accordion-heading">
			<div class="accordion-toggle" data-toggle="collapse" data-parent=".accordion" href="#serverstatus-{$issue.id}">
				<div class="row-fluid">
					<div class="span10">
						<h3>{$issue.title|truncate:80} <small>{$LANG.networkissuesdate} - {$issue.startdate}{if $issue.enddate} - {$issue.enddate}{/if}</small></h3>
						<strong>{$LANG.networkissuesaffecting} {$issue.type}</strong> - {if $issue.type eq $LANG.networkissuestypeserver}{$issue.server}{else}{$issue.affecting}{/if} | <strong>{$LANG.networkissuespriority}</strong> - {$issue.priority} | <strong>{$LANG.networkissueslastupdated}</strong>- {$issue.lastupdate}
					</div>
					<div class="span2 text-right">
						{if $issue.clientaffected}<span class="label label-warning" >Attention</span>{/if}
						<span class="badge badge-inverse">{$issue.status}</span>
					</div>
				</div>
			</div>
		</div>
		<div id="serverstatus-{$issue.id}" class="accordion-body collapse">
			<div class="accordion-inner">
				{$issue.description}
			</div>
		</div>
	</div>
{foreachelse}
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent=".accordion" href="#serverstatus-none">{$noissuesmsg}</a>
		</div>
	</div>
{/foreach}
</div>

<div class="pagination pagination-right">
	<ul>
		<li{if !$prevpage} class="disabled"{/if}>
			<a href="{if $prevpage}{$smarty.server.PHP_SELF}?{if $view}view={$view}&amp;{/if}page={$prevpage}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a>
		</li>
		<li{if !$nextpage} class="disabled"{/if}>
			<a href="{if $nextpage}{$smarty.server.PHP_SELF}?{if $view}view={$view}&amp;{/if}page={$nextpage}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a>
		</li>
	</ul>
</div>

{if $servers}
<script type="text/javascript">
{literal}
	function getStats(num) {
		$.post('serverstatus.php', 'getstats=1&num='+num, function(data) {
			$("#load"+num).html(data.load);
			$("#uptime"+num).html(data.uptime);
		},'json');
	}
	function checkPort(num,port) {
		$.post('serverstatus.php', 'ping=1&num='+num+'&port='+port, function(data) {
			$("#port"+port+"_"+num).html(data);
		});
	}
{/literal}
</script>

<div class="page-header">
	<h2>{$LANG.serverstatustitle}</h2>
</div>

<p>{$LANG.serverstatusheadingtext}</p>

<table class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>{$LANG.servername}</th>
			<th>HTTP</th>
			<th>FTP</th>
			<th>POP3</th>
			<th>{$LANG.serverstatusphpinfo}</th>
			<th>{$LANG.serverstatusserverload}</th>
			<th>{$LANG.serverstatusuptime}</th>
		</tr>
	</thead>
	<tbody>
{foreach from=$servers key=num item=server}
		<tr>
			<td>{$server.name}</td>
			<td class="text-center" id="port80_{$num}"><img src="images/loadingsml.gif" alt="{$LANG.loading}"/></td>
			<td class="text-center" id="port21_{$num}"><img src="images/loadingsml.gif" alt="{$LANG.loading}"/></td>
			<td class="text-center" id="port110_{$num}"><img src="images/loadingsml.gif" alt="{$LANG.loading}"/></td>
			<td class="text-center"><a href="{$server.phpinfourl}" target="_blank">{$LANG.serverstatusphpinfo}</a></td>
			<td class="text-center" id="load{$num}"><img src="images/loadingsml.gif" alt="{$LANG.loading}"/></td>
			<td class="text-center" id="uptime{$num}"><img src="images/loadingsml.gif" alt="{$LANG.loading}"/><script type="text/javascript">checkPort({$num},80);checkPort({$num},21);checkPort({$num},110);getStats({$num});</script></td>
		</tr>
{foreachelse}
		<tr>
			<td colspan="7">{$LANG.serverstatusnoservers}</td>
		</tr>
{/foreach}
	</tbody>
</table>

{/if}

<div class="text-right">
	<img src="images/rssfeed.gif" alt="RSS" class="valigntextbottom"/> <a href="networkissuesrss.php">{$LANG.announcementsrss}</a>
</div>