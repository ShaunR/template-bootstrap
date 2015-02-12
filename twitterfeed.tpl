
		{if $numtweets > 1}
		<ul class="media-list">
			{foreach from=$tweets item=tweet key=num}
			<li class="media">
				<div class="media-left">
					<span class="fa fa-2x fa-twitter text-primary">
				</div>
				<div class="media-body">
					{$tweet.date}<br>{$tweet.tweet}
				</div>
			</li>
			{/foreach}
		</ul>
		{/if}

		<div class="text-center margin-bottom margin-top">
			<a href="https://twitter.com/{$twitterusername}" class="twitter-follow-button" data-show-count="false" data-size="large">Follow @{$twitterusername}</a>
			{literal}<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>{/literal}
		</div>
