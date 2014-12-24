<section>
	<div class="container">
		<h1>{$LANG.twofactorauth}</h1>
		{if $newbackupcode}
		<div class="alert alert-success text-center">{$LANG.twofabackupcodereset}</div>
		{elseif $incorrect}
		<div class="alert alert-danger text-center">{$LANG.twofa2ndfactorincorrect}</div>
		{elseif $error}
		<div class="alert alert-danger text-center">{$error}</div>
		{else}
		<div class="alert alert-warning text-center">{$LANG.twofa2ndfactorreq}</div>
		{/if}

		<form method="post" action="{$systemsslurl}dologin.php" id="frmlogin">

		{if $newbackupcode}
			<input type="hidden" name="newbackupcode" value="1">
			<h2>{$LANG.twofanewbackupcodeis}</h2>
			<div class="alert alert-warning text-center twofabackupcode">{$newbackupcode}</div>
			<p>{$LANG.twofabackupcodeexpl}</p>
			<p><input type="submit" value="{$LANG.continue} &raquo;" class="btn btn-default"></p>
		{elseif $backupcode}
			<input type="hidden" name="backupcode" value="1">
			<p>
				<input type="text" name="code" size="25">
				<input type="submit" value="{$LANG.loginbutton} &raquo;" class="btn btn-default">
			</p>
		{else}
			{$challenge}
		{/if}

		{if !$newbackupcode}
			<div class="alert alert-info text-center">
			{if $backupcode}
				{$LANG.twofabackupcodelogin}
			{else}
				{$LANG.twofacantaccess2ndfactor} <a href="clientarea.php?backupcode=1">{$LANG.twofaloginusingbackupcode}</a>
			{/if}
			</div>
		{/if}
		</form>
		<script type="text/javascript">
			$("#frmlogin input:text:visible:first").focus();
		</script>
	</div>
</section>
