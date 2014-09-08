<section>
	<div class="container">
		<h1>{$LANG.knowledgebasetitle}</h1>

		<p class="breadcrumb">{$breadcrumbnav}</p>
		
		<form method="post" action="knowledgebase.php?action=search" class="well">
			{if $catid}<input type="hidden" name="catid" value="{$catid}" />{/if}
			<div class="row">
				<div class="col-md-10">
					<input class="form-control input-lg" name="search" type="text" value="" placeholder="{$LANG.kbquestionsearchere}">
				</div>
				<div class="col-md-2">
					<input type="submit" class="btn btn-lg btn-primary" value="{$LANG.knowledgebasesearch}">
				</div>
			</div>
		</form>
		
		{if $kbcats}
		<div class="page-header">
			<h2>{$LANG.knowledgebasecategories}</h2>
		</div>
		
		<div class="clearfix">
			<ul class="list-unstyled list-inline">
				{foreach from=$kbcats item=kbcat}
				<li class="col-md-3">
					<h4><img src="images/folder.gif" style="vertical-align:baseline" alt="folder icon"> <a href="{if $seofriendlyurls}knowledgebase/{$kbcat.id}/{$kbcat.urlfriendlyname}{else}knowledgebase.php?action=displaycat&amp;catid={$kbcat.id}{/if}">{$kbcat.name}</a></h4>
					<p>{$kbcat.description}</p>
				</li>
				{/foreach}
			</ul>
		</div>
		{/if}
		
		<div class="page-header">
		   <h2>{$LANG.knowledgebasearticles}</h2>
		</div>
		
		<ul class="list-unstyled">
			{foreach from=$kbarticles item=kbarticle}
		   <li>
		      <h4><img src="images/article.gif" style="vertical-align:baseline" alt="article icon"> <a href="{if $seofriendlyurls}knowledgebase/{$kbarticle.id}/{$kbarticle.urlfriendlytitle}.html{else}knowledgebase.php?action=displayarticle&amp;id={$kbarticle.id}{/if}">{$kbarticle.title}</a></h4>
		      {$kbarticle.article|truncate:150:"..."}
		   </li>
			{foreachelse}
			<li>
				<p class="text-center">{$LANG.knowledgebasenoarticles}</p>
			</li>
			{/foreach}
		</ul>
	</div>
</section>
