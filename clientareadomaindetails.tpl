<section>
	<div class="container">
		<h1>{$LANG.managing} {$domain}</h1>
		
		{if $updatesuccess}
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$LANG.changessavedsuccessfully}
		</div>
		{elseif $registrarcustombuttonresult=="success"}
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$LANG.moduleactionsuccess}
		</div>
		{elseif $error}
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$error}
		</div>
		{elseif $registrarcustombuttonresult}
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<h4 class="alert-heading">{$LANG.moduleactionfailed}</h4>
			{$registrarcustombuttonresult}
		</div>
		{elseif $lockstatus=="unlocked"}
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<h4 class="alert-heading">{$LANG.domaincurrentlyunlocked}</h4>
			{$LANG.domaincurrentlyunlockedexp}
		</div>
		{/if}
		
		<div class="tabbable">
			<ul class="nav nav-tabs" id="domaintabs">
				<li class="active"><a href="#tab-information" data-toggle="tab" title="{$LANG.information}">{$LANG.information}</a></li>
				<li><a href="#tab-autorenew" data-toggle="tab" title="{$LANG.domainsautorenew}">{$LANG.domainsautorenew}</a></li>
				{if $rawstatus == "active"}<li><a href="#tab-nameservers" data-toggle="tab" title="{$LANG.domainnameservers}">{$LANG.domainnameservers}</a></li>{/if}
				{if $lockstatus}{if $tld neq "co.uk" && $tld neq "org.uk" && $tld neq "ltd.uk" && $tld neq "plc.uk" && $tld neq "me.uk"}<li><a href="#tab-registrarlock" data-toggle="tab" title="{$LANG.domainregistrarlock}">{$LANG.domainregistrarlock}</a></li>{/if}{/if}
				{if $releasedomain}<li><a href="#tab-domainrelease" data-toggle="tab" title="{$LANG.domainrelease}">{$LANG.domainrelease}</a></li>{/if}
				{if $addonscount}<li><a href="#tab-domainaddons" data-toggle="tab" title="{$LANG.clientareahostingaddons}">{$LANG.clientareahostingaddons}</a></li>{/if}
				{if $managecontacts || $registerns || $dnsmanagement || $emailforwarding || $getepp}
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" title="{$LANG.domainmanagementtools}">{$LANG.domainmanagementtools} <span class="fa fa-angle-down"></span></a>
					<ul class="dropdown-menu">
						{if $managecontacts}<li><a href="clientarea.php?action=domaincontacts&amp;domainid={$domainid}" title="{$LANG.domaincontactinfo}">{$LANG.domaincontactinfo}</a></li>{/if}
						{if $registerns}<li><a href="clientarea.php?action=domainregisterns&amp;domainid={$domainid}" title="{$LANG.domainregisterns}">{$LANG.domainregisterns}</a></li>{/if}
						{if $dnsmanagement}<li><a href="clientarea.php?action=domaindns&amp;domainid={$domainid}" title="{$LANG.clientareadomainmanagedns}">{$LANG.clientareadomainmanagedns}</a></li>{/if}
						{if $emailforwarding}<li><a href="clientarea.php?action=domainemailforwarding&amp;domainid={$domainid}" title="{$LANG.clientareadomainmanageemailfwds}">{$LANG.clientareadomainmanageemailfwds}</a></li>{/if}
						{if $getepp}
						<li class="divider"></li>
						<li><a href="clientarea.php?action=domaingetepp&amp;domainid={$domainid}" title="{$LANG.domaingeteppcode}">{$LANG.domaingeteppcode}</a></li>
						{/if}
						{if $registrarcustombuttons}
						<li class="divider"></li>
						{foreach from=$registrarcustombuttons key=label item=command}
						<li><a href="clientarea.php?action=domaindetails&amp;id={$domainid}&amp;modop=custom&amp;a={$command}" title="{$label}">{$label}</a></li>
						{/foreach}
						{/if}
					</ul>
				</li>
				{/if}
			</ul>
		
			<div class="tab-content">
				<div class="tab-pane active" id="tab-information">
					<div class="row">
						<div class="col-md-4">
							<h2>{$LANG.information}</h2>
							<p>{$LANG.domaininfoexp}</p>
							<a class="btn btn-default" href="clientarea.php?action=domains" title="{$LANG.backtodomainslist}">{$LANG.backtodomainslist}</a>
						</div>
						<div class="col-md-8">
							<div class="row">
								<div class="col-md-6">
									<h4>{$LANG.clientareahostingdomain}</h4>
									{$domain} <span class="label label-{$rawstatus}">{$status}</span>
									{if $renew}
									<h4>{$LANG.domainrenew}</h4>
									<a href="cart.php?gid=renewals&amp;domainid={$domainid}" title="{$LANG.domainsrenewnow}" class="btn btn-primary">{$LANG.domainsrenewnow}</a>
									{/if}
								</div>
								<div class="col-md-6">
									<h4>{$LANG.clientareahostingregdate}</h4>
									{$registrationdate}
									<h4>{$LANG.firstpaymentamount}</h4>
									{$firstpaymentamount}
									<h4>{$LANG.recurringamount}</h4>
									{$recurringamount} {$LANG.every} {$registrationperiod} {$LANG.orderyears}
									<h4>{$LANG.clientareahostingnextduedate}</h4>
									{$nextduedate}
									<h4>{$LANG.orderpaymentmethod}</h4>
									{$paymentmethod}
								</div>
							</div>
							{if $registrarclientarea}<div class="moduleoutput">{$registrarclientarea|replace:'modulebutton':'btn'}</div>{/if}
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab-autorenew">
					<div class="row">
						<div class="col-md-4">
							<h2>{$LANG.domainsautorenew}</h2>
							<p>{$LANG.domainrenewexp}</p>
						</div>
						<div class="col-md-8 text-center">
							<form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tab-autorenew" class="margin-top margin-bottom">
								<input type="hidden" name="id" value="{$domainid}">
								{if $autorenew}
								<div class="alert alert-success alert-block text-center">
									<h3 class="alert-heading">{$LANG.domainautorenewstatus}: {$LANG.domainsautorenewenabled}</h3>
								</div>
								<input type="hidden" name="autorenew" value="disable">
								<button type="submit" class="btn btn-danger">{$LANG.domainsautorenewdisable}</button>
								{else}
								<div class="alert alert-danger alert-block text-center">
									<h3 class="alert-heading">{$LANG.domainautorenewstatus}: {$LANG.domainsautorenewdisabled}</h3>
								</div>
								<input type="hidden" name="autorenew" value="enable">
								<button type="submit" class="btn btn-success">{$LANG.domainsautorenewenable}</button>
								{/if}
							</form>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab-nameservers">
					<div class="row">
						<div class="col-md-4">
							<h2>{$LANG.domainnameservers}</h2>
							<p>{$LANG.domainnsexp}</p>
						</div>
						<div class="col-md-8">
							<form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails" class="form-horizontal margin-top">
								<input type="hidden" name="id" value="{$domainid}">
								<input type="hidden" name="sub" value="savens">
								<fieldset name="nschoises">
									<div class="radio">
										<label>
											<input type="radio" name="nschoice" value="default"{if $defaultns} checked="checked"{/if}> {$LANG.nschoicedefault}
										</label>
									</div>
									<div class="radio">
										<label>
											<input type="radio" name="nschoice" value="custom"{if !$defaultns} checked="checked"{/if}> {$LANG.nschoicecustom}
										</label>
									</div>
									<script type="text/javascript">
										{literal}
										$(function() {
											$('input[name=nschoice]').click(function() {
												if($(this).val() == 'default') {
													$('.domnsinputs').attr('disabled','disabled');
												} else { 
													$('.domnsinputs').removeAttr('disabled');
												}
											});
										}).click();
										{/literal}
									</script>
								</fieldset>
								<hr>
								<fieldset name="nameservers">
									<div class="form-group">
										<label for="ns1" class="col-md-4 control-label">{$LANG.domainnameserver1}</label>
										<div class="col-md-8">
											<input class="col-md-3 form-control domnsinputs" id="ns1" name="ns1" type="text" value="{$ns1}">
										</div>
									</div>
									<div class="form-group">
										<label for="ns2" class="col-md-4 control-label">{$LANG.domainnameserver2}</label>
										<div class="col-md-8">
											<input class="col-md-3 form-control domnsinputs" id="ns2" name="ns2" type="text" value="{$ns2}">
										</div>
									</div>
									<div class="form-group">
										<label for="ns3" class="col-md-4 control-label">{$LANG.domainnameserver3}</label>
										<div class="col-md-8">
											<input class="col-md-3 form-control domnsinputs" id="ns3" name="ns3" type="text" value="{$ns3}">
										</div>
									</div>
									<div class="form-group">
										<label for="ns4" class="col-md-4 control-label">{$LANG.domainnameserver4}</label>
										<div class="col-md-8">
											<input class="col-md-3 form-control domnsinputs" id="ns4" name="ns4" type="text" value="{$ns4}">
										</div>
									</div>
									<div class="form-group">
										<label for="ns5" class="col-md-4 control-label">{$LANG.domainnameserver5}</label>
										<div class="col-md-8">
											<input class="col-md-3 form-control domnsinputs" id="ns5" name="ns5" type="text" value="{$ns5}">
										</div>
									</div>
								</fieldset>
								<hr>
								<div class="form-group">
									<div class="col-md-12">
										<button type="submit" class="btn btn-primary">{$LANG.changenameservers}</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab-domainaddons">
					<div class="row">
						<div class="col-md-4">
							<h2>{$LANG.domainaddons}</h2>
							<p>{$LANG.domainaddonsinfo}</p>
						</div>
						<div class="col-md-8">
							<div class="margin-top">
								{if $addons.idprotection}
								<div class="media margin-bottom">
									<div class="pull-left">
										<img src="images/idprotect.png" alt="{$LANG.domainidprotection}" class="media-oject">
									</div>
									<div class="media-body">
										<h4 class="media-heading">{$LANG.domainidprotection}</h4>
										{$LANG.domainaddonsidprotectioninfo}
										{if $addonstatus.idprotection}
										<a href="clientarea.php?action=domainaddons&amp;id={$domainid}&amp;disable=idprotect&amp;token={$token}" title="Disable">Disable</a>
										{else}
										<a href="clientarea.php?action=domainaddons&amp;id={$domainid}&amp;buy=idprotect&amp;token={$token}" title="{$LANG.domainaddonsbuynow}">{$LANG.domainaddonsbuynow} {$addonspricing.idprotection}</a>
										{/if}
									</div>
								</div>
								{/if}
								{if $addons.dnsmanagement}
								<div class="media margin-bottom">
									<div class="pull-left">
										<img src="images/dnsmanagement.png" alt="{$LANG.domainaddonsdnsmanagement}" class="media-object">
									</div>
									<div class="media-body">
										<h4 class="media-heading">{$LANG.domainaddonsdnsmanagement}</h4>
										{$LANG.domainaddonsdnsmanagementinfo}
										{if $addonstatus.dnsmanagement}
										<a href="clientarea.php?action=domaindns&amp;domainid={$domainid}" title="Manage">Manage</a> | <a href="clientarea.php?action=domainaddons&amp;id={$domainid}&amp;disable=dnsmanagement&amp;token={$token}" title="Disable">Disable</a>
										{else}
										<a href="clientarea.php?action=domainaddons&amp;id={$domainid}&amp;buy=dnsmanagement&amp;token={$token}" title="{$LANG.domainaddonsbuynow}">{$LANG.domainaddonsbuynow} {$addonspricing.dnsmanagement}</a>
										{/if}
									</div>
								</div>
								{/if}
								{if $addons.emailforwarding}
								<div class="media margin-bottom">
									<div class="pull-left">
										<img src="images/emailfwd.png" alt="{$LANG.domainemailforwarding}" class="media-object">
									</div>
									<div class="media-body">
										<h4 class="media-heading">{$LANG.domainemailforwarding}</h4>
										{$LANG.domainaddonsemailforwardinginfo}
										{if $addonstatus.emailforwarding}
										<a href="clientarea.php?action=domainemailforwarding&amp;domainid={$domainid}">Manage</a> | <a href="clientarea.php?action=domainaddons&amp;id={$domainid}&amp;disable=emailfwd&amp;token={$token}">Disable</a>
										{else}
										<a href="clientarea.php?action=domainaddons&amp;id={$domainid}&amp;buy=emailfwd&amp;token={$token}">{$LANG.domainaddonsbuynow} {$addonspricing.emailforwarding}</a>
										{/if}
									</div>
								</div>
								{/if}
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab-registrarlock">
					<div class="row">
						<div class="col-md-4">
							<h2>{$LANG.domainregistrarlock}</h2>
							<p>{$LANG.domainlockingexp}</p>
						</div>
						<div class="col-md-8 text-center">
		               <form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tab-registrarlock" class="margin-top margin-bottom">
								<input type="hidden" name="id" value="{$domainid}">
								<input type="hidden" name="sub" value="savereglock">
			               {if $lockstatus == "locked"}
		                  <div class="alert alert-success alert-block text-center">
		                     <h3 class="alert-heading">{$LANG.domainreglockstatus}: {$LANG.domainsautorenewenabled}</h3>
		                  </div>
								<button type="submit" class="btn btn-danger">{$LANG.domainreglockdisable}</button>
		   	            {else}
		                  <div class="alert alert-danger alert-block text-center">
		                     <h3 class="alert-heading">{$LANG.domainreglockstatus}: {$LANG.domainsautorenewdisabled}</h3>
		                  </div>
								<button type="submit" class="btn btn-success">{$LANG.domainreglockenable}</button>
			               {/if}
		               </form>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab-domainrelease">
					<div class="row">
						<div class="col-md-4">
							<h2>{$LANG.domainrelease}</h2>
							<p>{$LANG.domainlockingexp}</p>
						</div>
						<div class="col-md-8 text-center">
							<form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails" class="form-inline margin-top margin-bottom">
								<input type="hidden" name="sub" value="releasedomain">
								<input type="hidden" name="id" value="{$domainid}">
								<fieldset class="well">
									<p>{$LANG.domainreleasedescription}</p>
									<div class="form-group">
										<label for="releasetag">{$LANG.domainreleasetag}:</label> 
									</div>
									<div class="form-group">
										<input type="text" name="transtag" class="form-control">
									</div>
								</fieldset>
								<button type="submit" class="btn btn-warning">{$LANG.domainrelease}</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		{literal}
		<script type="text/javascript">
			$(function() {
				if(window.location.hash != "") { $('.tabbable > .nav-tabs > li > a[href="'+window.location.hash+'"]').tab('show'); }
			});
		</script>
		{/literal}
	</div>
</section>
