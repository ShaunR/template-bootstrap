<section>
	<div class="container">
		<h1>{$title}</h1>
		<p><strong>{$timestamp|date_format:"%A, %B %e, %Y"}</strong></p>
		<hr>

		{$text}


		<div class="well">
			<div class="row">
			{if $twittertweet}
				<div class="col-md-3 text-center">
					<div class="tweetbutton" style="display:inline-block;"><a href="https://twitter.com/share" class="twitter-share-button" data-via="{$twitterusername}">Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script></div>
				</div>
			{/if}
			{if $facebookrecommend}
				<div class="col-md-6 text-center">
					{literal}<script>(function(d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (d.getElementById(id)) return; js = d.createElement(s); js.id = id; js.src = "//connect.facebook.net/en_US/all.js#xfbml=1"; fjs.parentNode.insertBefore(js, fjs); }(document, 'script', 'facebook-jssdk'));</script>{/literal}
					<div class="fb-like" data-href="{$systemurl}{if $seofriendlyurls}announcements/{$id}/{$urlfriendlytitle}.html{else}announcements.php?id={$id}{/if}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
				</div>
			{/if}
			{if $googleplus1}
				<div class="col-md-3 text-center">
					<g:plusone annotation="inline"></g:plusone>
					{literal}<script type="text/javascript">(function() { var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true; po.src = 'https://apis.google.com/js/plusone.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s); })();</script>{/literal}
				</div>
			{/if}
			</div>
		</div>

		{if $facebookcomments}
		<div class="margin-bottom">
			<div id="fb-root"></div>
			{literal}<script>(function(d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (d.getElementById(id)) {return;} js = d.createElement(s); js.id = id; js.src = "//connect.facebook.net/en_US/all.js#xfbml=1"; fjs.parentNode.insertBefore(js, fjs); }(document, 'script', 'facebook-jssdk'));</script>{/literal}
			<fb:comments href="{$systemurl}{if $seofriendlyurls}announcements/{$id}/{$urlfriendlytitle}.html{else}announcements.php?id={$id}{/if}" num_posts="5" width="500"></fb:comments>
		</div>
		{/if}

		<p class="text-center"><a href="announcements.php" title="{$LANG.clientareabacklink}" class="btn btn-default">{$LANG.clientareabacklink}</a></p>
	</div>
</section>
