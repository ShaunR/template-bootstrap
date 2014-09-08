<section>
	<div class="container">
		<h1>{$LANG.knowledgebasetitle}</h1>
		
		<form method="post" action="knowledgebase.php?action=search" class="well">
			<div class="row">
				<div class="col-md-10">
					<input class="input-lg form-control" name="search" type="text" value="" placeholder="{$LANG.kbquestionsearchere}">
				</div>
				<div class="col-md-2 text-left">
					<button type="submit" class="btn btn-lg btn-primary">{$LANG.knowledgebasesearch}</button>
				</div>
			</div>
		</form>
		
		<div class="page-header">
			<h2>{$LANG.knowledgebasecategories}</h2>
		</div>
		
		<div class="clearfix">
			<ul class="list-unstyled list-inline">
				{foreach from=$kbcats item=kbcat}
				<li class="col-md-3">
					<h4><img src="images/folder.gif" style="vertical-align:baseline" alt="folder icon"> <a href="{if $seofriendlyurls}knowledgebase/{$kbcat.id}/{$kbcat.urlfriendlyname}{else}knowledgebase.php?action=displaycat&amp;catid={$kbcat.id}{/if}">{$kbcat.name}</a> <small>( {$kbcat.numarticles} )</small></h4>
					<p>{$kbcat.description}</p>
				</li>
				{/foreach}
			</ul>
		</div>
		
		<div class="page-header">
			<h2>{$LANG.knowledgebasepopular}</h2>
		</div>
		
		<ul class="list-unstyled">
		{foreach from=$kbmostviews item=kbarticle}
			<li>
				<h4><img src="images/article.gif" style="vertical-align:baseline" alt="article icon"> <a href="{if $seofriendlyurls}knowledgebase/{$kbarticle.id}/{$kbarticle.urlfriendlytitle}.html{else}knowledgebase.php?action=displayarticle&amp;id={$kbarticle.id}{/if}">{$kbarticle.title}</a></h4>
				<p>{$kbarticle.article|truncate:150:"..."}</p>
			</li>
		{/foreach}
		</ul>
	</div>
</section>
