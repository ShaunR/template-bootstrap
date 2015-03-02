<section>
	<div class="container">
		<h1>{$LANG.clientareanavdetails}</h1>
		
		<ul class="nav nav-tabs" style="margin-bottom: 30px;">
			<li class="active"><a href="clientarea.php?action=details">{$LANG.clientareanavdetails}</a></li>
			{if $condlinks.updatecc}<li><a href="clientarea.php?action=creditcard">{$LANG.clientareanavccdetails}</a></li>{/if}
			<li><a href="clientarea.php?action=contacts">{$LANG.clientareanavcontacts}</a></li>
			<li><a href="clientarea.php?action=changepw">{$LANG.clientareanavchangepw}</a></li>
			{if $condlinks.security}<li><a href="clientarea.php?action=security">{$LANG.clientareanavsecurity}</a></li>{/if}
		</ul>
		
		{if $successful}
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$LANG.changessavedsuccessfully}
		</div>
		{/if}
		
		{if $errormessage}
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
			<ul>
				{$errormessage}
			</ul>
		</div>
		{/if}
		
		<form class="form-horizontal" method="post" action="clientarea.php">
			<input type="hidden" name="action" value="details">
			<div class="row">
				<div class="col-md-6">
					 <div class="form-group">
						 <label class="col-md-4 control-label" for="firstname">{$LANG.clientareafirstname}</label>
						<div class="col-md-8">
							 <input type="text" name="firstname" id="firstname" class="form-control" value="{$clientfirstname}"{if in_array('firstname',$uneditablefields)} disabled="disabled" class="disabled"{/if} >
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="lastname">{$LANG.clientarealastname}</label>
						<div class="col-md-8">
							<input type="text" name="lastname" id="lastname" class="form-control" value="{$clientlastname}"{if in_array('lastname',$uneditablefields)} disabled="disabled" class="disabled"{/if} >
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="companyname">{$LANG.clientareacompanyname}</label>
						<div class="col-md-8">
							<input type="text" name="companyname" id="companyname" class="form-control" value="{$clientcompanyname}"{if in_array('companyname',$uneditablefields)} disabled="disabled" class="disabled"{/if} >
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="email">{$LANG.clientareaemail}</label>
						<div class="col-md-8">
							<input type="text" name="email" id="email" class="form-control" value="{$clientemail}"{if in_array('email',$uneditablefields)} disabled="disabled" class="disabled"{/if} >
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="phonenumber">{$LANG.clientareaphonenumber}</label>
						<div class="col-md-8">
							<input type="text" name="phonenumber" id="phonenumber" class="form-control" value="{$clientphonenumber}"{if in_array('phonenumber',$uneditablefields)} disabled="disabled" class="disabled"{/if} >
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="paymentmethod">{$LANG.paymentmethod}</label>
						<div class="col-md-8">
							<select name="paymentmethod" id="paymentmethod" class="form-control">
								<option value="none">{$LANG.paymentmethoddefault}</option>
								{foreach from=$paymentmethods item=method}
								<option value="{$method.sysname}"{if $method.sysname eq $defaultpaymentmethod} selected="selected"{/if}>{$method.name}</option>
								{/foreach}
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="billingcontact">{$LANG.defaultbillingcontact}</label>
						<div class="col-md-8">
							<select name="billingcid" id="billingcontact" class="form-control">
								<option value="0">{$LANG.usedefaultcontact}</option>
								{foreach from=$contacts item=contact}
								<option value="{$contact.id}"{if $contact.id eq $billingcid} selected="selected"{/if}>{$contact.name}</option>
								{/foreach}
							</select>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-4 control-label" for="address1">{$LANG.clientareaaddress1}</label>
						<div class="col-md-8">
							<input type="text" name="address1" id="address1" class="form-control" value="{$clientaddress1}"{if in_array('address1',$uneditablefields)} disabled="disabled" class="disabled"{/if} >
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="address2">{$LANG.clientareaaddress2}</label>
						<div class="col-md-8">
							<input type="text" name="address2" id="address2" class="form-control" value="{$clientaddress2}"{if in_array('address2',$uneditablefields)} disabled="disabled" class="disabled"{/if} >
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="city">{$LANG.clientareacity}</label>
						<div class="col-md-8">
							<input type="text" name="city" id="city" class="form-control" value="{$clientcity}"{if in_array('city',$uneditablefields)} disabled="disabled" class="disabled"{/if} >
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="state">{$LANG.clientareastate}</label>
						<div class="col-md-8">
							<input type="text" name="state" id="state" class="form-control" value="{$clientstate}"{if in_array('state',$uneditablefields)} disabled="disabled" class="disabled"{/if} >
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="postcode">{$LANG.clientareapostcode}</label>
						<div class="col-md-8">
							<input type="text" name="postcode" id="postcode" class="form-control" value="{$clientpostcode}"{if in_array('postcode',$uneditablefields)} disabled="disabled" class="disabled"{/if} >
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="country">{$LANG.clientareacountry}</label>
						<div class="col-md-8">
							{$clientcountriesdropdown}
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="emailoptout">{$LANG.emailoptout}</label>
						<div class="col-md-8">
							<div class="checkbox">
								<label for="emailoptout">
									<input type="checkbox" value="1" name="emailoptout" id="emailoptout"{if $emailoptout} checked="checked"{/if}>
									{$LANG.emailoptoutdesc}
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		
			{if $customfields}
			<hr>
			{foreach key=num item=customfield from=$customfields}
			{if $customfield.type == "tickbox"}
			<div class="form-group">
				<div class="col-md-10 col-md-offset-2">
					<div class="checkbox">
						<label>
							{$customfield.input} {$customfield.description}
						</label>
					</div>
				</div>
			</div>
			{else}
			<div class="form-group">
				<label class="col-md-2 control-label" for="customfield{$customfield.id}">{$customfield.name}</label>
				<div class="col-md-4">{$customfield.input}</div>
				<div class="col-md-6">
					<div class="form-control-static">
						{$customfield.description}
					</div>
				</div>
			</div>
			{/if}
			{/foreach}
			{/if}
		
			<div class="form-group">
				<div class="col-md-10 col-md-offset-2">
					<input class="btn btn-primary" type="submit" name="save" value="{$LANG.clientareasavechanges}">
					<input class="btn btn-default" type="reset" value="{$LANG.cancel}">
				</div>
			</div>
		</form>
		
		<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>
		
		{literal}
		<script type="text/javascript">
			$(function() {
				// Make custom field inputs the correct size
				$('input[type=text]').addClass('form-control');
				$('select').addClass('form-control');
				$('#country').on('change', function() { $('#stateselect').addClass('form-control'); });
			});
		</script>
		{/literal}
	</div>
</section>
