<div class="page-header">
	<h1>{$LANG.downloadstitle}</h1>
</div>

<form class="form-inline well well-small pull-right" action="downloads.php" method="post">
	<input type="hidden" name="action" value="search"/>
	<input type="text" name="search" class="span3" value="{if $q}{$q}{/if}" placeholder="{$LANG.downloadssearch}"/>
	<button type="submit" class="btn btn-success">{$LANG.searchfilter}</button>
</form>

<p>{$LANG.downloadsintrotext}</p>

<div class="clearfix">
	<div class="page-header">
		<h2>{$LANG.downloadscategories}</h2>
	</div>
</div>

<ul class="thumbnails">
{foreach from=$dlcats item=dlcat}
	<li class="span3">
		<h3><img src="images/folder.gif" class="valignbaseline" alt="folder icon"/> <a href="{if $seofriendlyurls}downloads/{$dlcat.id}/{$dlcat.urlfriendlyname}{else}downloads.php?action=displaycat&amp;catid={$dlcat.id}{/if}">{$dlcat.name}</a> <small>( {$dlcat.numarticles} )</small></h3>
		<p>{$dlcat.description}</p>
	</li>
{/foreach}
</ul>

<div class="page-header">
	<h2>{$LANG.downloadspopular}</h2>
</div>

<ul class="thumbnails">
{foreach from=$mostdownloads item=download}
	<li class="span12">
		<h3>{$download.type} <a href="{$download.link}">{$download.title}{if $download.clientsonly} <img src="images/padlock.gif" alt="{$LANG.loginrequired}"/>{/if}</a></h3>
		<div>{$download.description}</div>
		<small>{$LANG.downloadsfilesize}: {$download.filesize}</small>
	</li>
{/foreach}
</ul>
