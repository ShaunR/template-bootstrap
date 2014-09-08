<section>
	<div class="container">
		<h1>{$LANG.domaintitle} <small>{$LANG.domaincheckerintro}</small></h1>
		
		{if $inccode}
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$LANG.captchaverifyincorrect}
		</div>
		{/if}
		
		{if $bulkdomainsearchenabled}
		<ul class="nav nav-tabs" style="margin-bottom: 30px">
			<li class="active"><a href="domainchecker.php">{$LANG.domainsimplesearch}</a></li>
			<li><a href="domainchecker.php?search=bulkregister">{$LANG.domainbulksearch}</a></li>
			<li><a href="domainchecker.php?search=bulktransfer">{$LANG.domainbulktransfersearch}</a></li>
		</ul>
		{/if}
		
		<div class="well text-center">
			<form method="post" action="domainchecker.php">
				<p>{$LANG.domaincheckerenterdomain}</p>
				<div class="form-group col-md-10 col-md-offset-1">
					<div class="input-group input-group-lg">
						<input class="input-lg form-control" name="domain" type="text" value="{if $domain}{$domain}{/if}" placeholder="{$LANG.domaincheckerdomainexample}">
						<span class="input-group-btn">
							<button class="btn btn-info btn-lg" type="button" onclick="jQuery('#mtlds').slideToggle();">{$LANG.searchmultipletlds}</button>
						</span>
					</div>
					<div id="mtlds" style="display:none;">
					{foreach from=$tldslist key=num item=listtld}
						<label class="checkbox-inline">
							<input type="checkbox" name="tlds[]" value="{$listtld}"{if in_array($listtld,$tlds) || !$tlds && $num==1} checked="checked"{/if}> {$listtld}
						</label>
					{/foreach}
					</div>
				</div>
		
				{if $capatacha}
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<div class="panel panel-default">
							<div class="panel-body">
								<p>{$LANG.captchaverify}</p>
								{if $capatacha eq "recaptcha"}
								<p>{$recapatchahtml}</p>
								{else}
								<div class="col-md-3 col-md-offset-3">
									<input type="text" name="code" class="form-control input-sm" maxlength="5">
								</div>
								<div class="col-md-6 text-left">
									<img src="includes/verifyimage.php" alt="captcha" style="margin-bottom: 20px;">
								</div>
							</div>
							{/if}
						</div>
					</div>
				</div>
				{/if}
		
				<div class="form-group">
					<input type="submit" value="{$LANG.checkavailability}" class="btn btn-primary btn-lg" onclick="$('#modalpleasewait').modal();">
					<input type="submit" name="transfer" value="{$LANG.domainstransfer}" class="btn btn-success btn-lg" onclick="$('#modalpleasewait').modal();">
					<input type="submit" name="hosting" value="{$LANG.domaincheckerhostingonly}" class="btn btn-lg btn-default">
				</div>
		
			</form>
		</div>
		
		{if $lookup}
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
			{if $available}
				<div class="alert alert-success text-center">{$LANG.domainavailable1} {$sld}{$ext} {$LANG.domainavailable2}</div>
			{elseif $invalidtld}
				<div class="alert alert-danger text-center">
					<h4>{$invalidtld|strtoupper} {$LANG.domaincheckerinvalidtld}</h4>
				</div>
			{elseif $invalid}
				<div class="alert alert-danger text-center">
					<h4>{$LANG.ordererrordomaininvalid}</h4>
				</div>
			{elseif $error}
				<div class="alert alert-danger text-center">
					<h4>{$LANG.domainerror}</h4>
				</div>
			{else}
				<div class="alert alert-danger text-center">
					<h4>{$LANG.domainunavailable1} {$sld}{$ext} {$LANG.domainunavailable2}</h4>
				</div>
			{/if}
		
			{if !$invalid}
				<form method="post" action="{$systemsslurl}cart.php?a=add&domain=register" class="form-horizontal">
					<table class="table table-striped table-bordered">
						<tbody>
						{foreach from=$availabilityresults key=num item=result}
							<tr>
								<td class="text-center">
								{if $result.status eq "available"}
									<input type="checkbox" name="domains[]" value="{$result.domain}"{if $num eq "0" && $available} checked="checked"{/if}>
									<input type="hidden" name="domainsregperiod[{$result.domain}]" value="{$result.period}">
								{else}
									&times;
								{/if}
								</td>
								<td class="text-center">{$result.domain}</td>
								<td class="text-center">
								{if $result.status eq "available"}
									<span class="label label-success">{$LANG.domainavailable}</span>
								{else}
									<span class="label label-danger">{$LANG.domainunavailable}</span>
								{/if}
								</td>
								<td class="text-center">
								{if $result.status eq "unavailable"}
									<a href="http://{$result.domain}" target="_blank">www</a> 
									 | 
									<a href="#" onclick="showWhois('{$result.domain}');return false;">whois</a>
								{else}
									<select name="domainsregperiod[{$result.domain}]">
									{foreach key=period item=regoption from=$result.regoptions}
										<option value="{$period}">{$period} {$LANG.orderyears} @ {$regoption.register}</option>
									{/foreach}
									</select>
								{/if}
								</td>
							</tr>
						{/foreach}
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4" class="text-right">
									<input type="submit" value="{$LANG.ordernowbutton}" class="btn btn-success">
								</td>
							</tr>
						</tfoot>
					</table>
				</form>
			{/if}
			</div>
		</div>
		
		{else}
		
		<div class="page-header">
			<h2>{$LANG.domainspricing}</h2>
		</div>
		
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th class="text-center">{$LANG.domaintld}</th>
							<th class="text-center">{$LANG.domainminyears}</th>
							<th class="text-center">{$LANG.domainsregister}</th>
							<th class="text-center">{$LANG.domainstransfer}</th>
							<th class="text-center">{$LANG.domainsrenew}</th>
						</tr>
					</thead>
					<tbody>
					{foreach from=$tldpricelist item=tldpricelist}
						<tr>
							<td class="text-center">{$tldpricelist.tld}</td>
							<td class="text-center">{$tldpricelist.period}</td>
							<td class="text-center">{if $tldpricelist.register}{$tldpricelist.register}{else}{$LANG.domainregnotavailable}{/if}</td>
							<td class="text-center">{if $tldpricelist.transfer}{$tldpricelist.transfer}{else}{$LANG.domainregnotavailable}{/if}</td>
							<td class="text-center">{if $tldpricelist.renew}{$tldpricelist.renew}{else}{$LANG.domainregnotavailable}{/if}</td>
						</tr>
					{/foreach}
					</tbody>
				</table>
		
			{if !$loggedin && $currencies}
				<form method="post" action="domainchecker.php" class="text-right">
					{$LANG.choosecurrency}: <select name="currency" onchange="submit()">
					{foreach from=$currencies item=curr}
						<option value="{$curr.id}"{if $curr.id eq $currency.id} selected="selected"{/if}>{$curr.code}</option>
					{/foreach}
					</select>
				</form>
			{/if}
			</div>
		</div>
		
		{/if}
		
		<div class="modal fade" id="modalpleasewait">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h4 class="modal-title"><img src="images/loadingsml.gif" alt="{$LANG.pleasewait}" style="vertical-align:baseline"> {$LANG.pleasewait}</h4>
					</div>
				</div>	
			</div>
		</div>
		
		<div class="modal fade" id="modalwhois">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">{$LANG.whoisresults} <span><img src="images/loadingsml.gif" alt="{$LANG.pleasewait}" style="vertical-align:baseline"></span></h4>
					</div>
					<div class="modal-body"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
		{literal}
			function showWhois(domain) {
				$('#modalwhois .modal-body').html('<div class="text-center"><img src="images/loadingsml.gif" alt="{$LANG.pleasewait}"></div>');
				$('#modalwhois .modal-header h4 span').html(domain);
				$('#modalwhois .modal-body').load('whois.php?domain='+domain);
				$('#modalwhois').modal();
			}
		{/literal}
		</script>
	</div>
</section>
