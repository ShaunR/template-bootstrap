<div class="page-header">
	<h1>{$LANG.navopenticket}</h1>
</div>

{if $errormessage}
<div class="alert alert-error fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	<h4 class="alert-header">{$LANG.clientareaerrors}</h4>
	<ul>
		{$errormessage}
	</ul>
</div>
{/if}

<form name="submitticket" method="post" action="{$smarty.server.PHP_SELF}" enctype="multipart/form-data">
	<input type="hidden" name="step" value="3"/>
	<div class="row">
		<div class="span4">
			<label for="name">{$LANG.supportticketsclientname}</label>
			{if $loggedin}<input class="span4 disabled" type="text" id="name" value="{$clientname}" disabled="disabled"/>
			{else}<input class="span4" type="text" name="name" id="name" value="{$name}"/>{/if}
		</div>
		<div class="span4">
			<label for="email">{$LANG.supportticketsclientemail}</label>
			{if $loggedin}<input class="span4 disabled" type="text" id="email" value="{$email}" disabled="disabled"/>
			{else}<input class="span4" type="text" name="email" id="email" value="{$email}"/>{/if}
		</div>
	</div>
	<label for="subject">{$LANG.supportticketsticketsubject}</label>
	<input class="span12" type="text" name="subject" id="subject" value="{$subject}"/>
	<div class="row">
		<div class="span3">
			<label for="name">{$LANG.supportticketsdepartment}</label>
			<select name="deptid" class="span3">
			{foreach from=$departments item=department}<option value="{$department.id}"{if $department.id eq $deptid} selected="selected"{/if}>{$department.name}</option>{/foreach}
			</select>
		</div>
		<div class="span3">
			<label for="priority">{$LANG.supportticketspriority}</label>
			<select name="urgency" id="priority" class="span3">
				<option value="High"{if $urgency eq "High"} selected="selected"{/if}>{$LANG.supportticketsticketurgencyhigh}</option>
				<option value="Medium"{if $urgency eq "Medium" || !$urgency} selected="selected"{/if}>{$LANG.supportticketsticketurgencymedium}</option>
				<option value="Low"{if $urgency eq "Low"} selected="selected"{/if}>{$LANG.supportticketsticketurgencylow}</option>
			</select>
		</div>
{if $relatedservices}
		<div class="span6">
			<label for="relatedservice">{$LANG.relatedservice}</label>
			<select name="relatedservice" id="relatedservice" class="span6">
				<option value="">{$LANG.none}</option>
			{foreach from=$relatedservices item=relatedservice}
				<option value="{$relatedservice.id}">{$relatedservice.name} ({$relatedservice.status})</option>
			{/foreach}
			</select>
		</div>
{/if}
	</div>
	<label for="message">{$LANG.contactmessage}</label>
	<textarea name="message" id="message" rows="12" class="span12">{$message}</textarea>
{foreach key=num item=customfield from=$customfields}
	<label for="customfield{$customfield.id}">{$customfield.name}</label>
	{$customfield.input} {$customfield.description}
{/foreach}
	<div id="attachements">
		<h3>Attachements</h3>
		<input type="file" name="attachments[]"/>
	</div>
	<script type="text/javascript">
	{literal}
	function extraAttachment() { $("#attachements").append('<div><input type="file" name="attachments[]"></div>');}
	{/literal}
	</script>
	<a href="#" onclick="extraAttachment();return false;"><img src="images/add.gif" alt="add icon"/> {$LANG.addmore}</a>
	({$LANG.supportticketsallowedextensions}: {$allowedfiletypes})

	<div id="searchresults" class="hide" ></div>

{if $capatacha}
	<h3>{$LANG.captchatitle}</h3>
	<p>{$LANG.captchaverify}</p>
	<div class="text-center">
	{if $capatacha eq "recaptcha"}{$recapatchahtml}
	{else}<img src="includes/verifyimage.php" alt="captcha"/> <input type="text" name="code" class="span2" maxlength="5"/>{/if}
{/if}

	<div class="form-actions">
	    <input class="btn btn-primary" type="submit" name="save" value="{$LANG.supportticketsticketsubmit}" onclick="$('#modalpleasewait').modal();"/>
	    <input class="btn" type="reset" value="{$LANG.cancel}"/>
	</div>

</form>

<div class="modal hide fade in" id="modalpleasewait">
	<div class="modal-header text-center">
		<h3><img src="images/loadingsml.gif" class="valignbaseline"/> {$LANG.pleasewait}</h3>
	</div>
</div>

{if $kbsuggestions}
<script type="text/javascript">
{literal}
	var currentcheckcontent, lastcheckcontent;
	setTimeout(function() {
		currentcheckcontent = $("#message").val();
		if (currentcheckcontent!=lastcheckcontent && currentcheckcontent!="") {
			$.post(
				"submitticket.php",
				{ action: "getkbarticles", text: currentcheckcontent },
				function(data){
					if (data) {
						$("#searchresults").html(data);
						$("#searchresults").slideDown();
					}
				}
			);
			lastcheckcontent = currentcheckcontent;
		}
	}, 3000);
{/literal}
</script>
{/if}