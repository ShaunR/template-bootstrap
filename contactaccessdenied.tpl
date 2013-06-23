<div class="page-header">
	<h1>{$LANG.accessdenied}</h1>
</div>

<div class="alert alert-error">
    <h4 class="alert-heading">{$LANG.subaccountpermissiondenied}</h4>
</div>

<p>{$LANG.subaccountallowedperms}</p>

<ul>
{foreach from=$allowedpermissions item=permission}
	<li>{$permission}</li>
{/foreach}
</ul>

<p>{$LANG.subaccountcontactmaster}</p>

<div class="text-center">
	<input type="button" value="{$LANG.clientareabacklink}" onclick="history.go(-1)" class="btn"/>
</p>
