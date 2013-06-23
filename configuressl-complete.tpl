{if $errormessage}

<div class="page-header">
	<h1>{$LANG.sslconfsslcertificate}</h1>
</div>

<div class="alert alert-error">
	<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
	<ul>
		{$errormessage}
	</ul>
</div>

<input type="button" value="{$LANG.clientareabacklink}" class="btn" onclick="history.go(-1)"/>

{else}

<div class="page-header">
	<h1>{$LANG.sslconfigcomplete}</h1>
</div>

<p>{$LANG.sslconfigcompletedetails}</p>

<form method="post" action="clientarea.php">
	<input type="hidden" name="action" value="productdetails"/>
	<input type="hidden" name="id" value="{$serviceid}"/>
	<input type="submit" value="{$LANG.invoicesbacktoclientarea}" class="btn"/>
</form>

{/if}
