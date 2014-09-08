<section>
	<div class="container">		
		<form class="form-inline well well-sm pull-right margin-top" action="downloads.php" method="post">
			<input type="hidden" name="action" value="search">
			<div class="form-group">
				<input type="text" name="search" class="form-control" value="{if $q}{$q}{/if}" placeholder="{$LANG.downloadssearch}">
			</div>
			<button type="submit" class="btn btn-success">{$LANG.searchfilter}</button>
		</form>
		
		<h1>{$LANG.downloadstitle}</h1>
		
		<p>{$LANG.downloadsintrotext}</p>
		
		<div class="clearfix">
		{if $dlcats}
			<h2>{$LANG.downloadscategories}</h2>
			<hr>
		
			<ul class="list-unstyled list-inline">
		{foreach from=$dlcats item=dlcat}
				<li class="col-md-3">
					<h3><img src="images/folder.gif" style="vertical-align:baseline" alt="folder icon"> <a href="{if $seofriendlyurls}downloads/{$dlcat.id}/{$dlcat.urlfriendlyname}{else}downloads.php?action=displaycat&amp;catid={$dlcat.id}{/if}">{$dlcat.name}</a> <small>( {$dlcat.numarticles} )</small></h3>
					<p>{$dlcat.description}</p>
				</li>
		{/foreach}
			</ul>
		{/if}
		</div>
		
		<h2>{$LANG.downloadsfiles}</h2>
		
		<div class="clearfix">
			<ul class="list-unstyled">
				{foreach from=$downloads item=download}
				<li>
					<h4>{$download.type} <a href="{$download.link}">{$download.title}{if $download.clientsonly} <img src="images/padlock.gif" alt="{$LANG.loginrequired}">{/if}</a></h4>
					<div>{$download.description}</div>
					<small>{$LANG.downloadsfilesize}: {$download.filesize}</small>
				</li>
				{foreachelse}
				<li>
					<p class="text-center">{$LANG.downloadsnone}</p>
				</li>
				{/foreach}
			</ul>
		</div>
	</div>
</section>
