<div class="row">
	<div class="span6 offset3">
		<div class="page-header">
			<h1>{$LANG.login}</h1>
		</div>
{if $incorrect}
		<div class="alert alert-error fade in">
			<button class="close" data-dismiss="alert">&times;</button>
			{$LANG.loginincorrect}
		</div>
{/if}
		<div class="row">
			<div class="span4 offset1">
				<form method="post" action="{$systemsslurl}dologin.php" class="form-stacked" name="frmlogin">
					<fieldset>
						<label for="username">{$LANG.loginemail}:</label>
						<input class="span4" name="username" id="username" type="text"/>
						<label for="password">{$LANG.loginpassword}:</label>
						<input class="span4" name="password" id="password" type="password"/>
						<div class="text-center">
							<input type="submit" class="btn btn-primary" value="{$LANG.loginbutton}"/>
							<label class="checkbox inline" style="margin-left:15px;"><input type="checkbox" name="rememberme"{if $rememberme} checked="checked"{/if}/> {$LANG.loginrememberme}</label>
						</div>
						<div class="text-center" style="margin-top:15px;">
							<a href="pwreset.php">{$LANG.loginforgotteninstructions}</a>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>
