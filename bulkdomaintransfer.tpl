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
		<ul class="nav nav-tabs" style="margin-bottom:30px">
			<li><a href="domainchecker.php">{$LANG.domainsimplesearch}</a></li>
			<li><a href="domainchecker.php?search=bulkregister">{$LANG.domainbulksearch}</a></li>
			<li class="active"><a href="domainchecker.php?search=bulktransfer">{$LANG.domainbulktransfersearch}</a></li>
		</ul>
		{/if}
		
		<div class="well text-center">
			<form method="post" action="domainchecker.php">
				<input type="hidden" name="search" value="bulktransfer">
				<p>{$LANG.domainbulktransferdescription}</p>
				<div class="text-center form-group">
					<textarea name="bulkdomains" rows="8" class="form-control">{$bulkdomains}</textarea>
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
				<input type="submit" value="{$LANG.domainstransfer}" class="btn btn-primary btn-lg" onclick="$('#modalpleasewait').modal();">
			</form>
		</div>
		
		{if $invalid}
		<div class="alert alert-danger text-center">
			<h4>{$LANG.domaincheckerbulkinvaliddomain}</h4>
		</div>
		{/if}
		
		{if $availabilityresults}
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<form method="post" action="{$systemsslurl}cart.php" class="form-horizontal">
					<input type="hidden" name="a" value="add">
					<input type="hidden" name="domain" value="transfer">
					<table class="table table-striped table-bordered">
						<tbody>
						{foreach from=$availabilityresults key=num item=result}
							<tr>
								<td class="text-center">
								{if $result.status eq "unavailable"}
									<input type="checkbox" name="domains[]" value="{$result.domain}"{if $num eq "0" && $available} checked="checked"{/if}>
									<input type="hidden" name="domainsregperiod[{$result.domain}]" value="{$result.period}">
								{else}
									&times;
								{/if}
								</td>
								<td>{$result.domain}</td>
								<td class="text-center">
								{if $result.status eq "unavailable"}
									<span class="label label-success">{$LANG.domaincheckeravailtransfer}</span>
								{else}
									<span class="label label-danger">{$LANG.domainunavailable}</span>
								{/if}
								</td>
								<td class="text-center">
								{if $result.status eq "unavailable"}
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
									<input type="submit" value="{$LANG.ordernowbutton} &raquo;" class="btn btn-success">
								</td>
							</tr>
						</tfoot>
					</table>
				</form>
			</div>
		</div>
		
		{else}
		
		<div class="page-header">
			<h1>{$LANG.domainspricing}</h1>
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
							<td>{$tldpricelist.tld}</td>
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
	</div>
</section>
