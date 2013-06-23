<form method="post" action="{$smarty.server.PHP_SELF}?action=domainaddons" class="form-horizontal">
	<input type="hidden" name="{$action}" value="{$addon}"/>
	<input type="hidden" name="id" value="{$domainid}"/>
	<input type="hidden" name="confirm" value="1"/>
	<input type="hidden" name="token" value="{$token}"/>

{if $action eq "buy"}
	<input type="hidden" name="buy" value="{$addon}"/>

	{if $addon eq "dnsmanagement"}
	<div class="page-header">
		<h1>{$LANG.domainaddonsdnsmanagement}</h1>
	</div>

	<div class="text-center">
		<p>{$LANG.domainaddonsdnsmanagementinfo}</p>
		<input type="submit" name="enable" value="{$LANG.domainaddonsbuynow} {$addonspricing.dnsmanagement}{$LANG.domainaddonsperyear}" class="btn btn-success btn-large"/>
	</div>

	{elseif $addon eq "emailfwd"}

	<div class="page-header">
		<h1>{$LANG.domainemailforwarding}</h1>
	</div>
	
	<div class="text-center">
		<p>{$LANG.domainaddonsemailforwardinginfo}</p>
		<input type="submit" name="enable" value="{$LANG.domainaddonsbuynow} {$addonspricing.emailforwarding}{$LANG.domainaddonsperyear}" class="btn btn-success btn-large"/>
	</div>

	{elseif $addon eq "idprotect"}
	
	<div class="page-header">
		<h1>{$LANG.domainidprotection}</h1>
	</div>

	<div class="text-center">
		<p>{$LANG.domainaddonsidprotectioninfo}</p>
		<input type="submit" name="enable" value="{$LANG.domainaddonsbuynow} {$addonspricing.idprotection}{$LANG.domainaddonsperyear}" class="btn btn-success btn-large"/>
	</div>

	{/if}
{elseif $action eq "disable"}
	<input type="hidden" name="disable" value="{$addon}"/>
	
	{if $addon eq "idprotect"}
	<div class="page-header">
		<h1>{$LANG.domainidprotection}</h1>
	</div>
		
	{if $success}
    <div class="alert alert-success">
		{$LANG.changessavedsuccessfully}
	</div>
	{elseif $error}
	<div class="alert alert-error">
		{$LANG.clientareaerrors}
	</div>
	{/if}

	<p class="text-center">{$LANG.domainaddonscancelareyousure}</p>
		
	<input type="submit" name="enable" value="{$LANG.domainaddonsconfirm}" class="btn btn-danger btn-large"/>
	{/if}

{/if}
	<div class="text-center margintop">
		<a class="btn" href="clientarea.php?action=domaindetails&amp;id={$domainid}" title="{$LANG.clientareabacklink}">{$LANG.clientareabacklink}</a>
	</div>

</form>
