		{if $update eq "nameservers"}
			{include file="$template/bulkdomainmanagementnameservers.tpl"}
		{elseif $update eq "autorenew"}
			{include file="$template/bulkdomainmanagementautorenew.tpl"}
		{elseif $update eq "reglock"}
			{include file="$template/bulkdomainmanagementreglock.tpl"}
		{elseif $update eq "contactinfo"}
			{include file="$template/bulkdomainmanagementcontactinfo.tpl"}
		{/if}
