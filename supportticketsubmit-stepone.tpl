<section>
	<div class="container">
		<h1>{$LANG.navopenticket}</h1>
		
		<p>{$LANG.supportticketsheader}</p>

		{foreach from=$departments item=department name=departments}
		{if $smarty.foreach.departments.first}
		<div class="row margin-top">
		{elseif $smarty.foreach.departments.index % 3 == 0 }
		</div>
		<div class="row margin-top">
		{/if}
			<div class="col-md-4 text-center">
				<h3>{$department.name}</h3>
				{if $department.description}<p>{$department.description}</p>{/if}
				<a href="{$smarty.server.PHP_SELF}?step=2&amp;deptid={$department.id}" title="{$department.name}" class="btn btn-primary">{$LANG.navopenticket}</a>
			</div>
		{if $smarty.foreach.departments.last}
		</div>
		{/if}
		{foreachelse}
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="alert alert-warning text-center">{$LANG.nosupportdepartments}</div>
			</div>
		</div>
		{/foreach}
	</div>
</section>
