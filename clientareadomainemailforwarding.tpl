<div class="page-header">
	<h1>{$LANG.domainemailforwarding} {$domain}</h1>
</div>

{if $error}
<div class="alert alert-error fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$error}
</div>
{/if}

<p>{$LANG.domainemailforwardingdesc}</p>

{if $external}

<div class="text-center">{$code}</div>

{else}

<form method="post" action="clientarea.php">
	<input type="hidden" name="action" value="domainemailforwarding"/>
	<input type="hidden" name="sub" value="save"/>
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<table class="table table-bordered table-striped">
		<thead>
			<tr>
				<th>{$LANG.domainemailforwardingprefix}</th>
				<th>{$LANG.domainemailforwardingforwardto}</th>
			</tr>
		</thead>
		<tbody>
		{foreach key=num item=emailforwarder from=$emailforwarders}
			<tr>
				<td>
					<div class="input-append">
						<input type="text" name="emailforwarderprefix[{$num}]" value="{$emailforwarder.prefix}" class="span3"/><span class="add-on">@{$domain}</span>
					</div>
				</td>
				<td><input type="text" name="emailforwarderforwardto[{$num}]" value="{$emailforwarder.forwardto}" class="span4"/></td>
			</tr>
		{/foreach}
			<tr>
				<td>
					<div class="input-append">
						<input type="text" name="emailforwarderprefixnew" class="span3"/><span class="add-on">@{$domain}</span>
					</div>
				</td>
				<td><input type="text" name="emailforwarderforwardtonew" class="span4"/></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3" class="text-right">
					<input type="submit" value="{$LANG.clientareasavechanges}" onclick="$('#modalpleasewait').modal();" class="btn btn-primary btn-large"/>
				</td>
			</tr>
		</tfoot>
	</table>
</form>

<div class="modal hide fade in" id="modalpleasewait">
	<div class="modal-header text-center">
		<h3><img src="images/loadingsml.gif" alt="{$LANG.pleasewait}" class="valignbaseline"/> {$LANG.pleasewait}</h3>
	</div>
</div>

{/if}
