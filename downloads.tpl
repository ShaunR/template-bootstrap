<section>
	<div class="container">
		<form class="form-inline well well-sm pull-right margin-top-xs" action="downloads.php" method="post">
			<input type="hidden" name="action" value="search">
			<div class="form-group">
				<input type="text" name="search" class="form-control" value="{if $q}{$q}{/if}" placeholder="{$LANG.downloadssearch}">
			</div>
			<button type="submit" class="btn btn-success">{$LANG.searchfilter}</button>
		</form>
		
		<div class="page-header">
			<h1>{$LANG.downloadstitle}</h1>
		</div>
		
		<p>{$LANG.downloadsintrotext}</p>
		
		<div class="page-header">
			<h2>{$LANG.downloadscategories}</h2>
		</div>
		
		<div class="clearfix">
			<ul class="list-unstyled list-inline">
				{foreach from=$dlcats item=dlcat}
				<li class="col-md-3">
					<h4><img src="images/folder.gif" style="vertical-align:baseline" alt="folder icon"> <a href="{if $seofriendlyurls}downloads/{$dlcat.id}/{$dlcat.urlfriendlyname}{else}downloads.php?action=displaycat&amp;catid={$dlcat.id}{/if}">{$dlcat.name}</a> <small>( {$dlcat.numarticles} )</small></h4>
					<p>{$dlcat.description}</p>
				</li>
				{/foreach}
			</ul>
		</div>
		
		<div class="page-header">
			<h2>{$LANG.downloadspopular}</h2>
		</div>
		
		<ul class="list-unstyled">
		{foreach from=$mostdownloads item=download}
			<li>
				<h4>{$download.type} <a href="{$download.link}">{$download.title}{if $download.clientsonly} <img src="images/padlock.gif" alt="{$LANG.loginrequired}">{/if}</a></h4>
				<div>{$download.description}</div>
				<small>{$LANG.downloadsfilesize}: {$download.filesize}</small>
			</li>
		{/foreach}
		</ul>
	</div>
</section>
