<section>
	<div class="container">
		<h1>{$LANG.clientareanavccdetails}</h1>
		
		<div class="tabbable">
			<ul class="nav nav-tabs">
				<li><a href="clientarea.php?action=details">{$LANG.clientareanavdetails}</a></li>
				<li class="active"><a href="clientarea.php?action=creditcard">{$LANG.clientareanavccdetails}</a></li>
				<li><a href="clientarea.php?action=contacts">{$LANG.clientareanavcontacts}</a></li>
				<li><a href="clientarea.php?action=changepw">{$LANG.clientareanavchangepw}</a></li>
				{if $condlinks.security}<li><a href="clientarea.php?action=security">{$LANG.clientareanavsecurity}</a></li>{/if}
			</ul>
		</div>
		
		{if $remoteupdatecode}
			{$remoteupdatecode}
		{else}
		
		{if $successful}
		<div class="alert alert-success alert-dismissable" style="margin-top:20px;">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$LANG.changessavedsuccessfully}
		</div>
		{/if}
		
		{if $errormessage}
		<div class="alert alert-danger" style="margin-top:20px;">
			<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
			<ul>
				{$errormessage}
			</ul>
		</div>
		{/if}
		
		
		<div class="row">
			<div class="col-md-6">
				<h3>{$LANG.creditcarddetails}</h3>
				<fieldset class="form-horizontal">
					<div class="form-group">
						<label class="col-md-4 control-label">{$LANG.creditcardcardtype}</label>
						<div class="col-md-8">
							<input type="text" value="{$cardtype}" readonly="readonly" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label">{$LANG.creditcardcardnumber}</label>
						<div class="col-md-8">
							<input type="text" value="{$cardnum}" readonly="readonly" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label">{$LANG.creditcardcardexpires}</label>
						<div class="col-md-8">
							<input type="text" value="{$cardexp}" readonly="readonly" class="form-control">
						</div>
					</div>
					{if $cardissuenum}
					<div class="form-group">
						<label class="col-md-4 control-label">{$LANG.creditcardcardissuenum}</label>
						<div class="col-md-8">
							<input type="text" value="{$cardissuenum}" readonly="readonly" class="form-control">
						</div>
					</div>
					{/if}
					{if $cardstart}
					<div class="form-group">
						<label class="col-md-4 control-label">{$LANG.creditcardcardstart}</label>
						<div class="col-md-8">
							<input type="text" value="{$cardstart}" readonly="readonly" class="form-control">
						</div>
					</div>
					{/if}
					{if $allowcustomerdelete && $cardtype}
					<div class="text-right">
						<form method="post" action="{$smarty.server.PHP_SELF}">
							<input type="hidden" name="action" value="creditcard">
							<button type="submit" name="remove" value="{$LANG.creditcarddelete}" class="btn btn-danger">{$LANG.creditcarddelete}</button>
						</form>
					</div>
					{/if}
				</fieldset>
			</div>
			<div class="col-md-6">
				<form class="form-horizontal" method="post" action="clientarea.php">
					<input type="hidden" name="action" value="creditcard">
					<h3>{$LANG.creditcardenternewcard}</h3>
					<div class="form-group">
						<label class="col-md-4 control-label" for="cctype">{$LANG.creditcardcardtype}</label>
						<div class="col-md-8">
							<select name="cctype" id="cctype" class="form-control">
							{foreach key=num item=cardtype from=$acceptedcctypes}
								<option>{$cardtype}</option>
							{/foreach}
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="ccnumber">{$LANG.creditcardcardnumber}</label>
						<div class="col-md-8">
							<input type="text" name="ccnumber" id="ccnumber" autocomplete="off" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="ccexpirymonth">{$LANG.creditcardcardexpires}</label>
						<div class="col-md-8">
							<div class="input-group">
								<select name="ccexpirymonth" id="ccexpirymonth" class="form-control">
									{foreach from=$months item=month}
									<option>{$month}</option>
									{/foreach}
								</select>
								<span class="input-group-addon">/</span>
								<select name="ccexpiryyear" class="form-control">
									{foreach from=$expiryyears item=year}
									<option>{$year}</option>
									{/foreach}
								</select>
							</div>
						</div>
					</div>
					{if $showccissuestart}
					<div class="form-group">
						<label class="col-md-4 control-label" for="ccstartmonth">{$LANG.creditcardcardstart}</label>
						<div class="col-md-8">
							<div class="input-group">
								<select name="ccstartmonth" id="ccstartmonth" class="form-control">
									{foreach from=$months item=month}
									<option>{$month}</option>
									{/foreach}
								</select>
								<span class="input-group-addon">/</span>
								<select name="ccstartyear" class="form-control">
									{foreach from=$startyears item=year}
									<option>{$year}</option>
									{/foreach}
								</select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="ccissuenum">{$LANG.creditcardcardissuenum}</label>
						<div class="col-md-8">
							<input type="text" name="ccissuenum" id="ccissuenum" maxlength="3" class="form-control">
						</div>
					</div>
					{/if}
					<div class="form-group">
						<label class="col-md-4 control-label" for="cardcvv">{$LANG.creditcardcvvnumber}</label>
						<div class="col-md-8">
							<input type="text" class="form-control" name="cardcvv" id="cardcvv" value="{$cardcvv}" autocomplete="off">
						</div>
					</div>
					<div class="form-group text-right">
						<input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}">
						<input class="btn btn-default" type="reset" value="{$LANG.cancel}">
					</div>
				</form>
			</div>
		</div>
		{/if}
	</div>
</section>
