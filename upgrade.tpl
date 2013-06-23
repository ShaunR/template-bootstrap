<div class="page-header">
	<h1>{$LANG.upgradedowngradepackage}</h1>
</div>

<div class="alert alert-info">
	<span class="lead">{$LANG.orderproduct}: <strong>{if $groupname}{$groupname} - {/if}{$productname}</strong>{if $domain} ({$domain}){/if}</span>
</div>

{if $overdueinvoice}

<div class="alert alert-error">
	{$LANG.upgradeerroroverdueinvoice}
</div>

<div class="text-center marginbottom">
	<a href="clientarea.php?action=productdetails&id={$id}" class="btn btn-large">{$LANG.clientareabacklink}</a>
</div>

{else}

{if $type eq "package"}

<p>{$LANG.upgradechoosepackage}</p>

<table class="table table-bordered table-striped">
{foreach key=num item=upgradepackage from=$upgradepackages}
	<tr>
		<td>
			<form method="post" action="upgrade.php" class="form-inline nomarginbottom">
				<input type="hidden" name="step" value="2"/>
				<input type="hidden" name="type" value="{$type}"/>
				<input type="hidden" name="id" value="{$id}"/>
				<input type="hidden" name="pid" value="{$upgradepackage.pid}"/>
				<div class="row-fluid">
					<div class="span6">
						<h4>{if $upgradepackage.groupname}{$upgradepackage.groupname} - {/if}{$upgradepackage.name}</h4>
					</div>
					<div class="span3">
						{if $upgradepackage.pricing.type eq "free"}{$LANG.orderfree}<input type="hidden" name="billingcycle" value="free"/>
						{elseif $upgradepackage.pricing.type eq "onetime"}{$upgradepackage.pricing.onetime} {$LANG.orderpaymenttermonetime}
						<input type="hidden" name="billingcycle" value="onetime"/>
						{elseif $upgradepackage.pricing.type eq "recurring"}
						<select name="billingcycle">
							{if $upgradepackage.pricing.monthly}<option value="monthly">{$upgradepackage.pricing.monthly}</option>{/if}
							{if $upgradepackage.pricing.quarterly}<option value="quarterly">{$upgradepackage.pricing.quarterly}</option>{/if}
							{if $upgradepackage.pricing.semiannually}<option value="semiannually">{$upgradepackage.pricing.semiannually}</option>{/if}
							{if $upgradepackage.pricing.annually}<option value="annually">{$upgradepackage.pricing.annually}</option>{/if}
							{if $upgradepackage.pricing.biennially}<option value="biennially">{$upgradepackage.pricing.biennially}</option>{/if}
							{if $upgradepackage.pricing.triennially}<option value="triennially">{$upgradepackage.pricing.triennially}</option>{/if}
						</select>
						{/if}
					</div>
					<div class="span3 text-right">
						<input type="submit" value="{$LANG.upgradedowngradechooseproduct}" class="btn"/>
					</div>
				</div>
			</form>
		</td>
	</tr>
{/foreach}
</table>

{elseif $type eq "configoptions"}

{if $errormessage}
<div class="alert alert-error">
	<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
	<ul>
		{$errormessage}
	</ul>
</div>
{/if}

<p>{$LANG.upgradechooseconfigoptions}</p>

<form method="post" action="upgrade.php" class="form-inline">
	<input type="hidden" name="step" value="2"/>
	<input type="hidden" name="type" value="{$type}"/>
	<input type="hidden" name="id" value="{$id}"/>
	<table class="table table-striped table-bordered">
		<thead>
			<tr>
				<th></th>
				<th>{$LANG.upgradecurrentconfig}</th>
				<th>{$LANG.upgradenewconfig}</th>
			</tr>
		</thead>
		<tbody>
		{foreach key=num item=configoption from=$configoptions}
			<tr>
				<td>{$configoption.optionname}</td>
				<td>
				{if $configoption.optiontype eq 1 || $configoption.optiontype eq 2}
					{$configoption.selectedname}
				{elseif $configoption.optiontype eq 3}
					{if $configoption.selectedqty}{$LANG.yes}{else}{$LANG.no}{/if}
				{elseif $configoption.optiontype eq 4}
					{$configoption.selectedqty} &times; {$configoption.options.0.name}
				{/if}
            </td>
            <td>
				{if $configoption.optiontype eq 1 || $configoption.optiontype eq 2}
					<select name="configoption[{$configoption.id}]" class="span3">
					{foreach key=num item=option from=$configoption.options}
						{if $option.selected}
						<option value="{$option.id}" selected="checked">{$LANG.upgradenochange}</option>
						{else}
						<option value="{$option.id}">{$option.nameonly} {$option.price}</option>
						{/if}
					{/foreach}
					</select>
				{elseif $configoption.optiontype eq 3}
					<label class="checkbox">
						<input type="checkbox" name="configoption[{$configoption.id}]" value="1"{if $configoption.selectedqty} checked="checked"{/if}/> 
						{$configoption.options.0.name}
					</label>
				{elseif $configoption.optiontype eq 4}
					<input type="text" name="configoption[{$configoption.id}]" value="{$configoption.selectedqty}" class="span3" > &times; {$configoption.options.0.name}
				{/if}
            </td>
			</tr>
		{/foreach}
		</tbody>
	</table>

	<div class="text-center">
		<input type="submit" value="{$LANG.ordercontinuebutton}" class="btn btn-primary btn-large"/>
	</div>

</form>

{/if}
{/if}
