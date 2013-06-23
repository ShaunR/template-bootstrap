<div class="page-header">
	<h1>{$LANG.knowledgebasetitle}</h1>
</div>

<p class="marginbottom breadcrumb">{$breadcrumbnav}</p>

<form method="post" action="knowledgebase.php?action=search" class="well form-horizontal text-center">
	{if $catid}<input type="hidden" name="catid" value="{$catid}" />{/if}
	<fieldset>
		<input class="span6" style="font-size:1.4em;height:30px;" name="search" type="text" value="" placeholder="{$LANG.kbquestionsearchere}"/>
		<input type="submit" class="btn btn-large btn-primary" value="{$LANG.knowledgebasesearch}"/>
	</fieldset>
</form>

{if $kbcats}
<div class="page-header">
	<h2>{$LANG.knowledgebasecategories}</h2>
</div>

<ul class="thumbnails">
{foreach from=$kbcats item=kbcat}
	<li class="span3">
		<h4><img src="images/folder.gif" class="valignbaseline" alt="folder icon"/> <a href="{if $seofriendlyurls}knowledgebase/{$kbcat.id}/{$kbcat.urlfriendlyname}{else}knowledgebase.php?action=displaycat&amp;catid={$kbcat.id}{/if}">{$kbcat.name}</a></h4>
		<p>{$kbcat.description}</p>
	</li>
{/foreach}
</ul>
{/if}

<div class="page-header">
   <h2>{$LANG.knowledgebasearticles}</h2>
</div>

<ul class="thumbnails">
{foreach from=$kbarticles item=kbarticle}
   <li class="span12">
      <h4><img src="images/article.gif" class="valignbaseline" alt="article icon"/> <a href="{if $seofriendlyurls}knowledgebase/{$kbarticle.id}/{$kbarticle.urlfriendlytitle}.html{else}knowledgebase.php?action=displayarticle&amp;id={$kbarticle.id}{/if}">{$kbarticle.title}</a></h4>
      {$kbarticle.article|truncate:150:"..."}
   </li>
{foreachelse}
	<li class="span12">
		<p class="text-center">{$LANG.knowledgebasenoarticles}</p>
	</li>
{/foreach}
</ul>
