{if $affiliatesystemenabled}
<div class="page-header">
	<h1>{$LANG.affiliatesactivate}</h1>
</div>

<div class="alert alert-info">
	<h4 class="alert-heading">{$LANG.affiliatesignuptitle}</h4>
	{$LANG.affiliatesignupintro}
</div>

<ul>
	<li>{$LANG.affiliatesignupinfo1}</li>
	<li>{$LANG.affiliatesignupinfo2}</li>
	<li>{$LANG.affiliatesignupinfo3}</li>
</ul>

<form method="post" action="affiliates.php" class="text-center">
	<input type="hidden" name="activate" value="true"/>
	<button class="btn btn-success btn-large">{$LANG.affiliatesactivate}</button>
</form>

{else}

<div class="page-header">
	<h1>{$LANG.affiliatestitle}</h1>
</div>

<div class="alert alert-warning">
	{$LANG.affiliatesdisabled}
</div>

{/if}
