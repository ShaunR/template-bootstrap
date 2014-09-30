<section>
	<div class="container">
		<h1>{$LANG.upgradedowngradepackage}</h1>
		
		<div class="alert alert-info">
			<span class="lead">{$LANG.orderproduct}: <strong>{$productname}</strong>{if $domain} ({$domain}){/if}</span>
		</div>
		
		{if $overdueinvoice}
		
		<div class="alert alert-danger">
			{$LANG.upgradeerroroverdueinvoice}
		</div>
		
		<p class="text-center">
			<a href="clientarea.php?action=productdetails&id={$id}" class="btn btn-primary">{$LANG.clientareabacklink}</a>
		</p>
		
		{elseif $existingupgradeinvoice}
		
		<div class="alert alert-danger">{$LANG.upgradeexistingupgradeinvoice}</div>
		
		<div class="text-center">
			<a href="clientarea.php?action=productdetails&amp;id={$id}" title="{$LANG.clientareabacklink}" class="btn btn-default">{$LANG.clientareabacklink}</a>
			<a href="submitticket.php" title="{$LANG.submitticketdescription}" class="btn btn-primary">{$LANG.submitticketdescription}</a>
		</div>
		
		{else}
		
		{if $type eq "package"}
		
		<p>{$LANG.upgradechoosepackage}</p>
		
		<div class="list-group">
			{foreach key=num item=upgradepackage from=$upgradepackages}
			<form method="post" action="upgrade.php" class="list-group-item">
				<input type="hidden" name="step" value="2">
				<input type="hidden" name="type" value="{$type}">
				<input type="hidden" name="id" value="{$id}">
				<input type="hidden" name="pid" value="{$upgradepackage.pid}">
				<div class="row">
					<div class="col-md-6">
						<h4>{$upgradepackage.name}</h4>
					</div>
					<div class="col-md-4">
						{if $upgradepackage.pricing.type eq "free"}
						{$LANG.orderfree}
						<input type="hidden" name="billingcycle" value="free" class="form-control">
						{elseif $upgradepackage.pricing.type eq "onetime"}
						{$upgradepackage.pricing.onetime} {$LANG.orderpaymenttermonetime}
						<input type="hidden" name="billingcycle" value="onetime" class="form-control">
						{elseif $upgradepackage.pricing.type eq "recurring"}
						<select name="billingcycle" class="form-control">
							{if $upgradepackage.pricing.monthly}<option value="monthly">{$upgradepackage.pricing.monthly}</option>{/if}
							{if $upgradepackage.pricing.quarterly}<option value="quarterly">{$upgradepackage.pricing.quarterly}</option>{/if}
							{if $upgradepackage.pricing.semiannually}<option value="semiannually">{$upgradepackage.pricing.semiannually}</option>{/if}
							{if $upgradepackage.pricing.annually}<option value="annually">{$upgradepackage.pricing.annually}</option>{/if}
							{if $upgradepackage.pricing.biennially}<option value="biennially">{$upgradepackage.pricing.biennially}</option>{/if}
							{if $upgradepackage.pricing.triennially}<option value="triennially">{$upgradepackage.pricing.triennially}</option>{/if}
						</select>
						{/if}
					</div>
					<div class="col-md-2 text-right">
						<input type="submit" value="{$LANG.upgradedowngradechooseproduct}" class="btn btn-primary">
					</div>
				</div>
			</form>
		{/foreach}
		</div>
		
		{elseif $type eq "configoptions"}
		
		{if $errormessage}
		<div class="alert alert-danger">
			<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
			<ul>
				{$errormessage}
			</ul>
		</div>
		{/if}
		
		<p>{$LANG.upgradechooseconfigoptions}</p>
		
		<form method="post" action="upgrade.php">
			<input type="hidden" name="step" value="2">
			<input type="hidden" name="type" value="{$type}">
			<input type="hidden" name="id" value="{$id}">
			<div class="row">
				<div class="col-md-3 col-md-offset-6">
					<strong>{$LANG.upgradecurrentconfig}</strong>
				</div>
				<div class="col-md-3">
					<strong>{$LANG.upgradenewconfig}</strong>
				</div>
			</div>
			<hr>
			{foreach key=num item=configoption from=$configoptions}
			<div class="row">
				<div class="col-md-6">
					{$configoption.optionname}
				</div>
				<div class="col-md-3">
					{if $configoption.optiontype eq 1 || $configoption.optiontype eq 2}
					{$configoption.selectedname}
					{elseif $configoption.optiontype eq 3}
					{if $configoption.selectedqty}{$LANG.yes}{else}{$LANG.no}{/if}
					{elseif $configoption.optiontype eq 4}
					{$configoption.selectedqty} &times; {$configoption.options.0.name}
					{/if}
				</div>
				<div class="col-md-3">
					{if $configoption.optiontype eq 1 || $configoption.optiontype eq 2}
					<select name="configoption[{$configoption.id}]" class="form-control">
						{foreach key=num item=option from=$configoption.options}
						{if $option.selected}
						<option value="{$option.id}" selected="checked">{$LANG.upgradenochange}</option>
						{else}
						<option value="{$option.id}">{$option.nameonly} {$option.price}</option>
						{/if}
						{/foreach}
					</select>
					{elseif $configoption.optiontype eq 3}
					<div class="checkbox">
						<label>
							<input type="checkbox" name="configoption[{$configoption.id}]" value="1"{if $configoption.selectedqty} checked="checked"{/if}> 
							{$configoption.options.0.name}
						</label>
					</div>
					{elseif $configoption.optiontype eq 4}
					<div class="input-group">
						<input type="text" name="configoption[{$configoption.id}]" value="{$configoption.selectedqty}" class="form-control" >
						<span class="input-group-addon">&times; {$configoption.options.0.name}</span>
					</div>
					{/if}
				</div>
			</div>
			<hr>
			{/foreach}
		
			<div class="text-center form-group">
				<input type="submit" value="{$LANG.ordercontinuebutton}" class="btn btn-primary btn-lg">
			</div>
		
		</form>
		
		{/if}
		{/if}
	</div>
</section>
