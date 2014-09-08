<section>
	<div class="container">
		<div class="row text-center">
			<div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4 margin-top margin-bottom">
				<h1 class="h2">{$LANG.pwreset}</h1>
				{if $success}
				<div class="alert alert-success">
					<div class="h4">{$LANG.pwresetvalidationsent}</div>
					<p>{$LANG.pwresetvalidationcheckemail}</p>
				</div>
				{else}
				{if $errormessage}
				<div class="alert alert-danger alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					<p>{$errormessage}</p>
				</div>
				{/if}
				{if $securityquestion}
				<form method="post" action="pwreset.php" class="well well-sm margin-top">
					<input type="hidden" name="action" value="reset">
					<input type="hidden" name="email" value="{$email}">
					<p>{$LANG.pwresetsecurityquestionrequired}</p>
					<hr>
					<div class="form-group">
						<label for="answer">{$securityquestion}</label>
						<input name="answer" id="answer" type="text" value="{$answer}" class="form-control input-lg">
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-block btn-lg btn-primary">{$LANG.pwresetsubmit}</button>
					</div>
				</form>
				{else}
				<p>{$LANG.pwresetdesc}</p>
				<form method="post" action="pwreset.php" class="well wells-sm margin-top">
					<input type="hidden" name="action" value="reset">
					<div class="form-group">
						<input name="email" type="text" placeholder="{$LANG.loginemail}" class="form-control text-center input-lg">
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-lg btn-block btn-primary">{$LANG.pwresetsubmit}</button>
					</div>
				</form>
				{/if}
				{/if}
			</div>
	   </div>
	</div>
</section>
