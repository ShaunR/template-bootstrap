<section>
	<div class="container">
		<h1>{$LANG.clientareanavcontacts}</h1>
		
		<ul class="nav nav-tabs" style="margin-bottom: 30px" >
			<li><a href="clientarea.php?action=details">{$LANG.clientareanavdetails}</a></li>
			{if $condlinks.updatecc}<li><a href="clientarea.php?action=creditcard">{$LANG.clientareanavccdetails}</a></li>{/if}
			<li class="active"><a href="clientarea.php?action=contacts">{$LANG.clientareanavcontacts}</a></li>
			<li><a href="clientarea.php?action=changepw">{$LANG.clientareanavchangepw}</a></li>
			{if $condlinks.security}<li><a href="clientarea.php?action=security">{$LANG.clientareanavsecurity}</a></li>{/if}
		</ul>
		
		{if $successful}
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$LANG.changessavedsuccessfully}
		</div>
		{/if}
		
		{if $errormessage}
		<div class="alert alert-danger">
			<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
			<ul>
				{$errormessage}
			</ul>
		</div>
		{/if}
		
		<form method="get" class="form-inline alert alert-info alert-block" action="clientarea.php">
			<input type="hidden" name="action" value="contacts">
			<label class="form-control-static" for="contactid">{$LANG.clientareachoosecontact}:</label>
			<div class="form-group">
				<select name="contactid" id="contactid" onchange="submit()" class="form-control">
					{foreach item=contact from=$contacts}
					<option value="{$contact.id}"{if $contact.id eq $contactid} selected="selected"{/if}>{$contact.name} - {$contact.email}</option>
					{/foreach}
					<option value="new" selected="selected">{$LANG.clientareanavaddcontact}</option>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">{$LANG.go}</button>
		</form>
		
		<form class="form-horizontal" method="post" action="clientarea.php?action=addcontact">
			<input type="hidden" name="submit" value="true">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-4 control-label" for="firstname">{$LANG.clientareafirstname}</label>
						<div class="col-md-8">
							<input type="text" name="firstname" id="firstname" class="form-control" value="{$contactfirstname}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="lastname">{$LANG.clientarealastname}</label>
						<div class="col-md-8">
							<input type="text" name="lastname" id="lastname" class="form-control" value="{$contactlastname}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="companyname">{$LANG.clientareacompanyname}</label>
						<div class="col-md-8">
							<input type="text" name="companyname" id="companyname" class="form-control" value="{$contactcompanyname}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="email">{$LANG.clientareaemail}</label>
						<div class="col-md-8">
							<input type="text" name="email" id="email" class="form-control" value="{$contactemail}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="phonenumber">{$LANG.clientareaphonenumber}</label>
						<div class="col-md-8">
							<input type="text" name="phonenumber" id="phonenumber" class="form-control" value="{$contactphonenumber}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label">{$LANG.subaccountactivate}</label>
						<div class="col-md-8">
							<div class="checkbox">
								<label>
									<input type="checkbox" name="subaccount" id="subaccount"{if $subaccount} checked="checked"{/if}> {$LANG.subaccountactivatedesc}
								</label>
							</div>
						</div>
						<script type="text/javascript">
						{literal}
							$(function(){
								$("#subaccount").change(function () {
									if($("#subaccount:checked").val()!=null) {
										$("#subaccountfields").removeClass("hide");
									} else {
										$("#subaccountfields").addClass("hide");
									}
								}).change();
							});
						{/literal}
						</script>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-4 control-label" for="address1">{$LANG.clientareaaddress1}</label>
						<div class="col-md-8">
							<input type="text" name="address1" id="address1" class="form-control" value="{$contactaddress1}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="address2">{$LANG.clientareaaddress2}</label>
						<div class="col-md-8">
							<input type="text" name="address2" id="address2" class="form-control" value="{$contactaddress2}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="city">{$LANG.clientareacity}</label>
						<div class="col-md-8">
							<input type="text" name="city" id="city" class="form-control" value="{$contactcity}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="state">{$LANG.clientareastate}</label>
						<div class="col-md-8">
							<input type="text" name="state" id="state" class="form-control" value="{$contactstate}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="postcode">{$LANG.clientareapostcode}</label>
						<div class="col-md-8">
							<input type="text" name="postcode" id="postcode" class="form-control" value="{$contactpostcode}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="country">{$LANG.clientareacountry}</label>
						<div class="col-md-8">
							{$countriesdropdown}
						</div>
					</div>
				</div>
			</div>
		
			<fieldset id="subaccountfields"{if !$subaccount} class="hide"{/if}>
				<hr>
				<div class="form-group">
					<label class="col-md-2 control-label" for="password">{$LANG.clientareapassword}</label>
					<div class="col-md-4">
						<input type="password" name="password" id="password" class="form-control">
					</div>
					<div class="col-md-6">
						<div class="help-block"></div>
					</div>
					<script type="text/javascript">
						{literal}
						$(function() {
							$('#password').keyup(function() {
								$(this).parent().parent().removeClass('has-warning has-error has-success');
								$(this).next().html("");
								if($(this).val().length == 0) return;
								var pwstrength = passwordStrength($(this).val());
								if(pwstrength > 75) {
									$(this).parent().parent().addClass("has-success");
									$(this).parent().next().children().html("{/literal}{$LANG.pwstrengthstrong}{literal}");
								} else if (pwstrength > 30) {
									$(this).parent().parent().addClass("has-warning");
									$(this).parent().next().children().html("{/literal}{$LANG.pwstrengthmoderate}{literal}");
								} else {
									$(this).parent().parent().addClass("has-error");
									$(this).parent().next().children().html("{/literal}{$LANG.pwstrengthweak}{literal}");
								}
								$('#password2').keyup();
							});
						});
						{/literal}
					</script>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label" for="password2">{$LANG.clientareaconfirmpassword}</label>
					<div class="col-md-4">
						<input type="password" name="password2" id="password2" class="form-control">
					</div>
					<div class="col-md-6">
						<div class="help-block"></div>
					</div>
					<script type="text/javascript">
						{literal}
						$(function() {
							$('#password2').keyup(function() {
								$(this).parent().parent().removeClass('has-error has-success');
								if($(this).val().length < 1) return;
								if($('#password').val() != $(this).val()) {
									$(this).parent().parent().addClass('has-error');
									$(this).parent().next().children().html("{/literal}{$LANG.clientareaerrorpasswordnotmatch}{literal}");
								} else {
									$(this).parent().parent().addClass('has-success');
									$(this).parent().next().children().html("");
								}
							});
						});
						{/literal}
					</script>
				</div>
				<strong>{$LANG.subaccountpermissions}</strong>
				<div class="row form-group">
					<div class="col-md-offset-2 col-md-4">
						<div class="checkbox">
							<label>
								<input type="checkbox" name="permissions[]" value="profile"{if in_array('profile',$permissions)} checked="checked"{/if}> 
								{$LANG.subaccountpermsprofile}
							</label>
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="permissions[]" id="permproducts" value="products"{if in_array('products',$permissions)} checked="checked"{/if}> 
								{$LANG.subaccountpermsproducts}
							</label>
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="permissions[]" id="permdomains" value="domains"{if in_array('domains',$permissions)} checked="checked"{/if}> 
								{$LANG.subaccountpermsdomains}
							</label>
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="permissions[]" id="perminvoices" value="invoices"{if in_array('invoices',$permissions)} checked="checked"{/if}>
								{$LANG.subaccountpermsinvoices}
							</label>
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="permissions[]" id="permaffiliates" value="affiliates"{if in_array('affiliates',$permissions)} checked="checked"{/if}>
								{$LANG.subaccountpermsaffiliates}
							</label>
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="permissions[]" id="permorders" value="orders"{if in_array('orders',$permissions)} checked="checked"{/if}>
								{$LANG.subaccountpermsorders}
							</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="checkbox">
							<label>
								<input type="checkbox" name="permissions[]" id="permcontacts" value="contacts"{if in_array('contacts',$permissions)} checked="checked"{/if}>
								{$LANG.subaccountpermscontacts}
							</label>
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="permissions[]" id="permmanageproducts" value="manageproducts"{if in_array('manageproducts',$permissions)} checked="checked"{/if}>
								{$LANG.subaccountpermsmanageproducts}
							</label>
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="permissions[]" id="permmanagedomains" value="managedomains"{if in_array('managedomains',$permissions)} checked="checked"{/if}>
								{$LANG.subaccountpermsmanagedomains}
							</label>
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="permissions[]" id="permtickets" value="tickets"{if in_array('tickets',$permissions)} checked="checked"{/if}>
								{$LANG.subaccountpermstickets}
							</label>
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="permissions[]" id="permemails" value="emails"{if in_array('emails',$permissions)} checked="checked"{/if}>
								{$LANG.subaccountpermsemails}
							</label>
						</div>
					</div>
				</div>
			</fieldset>
		
			<fieldset>
				<hr>
				<div class="row form-group">
					<label class="col-md-2 control-label">{$LANG.clientareacontactsemails}</label>
					<div class="col-md-10">
						<div class="checkbox">
							<label>
								<input type="checkbox" name="generalemails" id="generalemails" value="1"{if $generalemails} checked="checked"{/if}>
								{$LANG.clientareacontactsemailsgeneral}
							</label>
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="productemails" id="productemails" value="1"{if $productemails} checked="checked"{/if}>
								{$LANG.clientareacontactsemailsproduct}
							</label>
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="domainemails" id="domainemails" value="1"{if $domainemails} checked="checked"{/if}>
								{$LANG.clientareacontactsemailsdomain}
							</label>
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="invoiceemails" id="invoiceemails" value="1"{if $invoiceemails} checked="checked"{/if}>
								{$LANG.clientareacontactsemailsinvoice}
							</label>
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="supportemails" id="supportemails" value="1"{if $supportemails} checked="checked"{/if}>
								{$LANG.clientareacontactsemailssupport}
							</label>
						</div>
					</div>
				</div>
			</fieldset>
		
			<div class="form-group row">
				<div class="col-md-10 col-md-offset-2">
					<button type="submit" class="btn btn-primary">{$LANG.clientareasavechanges}</button>
					<input class="btn btn-default" type="reset" value="{$LANG.cancel}">
				</div>
			</div>
		</form>
		
		<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>
		{literal}
		<script type="text/javascript">
			$(function() { 
				$('#stateselect').addClass('form-control');
				$('#country').addClass('form-control');
			});
		</script>
		{/literal}
	</div>
</section>
