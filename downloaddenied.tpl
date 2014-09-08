<section>
	<div class="container">
		<h1>{$LANG.accessdenied}</h1>
		
		<p>{$LANG.downloadproductrequired}</p>
		
		<div class="alert alert-info">
			{if $pid}{$prodname}{else}{$addonname}{/if}
		</div>
		
		{if $pid}
		<div class="form-group text-center"><a href="cart.php?a=add&pid={$pid}" class="btn btn-success btn-lg" title="{$LANG.ordernowbutton}">{$LANG.ordernowbutton} &raquo;</a></div>
		{/if}
		
		{if $aid}
		<div class="form-group text-center"><a href="cart.php?gid=addons" class="btn btn-success btn-lg" title="{$LANG.ordernowbutton}">{$LANG.ordernowbutton} &raquo;</a></div>
		{/if}
	</div>
</section>
