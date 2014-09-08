<section>
	<div class="container">
		{if $errormessage}
		
		<h1>{$LANG.sslconfsslcertificate}</h1>
		
		<div class="alert alert-danger">
			<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
			<ul>
				{$errormessage}
			</ul>
		</div>
		
		<input type="button" value="{$LANG.clientareabacklink}" class="btn btn-default" onclick="history.go(-1)">
		
		{else}
		
		<h1>{$LANG.sslconfigcomplete}</h1>
		
		<p>{$LANG.sslconfigcompletedetails}</p>
		
		<form method="post" action="clientarea.php">
			<input type="hidden" name="action" value="productdetails">
			<input type="hidden" name="id" value="{$serviceid}">
			<input type="submit" value="{$LANG.invoicesbacktoclientarea}" class="btn btn-default">
		</form>
		
		{/if}
	</div>
</section>
