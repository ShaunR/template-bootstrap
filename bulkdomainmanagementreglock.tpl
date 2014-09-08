<section>
	<div class="container">
		<h1>{$LANG.domainreglockstatus}</h1>
		
		{if $save}
		{if $errors}
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
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
		
		<p>{$LANG.domainreglockinfo}</p>
		
		<div class="alert">
			<h3 class="alert-heading">{$LANG.domainbulkmanagementchangeaffect}</h3>
			{foreach from=$domains item=domain name=domains}{$domain}{if !$smarty.foreach.domains.last}, {/if}{/foreach}
		</div>
		
		<form method="post" action="clientarea.php" class="well text-center">
			<input type="hidden" name="action" value="bulkdomain">
			<input type="hidden" name="update" value="reglock">
			<input type="hidden" name="save" value="1">
			{foreach from=$domainids item=domainid}
			<input type="hidden" name="domids[]" value="{$domainid}">
			{/foreach}
			<h4 class="margin-bottom">{$LANG.domainreglockrecommend}</h4>
			<input type="submit" name="enable" value="{$LANG.domainreglockenable}" class="btn btn-success btn-lg">
			<input type="submit" name="disable" value="{$LANG.domainreglockdisable}" class="btn btn-danger btn-lg">
		</form>
	</div>
</section>
