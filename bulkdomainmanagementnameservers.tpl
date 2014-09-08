<section>
	<div class="container">
		<h1>{$LANG.domainmanagens}</h1>
		
		{if $save}
		{if $errors}
		<div class="alert alert-danger">
			<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
			<ul>
			{foreach from=$errors item=error}
				<li>{$error}</li>
			{/foreach}
			</ul>
		</div>
		{else}
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$LANG.changessavedsuccessfully}
		</div>
		{/if}
		{/if}
		
		<div class="alert">
			<h3 class="alert-heading">{$LANG.domainbulkmanagementchangesaffect}</h3>
			{foreach from=$domains item=domain name=domains}{$domain}{if !$smarty.foreach.domains.last}, {/if}{/foreach}
		</div>
		
		<form method="post" action="clientarea.php" class="form-horizontal">
			<input type="hidden" name="action" value="bulkdomain">
			<input type="hidden" name="update" value="nameservers">
			<input type="hidden" name="save" value="1">
			{foreach from=$domainids item=domainid}
			<input type="hidden" name="domids[]" value="{$domainid}">
			{/foreach}
			<fieldset name="nschoises" class="margin-bottom well">
				<label class="radio"><input type="radio" name="nschoice" value="default"{if $defaultns} checked="checked"{/if}> {$LANG.nschoicedefault}</label>
				<label class="radio"><input type="radio" name="nschoice" value="custom"{if !$defaultns} checked="checked"{/if}> {$LANG.nschoicecustom}</label>
				<script type="text/javascript">
				{literal}
					$(function() {
						$('input[name=nschoice]').click(function() {
							if($(this).val() == 'default') {
								$('.domnsinputs').attr('disabled','disabled');
							} else {
								$('.domnsinputs').removeAttr('disabled');
							}
						});
					}).click();
					{/literal}
				</script>
			</fieldset>
			<fieldset name="nameservers">
				<div class="control-group">
					<label class="control-label" for="ns1">{$LANG.domainnameserver1}</label>
					<div class="controls">
						<input class="col-md-3 domnsinputs" id="ns1" name="ns1" type="text" value="{$ns1}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="ns2">{$LANG.domainnameserver2}</label>
					<div class="controls">
						<input class="col-md-3 domnsinputs" id="ns2" name="ns2" type="text" value="{$ns2}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="ns3">{$LANG.domainnameserver3}</label>
					<div class="controls">
						<input class="col-md-3 domnsinputs" id="ns3" name="ns3" type="text" value="{$ns3}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="ns4">{$LANG.domainnameserver4}</label>
					<div class="controls">
						<input class="col-md-3 domnsinputs" id="ns4" name="ns4" type="text" value="{$ns4}">
					</div>
				</div>
				<div class="control-group">			
					<label class="control-label" for="ns5">{$LANG.domainnameserver5}</label>
					<div class="controls">
						<input class="col-md-3 domnsinputs" id="ns5" name="ns5" type="text" value="{$ns5}">
					</div>
				</div>
			</fieldset>
			<div class="form-actions">
				<input type="submit" class="btn btn-lg btn-primary" onclick="$('#modalpleasewait').modal();" value="{$LANG.changenameservers}">
			</div>
		</form>
		
		<div class="modal hide fade in" id="modalpleasewait">
			<div class="modal-header text-center">
				<h3><img src="images/loadingsml.gif" alt="{$LANG.pleasewait}" style="vertical-align:baseline"> {$LANG.pleasewait}</h3>
			</div>
		</div>
	</div>
</section>
