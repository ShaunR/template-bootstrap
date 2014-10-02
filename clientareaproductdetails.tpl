<section>
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				<h1>{$product}</h1>
			</div>
			<div class="col-md-3">
				<div class="h1 text-right"><span class="label label-{$rawstatus}">{$status}</span></div>
			</div>
		</div>
		<hr>
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
		{if $status eq "Suspended" && $suspendreason}
		<div class="alert alert-danger lead">
			<span class="fa fa-exclamation-triangle"></span> <strong>{$LANG.clientareasuspended}!</strong> {$suspendreason}
		</div>
		{/if}

		<div class="row">
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading"><strong>{$LANG.navbilling}</strong>{if $showcancelbutton} <span class="pull-right"><a href="clientarea.php?action=cancel&amp;id={$id}">{$LANG.clientareacancelrequestbutton}</a></span>{/if}</div>
					<div class="panel-body">
						<p><strong>{$LANG.clientareahostingregdate}:</strong><br>{$regdate}</p>
						<p><strong>{$LANG.firstpaymentamount}:</strong><br>{$firstpaymentamount}</p>
						<p><strong>{$LANG.recurringamount}:</strong><br>{$recurringamount}</p>
						<p><strong>{$LANG.clientareahostingnextduedate}:</strong><br>{$nextduedate}</p>
						<p><strong>{$LANG.orderbillingcycle}:</strong><br>{$billingcycle}</p>
						<p><strong>{$LANG.orderpaymentmethod}:</strong><br>{$paymentmethod}</p>
					</div>
				</div>
				{if $modulechangepassword || $modulecustombuttons}
				<div class="panel panel-default">
					<div class="panel-heading"><strong>{$LANG.productmanagementactions}</strong></div>
					<div class="panel-body">
						{if $modulechangepassword}<a href="#modal-modulechangepassword" data-toggle="modal" title="{$LANG.serverchangepassword}" class="btn btn-default btn-sm">{$LANG.serverchangepassword}</a>{/if}
						{foreach from=$modulecustombuttons key=label item=command}
						<a href="clientarea.php?action=productdetails&amp;id={$id}&amp;modop=custom&amp;a={$command}" title="{$label}" class="btn btn-default btn-sm">{$label}</a>
						{/foreach}
					</div>
				</div>
				{/if}
				{if $downloads}
				<div class="panel panel-default">
					<div class="panel-heading"><strong>{$LANG.downloadstitle}</strong></div>
					<ul class="list-group">
						{foreach from=$downloads item=download}
						<li class="list-group-item">
							<a href="{$download.link}" title="{$LANG.downloadname} {$download.title}"><strong>{$download.title}</strong></a>
							{if $download.description}<p>{$download.description}</p>{/if}
						</li>
						{/foreach}
					</ul>
				</div>
				{/if}
			</div>
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-heading"><strong>{$LANG.information}</strong>{if $packagesupgrade} <span class="pull-right"><a href="upgrade.php?type=package&amp;id={$id}">{$LANG.upgradedowngradepackage}</a></span>{/if}</div>
					<div class="panel-body">
						<p><strong>{$LANG.orderproduct}:</strong><br>{$product}</p>
						<div class="row">
							{if $domain}
							<div class="col-md-4">
								<p><strong>{if $type eq "hostingaccount" || $type eq "other"}{$LANG.clientareahostingdomain}{else}{$LANG.serverhostname}{/if}:</strong><br><a href="http://{$domain}" target="_blank">{$domain}</a></p>
							</div>
							{/if}
							{if $dedicatedip}
							<div class="col-md-4">
								<p><strong>{$LANG.domainregisternsip}:</strong><br>{$dedicatedip}</p>
							</div>
							{/if}
							{if $username}
							<div class="col-md-4">
								<p><strong>{$LANG.serverusername}:</strong><br>{$username}</p>
							</div>
							{/if}
						</div>
						{if $lastupdate}
						<div class="row">
							<div class="col-md-4">
								<p><strong>{$LANG.clientareadiskusage}:</strong><br>{$diskusage}MB / {$disklimit}MB</p>
								<div class="progress">
									<div class="progress-bar" role="progressbar" aria-valuenow="{$diskpercent|replace:'%':''}" aria-valuemin="0" aria-valuemax="100" style="width: {$diskpercent};">{$diskpercent}</div>
								</div>
							</div>
							<div class="col-md-4">
								<p><strong>{$LANG.clientareabwusage}:</strong><br>{$bwusage}MB / {$bwlimit}MB</p>
								<div class="progress">
									<div class="progress-bar" role="progressbar" aria-valuenow="{$bwpercent|replace:'%':''}" aria-valuemin="0" aria-valuemax="100" style="width: {$bwpercent};">{$bwpercent}</div>
								</div>
							</div>
						</div>
						{/if}
						{if $productcustomfields}
						{foreach from=$productcustomfields item=customfield name=productcustomfields}
						{if $smarty.foreach.productcustomfields.first}
						<div class="row">
						{elseif $smarty.foreach.productcustomfields.index % 3 == 0 }
						</div>
						<div class="row">
						{/if}
							<div class="col-md-4">
								<p><strong>{$customfield.name}:</strong><br>{$customfield.value}</p>
							</div>
						{if $smarty.foreach.productcustomfields.last}
						</div>
						{/if}
						{/foreach}
						{/if}
					</div>
				</div>
				{if $configurableoptions}
				<div class="panel panel-default">
					<div class="panel-heading"><strong>{$LANG.cartconfigurationoptions}</strong>{if $configoptionsupgrade}<span class="pull-right"><a href="upgrade.php?type=configoptions&amp;id={$id}">{$LANG.upgradedowngradeconfigoptions}</a></span>{/if}</div>
					<div class="panel-body">
						{foreach from=$configurableoptions item=configoption name=configurableoptions}
						{if $smarty.foreach.configurableoptions.first}
						<div class="row">
						{elseif $smarty.foreach.configurableoptions.index % 3 == 0 }
						</div>
						<div class="row">
						{/if}
							<div class="col-md-4">
								<p><strong>{$configoption.optionname}:</strong><br>
								{if $configoption.optiontype eq 3}
								{if $configoption.selectedqty}{$LANG.yes}{else}{$LANG.no}{/if}
								{elseif $configoption.optiontype eq 4}
								{$configoption.selectedqty} &times; {$configoption.selectedoption}
								{else}
								{$configoption.selectedoption}
								{/if}
								</p>
							</div>
						{if $smarty.foreach.configurableoptions.last}
						</div>
						{/if}
						{/foreach}
					</div>
				</div>
				{/if}
				{if $addons || $addonsavailable }
				<div class="panel panel-default">
					<div class="panel-heading"><strong>{$LANG.clientareahostingaddons}</strong> {if $addonsavailable}<span class="pull-right"><a href="cart.php?gid=addons&amp;pid={$id}">{$LANG.orderavailableaddons}</a></span>{/if}</div>
					<table class="table table-striped">
						{if $addons}
						<thead>
							<tr>
								<th>{$LANG.clientareaaddon}</th>
								<th>{$LANG.clientareaaddonpricing}</th>
								<th>{$LANG.clientareahostingnextduedate}</th>
								<th>{$LANG.clientareastatus}</th>
							</tr>
						</thead>
						{/if}
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
				{/if}
				{if $moduleclientarea}
				<div class="moduleoutput">{$moduleclientarea}</div>
				{/if}
			</div>
		</div>
	</div>
</section>

{if $modulechangepassword}
<div class="modal fade" id="modal-modulechangepassword">
	<div class="modal-dialog">
		<form method="post" action="{$smarty.server.PHP_SELF}" class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title"><span class="fa fa-lock"></span> {$LANG.serverchangepassword}</h4>
			</div>
			<div class="modal-body">
				<p class="text-warning">{$LANG.serverchangepasswordintro}</p>
				<input type="hidden" name="id" value="{$id}">
				<input type="hidden" name="modulechangepassword" value="true">
				<input type="hidden" name="action" value="productdetails">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group has-feedback">
							<label for="modulenewpw">{$LANG.newpassword}</label>
							<input type="password" name="newpw" id="modulenewpw" class="form-control">
							<span class="form-control-feedback glyphicon"></span>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group has-feedback">
							<label for="moduleconfirmpw">{$LANG.confirmnewpassword}</label>
							<input type="password" name="confirmpw" id="moduleconfirmpw" class="form-control">
							<span class="form-control-feedback glyphicon"></span>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">{$LANG.clientareanavchangepw}</button>
				<button type="reset" class="btn btn-default" data-dismiss="modal">{$LANG.cancel}</button>
			</div>
		</form>
	</div>
</div>
{literal}
<script type="text/javascript">
	$(function() {
		// Password Strength
		$('#modulenewpw').keyup(function() {
			$(this).parent().removeClass('has-warning has-error has-success');
			$(this).next().removeClass('glyphicon-thumbs-down glyphicon-thumbs-up');
			if($(this).val().length == 0) {
				return;
			}
			var pwstrength = passwordStrength($(this).val());
			if(pwstrength > 75) {
				$(this).parent().addClass("has-success");
				$(this).next().addClass('glyphicon-thumbs-up');
			} else if (pwstrength > 30) {
				$(this).parent().addClass("has-warning");
				$(this).next().addClass('glyphicon-thumbs-down');
			} else {
				$(this).parent().addClass("has-error");
				$(this).next().addClass('glyphicon-thumbs-down');
			}
			$('#confirmpw').keyup();
		});
		// Compare passwords
		$('#moduleconfirmpw').keyup(function() {
			$(this).parent().removeClass('has-error has-success');
			$(this).next().removeClass('glyphicon-thumbs-down glyphicon-thumbs-up');
			if($(this).val().length < 1) return;
			if($('#modulenewpw').val() != $(this).val()) {
				$(this).parent().addClass("has-error");
				$(this).next().addClass('glyphicon-thumbs-down');
			} else {
				$(this).parent().addClass("has-success");
				$(this).next().addClass('glyphicon-thumbs-up');
			}
		});
	});
</script>
{/literal}
{/if}
