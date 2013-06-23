<div class="page-header">
	<h1>{$LANG.domaindnsmanagement} <small>{$domain}</small></h1>
</div>

<p>{$LANG.domaindnsmanagementdesc}</p>

{if $error}
<div class="alert alert-error fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$error}
</div>
{/if}

{if $external}
<div class="text-center">
	{$code}
</div>
{else}

<form class="form-horizontal" method="post" action="clientarea.php">
	<input type="hidden" name="action" value="domaindns"/>
	<input type="hidden" name="sub" value="save"/>
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<table class="table table-bordered table-striped">
		<thead>
			<tr>
				<th>{$LANG.domaindnshostname}</th>
				<th>{$LANG.domaindnsrecordtype}</th>
				<th>{$LANG.domaindnsaddress}</th>
				<th>{$LANG.domaindnspriority}</th>
			</tr>
		</thead>
		<tbody>
		{foreach from=$dnsrecords item=dnsrecord}
			<tr>
				<td>
					<input type="hidden" name="dnsrecid[]" value="{$dnsrecord.recid}"/>
					<input type="text" name="dnsrecordhost[]" value="{$dnsrecord.hostname}" class="span3"/>
				</td>
				<td>
					<select name="dnsrecordtype[]" class="span2">
						<option value="A"{if $dnsrecord.type eq "A"} selected="selected"{/if}>A (Address)</option>
						<option value="AAAA"{if $dnsrecord.type eq "AAAA"} selected="selected"{/if}>AAAA (Address)</option>
						<option value="MXE"{if $dnsrecord.type eq "MXE"} selected="selected"{/if}>MXE (Mail Easy)</option>
						<option value="MX"{if $dnsrecord.type eq "MX"} selected="selected"{/if}>MX (Mail)</option>
						<option value="CNAME"{if $dnsrecord.type eq "CNAME"} selected="selected"{/if}>CNAME (Alias)</option>
						<option value="TXT"{if $dnsrecord.type eq "TXT"} selected="selected"{/if}>SPF (txt)</option>
						<option value="URL"{if $dnsrecord.type eq "URL"} selected="selected"{/if}>URL Redirect</option>
						<option value="FRAME"{if $dnsrecord.type eq "FRAME"} selected="selected"{/if}>URL Frame</option>
					</select>
				</td>
				<td><input type="text" name="dnsrecordaddress[]" value="{$dnsrecord.address}" class="span3"/></td>
          		<td>
				{if $dnsrecord.type eq "MX"}
					<input type="text" name="dnsrecordpriority[]" value="{$dnsrecord.priority}" class="span1"/> <i class="icon icon-question-sign" rel="tooltip" data-original-title="{$LANG.domaindnsmxonly}"></i>
				{else}
					<input type="hidden" name="dnsrecordpriority[]" value="N/A"/>{$LANG.domainregnotavailable}
				{/if}
				</td>
			</tr>
		{/foreach}
			<tr>
				<td><input type="text" name="dnsrecordhost[]" value="" class="span3"/></td>
				<td>
					<select name="dnsrecordtype[]" class="span2">
						<option value="A">A (Address)</option>
						<option value="AAAA">AAAA (Address)</option>
						<option value="MXE">MXE (Mail Easy)</option>
						<option value="MX">MX (Mail)</option>
						<option value="CNAME">CNAME (Alias)</option>
						<option value="TXT">SPF (txt)</option>
						<option value="URL">URL Redirect</option>
						<option value="FRAME">URL Frame</option>
					</select>
				</td>
				<td><input type="text" name="dnsrecordaddress[]" value="" class="span3"/></td>
				<td><input type="text" name="dnsrecordpriority[]" value="" class="span1"/> <i class="icon icon-question-sign" rel="tooltip" data-original-title="{$LANG.domaindnsmxonly}"></i></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4" class="text-right">
					<input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary btn-large"/>
				</td>
			</tr>
		</tfoot>
	</table>
</form>
{/if}

<script type="text/javascript">$('[rel=tooltip]').tooltip();</script>
