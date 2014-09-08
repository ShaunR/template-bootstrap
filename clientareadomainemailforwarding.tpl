<section>
	<div class="container">
		<h1>{$LANG.domainemailforwarding} {$domain}</h1>
		
		{if $error}
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$error}
		</div>
		{/if}
		
		<p>{$LANG.domainemailforwardingdesc}</p>
		
		{if $external}
		
		<div class="text-center">{$code}</div>
		
		{else}
		
		<form method="post" action="clientarea.php">
			<input type="hidden" name="action" value="domainemailforwarding">
			<input type="hidden" name="sub" value="save">
			<input type="hidden" name="domainid" value="{$domainid}">
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
							<div class="input-group">
								<input type="text" name="emailforwarderprefix[{$num}]" value="{$emailforwarder.prefix}" class="form-control">
								<span class="input-group-addon">@{$domain}</span>
							</div>
						</td>
						<td><input type="text" name="emailforwarderforwardto[{$num}]" value="{$emailforwarder.forwardto}" class="form-control"></td>
					</tr>
				{/foreach}
					<tr>
						<td>
							<div class="input-group">
								<input type="text" name="emailforwarderprefixnew" class="form-control">
								<span class="input-group-addon">@{$domain}</span>
							</div>
						</td>
						<td><input type="text" name="emailforwarderforwardtonew" class="form-control"></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3" class="text-right">
							<input type="submit" value="{$LANG.clientareasavechanges}" onclick="$('#modalpleasewait').modal();" class="btn btn-primary">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
		
		<div class="modal fade" id="modalpleasewait">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header text-center">
						<img src="images/loadingsml.gif" alt="{$LANG.pleasewait}" style="vertical-align:baseline;">
						<span class="lead">{$LANG.pleasewait}</span>
					</div>
				</div>
			</div>
		</div>
		
		{/if}
	</div>
</section>
