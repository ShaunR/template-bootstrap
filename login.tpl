<section>
	<div class="container">
		<div class="row text-center">
			<div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4 margin-top margin-bottom">
				<h1 class="h2">{$LANG.login}</h1>
				{if $incorrect}<p class="text-danger"><strong>{$LANG.loginincorrect}</strong></p>{/if}
				<form method="post" action="{$systemsslurl}dologin.php" class="well well-sm margin-top">
					<fieldset>
						<div class="form-group">
							<input type="email" name="username" value="{if $smarty.request.username}{$smarty.request.username}{/if}" placeholder="{$LANG.loginemail}" class="form-control text-center input-lg">
						</div>
						<div class="form-group">
							<input type="password" name="password" placeholder="{$LANG.loginpassword}" class="form-control text-center input-lg">
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="rememberme"{if $rememberme} checked="checked"{/if}> {$LANG.loginrememberme}
							</label>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-lg btn-block">{$LANG.loginbutton}</button>
						</div>
						<p class="form-group">
							<a href="pwreset.php" title="{$LANG.loginforgotteninstructions}">{$LANG.loginforgotteninstructions}</a>
						</p>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</section>
