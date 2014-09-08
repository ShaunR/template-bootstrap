<section>
	<div class="container">
		<h1>{$LANG.managing} {$domain}</h1>
		
		<div class="row">
			<div class="col-md-4">
				<h2>{$LANG.domaingeteppcode}</h2>
				<p>{$LANG.domaingeteppcodeexplanation}</p>
			</div>
			<div class="col-md-8">
		{if $error}
				<div class="alert alert-danger alert-block">
					<h3 class="alert-heading">{$LANG.domaingeteppcodefailure}</h3>
					{$error}
				</div>
		{elseif $eppcode}
				<div class="alert alert-warning alert-block">
					<h3 class="alert-heading">{$LANG.domaingeteppcodeis}</h3>
					{$eppcode}
				</div>
		{else}
				<div class="alert alert-warning alert-block">
					{$LANG.domaingeteppcodeemailconfirmation}
				</div>
		{/if}
			</div>
		</div>
		
		<div class="text-center margin-bottom">
			<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-default" title="{$LANG.clientareabacklink}">{$LANG.clientareabacklink}</a>
		</div>
	</div>
</section>
