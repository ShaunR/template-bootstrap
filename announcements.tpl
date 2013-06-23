<div class="page-header">
	<h1>{$LANG.announcementstitle}</h1>
</div>

{foreach key=num item=announcement from=$announcements}
<div class="marginbottom">
	<h4><a href="{if $seofriendlyurls}announcements/{$announcement.id}/{$announcement.urlfriendlytitle}.html{else}{$smarty.server.PHP_SELF}?id={$announcement.id}{/if}">{$announcement.title}</a></h4>
	<p>{$announcement.timestamp|date_format:"%A, %B %e, %Y"}</p>
	<blockquote>
		<p>{$announcement.text|strip_tags|truncate:400:"..."}</p>
{if strlen($announcement.text)>400}
		<small><a href="{if $seofriendlyurls}announcements/{$announcement.id}/{$announcement.urlfriendlytitle}.html{else}{$smarty.server.PHP_SELF}?id={$announcement.id}{/if}">{$LANG.more} &raquo;</a></small>
{/if}
	</blockquote>

{if $facebookrecommend}
	{literal}
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {return;}
			js = d.createElement(s); js.id = id;
			js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	{/literal}
	<div class="fb-like" data-href="{$systemurl}{if $seofriendlyurls}announcements/{$announcement.id}/{$announcement.urlfriendlytitle}.html{else}announcements.php?id={$announcement.id}{/if}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
{/if}
</div>
<hr/>
{foreachelse}
	<p class="text-center marginbottom"><strong>{$LANG.announcementsnone}</strong></p>
{/foreach}

<div class="pull-left"><img src="images/rssfeed.gif" alt="{$LANG.announcementsrss}" class="valigntop"/> <a href="announcementsrss.php">{$LANG.announcementsrss}</a></div>

<div class="pagination pagination-right">
   <ul>
      <li{if !$prevpage} class="disabled"{/if}>
			<a href="{if $prevpage}{$smarty.server.PHP_SELF}?page={$prevpage}{else}javascript:return false;{/if}" title="{$LANG.previouspage}">&larr; {$LANG.previouspage}</a>
      </li>
      <li{if !$nextpage} class="disabled"{/if}>
			<a href="{if $nextpage}{$smarty.server.PHP_SELF}?page={$nextpage}{else}javascript:return false;{/if}" title="{$LANG.nextpage}">{$LANG.nextpage} &rarr;</a>
      </li>
   </ul>
</div>
