<section>
	<div class="container">
		{if $condlinks.domainreg || $condlinks.domaintrans || $condlinks.domainown}
		<div class="well text-center margin-top">
			<h1>{$LANG.domaincheckerchoosedomain}</h1>
			<p>{$LANG.domaincheckerenterdomain}</p>
			<form method="post" action="domainchecker.php">
				<div class="row form-group">
					<div class="col-md-10 col-md-offset-1">
						<input class="form-control input-lg" name="domain" type="text" value="" placeholder="{$LANG.domaincheckerdomainexample}">
					</div>
				</div>
			{if $capatacha}
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<div class="panel panel-default">
							<div class="panel-body">
								<p><small>{$LANG.captchaverify}</small></p>
						{if $capatacha eq "recaptcha"}
								<p>{$recapatchahtml}</p>
						{else}
								<div class="col-md-3 col-md-offset-3">
									<input type="text" name="code" class="form-control input-sm" maxlength="5">
								</div>
								<div class="col-md-6 text-left">
									<img src="includes/verifyimage.php" alt="captcha" style="margin-bottom: 20px;">
								</div>
						{/if}
							</div>
						</div>
					</div>
				</div>
			{/if}
				<div>
					{if $condlinks.domainreg}<input type="submit" value="{$LANG.checkavailability}" class="btn btn-primary btn-lg">{/if} 
					{if $condlinks.domaintrans}<input type="submit" name="transfer" value="{$LANG.domainstransfer}" class="btn btn-success btn-lg">{/if} 
					{if $condlinks.domainown}<input type="submit" name="hosting" value="{$LANG.domaincheckerhostingonly}" class="btn btn-default btn-lg">{/if} 
				</div>
			</form>
		</div>
		{/if}
		
		<div class="row">
			<div class="col-md-6">
				<h2>{$LANG.navservicesorder}</h2>
				<p>{$LANG.clientareahomeorder}</p>
				<div class="text-right">
					<a href="cart.php" title="{$LANG.clientareahomeorderbtn}" class="btn btn-primary">{$LANG.clientareahomeorderbtn}</a>
				</div>
			</div>
			<div class="col-md-6">
				<h2>{$LANG.manageyouraccount}</h2>
				<p>{$LANG.clientareahomelogin}</p>
				<div class="text-right">
					<a href="clientarea.php" title="{$LANG.clientareahomeloginbtn}" class="btn btn-primary">{$LANG.clientareahomeloginbtn}</a>
				</div>
			</div>
		</div>
		
		{if $twitterusername}
		<div class="page-header">
			<h2>{$LANG.twitterlatesttweets}</h2>
		</div>
		<div id="twitterfeed">
			<p><img src="images/loading.gif" alt="loading..."></p>
		</div>
		{literal}
		<script type="text/javascript">
			jQuery(document).ready(function(){jQuery.post("announcements.php",{action:"twitterfeed",numtweets:3},function(data){jQuery("#twitterfeed").html(data);});});
		</script>
		{/literal}
		{elseif $announcements}
		<h2>{$LANG.latestannouncements}</h2>
			{foreach from=$announcements item=announcement}
		<p>{$announcement.date} - <a href="{if $seofriendlyurls}announcements/{$announcement.id}/{$announcement.urlfriendlytitle}.html{else}announcements.php?id={$announcement.id}{/if}"><b>{$announcement.title}</b></a><br>{$announcement.text|strip_tags|truncate:100:"..."}</p>
			{/foreach}
		{/if}
	</div>
</section>
