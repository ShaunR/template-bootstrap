{if $condlinks.domainreg || $condlinks.domaintrans || $condlinks.domainown}
<div class="well">
	<h1 class="marginbottom">{$LANG.domaincheckerchoosedomain}</h1>
	<p class="marginbottom">{$LANG.domaincheckerenterdomain}</p>
	<div class="text-center">
		<form method="post" action="domainchecker.php">
			<input class="span7 marginbottom" style="font-size:1.4em;height:30px;" name="domain" type="text" value="" placeholder="{$LANG.domaincheckerdomainexample}"/>
	{if $capatacha}
			<div class="borderradius text-center marginbottom" style="width:50%;margin-left:auto;margin-right:auto;border:1px dashed #cccccc;padding:10px;">
				<p>{$LANG.captchaverify}</p>
		{if $capatacha eq "recaptcha"}<p>{$recapatchahtml}</p>
		{else}<img src="includes/verifyimage.php" alt="captcha"/> <input type="text" name="code" class="span1" style="margin-bottom:0" maxlength="5"/>{/if}
			</div>
	{/if}
			<div>
				{if $condlinks.domainreg}<input type="submit" value="{$LANG.checkavailability}" class="btn btn-primary btn-large"/>{/if} 
				{if $condlinks.domaintrans}<input type="submit" name="transfer" value="{$LANG.domainstransfer}" class="btn btn-success btn-large"/>{/if} 
				{if $condlinks.domainown}<input type="submit" name="hosting" value="{$LANG.domaincheckerhostingonly}" class="btn btn-large"/>{/if} 
			</div>
		</form>
	</div>
</div>
{/if}

<div class="row marginbottom">
	<div class="span6">
		<h2>{$LANG.navservicesorder}</h2>
		<p>{$LANG.clientareahomeorder}</p>
		<div class="text-center">
			<a href="cart.php" title="{$LANG.clientareahomeorderbtn}" class="btn">{$LANG.clientareahomeorderbtn} <i class="icon icon-shopping-cart"></i></a>
		</div>
	</div>
	<div class="span6">
		<h2>{$LANG.manageyouraccount}</h2>
		<p>{$LANG.clientareahomelogin}</p>
		<div class="text-center">
			<a href="clientarea.php" title="{$LANG.clientareahomeloginbtn}" class="btn">{$LANG.clientareahomeloginbtn} <i class="icon icon-lock"></i></a>
		</div>
	</div>
</div>

{if $twitterusername}
<div class="page-header">
<h2>{$LANG.twitterlatesttweets}</h2>
</div>
<div id="twitterfeed">
	<p><img src="images/loading.gif"/></p>
</div>
{literal}
<script language="javascript">
	jQuery(document).ready(function(){jQuery.post("announcements.php",{action:"twitterfeed",numtweets:3},function(data){jQuery("#twitterfeed").html(data);});});
</script>
{/literal}
{elseif $announcements}
<h2>{$LANG.latestannouncements}</h2>
	{foreach from=$announcements item=announcement}<p>{$announcement.date} - <a href="{if $seofriendlyurls}announcements/{$announcement.id}/{$announcement.urlfriendlytitle}.html{else}announcements.php?id={$announcement.id}{/if}"><b>{$announcement.title}</b></a><br/>{$announcement.text|strip_tags|truncate:100:"..."}</p>{/foreach}
{/if}