		<hr>
		
		<h3>{$LANG.kbsuggestions}</h3>
		
		<p>{$LANG.kbsuggestionsexplanation}</p>
		
		<ul class="list-unstyled">
		{foreach from=$kbarticles item=kbarticle}
			<li><img src="images/article.gif" alt="article icon"> <a href="knowledgebase.php?action=displayarticle&id={$kbarticle.id}" target="_blank">{$kbarticle.title}</a> - {$kbarticle.article}...</li>
		{/foreach}
		</ul>
