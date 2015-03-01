<section>
	<div class="container">
		<h1>{$LANG.navopenticket}</h1>
		
		{if $errormessage}
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<h4 class="alert-header">{$LANG.clientareaerrors}</h4>
			<ul>
				{$errormessage}
			</ul>
		</div>
		{/if}
		
		<form name="submitticket" method="post" action="{$smarty.server.PHP_SELF}" enctype="multipart/form-data">
			<input type="hidden" name="step" value="3">
			<div class="row form-group">
				<div class="col-md-4">
					<label for="name">{$LANG.supportticketsclientname}</label>
					{if $loggedin}
					<input class="form-control disabled" type="text" id="name" value="{$clientname}" disabled="disabled">
					{else}
					<input class="form-control" type="text" name="name" id="name" value="{$name}">
					{/if}
				</div>
				<div class="col-md-4">
					<label for="email">{$LANG.supportticketsclientemail}</label>
					{if $loggedin}
					<input class="form-control disabled" type="text" id="email" value="{$email}" disabled="disabled">
					{else}
					<input class="form-control" type="text" name="email" id="email" value="{$email}">
					{/if}
				</div>
			</div>
			<div class="form-group">
				<label for="subject">{$LANG.supportticketsticketsubject}</label>
				<input class="form-control" type="text" name="subject" id="subject" value="{$subject}">
			</div>
			<div class="row form-group">
				<div class="col-md-3">
					<label for="name">{$LANG.supportticketsdepartment}</label>
					<select name="deptid" class="form-control" id="department" disabled onchange="getCustomFields()">
						{foreach from=$departments item=department}
						<option value="{$department.id}"{if $department.id eq $deptid} selected="selected"{/if}>{$department.name}</option>
						{/foreach}
					</select>
				</div>
				<div class="col-md-3">
					<label for="priority">{$LANG.supportticketspriority}</label>
					<select name="urgency" id="priority" class="form-control">
						<option value="High"{if $urgency eq "High"} selected="selected"{/if}>{$LANG.supportticketsticketurgencyhigh}</option>
						<option value="Medium"{if $urgency eq "Medium" || !$urgency} selected="selected"{/if}>{$LANG.supportticketsticketurgencymedium}</option>
						<option value="Low"{if $urgency eq "Low"} selected="selected"{/if}>{$LANG.supportticketsticketurgencylow}</option>
					</select>
				</div>
				{if $relatedservices}
				<div class="col-md-6">
					<label for="relatedservice">{$LANG.relatedservice}</label>
					<select name="relatedservice" id="relatedservice" class="form-control">
						<option value="">{$LANG.none}</option>
						{foreach from=$relatedservices item=relatedservice}
						<option value="{$relatedservice.id}">{$relatedservice.name} ({$relatedservice.status})</option>
						{/foreach}
					</select>
				</div>
				{/if}
			</div>
			<div class="form-group">
				<label for="message">{$LANG.contactmessage}</label>
				<textarea name="message" id="message" rows="12" class="form-control">{$message}</textarea>
			</div>
			<div id="customFields" style="display:none;"></div>
			<div id="attachments">
				<h4>{$LANG.supportticketsticketattachments}</h4>
				<div class="form-group">
					<input type="file" name="attachments[]">
				</div>
			</div>
			<script type="text/javascript">
			{literal}
			function extraAttachment() { $("#attachments").append('<div class="form-group"><input type="file" name="attachments[]"></div>');}
			{/literal}
			</script>
			<a href="javascript:void(0)" onclick="extraAttachment();"><img src="images/add.gif" alt="add icon"> {$LANG.addmore}</a>
			({$LANG.supportticketsallowedextensions}: {$allowedfiletypes})
		
			<div id="searchresults" style="display:none;"></div>
		
			{if $capatacha}
			<h4>{$LANG.captchatitle}</h4>
			<p>{$LANG.captchaverify}</p>
			{if $capatacha eq "recaptcha"}
			{$recapatchahtml}
			{else}
			<fieldset class="form-inline form-group">
				<div class="form-group">
					<input type="text" name="code" class="form-control" maxlength="5">
				</div>
				<img src="includes/verifyimage.php" alt="captcha">
			</fieldset>
			{/if}
			{/if}
		
			<div class="form-group">
				<input class="btn btn-primary" type="submit" name="save" value="{$LANG.supportticketsticketsubmit}" onclick="$('#modalpleasewait').modal();">
				<button class="btn btn-default" type="reset">{$LANG.cancel}</button>
			</div>
		
		</form>
		
		<div class="modal hide fade in" id="modalpleasewait">
			<div class="modal-header text-center">
				<img src="images/loadingsml.gif" style="vertical-align:baseline">
				<span class="lead">{$LANG.pleasewait}</span>
			</div>
		</div>

		{if $kbsuggestions}
		{literal}
		<script language="javascript">
			var currentcheckcontent,lastcheckcontent;
			function getticketsuggestions() {
				currentcheckcontent = jQuery("#message").val();
				if (currentcheckcontent!=lastcheckcontent && currentcheckcontent!="") {
					jQuery.post("submitticket.php", { action: "getkbarticles", text: currentcheckcontent }, function(data) {
						if (data) {
							jQuery("#searchresults").html(data);
							jQuery("#searchresults").slideDown();
						}
					});
					lastcheckcontent = currentcheckcontent;
				}
				setTimeout('getticketsuggestions();', 3000);
			}
			getticketsuggestions();
		</script>
		{/literal}
		{/if}

		{literal}
		<script language="javascript">
			$( document ).ready(function() { getCustomFields(); });
			function getCustomFields() {
				jQuery("#department").prop('disabled', true);
				jQuery("#customFields").load("submitticket.php", { action: "getcustomfields", deptid: jQuery("#department").val() });
				jQuery("#customFields").slideDown();
				jQuery("#department").prop('disabled', false);
			}
		</script>
		{/literal}
	</div>
</section>
