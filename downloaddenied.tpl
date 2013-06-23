<div class="page-header">
	<h1>{$LANG.accessdenied}</h1>
</div>

<p>{$LANG.downloadproductrequired}</p>
<div class="alert alert-info">
	{if $pid}{$prodname}{else}{$addonname}{/if}
</div>

{if $pid}<div class="text-center"><a href="cart.php?a=add&pid={$pid}" class="btn btn-large marginbottom" title="{$LANG.ordernowbutton}">{$LANG.ordernowbutton} &raquo;</a></div>{/if}
{if $aid}<div class="text-center"><a href="cart.php?gid=addons" class="btn btn-large marginbottom" title="{$LANG.ordernowbutton}">{$LANG.ordernowbutton} &raquo;</a></div>{/if}