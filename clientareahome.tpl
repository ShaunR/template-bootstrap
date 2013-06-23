<div class="row">
	<div class="span6">
		<div class="page-header">
			<h2>{$LANG.accountinfo} <a href="clientarea.php?action=details" rel="tooltip" data-placement="right" title="{$LANG.clientareaupdateyourdetails}"><i class="icon icon-edit"></i></a></h2>
		</div>
		<address>
			<strong>{$clientsdetails.firstname} {$clientsdetails.lastname} {if $clientsdetails.companyname}({$clientsdetails.companyname}){/if}</strong><br/>
			{$clientsdetails.address1}{if $clientsdetails.address2}, {$clientsdetails.address2}{/if}<br/>
			{if $clientsdetails.city}{$clientsdetails.city}, {/if}{if $clientsdetails.state}{$clientsdetails.state}, {/if}{$clientsdetails.postcode}<br/>
			{$clientsdetails.countryname}<br/>
			<a href="mailto:{$clientsdetails.email}">{$clientsdetails.email}</a><br/>
		</address>
			
	</div>
	<div class="span6">
		<div class="page-header">
			<h2>{$LANG.accountoverview}</h2>
		</div>
		<ul class="unstyled">
			<li>{$LANG.statsnumproducts}: <a href="clientarea.php?action=products"><strong>{$clientsstats.productsnumactive}</strong> ({$clientsstats.productsnumtotal}) - {$LANG.view} &raquo;</a></li>
			<li>{$LANG.statsnumdomains}: <a href="clientarea.php?action=domains"><strong>{$clientsstats.numactivedomains}</strong> ({$clientsstats.numdomains}) - {$LANG.view} &raquo;</a></li>
			<li>{$LANG.statsnumtickets}: <a href="supporttickets.php"><strong>{$clientsstats.numtickets}</strong> - {$LANG.view} &raquo;</a></li>
			<li>{$LANG.statsnumreferredsignups}: <a href="affiliates.php"><strong>{$clientsstats.numaffiliatesignups}</strong> - {$LANG.view} &raquo;</a></li>
			<li>{$LANG.creditcardyourinfo}: <strong>{if $defaultpaymentmethod}{$defaultpaymentmethod}{else}{$LANG.paymentmethoddefault}{/if}</strong> {if $clientsdetails.cctype}({$clientsdetails.cctype}-{$clientsdetails.cclastfour}) - <a href="clientarea.php?action=creditcard">Update &raquo;</a>{/if}</li>
		</ul>
	</div>
</div>
	
{if $announcements}
<div class="alert alert-warning fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	<h4 class="alert-heading">{$LANG.ourlatestnews}</h4>
	<p>{$announcements.0.text|strip_tags|truncate:500:'...'} <a href="announcements.php?id={$announcements.0.id}" title="{$LANG.more}">{$LANG.view} &raquo;</a></p>
</div>
{/if}

{if $ccexpiringsoon}
<div class="alert alert-error fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	<strong>{$LANG.ccexpiringsoon}:</strong> {$LANG.ccexpiringsoondesc|sprintf2:'<a href="clientarea.php?action=creditcard" class="btn btn-mini">':'</a>'}
</div>
{/if}

{if $clientsstats.incredit}
<div class="alert alert-success fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	<strong>{$LANG.availcreditbal}:</strong> {$LANG.availcreditbaldesc|sprintf2:$clientsstats.creditbalance}
</div>
{/if}

{if $clientsstats.numoverdueinvoices>0}
<div class="alert alert-error fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	<strong>{$LANG.youhaveoverdueinvoices|sprintf2:$clientsstats.numoverdueinvoices}:</strong> {$LANG.overdueinvoicesdesc|sprintf2:'<a href="clientarea.php?action=masspay&all=true">':'</a>'}
</div>
{/if}

{if $condlinks.domainreg || $condlinks.domaintrans || $condlinks.domainown}
<div class="well text-center">
	<h3>{$LANG.domaincheckerchecknewdomain}</h3>
	<form method="post" action="domainchecker.php">
		<input class="span7" style="font-size:1.4em;height:30px;" name="domain" type="text" value="" placeholder="{$LANG.domaincheckerdomainexample}"/>
		<div>
			{if $condlinks.domainreg}<input type="submit" value="{$LANG.checkavailability}" class="btn btn-primary btn-large"/>{/if} 
			{if $condlinks.domaintrans}<input type="submit" name="transfer" value="{$LANG.domainstransfer}" class="btn btn-success btn-large"/>{/if} 
			{if $condlinks.domainown}<input type="submit" name="hosting" value="{$LANG.domaincheckerhostingonly}" class="btn btn-large"/>{/if}
		</div>
	</form>
</div>
{/if}

{foreach from=$addons_html item=addon_html}
<div class="marginbottom">{$addon_html}</div>
{/foreach}

{if in_array('tickets',$contactpermissions)}
<h3>{$clientsstats.numactivetickets} {$LANG.supportticketsopentickets} <small>( <a href="submitticket.php">{$LANG.opennewticket}</a> )</small></h3>
<table class="table table-striped table-bordered-outside table-sorted">
	<thead>
		<tr>
			<th><a href="supporttickets.php?orderby=date">{$LANG.supportticketsdate}</a></th>
			<th><a href="supporttickets.php?orderby=dept">{$LANG.supportticketsdepartment}</a></th>
			<th><a href="supporttickets.php?orderby=subject">{$LANG.supportticketssubject}</a></th>
			<th><a href="supporttickets.php?orderby=status">{$LANG.supportticketsstatus}</a></th>
			<th class="sort-desc"><a href="supporttickets.php?orderby=lastreply">{$LANG.supportticketsticketlastupdated}</a></th>
			<th>&nbsp;</th>
		</tr>
	</thead>
	<tbody>
{foreach from=$tickets item=ticket}
		<tr>
			<td>{$ticket.date}</td>
			<td>{$ticket.department}</td>
			<td><img src="images/article.gif" alt="Ticket">&nbsp;<a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}">{if $ticket.unread}<strong>{/if}#{$ticket.tid} - {$ticket.subject}{if $ticket.unread}</strong>{/if}</a></td>
			<td>{$ticket.status}</td>
			<td>{$ticket.lastreply}</td>
			<td class="text-center">
				<a href="viewticket.php?tid={$tikcet.tid}&c={$ticket.c}" title="{$LANG.supportticketsviewticket}" class="btn btn-info">{$LANG.supportticketsviewticket}</a>
			</td>
		</tr>
{foreachelse}
		<tr>
			<td colspan="6" class="text-center">{$LANG.supportticketsnoneopen}</td>
		</tr>
{/foreach}
	</tbody>
</table>
{/if}

{if in_array('invoices',$contactpermissions)}
<h3>{$clientsstats.numdueinvoices} {$LANG.invoicesdue} <small>( <a href="clientarea.php?action=invoices">{$LANG.view}</a> )</small></h3>
<form method="post" action="clientarea.php?action=masspay">
	<table class="table table-striped table-bordered-outside table-sorted">
		<thead>
			<tr>
				{if $masspay}<th class="text-center"><input type="checkbox" onclick="toggleCheckboxes('invids')"/></th>{/if}
				<th class="sort-desc"><a href="clientarea.php?action=invoices&orderby=id">{$LANG.invoicestitle}</a></th>
				<th><a href="clientarea.php?action=invoices&orderby=date">{$LANG.invoicesdatecreated}</a></th>
				<th><a href="clientarea.php?action=invoices&orderby=duedate">{$LANG.invoicesdatedue}</a></th>
				<th><a href="clientarea.php?action=invoices&orderby=total">{$LANG.invoicestotal}</a></th>
				<th><a href="clientarea.php?action=invoices&orderby=balance">{$LANG.invoicesbalance}</a></th>
				<th><a href="clientarea.php?action=invoices&orderby=status">{$LANG.invoicesstatus}</a></th>
				<th>&nbsp;</th>
			</tr>
		</thead>
		<tbody>
	{foreach from=$invoices item=invoice}
			<tr>
				{if $masspay}<td class="text-center"><input type="checkbox" name="invoiceids[]" value="{$invoice.id}" class="invids"/></td>{/if}
				<td><a href="viewinvoice.php?id={$invoice.id}" target="_blank">{$invoice.invoicenum}</a></td>
				<td>{$invoice.datecreated}</td>
				<td>{$invoice.datedue}</td>
				<td>{$invoice.total}</td>
				<td><span class="label label-{$invoice.rawstatus}">{$invoice.statustext}</span></td>
				<td>{$invoice.balance}</td>
				<td class="text-center"><input type="button" class="btn btn-info" value="{$LANG.invoicesview}" onclick="window.open('viewinvoice.php?id={$invoice.id}')"/></td>
			</tr>
	{foreachelse}
			<tr>
				<td colspan="{if $masspay}8{else}7{/if}" class="text-center">{$LANG.invoicesnoneunpaid}</td>
			</tr>
	{/foreach}
		</tbody>
		<tfoot>
	{if $invoices}
			<tr>
				<td colspan="{if $masspay}4{else}3{/if}">{if $masspay}<input type="submit" value="{$LANG.masspayselected}" class="btn"/> <input type="button" value="{$LANG.masspayall}" onclick="window.location='clientarea.php?action=masspay&all=true'" class="btn btn-primary"/>{/if}</td>
				<td class="text-right">{$LANG.invoicestotaldue}</td>
				<td>{$totalbalance}</td>
				<td colspan="2">&nbsp;</td>
			</tr>
	{/if}
		</tfoot>
	</table>
</form>
{/if}

{if $files}
<h3>{$LANG.clientareafiles}</h3>
<ul class="thumbnails">
{foreach from=$files item=file}
	<li class="span3">
		<h4><img src="images/file.png" class="valignbaseline" alt="File Icon"/> <a href="dl.php?type=f&id={$file.id}"><strong>{$file.title}</strong></a></h4>
		{$LANG.clientareafilesdate}: {$file.date}
	</li>
{/foreach}
</ul>
{/if}