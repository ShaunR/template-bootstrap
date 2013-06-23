<div class="page-header">
	<h1>{$LANG.domainautorenewstatus}</h1>
</div>

{if $save}
<div class="alert alert-success fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$LANG.changessavedsuccessfully}
</div>
{/if}

<p>{$LANG.domainautorenewinfo}</p>

<div class="alert">
	<h3 class="alert-heading">{$LANG.domainbulkmanagementchangeaffect}</h3>
	{foreach from=$domains item=domain name=domains}{$domain}{if !$smarty.foreach.domains.last}, {/if}{/foreach}
</div>

<form method="post" action="clientarea.php" class="well text-center">
	<input type="hidden" name="action" value="bulkdomain"/>
	<input type="hidden" name="update" value="autorenew"/>
	<input type="hidden" name="save" value="1"/>
	{foreach from=$domainids item=domainid}
	<input type="hidden" name="domids[]" value="{$domainid}"/>
	{/foreach}
	<h4 class="marginbottom">{$LANG.domainautorenewrecommend}</h4>
	<input type="submit" name="enable" value="{$LANG.domainsautorenewenable}" class="btn btn-success btn-large"/>
	<input type="submit" name="disable" value="{$LANG.domainsautorenewdisable}" class="btn btn-danger btn-large"/>
</form>
