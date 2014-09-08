<section>
	<div class="container">
		<p>{$LANG.creditcard3dsecure}</p>

		<div id="submitfrm">
			{$code}
			<iframe name="3dauth" width="400" height="500" scrolling="auto" src="about:blank"></iframe>
		</div>

		{literal}
		<script type="text/javascript">
			setTimeout ( "autoForward()" , 1000 );
			function autoForward() {
				var submitForm = $("#submitfrm").find("form");
				submitForm.submit();
			}
		</script>
		{/literal}
	</div>
</section>
