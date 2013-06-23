<div class="row">
	<div class="span6 offset3">
		<div class="page-header">
			<h1>{$LANG.pwreset}</h1>
		</div>
		{if $invalidlink}
		<div class="alert alert-error">
			{$invalidlink}
		</div>
	{elseif $success}
		<div class="alert alert-success text-center">
			{$LANG.pwresetvalidationsuccess}
		</div>
		<p class="text-center">{$LANG.pwresetsuccessdesc|sprintf2:'<a href="clientarea.php">':'</a>'}</p>
	{else}
		{if $errormessage}
		<div class="alert alert-error">
			{$errormessage}
		</div>
		{/if}

		<p class="lead text-center">{$LANG.pwresetenternewpw}</p>
		<form class="form-horizontal" method="post" action="{$smarty.server.PHP_SELF}?action=pwreset">
			<input type="hidden" name="key" id="key" value="{$key}"/>
			<div class="control-group">
				<label class="control-label" for="password">{$LANG.newpassword}</label>
				<div class="controls">
					<input type="password" name="newpw" id="password"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="confirmpw">{$LANG.confirmnewpassword}</label>
				<div class="controls">
					<input type="password" name="confirmpw" id="confirmpw"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="passstrength">{$LANG.pwstrength}</label>
				<div class="controls">
					<div style="width: 220px;">{include file="$template/pwstrength.tpl"}</div>
				</div>
			</div>
			<div class="form-actions">
				<input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}"/>
				<input class="btn" type="reset" value="{$LANG.cancel}"/>
			</div>
		</form>
		{/if}
	</div>
</div>