<div class="page-header">
	<h1>{$LANG.clientareanavccdetails}</h1>
</div>

<div class="tabbable">
	<ul class="nav nav-tabs">
		<li><a href="clientarea.php?action=details">{$LANG.clientareanavdetails}</a></li>
		<li class="active"><a href="clientarea.php?action=creditcard">{$LANG.clientareanavccdetails}</a></li>
		<li><a href="clientarea.php?action=contacts">{$LANG.clientareanavcontacts}</a></li>
		<li><a href="clientarea.php?action=changepw">{$LANG.clientareanavchangepw}</a></li>
		{if $condlinks.security}<li><a href="clientarea.php?action=security">{$LANG.clientareanavsecurity}</a></li>{/if}
	</ul>
</div>

{if $remoteupdatecode}
	{$removeupdatecode}
{else}

{if $successful}
<div class="alert alert-success fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$LANG.changessavedsuccessfully}
</div>
{/if}

{if $errormessage}
<div class="alert alert-error">
	<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
	<ul>
		{$errormessage}
	</ul>
</div>
{/if}

<form class="form-horizontal" method="post" action="clientarea.php">
	<input type="hidden" name="action" value="creditcard"/>
	<h3 class="marginbottom">{$LANG.creditcarddetails}</h3>
	<div class="control-group">
		<label class="control-label">{$LANG.creditcardcardtype}</label>
		<div class="controls">
			<input type="text" value="{$cardtype}" readonly="readonly" class="span3"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">{$LANG.creditcardcardnumber}</label>
		<div class="controls">
			<input type="text" value="{$cardnum}" readonly="readonly" class="span3"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">{$LANG.creditcardcardexpires}</label>
		<div class="controls">
			<input type="text" value="{$cardexp}" readonly="readonly" class="span1"/>
		</div>
	</div>
{if $cardissuenum}
	<div class="control-group">
		<label class="control-label">{$LANG.creditcardcardissuenum}</label>
		<div class="controls">
			<input type="text" value="{$cardissuenum}" readonly="readonly" class="span2"/>
		</div>
	</div>
{/if}
{if $cardstart}
	<div class="control-group">
		<label class="control-label">{$LANG.creditcardcardstart}</label>
		<div class="controls">
			<input type="text" value="{$cardstart}" readonly="readonly" class="span2"/>
		</div>
	</div>
{/if}
	<hr/>
	<h3 class="marginbottom">{$LANG.creditcardenternewcard}</h3>
	<div class="control-group">
		<label class="control-label" for="cctype">{$LANG.creditcardcardtype}</label>
		<div class="controls">
			<select name="cctype" id="cctype">
			{foreach key=num item=cardtype from=$acceptedcctypes}
				<option>{$cardtype}</option>
			{/foreach}
			</select>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="ccnumber">{$LANG.creditcardcardnumber}</label>
		<div class="controls">
			<input type="text" name="ccnumber" id="ccnumber" autocomplete="off" class="span3"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="ccexpirymonth">{$LANG.creditcardcardexpires}</label>
		<div class="controls">
			<select name="ccexpirymonth" id="ccexpirymonth">
			{foreach from=$months item=month}
				<option>{$month}</option>
			{/foreach}
			</select>
			/
			<select name="ccexpiryyear">
			{foreach from=$expiryyears item=year}
				<option>{$year}</option>
			{/foreach}
			</select>
		</div>
	</div>
{if $showccissuestart}
	<div class="control-group">
		<label class="control-label" for="ccstartmonth">{$LANG.creditcardcardstart}</label>
		<div class="controls">
			<select name="ccstartmonth" id="ccstartmonth">
			{foreach from=$months item=month}
				<option>{$month}</option>
			{/foreach}
			</select>
			/ 
			<select name="ccstartyear">
			{foreach from=$startyears item=year}
				<option>{$year}</option>
			{/foreach}
			</select>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="ccissuenum">{$LANG.creditcardcardissuenum}</label>
		<div class="controls">
			<input type="text" name="ccissuenum" id="ccissuenum" maxlength="3" class="span1"/>
		</div>
	</div>
{/if}
	<div class="control-group">
		<label class="control-label" for="cardcvv">{$LANG.creditcardcvvnumber}</label>
		<div class="controls">
			<input type="text" class="span1" name="cardcvv" id="cardcvv" value="{$cardcvv}" autocomplete="off"/>
		</div>
	</div>
	<div class="form-actions">
		<input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}"/>
		<input class="btn" type="reset" value="{$LANG.cancel}"/>
		{if $allowcustomerdelete && $cardtype}
		<a href="clientarea.php?action=creditcard&amp;delete=true" class="btn btn-danger">{$LANG.creditcarddelete}</a>
		{/if}
	</div>
</form>
{/if}
