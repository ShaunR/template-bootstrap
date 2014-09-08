<section>
	<div class="container">
		<h1>{$LANG.sslconfsslcertificate}</h1>
		
		{if $errormessage}
		<div class="alert alert-danger">
			<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
			<ul>
				{$errormessage}
			</ul>
		</div>
		{/if}
		
		<div class="page-header">
			<h2>{$LANG.sslcertinfo}</h2>
		</div>
		
		<ul class="thumbnails">
			<li class="col-md-6">
				<h4>{$LANG.sslcerttype}:</h4>
				{$certtype}
			</li>
			<li class="col-md-6">
				<h4>{$LANG.sslorderdate}:</h4>
				{$date}
			</li>
			{if $domain}
			<li class="col-md-6">
				<h4>{$LANG.domainname}:</h4>
				{$domain}
			</li>
			{/if}
			<li class="col-md-6">
				<h4>{$LANG.orderprice}:</h4>
				{$price}
			</li>
			<li class="col-md-6">
				<h4>{$LANG.sslstatus}:</h4>
				{$status}
			</li>
			{foreach from=$displaydata key=displaydataname item=displaydatavalue}
			<li class="col-md-6">
				<h4>{$displaydataname}:</h4>
				{$displaydatavalue}
			</li>
			{/foreach}
		</ul>
		
		<div class="page-header">
			<h2>{$LANG.sslcertapproveremail}</h2>
		</div>
		
		<p>{$LANG.sslcertapproveremaildetails}</p>
		
		<form class="form-horizontal" method="post" action="{$smarty.server.PHP_SELF}?cert={$cert}&step=3">
			<div class="control-group">
				<label class="control-label" for="servertype">{$LANG.sslcertapproveremail}</label>
				<div class="controls">
					{foreach from=$approveremails item=approveremail key=num}
					<label class="radio"><input type="radio" name="approveremail" value="{$approveremail}"{if $num eq 0} checked="checked"{/if}> {$approveremail}</label>
					{/foreach}
				</div>
			</div>
			
			<div class="form-actions">
				<input type="submit" value="{$LANG.ordercontinuebutton}" class="btn btn-primary">
			</div>
		</form>
	</div>
</section>
