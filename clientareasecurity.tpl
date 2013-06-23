<div class="page-header">
	<h1>{$LANG.clientareanavsecurity}</h1>
</div>

<div class="tabbable">
	<ul class="nav nav-tabs">
		<li><a href="clientarea.php?action=details">{$LANG.clientareanavdetails}</a></li>
		{if $condlinks.updatecc}<li><a href="clientarea.php?action=creditcard">{$LANG.clientareanavccdetails}</a></li>{/if}
		<li><a href="clientarea.php?action=contacts">{$LANG.clientareanavcontacts}</a></li>
		<li><a href="clientarea.php?action=changepw">{$LANG.clientareanavchangepw}</a></li>
		{if $condlinks.security}<li class="active"><a href="clientarea.php?action=security">{$LANG.clientareanavsecurity}</a></li>{/if}
	</ul>
</div>

{if $successful}
<div class="alert alert-success fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$LANG.changessavedsuccessfully}
</div>
{/if}

{if $errormessage}
<div class="alert alert-error fade in">
	<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
	<ul>
		{$errormessage}
	</ul>
</div>
{/if}

{if $twofaavailable}
{if $twofaactivation}
{literal}
<script>
	function dialogSubmit() {
		$('div#twofaactivation form').attr('method', 'post');
		$('div#twofaactivation form').attr('action', 'clientarea.php');
		$('div#twofaactivation form').attr('onsubmit', '');
		$('div#twofaactivation form').submit();
		return true;
	}
</script>
{/literal}

<div id="twofaactivation">{$twofaactivation}</div>
{else}

<h2>{$LANG.twofactorauth}</h2>
<p>{$LANG.twofaactivationintro}</p>

<form method="post" action="clientarea.php?action=security">
	<input type="hidden" name="2fasetup" value="1"/>
	<p align="center">
		{if $twofastatus}
		<input type="submit" value="{$LANG.twofadisableclickhere}" class="btn btn-danger"/>
		{else}
		<input type="submit" value="{$LANG.twofaenableclickhere}" class="btn btn-success"/>
		{/if}
	</p>
</form>
{/if}
{/if}


{if $securityquestionsenabled && !$twofaactivation}

<form method="post" action="clientarea.php">
	<input type="hidden" name="action" value="changesq"/>
	<div class="row">
		<div class="span10 offset2">
	{if !$nocurrent}
			<label class="control-label" for="currentans">{$currentquestion}</label>
			<input type="password" name="currentsecurityqans" id="currentans"/>
	{/if}
			<label class="control-label" for="securityqid">{$LANG.clientareasecurityquestion}</label>
			<select name="securityqid" id="securityqid" class="span3">
			{foreach key=num item=question from=$securityquestions}
				<option value={$question.id}/>{$question.question}</option>
			{/foreach}
			</select>
			<label class="control-label" for="securityqans">{$LANG.clientareasecurityanswer}</label>
			<input type="password" name="securityqans" id="securityqans"/>
			<label class="control-label" for="securityqans2">{$LANG.clientareasecurityconfanswer}</label>
			<input type="password" name="securityqans2" id="securityqans2" class="span3"/>
		</div>
	</div>
	<hr/>
	<div class="form-actions text-center">
		<input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}"/>
		<input class="btn" type="reset" value="{$LANG.cancel}"/>
	</div>
</form>
{/if}
