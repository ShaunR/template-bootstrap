<section>
	<div class="container">
		{if $error}
		<div class="alert alert-danger">{$LANG.supportticketinvalid}</div>
		{else}
		<div class="page-header">
			<h1>{$LANG.supportticketsviewticket} #{$tid}</h1>
		</div>
		
		{if $errormessage}
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
			<ul>
				{$errormessage}
			</ul>
		</div>
		{/if}
		
		<h2>{$subject}</h2>
		
		<div class="row text-center">
			<div class="col-md-3">
				<div class="well well-sm">
					<span class="lead">{$LANG.supportticketsubmitted}</span>
					<div>{$date}</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="well well-sm">
					<span class="lead">{$LANG.supportticketsdepartment}</span>
					<div>{$department}</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="well well-sm">
					<span class="lead">{$LANG.supportticketspriority}</span>
					<div>{$urgency}</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="well well-sm">
					<span class="lead">{$LANG.supportticketsstatus}</span>
					<div>{$status}</div>
				</div>
			</div>
		</div>
		
		<div class="margin-bottom">
			<a href="supporttickets.php" class="btn btn-default" title="{$LANG.clientareabacklink}">{$LANG.clientareabacklink}</a> 
			<button type="button" class="btn btn-primary" onclick="$('#replycontainer').slideToggle().removeClass('hide');">{$LANG.supportticketsreply}</button> 
			{if $showclosebutton}<a href="{$smarty.server.PHP_SELF}?tid={$tid}&amp;c={$c}&amp;closeticket=true" class="btn btn-danger" title="{$LANG.supportticketsclose}">{$LANG.supportticketsclose}</a>{/if}
		</div>
		
		<form method="post" action="{$smarty.server.PHP_SELF}" enctype="multipart/form-data" id="replycontainer" class="panel panel-default{if !$smarty.get.postreply} hide{/if}">
			<input type="hidden" name="tid" value="{$tid}">
			<input type="hidden" name="c" value="{$c}">
			<input type="hidden" name="postreply" value="true">
			<div class="panel-body">
				<div class="row form-group">
					<div class="col-md-4">
						<label for="name">{$LANG.supportticketsclientname}</label>
						{if $loggedin}
						<input class="disabled form-control" type="text" id="name" value="{$clientname}" disabled="disabled">
						{else}
						<input class="form-control" type="text" name="replyname" id="name" value="{$replyname}">
						{/if}
					</div>
					<div class="col-md-4">
						<label for="email">{$LANG.supportticketsclientemail}</label>
						{if $loggedin}
						<input class="form-control disabled" type="text" id="email" value="{$email}" disabled="disabled">
						{else}
						<input class="form-control" type="text" name="replyemail" id="email" value="{$replyemail}">
						{/if}
					</div>
				</div>
				<div class="row form-group">
					<div class="col-md-12">
						<label for="message">{$LANG.contactmessage}</label>
						<textarea name="replymessage" id="message" rows="12" class="form-control">{$replymessage}</textarea>
					</div>
				</div>
				<div id="attachements">
					<h3>Attachements</h3>
					<div class="form-group"><input type="file" name="attachments[]"></div>
				</div>
				<script type="text/javascript">
				{literal}
				function extraAttachment() { $("#attachements").append('<div class="form-group"><input type="file" name="attachments[]"></div>');}
				{/literal}
				</script>
				<a href="#" onclick="extraAttachment();return false;"><img src="images/add.gif" alt="add icon" style="vertical-align:textbottom"> {$LANG.addmore}</a>
				({$LANG.supportticketsallowedextensions}: {$allowedfiletypes})
				<div class="form-group text-center">
					<button class="btn btn-primary" onclick="$('#modalpleasewait').modal();">{$LANG.supportticketsticketsubmit}</button>
				</div>
			</div>
		</form>
		
		<div class="ticketreplys">
		{foreach from=$descreplies key=num item=reply}
			<div class="well well-sm" style="margin-bottom:0">
				<span class="pull-right">{$reply.date}</span>
				{$reply.name}
			{if $reply.admin}
				<span class="label label-primary">{$LANG.supportticketsstaff}</span>
			{elseif $reply.contactid}
				<span class="label label-info">{$LANG.supportticketscontact}</span>
			{elseif $reply.userid}
				<span class="label label-info">{$LANG.supportticketsclient}</span>
			{else}
				<span class="label label-info">{$reply.email}</span>
			{/if}
			</div>
			<div class="ticketreply clearfix">
				<p>{$reply.message}</p>
		
			{if $reply.attachments}
				<hr>
				<h4>{$LANG.supportticketsticketattachments}</h4>
				<ul class="list-unstyled">
				{foreach from=$reply.attachments key=num item=attachment}
					<li>
						<img src="images/article.gif" style="vertical-align:textbottom" alt="article"> <a href="dl.php?type={if $reply.id}ar&amp;id={$reply.id}{else}a&amp;id={$id}{/if}&amp;i={$num}">{$attachment}</a>
					</li>
				{/foreach}
				</ul>
			{/if}
		
			{if $reply.id && $reply.admin && $ratingenabled}
				<div class="pull-right">
				{if $reply.rating}
					{$LANG.ticketreatinggiven}
					<span class="rating">
					{foreach from=$ratings item=rating}
						<span{if $reply.rating gte $rating} class="selected"{/if}></span>
					{/foreach}
					</span>
				{else}
					{$LANG.ticketratingquestion}
					<span class="rating interactive">
					{foreach from=$ratings item=rating}
						<span><a href="viewticket.php?tid={$tid}&amp;c={$c}&amp;rating=rate{$reply.id}_{$rating}" title="{$rating}"></a></span>
					{/foreach}
					</span>
				{/if}
				</div>
			{/if}
			</div>
		{/foreach}
		</div>
		
		<div class="modal fade" id="modalpleasewait">
			<div class="modal-dialog">
				<div class="modal-content">
				   <div class="modal-header text-center">
				      <h3><img src="images/loadingsml.gif" alt="{$LANG.pleasewait}" style="vertical-align:baseline"> {$LANG.pleasewait}</h3>
				   </div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
		{literal}
		$(function() { 
			$('.rating.interactive').mouseleave(function() {
				$(this).children().removeClass('selected');
			});
			$('.rating.interactive span').mouseover(function() {
				$(this).addClass('selected');
				$(this).prevAll().addClass('selected');
				$(this).nextAll().removeClass('selected');
			});
		});
		{/literal}
		</script>
		
		{/if}
	</div>
</section>
