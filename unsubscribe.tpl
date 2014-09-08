<section>
	<div class="container">
		<h1>{$LANG.newsletterunsubscribe}</h1>
		
		{if $successful}
		<div class="alert alert-success">
		{$LANG.unsubscribesuccess}
		</div>
		
		<p>{$LANG.newsletterremoved}</p>
		{/if}
		
		{if $errormessage}
		<div class="alert alert-danger">
			{$LANG.erroroccured}
		</div>
		
		<p>{$errormessage}</p>
		{/if}
		
		<p>{$LANG.newsletterresubscribe|sprintf2:'<a href="clientarea.php?action=details">':'</a>'}</p>
	</div>
</section>
