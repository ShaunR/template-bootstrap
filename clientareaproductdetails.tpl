<section>
	<div class="container">
		<h1>{$product}</h1>
		
		{if $modulechangepwresult eq "success"}
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$LANG.serverchangepasswordsuccessful}
		</div>
		{elseif $modulechangepwresult eq "error"}
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$modulechangepasswordmessage}
		</div>
		{elseif $modulecustombuttonresult=="success"}
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$LANG.moduleactionsuccess}
		</div>
		{elseif $modulecustombuttonresult}
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<strong>{$LANG.moduleactionfailed}:</strong> {$modulecustombuttonresult}
		</div>
		{/if}
		
		<ul class="nav nav-tabs">
			<li class="active"><a href="#tab-information" data-toggle="tab" title="{$LANG.information}">{$LANG.information}</a></li>
			{if $modulechangepassword}<li><a href="#tab-changepw" data-toggle="tab" title="{$LANG.serverchangepassword}">{$LANG.serverchangepassword}</a></li>{/if}
			{if $downloads}<li><a href="#tab-downloads" data-toggle="tab" title="{$LANG.downloadstitle}">{$LANG.downloadstitle}</a></li>{/if}
			{if $addons || $addonsavailable}<li><a href="#tab-addons" data-toggle="tab" title="{$LANG.clientareahostingaddons}">{$LANG.clientareahostingaddons}</a></li>{/if}
			{if $packagesupgrade || $configoptionsupgrade || $showcancelbutton || $modulecustombuttons}
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" title="{$LANG.productmanagementactions}">{$LANG.productmanagementactions}<b class="caret"></b></a>
				<ul class="dropdown-menu">
					{foreach from=$modulecustombuttons key=label item=command}
					<li><a href="clientarea.php?action=productdetails&amp;id={$id}&amp;modop=custom&amp;a={$command}" title="{$label}">{$label}</a></li>
					{/foreach}
					{if $packagesupgrade}<li><a href="upgrade.php?type=package&amp;id={$id}">{$LANG.upgradedowngradepackage}</a></li>{/if}
					{if $configoptionsupgrade}<li><a href="upgrade.php?type=configoptions&amp;id={$id}">{$LANG.upgradedowngradeconfigoptions}</a></li>{/if}
					{if $showcancelbutton}<li><a href="clientarea.php?action=cancel&amp;id={$id}">{$LANG.clientareacancelrequestbutton}</a></li>{/if}
				</ul>
			</li>
			{/if}
		</ul>
		
		<div class="tab-content">
			<div class="tab-pane active" id="tab-information">
				<div class="row">
					<div class="col-md-4">
						<h2>{$LANG.information}</h2>
						<p>{$LANG.clientareaproductdetailsintro}</p>
						<a href="clientarea.php?action=products" title="{$LANG.backtoserviceslist}" class="btn btn-default">{$LANG.backtoserviceslist}</a>
					</div>
					<div class="col-md-8" style="padding-top:20px">
						{if $status eq "Suspended" && $suspendreason}
						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> <strong>{$LANG.clientareasuspended}!</strong> {$suspendreason}
						</div>
						{/if}
						<div class="row">
							<div class="col-md-6">
								<h4>{$LANG.orderproduct}:</h4>
								{if $groupname}{$groupname} - {/if}{$product} <span class="label label-{$rawstatus}">{$status}</span>
								<h4>{if $type eq "hostingaccount" || $type eq "other"}{$LANG.clientareahostingdomain}{else}{$LANG.serverhostname}{/if}:</h4>
								{if $domain}
								<a href="http://{$domain}" target="_blank">{$domain}</a>
								{else}
								<div>N/A</div>
								{/if}
								{if $username}
								<h4>{$LANG.serverusername}:</h4>
								{$username}
								{/if}
								{if $dedicatedip}
								<h4>{$LANG.domainregisternsip}:</h4>
								{$dedicatedip}
								{/if}
								{if $lastupdate}
								<h4>{$LANG.clientareadiskusage}:</h4>
								{$diskusage}MB / {$disklimit}MB ({$diskpercent})
								<h4>{$LANG.clientareabwusage}:</h4>
								{$bwusage}MB / {$bwlimit}MB ({$bwpercent})
								{/if}
								{foreach from=$configurableoptions item=configoption}
								<h4>{$configoption.optionname}:</h4>
								{if $configoption.optiontype eq 3}
								{if $configoption.selectedqty}{$LANG.yes}{else}{$LANG.no}{/if}
								{elseif $configoption.optiontype eq 4}
								{$configoption.selectedqty} &times; {$configoption.selectedoption}
								{else}
								{$configoption.selectedoption}
								{/if}
								{/foreach}
								{foreach from=$productcustomfields item=customfield}
								<h4>{$customfield.name}:</h4>
								{$customfield.value}
								{/foreach}
							</div>
							<div class="col-md-6">
								<h4>{$LANG.clientareahostingregdate}:</h4>
								{$regdate}
								<h4>{$LANG.firstpaymentamount}:</h4>
								{$firstpaymentamount}
								<h4>{$LANG.recurringamount}:</h4>
								{$recurringamount}
								<h4>{$LANG.clientareahostingnextduedate}:</h4>
								{$nextduedate}
								<h4>{$LANG.orderbillingcycle}:</h4>
								{$billingcycle}
								<h4>{$LANG.orderpaymentmethod}:</h4>
								{$paymentmethod}
							</div>
						</div>
						{if $moduleclientarea}
						<hr>
						<div class="moduleoutput">{$moduleclientarea|replace:'modulebutton':'btn'}</div>
						<hr>
						{/if}
					</div>
				</div>
			</div>
		
			<div class="tab-pane" id="tab-changepw">
				<h2>{$LANG.serverchangepassword}</h2>
				<p>{$LANG.serverchangepasswordintro}</p>
				<form method="post" action="{$smarty.server.PHP_SELF}" class="form-horizontal" style="margin-top: 20px">
					<input type="hidden" name="id" value="{$id}">
					<input type="hidden" name="modulechangepassword" value="true">
					<input type="hidden" name="action" value="productdetails">
					<fieldset>
						<div class="form-group">
							<label class="col-md-2 control-label" for="password">{$LANG.newpassword}</label>
							<div class="col-md-4">
								<input type="password" name="newpw" id="password" class="form-control">
							</div>
							<div class="col-md-6">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label" for="confirmpw">{$LANG.confirmnewpassword}</label>
							<div class="col-md-4">
								<input type="password" name="confirmpw" id="confirmpw" class="form-control">
							</div>
							<div class="col-md-6">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-10 col-md-offset-2">
								<button class="btn btn-primary">{$LANG.clientareanavchangepw}</button>
								<button type="reset" class="btn btn-default">{$LANG.cancel}</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		
			<div class="tab-pane" id="tab-downloads">
				<div class="row">
					<div class="col-md-4">
						<h2>{$LANG.downloadstitle}</h2>
						<p>There are the following downloads associated with this product</p>
					</div>
					<div class="col-md-8">
						<div class="list-group" style="margin-top:18px">
							{foreach from=$downloads item=download}
							<div class="list-group-item">
								<h4 class="list-group-item-heading">{$download.title}</h4>
								<p class="list-group-item-text">{$download.description}</p>
								<a href="{$download.link}" title="{$LANG.downloadname} {$download.title}">{$LANG.downloadname}</a>
							</div>
							{/foreach}
						</div>
					</div>
				</div>
			</div>
		
			<div class="tab-pane" id="tab-addons">
				<h2>{$LANG.clientareahostingaddons}</h2>
				<p>{$LANG.yourclientareahostingaddons}</p>
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>{$LANG.clientareaaddon}</th>
							<th>{$LANG.clientareaaddonpricing}</th>
							<th>{$LANG.clientareahostingnextduedate}</th>
							<th>{$LANG.clientareastatus}</th>
						</tr>
					</thead>
					<tbody>
						{foreach key=num item=addon from=$addons}
						<tr>
							<td>{$addon.name}</td>
							<td>{$addon.pricing}</td>
							<td>{$addon.nextduedate}</td>
							<td><span class="label label-{$addon.rawstatus}">{$addon.status}</span></td>
						</tr>
						{foreachelse}
						<tr>
							<td class="text-center" colspan="4">{$LANG.clientareanoaddons}</td>
						</tr>
						{/foreach}
					</tbody>
				</table>
				{if $addonsavailable}
				<p class="text-center">
					<a class="btn btn-primary" href="cart.php?gid=addons&amp;pid={$id}">{$LANG.orderavailableaddons}</a>
				</p>
				{/if}
			</div>
		</div>
		
		{literal}
		<script type="text/javascript">
			$(function() {
				// Password Strength
				$('#password').keyup(function() {
					$(this).parent().parent().removeClass('has-warning has-error has-success');
					$(this).next().html("");
					if($(this).val().length == 0) {
						$(this).parent().next().children().html("");
						return;
					}
					var pwstrength = passwordStrength($(this).val());
					if(pwstrength > 75) {
						$(this).parent().parent().addClass("has-success");
						$(this).parent().next().children().html("{/literal}{$LANG.pwstrengthstrong}{literal}");
					} else if (pwstrength > 30) {
						$(this).parent().parent().addClass("has-warning");
						$(this).parent().next().children().html("{/literal}{$LANG.pwstrengthmoderate}{literal}");
					} else {
						$(this).parent().parent().addClass("has-error");
						$(this).parent().next().children().html("{/literal}{$LANG.pwstrengthweak}{literal}");
					}
					$('#confirmpw').keyup();
				});
				// Compare passwords
				$('#confirmpw').keyup(function() {
					$(this).parent().parent().removeClass('has-error has-success');
					$(this).next().html("");
					if($(this).val().length < 1) return;
					if($('#password').val() != $(this).val()) {
						$(this).parent().parent().addClass('has-error');
						$(this).parent().next().children().html("{/literal}{$LANG.clientareaerrorpasswordnotmatch}{literal}");
					} else {
						$(this).parent().parent().addClass('has-success');
						$(this).parent().next().children().html("");
					}
				});
			});
		</script>
		{/literal}
	</div>
</section>
