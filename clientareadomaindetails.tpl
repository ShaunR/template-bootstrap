<div class="page-header">
	<h1>{$LANG.managing} {$domain}</h1>
</div>

{if $updatesuccess}
<div class="alert alert-success fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$LANG.changessavedsuccessfully}
</div>
{elseif $registrarcustombuttonresult=="success"}
<div class="alert alert-success fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$LANG.moduleactionsuccess}
</div>
{elseif $error}
<div class="alert alert-error fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$error}
</div>
{elseif $registrarcustombuttonresult}
<div class="alert alert-error fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	<h4 class="alert-heading">{$LANG.moduleactionfailed}</h4>
	{$registrarcustombuttonresult}
</div>
{elseif $lockstatus=="unlocked"}
<div class="alert alert-error fade in">
	<button class="close" data-dismiss="alert">&times;</button>
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
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" title="{$LANG.domainmanagementtools}">{$LANG.domainmanagementtools}<b class="caret"></b></a>
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
				<div class="span4">
					<h2>{$LANG.domainsautorenew}</h2>
					<p>{$LANG.domaininfoexp}</p>
					<a class="btn" href="clientarea.php?action=domains" title="{$LANG.backtodomainslist}">{$LANG.backtodomainslist}</a>
				</div>
				<div class="span8">
					<ul class="thumbnails">
						<li class="span8">
							<h4>{$LANG.clientareahostingdomain}</h4>
							{$domain} <span class="label label-{$rawstatus}">{$status}</span>
						</li>
						<li class="span4">
							<h4>{$LANG.clientareahostingregdate}</h4>
							{$registrationdate}
						</li>
						<li class="span4">
							<h4>{$LANG.clientareahostingnextduedate}</h4>
							{$nextduedate}
						</li>
						<li class="span4">
							<h4>{$LANG.firstpaymentamount}</h4>
							{$firstpaymentamount}
						</li>
						<li class="span4">
							<h4>{$LANG.recurringamount}</h4>
							{$recurringamount} {$LANG.every} {$registrationperiod} {$LANG.orderyears} {if $renew}<a href="cart.php?gid=renewals&domainid={$domainid}" title="{$LANG.domainsrenewnow}" class="btn">{$LANG.domainsrenewnow}</a>{/if}</form>
						</li>
						<li class="span4">
							<h4>{$LANG.orderpaymentmethod}</h4>
							{$paymentmethod}
						</li>
					</ul>
					{if $registrarclientarea}<div class="moduleoutput">{$registrarclientarea|replace:'modulebutton':'btn'}</div>{/if}
				</div>
			</div>
		</div>
		<div class="tab-pane" id="tab-autorenew">
			<div class="row">
				<div class="span4">
					<h2>{$LANG.domainsautorenew}</h2>
					<p>{$LANG.domainrenewexp}</p>
				</div>
				<div class="span8 text-center">
					<form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tab-autorenew">
						<input type="hidden" name="id" value="{$domainid}"/>
					{if $autorenew}
						<div class="alert alert-success alert-block text-center">
							<h3 class="alert-heading">{$LANG.domainautorenewstatus}: {$LANG.domainsautorenewenabled}</h3>
						</div>
						<input type="hidden" name="autorenew" value="disable"/>
						<input type="submit" class="btn btn-large btn-danger" value="{$LANG.domainsautorenewdisable}"/>
					{else}
						<div class="alert alert-error alert-block text-center">
							<h3 class="alert-heading">{$LANG.domainautorenewstatus}: {$LANG.domainsautorenewdisabled}</h3>
						</div>
						<input type="hidden" name="autorenew" value="enable"/>
						<input type="submit" class="btn btn-large btn-success" value="{$LANG.domainsautorenewenable}"/>
					{/if}
					</form>
				</div>
			</div>
		</div>
		<div class="tab-pane" id="tab-nameservers">
			<div class="row">
				<div class="span4">
					<h2>{$LANG.domainnameservers}</h2>
					<p>{$LANG.domainnsexp}</p>
				</div>
				<div class="span8">
					<form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails">
						<input type="hidden" name="id" value="{$domainid}"/>
						<input type="hidden" name="sub" value="savens"/>
						<fieldset name="nschoises" class="marginbottom well">
							<label class="radio"><input type="radio" name="nschoice" value="default"{if $defaultns} checked="checked"{/if}/> {$LANG.nschoicedefault}</label>
							<label class="radio"><input type="radio" name="nschoice" value="custom"{if !$defaultns} checked="checked"{/if}/> {$LANG.nschoicecustom}</label>
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
						<fieldset name="nameservers">
							<label for="ns1">{$LANG.domainnameserver1}</label>
							<input class="span3 domnsinputs" id="ns1" name="ns1" type="text" value="{$ns1}"/>
							<label for="ns2">{$LANG.domainnameserver2}</label>
							<input class="span3 domnsinputs" id="ns2" name="ns2" type="text" value="{$ns2}"/>
							<label for="ns3">{$LANG.domainnameserver3}</label>
							<input class="span3 domnsinputs" id="ns3" name="ns3" type="text" value="{$ns3}"/>
							<label for="ns4">{$LANG.domainnameserver4}</label>
							<input class="span3 domnsinputs" id="ns4" name="ns4" type="text" value="{$ns4}"/>
							<label for="ns5">{$LANG.domainnameserver5}</label>
							<input class="span3 domnsinputs" id="ns5" name="ns5" type="text" value="{$ns5}"/>
						</fieldset>
						<input type="submit" class="btn btn-large btn-primary" value="{$LANG.changenameservers}"/>
					</form>
				</div>
			</div>
		</div>
		<div class="tab-pane" id="tab-domainaddons">
			<div class="row">
				<div class="span4">
					<h2>{$LANG.domainaddons}</h2>
					<p>{$LANG.domainaddonsinfo}</p>
				</div>
				<div class="span8">
				{if $addons.idprotection}
					<div class="marginbottom">
						<img src="images/idprotect.png" title="{$LANG.domainidprotection}" class="pull-left marginright"/>
						<h4>{$LANG.domainidprotection}</h4>
						<p class="nomarginbottom">{$LANG.domainaddonsidprotectioninfo}</p>
						<div class="clearfix">
						{if $addonstatus.idprotection}
							<a href="clientarea.php?action=domainaddons&id={$domainid}&disable=idprotect&token={$token}" title="Disable">Disable</a>
						{else}
							<a href="clientarea.php?action=domainaddons&id={$domainid}&buy=idprotect&token={$token}" title="{$LANG.domainaddonsbuynow}">{$LANG.domainaddonsbuynow} {$addonspricing.idprotection}</a>
						{/if}
						</div>
					</div>
				{/if}
				{if $addons.dnsmanagement}
					<div class="marginbottom">
						<img src="images/dnsmanagement.png" title="{$LANG.domainaddonsdnsmanagement}" class="pull-left marginright"/>
						<h4>{$LANG.domainaddonsdnsmanagement}</h4>
						<p class="nomarginbottom">{$LANG.domainaddonsdnsmanagementinfo}</p>
						<div class="clearfix">
						{if $addonstatus.dnsmanagement}
							<a href="clientarea.php?action=domaindns&domainid={$domainid}" title="Manage">Manage</a> | <a href="clientarea.php?action=domainaddons&id={$domainid}&disable=dnsmanagement&token={$token}" title="Disable">Disable</a>
						{else}
							<a href="clientarea.php?action=domainaddons&id={$domainid}&buy=dnsmanagement&token={$token}" title="{$LANG.domainaddonsbuynow}">{$LANG.domainaddonsbuynow} {$addonspricing.dnsmanagement}</a>
						{/if}
						</div>
					</div>
				{/if}
				{if $addons.emailforwarding}
					<div class="marginbottom">
						<img src="images/emailfwd.png" title="{$LANG.domainemailforwarding}" class="pull-left marginright"/>
						<h4>{$LANG.domainemailforwarding}</h4>
						<p class="nomarginbottom">{$LANG.domainaddonsemailforwardinginfo}</p>
						<div class="clearfix">
						{if $addonstatus.emailforwarding}
							<a href="clientarea.php?action=domainemailforwarding&domainid={$domainid}">Manage</a> | <a href="clientarea.php?action=domainaddons&id={$domainid}&disable=emailfwd&token={$token}">Disable</a>
						{else}
							<a href="clientarea.php?action=domainaddons&id={$domainid}&buy=emailfwd&token={$token}">{$LANG.domainaddonsbuynow} {$addonspricing.emailforwarding}</a>
						{/if}
						</div>
					</div>
				{/if}
				</div>
			</div>
		</div>
		<div class="tab-pane" id="tab-registrarlock">
			<div class="row">
				<div class="span4">
					<h2>{$LANG.domainregistrarlock}</h2>
					<p>{$LANG.domainlockingexp}</p>
				</div>
				<div class="span8 text-center">
               <form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tab-registrarlock">
						<input type="hidden" name="id" value="{$domainid}"/>
						<input type="hidden" name="sub" value="savereglock"/>
               {if $lockstatus == "locked"}
                  <div class="alert alert-success alert-block text-center">
                     <h3 class="alert-heading">{$LANG.domainreglockstatus}: {$LANG.domainsautorenewenabled}</h3>
                  </div>
						<input type="submit" class="btn btn-large btn-danger" value="{$LANG.domainreglockdisable}"/>
               {else}
                  <div class="alert alert-error alert-block text-center">
                     <h3 class="alert-heading">{$LANG.domainreglockstatus}: {$LANG.domainsautorenewdisabled}</h3>
                  </div>
						<input type="submit" name="reglock" class="btn btn-large btn-success" value="{$LANG.domainreglockenable}"/>
               {/if}
               </form>
				</div>
			</div>
		</div>
		<div class="tab-pane" id="tab-domainrelease">
			<div class="row">
				<div class="span4">
					<h2>{$LANG.domainrelease}</h2>
					<p>{$LANG.domainlockingexp}</p>
				</div>
				<div class="span8 text-center">
					<form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails" class="form-inline">
						<fieldset class="well">
							<input type="hidden" name="sub" value="releasedomain"/>
							<input type="hidden" name="id" value="{$domainid}"/>
							<label for="releasetag">{$LANG.domainreleasetag}:</label> 
							<input type="text" name="transtag" class="span2"/>
							<span class="help-inline">{$LANG.domainreleasedescription}</span>
						</fieldset>
						<input type="submit" value="{$LANG.domainrelease}" class="btn btn-large btn-warning"/>
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