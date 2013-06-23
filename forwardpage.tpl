<div class="alert alert-warning">{$message}</div>

<hr/>

<p class="text-center"><img src="images/loading.gif" alt="Loading" border="0"/></p>

<hr/>

<div class="text-center">{$code}</div>

<form method="post" action="{if $invoiceid}viewinvoice.php?id={$invoiceid}{else}clientarea.php{/if}"></form>

{literal}
<script language="javascript">
	setTimeout ( "autoForward()" , 5000 );
	function autoForward() {
   	document.forms[0].submit()
	}
</script>
{/literal}
