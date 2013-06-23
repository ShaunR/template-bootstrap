<div class="page-header">
	<h1>{$product}</h1>
</div>

{if $modulechangepwresult eq "success"}
<div class="alert alert-success fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$LANG.serverchangepasswordsuccessful}
</div>
{elseif $modulechangepwresult eq "error"}
<div class="alert alert-error fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$modulechangepasswordmessage}
</div>
{elseif $modulecustombuttonresult=="success"}
<div class="alert alert-success fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$LANG.moduleactionsuccess}
</div>
{elseif $modulecustombuttonresult}
<div class="alert alert-error fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	<strong>{$LANG.moduleactionfailed}:</strong> {$modulecustombuttonresult}
</div>
{/if}

<div class="tabbable">
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
				<div class="span4">
					<h2>{$LANG.information}</h2>
					<p>{$LANG.clientareaproductdetailsintro}</p>
					<a href="clientarea.php?action=products" title="{$LANG.backtoserviceslist}" class="btn">{$LANG.backtoserviceslist}</a>
				</div>
				<div class="span8">
					<ul class="thumbnails">
						<li class="span8">
							<h4>{$LANG.orderproduct}:</h4>
							{if $groupname}{$groupname} - {/if}{$product} <span class="label label-{$rawstatus}">{$status}</span>{if $domain}<div><a href="http://{$domain}" target="_blank">{$domain}</a></div>{/if}
						</li>
{if $username}
						<li class="span4">
							<h4>{$LANG.serverusername}:</h4>
							{$username}
						</li>
{/if}
{if $dedicatedip}
						<li class="span4">
							<h4>{$LANG.domainregisternsip}:</h4>
							{$dedicatedip}
						</li>
{/if}
						<li class="span4">
							<h4>{$LANG.firstpaymentamount}:</h4>
							{$firstpaymentamount}
						</li>
						<li class="span4">
							<h4>{$LANG.clientareahostingregdate}:</h4>
							{$regdate}
						</li>
						<li class="span4">
							<h4>{$LANG.recurringamount}:</h4>
							{$recurringamount}
						</li>
						<li class="span4">
							<h4>{$LANG.clientareahostingnextduedate}:</h4>
							{$nextduedate}
						</li>
						<li class="span4">
							<h4>{$LANG.orderbillingcycle}:</h4>
							{$billingcycle}
						</li>
						<li class="span4">
							<h4>{$LANG.orderpaymentmethod}:</h4>
							{$paymentmethod}
						</li>
{if $lastupdate}
						<li class="span4">
							<h4>{$LANG.clientareadiskusage}:</h4>
							{$diskusage}MB / {$disklimit}MB ({$diskpercent})
						</li>
						<li class="span4">
							<h4>{$LANG.clientareabwusage}:</h4>
							{$bwusage}MB / {$bwlimit}MB ({$bwpercent})
						</li>
{/if}
{foreach from=$configurableoptions item=configoption}
						<li class="span4">
							<h4>{$configoption.optionname}:</h4>
							{if $configoption.optiontype eq 3}{if $configoption.selectedqty}{$LANG.yes}{else}{$LANG.no}{/if}{elseif $configoption.optiontype eq 4}{$configoption.selectedqty} x {$configoption.selectedoption}{else}{$configoption.selectedoption}{/if}
						</li>
{/foreach}
{foreach from=$productcustomfields item=customfield}
						<li class="span4">
							<h4>{$customfield.name}:</h4>
							{$customfield.value}
						</li>
{/foreach}
{if $suspendreason}
						<li class="span8">
							<h4>{$LANG.suspendreason}:</h4>
							{$suspendreason}
						</li>
{/if}
					</ul>
{if $moduleclientarea}
					<hr/>
					<div class="moduleoutput">{$moduleclientarea|replace:'modulebutton':'btn'}</div>
					<hr/>
{/if}
				</div>
			</div>
		</div>

		<div class="tab-pane" id="tab-changepw">
			<div class="row">
				<div class="span4">
					<h2>{$LANG.serverchangepassword}</h2>
					<p>{$LANG.serverchangepasswordintro}</p>
				</div>
				<div class="span8">
					<form method="post" action="{$smarty.server.PHP_SELF}" class="form-horizontal">
						<input type="hidden" name="id" value="{$id}"/>
						<input type="hidden" name="modulechangepassword" value="true"/>
						<fieldset>
							<input type="hidden" name="action" value="productdetails"/>
							<div class="control-group">
								<label class="control-label" for="password">{$LANG.newpassword}</label>
								<div class="controls">
									<input type="password" name="newpw" id="password"/>
									<span class="help-inline"></span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="confirmpw">{$LANG.confirmnewpassword}</label>
								<div class="controls">
									<input type="password" name="confirmpw" id="confirmpw" class=""/>
									<span class="help-inline"></span>
								</div>
							</div>
							<div class="form-actions">
								<button class="btn btn-primary">{$LANG.clientareasavechanges}</button>
								<button type="reset">{$LANG.cancel}</button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>

		<div class="tab-pane" id="tab-downloads">
			<div class="row">
				<div class="span4">
					<h2>{$LANG.downloadstitle}</h2>
					<p>There are the following downloads associated with this product</p>
				</div>
				<div class="span8">
					<ul class="thumbnails">
{foreach from=$downloads item=download}
						<li class="span8">
							<h4>{$download.title} - <a href="{$download.link}" title="{$LANG.downloadname} {$download.title}">{$LANG.downloadname}</a></h4>
							<p>{$download.description}</p>
						</li>
{/foreach}
					</ul>
				</div>
			</div>
		</div>

		<div class="tab-pane" id="tab-addons">
			<div class="row">
				<div class="span4">
					<h2>{$LANG.clientareahostingaddons}</h2>
					<p>{$LANG.yourclientareahostingaddons}</p>
					{if $addonsavailable}<p><a class="btn" href="cart.php?gid=addons&amp;pid={$id}">{$LANG.orderavailableaddons}</a></p>{/if}
				</div>
				<div class="span8">
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
				</div>
			</div>
		</div>

	</div>
</div>

{literal}
<script type="text/javascript">
	$(function() {
		// Password Strength
		$('#password').keyup(function() {
			$(this).parent().parent().removeClass('warning error success');
			$(this).next().html("");
			if($(this).val().length == 0) return;
			var pwstrength = passwordStrength($(this).val());
			if(pwstrength > 75) {
				$(this).parent().parent().addClass("success");
				$(this).next().html("{/literal}{$LANG.pwstrengthstrong}{literal}");
			} else if (pwstrength > 30) {
				$(this).parent().parent().addClass("warning");
				$(this).next().html("{/literal}{$LANG.pwstrengthmoderate}{literal}");
			} else {
				$(this).parent().parent().addClass("error");
				$(this).next().html("{/literal}{$LANG.pwstrengthweak}{literal}");
			}
			$('#confirmpw').keyup();
		});
		// Compare passwords
		$('#confirmpw').keyup(function() {
			$(this).parent().parent().removeClass('error success');
			$(this).next().html("");
			if($(this).val().length < 1) return;
			if($('#password').val() != $(this).val()) {
				$(this).parent().parent().addClass('error');
			} else {
				$(this).parent().parent().addClass('success');
			}
		});
	});
</script>
{/literal}
