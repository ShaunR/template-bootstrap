<section>
	<div class="container">
		<h1 class="text-center">{$LANG.pwreset}</h1>
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				{if $invalidlink}
				<div class="alert alert-danger">
					{$invalidlink}
				</div>
				{elseif $success}
				<div class="alert alert-success text-center">
					{$LANG.pwresetvalidationsuccess}
				</div>
				<p class="text-center">{$LANG.pwresetsuccessdesc|sprintf2:'<a href="clientarea.php">':'</a>'}</p>
				{else}

				<p class="text-center">{$LANG.pwresetenternewpw}</p>
				<hr>
				{if $errormessage}<ul class="list-unstyled text-danger">{$errormessage}</ul>{/if}
				<form class="form-horizontal margin-top" method="post" action="{$smarty.server.PHP_SELF}?action=pwreset">
					<input type="hidden" name="key" id="key" value="{$key}">
					<div class="form-group">
						<label class="col-md-4 control-label" for="password">{$LANG.newpassword}</label>
						<div class="col-md-8">
							<input type="password" name="newpw" id="password" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="confirmpw">{$LANG.confirmnewpassword}</label>
						<div class="col-md-8">
							<input type="password" name="confirmpw" id="confirmpw" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="passstrength">{$LANG.pwstrength}</label>
						<div class="col-md-8">
							<div class="form-control-static">{include file="$template/pwstrength.tpl"}</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-8 col-md-offset-4">
							<input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}">
							<input class="btn btn-default" type="reset" value="{$LANG.cancel}">
						</div>
					</div>
				</form>
				{/if}
			</div>
		</div>
	</div>
</section>
