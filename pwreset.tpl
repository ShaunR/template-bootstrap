<div class="row marginbottom">
	<div class="span6 offset3">
		<div class="page-header">
			<h1>{$LANG.pwreset}</h1>
		</div>

{if $success}
	<div class="alert alert-success">
		<h4>{$LANG.pwresetvalidationsent}</h4>
		{$LANG.pwresetvalidationcheckemail}
	</div>
{else}
	{if $errormessage}
	<div class="alert alert-error fade in">
		<button class="close" data-dismiss="alert">&times;</button>
		{$errormessage}
	</div>
	{/if}

	{if $securityquestion}
	<div class="alert alert-info">{$LANG.pwresetsecurityquestionrequired}</div>
	<form method="post" action="pwreset.php">
		<input type="hidden" name="action" value="reset"/>
		<input type="hidden" name="email" value="{$email}"/>
		<div class="text-center">
			<label for="answer">{$securityquestion}</label>
			<input name="answer" id="answer" type="text" value="{$answer}"/>
		</div>
		<div class="text-center">
			<input type="submit" class="btn btn-primary" value="{$LANG.pwresetsubmit}"/>
		</div>
	</form>
	{else}
		<p>{$LANG.pwresetdesc}</p>
		<form method="post" action="pwreset.php" class="form-horizontal">
			<input type="hidden" name="action" value="reset"/>
			<div class="control-group">
				<label class="control-label" for="email">{$LANG.loginemail}</label>
				<div class="controls">
					<input name="email" id="email" type="text"/>
				</div>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-primary">{$LANG.pwresetsubmit}</button>
			</div>
		</form>
	{/if}
   </div>
{/if}
</div>

