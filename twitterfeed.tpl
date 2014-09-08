		<ul class="list-unstyled">
		{foreach from=$tweets item=tweet key=num}
			{if $num < $numtweets}
			<li>
				<i class="glyphicon32 icon32-twitter pull-left"></i>
				<h4>{$tweet.date}</h4>
				<p>{$tweet.tweet}</p>
			</li>
			{/if}
		{/foreach}
		</ul>
		<div class="text-center margin-bottom">
		<a href="https://twitter.com/{$twitterusername}" class="twitter-follow-button" data-show-count="false" data-size="large">Follow @{$twitterusername}</a>
		{literal}<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>{/literal}
		</div>
