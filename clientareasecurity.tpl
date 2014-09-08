<section>
	<div class="container">
		<h1>{$LANG.clientareanavsecurity}</h1>
		
		<ul class="nav nav-tabs">
			<li><a href="clientarea.php?action=details">{$LANG.clientareanavdetails}</a></li>
			{if $condlinks.updatecc}<li><a href="clientarea.php?action=creditcard">{$LANG.clientareanavccdetails}</a></li>{/if}
			<li><a href="clientarea.php?action=contacts">{$LANG.clientareanavcontacts}</a></li>
			<li><a href="clientarea.php?action=changepw">{$LANG.clientareanavchangepw}</a></li>
			{if $condlinks.security}<li class="active"><a href="clientarea.php?action=security">{$LANG.clientareanavsecurity}</a></li>{/if}
		</ul>
		
		{if $successful}
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$LANG.changessavedsuccessfully}
		</div>
		{/if}
		
		{if $errormessage}
		<div class="alert alert-danger alert-dismissable">
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
			<input type="hidden" name="2fasetup" value="1">
			<p align="center">
				{if $twofastatus}
				<input type="submit" value="{$LANG.twofadisableclickhere}" class="btn btn-danger">
				{else}
				<input type="submit" value="{$LANG.twofaenableclickhere}" class="btn btn-success">
				{/if}
			</p>
		</form>
		{/if}
		{/if}
		
		
		{if $securityquestionsenabled && !$twofaactivation}
		
		<h3>{$LANG.clientareanavsecurityquestions}</h3>
		<form method="post" action="clientarea.php" class="form-horizontal">
			<input type="hidden" name="action" value="changesq">
			{if !$nocurrent}
			<div class="form-group">
				<label class="col-md-4 control-label" for="currentans">{$currentquestion}</label>
				<div class="col-md-6">
					<input type="password" name="currentsecurityqans" id="currentans" class="form-control">
				</div>
			</div>
			{/if}
			<div class="form-group">
				<label class="col-md-4 control-label" for="securityqid">{$LANG.clientareasecurityquestion}</label>
				<div class="col-md-6">
					<select name="securityqid" id="securityqid" class="form-control">
					{foreach key=num item=question from=$securityquestions}
						<option value={$question.id}>{$question.question}</option>
					{/foreach}
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="securityqans">{$LANG.clientareasecurityanswer}</label>
				<div class="col-md-6">
					<input type="password" name="securityqans" id="securityqans" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="securityqans2">{$LANG.clientareasecurityconfanswer}</label>
				<div class="col-md-6">
					<input type="password" name="securityqans2" id="securityqans2" class="form-control">
				</div>
			</div>
			<div class="form-group text-center">
				<input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}">
				<input class="btn btn-default" type="reset" value="{$LANG.cancel}">
			</div>
		</form>
		{/if}
	</div>
</section>
