{if $error}
<div class="alert alert-error fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$LANG.supportticketinvalid}
</div>
{elseif $stillopen}
<div class="page-header">
	<h1>{$LANG.ticketfeedbacktitle} #{$tid}</h1>
</div>

<div class="alert alert-error">
	{$LANG.feedbackclosed}
</div>

<div class="text-center">
	<a href="clientarea.php" title="{$LANG.returnclient}" class="btn">{$LANG.returnclient}</a>
</div>
{elseif $feedbackdone}
<div class="page-header">
	<h1>{$LANG.ticketfeedbacktitle} #{$tid}</h1>
</div>

<div class="alert alert-success">
	{$LANG.feedbackprovided}
</div>

<p class="text-center">{$LANG.feedbackthankyou}</p>

<div class="text-center">
	<a href="clientarea.php" title="{$LANG.returnclient}" class="btn">{$LANG.returnclient}</a>
</div>
{elseif $success}
<div class="page-header">
	<h1>{$LANG.ticketfeedbacktitle} #{$tid}</h1>
</div>

<div class="alert alert-success">
	<h4 class="alert-heading">{$LANG.feedbackreceived}</h4>
	<p>{$LANG.feedbackthankyou}</p>
</div>

<div class="text-center">
	<a href="clientarea.php" title="{$LANG.returnclient}" class="btn">{$LANG.returnclient}</a>
</div>
{else}
<div class="page-header">
	<h1>{$LANG.ticketfeedbacktitle} #{$tid}</h1>
</div>

{if $errormessage}
<div class="alert alert-error">
	<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
	<ul>
		{$errormessage}
	</ul>
</div>
{/if}

<p>{$LANG.feedbackdesc}</p>

<div class="alert alert-warning text-center">
	<span class="lead"><a href="viewticket.php?tid={$tid}&c={$c}">{$LANG.feedbackclickreview}</a></span>
</div>

<table class="table table-bordered">
	<tr>
		<th>{$LANG.feedbackopenedat}:</th>
		<td>{$opened}</td>
	</tr>
	<tr>
		<th>{$LANG.feedbacklastreplied}:</th>
		<td>{$lastreply}</td>
	</tr>
	<tr>
		<th>{$LANG.feedbackstaffinvolved}:</th>
		<td>{foreach from=$staffinvolved item=staff name=staff}{$staff}{if !$smarty.foreach.staff.last}, {/if}{foreachelse}{$LANG.none}{/foreach}</td>
	</tr>
	<tr>
		<td>{$LANG.feedbacktotalduration}:</td>
		<td><strong>{$duration}</strong></td>
	</tr>
</table>

<form method="post" action="{$smarty.server.PHP_SELF}?tid={$tid}&c={$c}&feedback=1" class="form-inline">
	<input type="hidden" name="validate" value="true"/>
	{foreach from=$staffinvolved key=staffid item=staff}
	<div class="well well-small">
		<label>{$LANG.feedbackpleaserate1} <strong>{$staff}</strong> {$LANG.feedbackhandled}:</label>
		<select name="rate[{$staffid}]">
		{foreach from=$ratings item=rating}
			<option value="{$rating}">{$rating}{if $rating eq 1} ({$LANG.feedbackworst}){elseif $rating eq 10} ({$LANG.feedbackbest}){/if}</option>
		{/foreach}
		</select>
		<p>{$LANG.feedbackpleasecomment1} <strong>{$staff}</strong> {$LANG.feedbackhandled}.</p>
		<textarea name="comments[{$staffid}]" rows="4" class="span11">{$comments.$staffid}</textarea>
	</div>
</form>
{/foreach}

<p>{$LANG.feedbackimprove}</p>
<textarea name="comments[generic]" rows="4" style="width:80%;">{$comments.generic}</textarea>

<div class="form-actions">
	<input class="btn btn-primary" type="submit" name="save" value="{$LANG.clientareasavechanges}"/>
	<input class="btn" type="reset" value="{$LANG.cancel}"/>
</div>

</form>

{/if}
