<div class="page-header">
	<h1>{$LANG.clientareanavcontacts}</h1>
</div>

<div class="tabbable">
	<ul class="nav nav-tabs">
		<li><a href="clientarea.php?action=details">{$LANG.clientareanavdetails}</a></li>
		{if $condlinks.updatecc}<li><a href="clientarea.php?action=creditcard">{$LANG.clientareanavccdetails}</a></li>{/if}
		<li class="active"><a href="clientarea.php?action=contacts">{$LANG.clientareanavcontacts}</a></li>
		<li><a href="clientarea.php?action=changepw">{$LANG.clientareanavchangepw}</a></li>
		{if $condlinks.security}<li><a href="clientarea.php?action=security">{$LANG.clientareanavsecurity}</a></li>{/if}
	</ul>
</div>

{if $successful}
<div class="alert alert-success">
	<button class="close" data-dismiss="alert">&times;</button>
	{$LANG.changessavedsuccessfully}
</div>
{/if}

{if $errormessage}
<div class="alert alert-error">
	<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
	<ul>
		{$errormessage}
	</ul>
</div>
{/if}

<form method="post" class="form-inline alert alert-info alert-block" action="clientarea.php">
	<input type="hidden" name="action" value="contacts"/>
	<label for="contactid">{$LANG.clientareachoosecontact}:</label>
	<select name="contactid" id="contactid" onchange="submit()">
	{foreach item=contact from=$contacts}
		<option value="{$contact.id}">{$contact.name} - {$contact.email}</option>
	{/foreach}
		<option value="new" selected="selected">{$LANG.clientareanavaddcontact}</option>
	</select>
	<input class="btn" type="submit" value="{$LANG.go}"/>
</form>

<form class="form-horizontal" method="post" action="clientarea.php">
	<input type="hidden" name="action" value="addcontact"/>
	<div class="row">
		<div class="span6">
			<div class="control-group">
				<label class="control-label" for="firstname">{$LANG.clientareafirstname}</label>
				<div class="controls">
					<input type="text" name="firstname" id="firstname" class="span3" value="{$contactfirstname}"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="lastname">{$LANG.clientarealastname}</label>
				<div class="controls">
					<input type="text" name="lastname" id="lastname" class="span3" value="{$contactlastname}"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="companyname">{$LANG.clientareacompanyname}</label>
				<div class="controls">
					<input type="text" name="companyname" id="companyname" class="span3" value="{$contactcompanyname}"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="email">{$LANG.clientareaemail}</label>
				<div class="controls">
					<input type="text" name="email" id="email" class="span3" value="{$contactemail}"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="phonenumber">{$LANG.clientareaphonenumber}</label>
				<div class="controls">
					<input type="text" name="phonenumber" id="phonenumber" class="span3" value="{$contactphonenumber}"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">{$LANG.subaccountactivate}</label>
				<div class="controls">
					<label class="checkbox">
						<input type="checkbox" name="subaccount" id="subaccount"{if $subaccount} checked="checked"{/if}/> {$LANG.subaccountactivatedesc}
					</label>
				</div>
				<script type="text/javascript">
				{literal}
					$(function(){
						$("#subaccount").click(function () {
							if($("#subaccount:checked").val()!=null) {
								$("#subaccountfields").fadeIn();
							} else {
								$("#subaccountfields").fadeOut();
							}
						});
					});
				{/literal}
				</script>
			</div>
		</div>
		<div class="span6">
			<div class="control-group">
				<label class="control-label" for="address1">{$LANG.clientareaaddress1}</label>
				<div class="controls">
					<input type="text" name="address1" id="address1" class="span3" value="{$contactaddress1}"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="address2">{$LANG.clientareaaddress2}</label>
				<div class="controls">
					<input type="text" name="address2" id="address2" class="span3" value="{$contactaddress2}"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="city">{$LANG.clientareacity}</label>
				<div class="controls">
					<input type="text" name="city" id="city" class="span3" value="{$contactcity}"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="state">{$LANG.clientareastate}</label>
				<div class="controls">
					<input type="text" name="state" id="state" class="span3" value="{$contactstate}"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="postcode">{$LANG.clientareapostcode}</label>
				<div class="controls">
					<input type="text" name="postcode" id="postcode" class="span3" value="{$contactpostcode}"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="country">{$LANG.clientareacountry}</label>
				<div class="controls">
					{$countriesdropdown}
				</div>
				{literal}<script type="text/javascript">$(function() { $('#country').addClass('span3'); });</script>{/literal}
			</div>
		</div>
	</div>

	<fieldset id="subaccountfields" class="{if !$subaccount} hide{/if}">
		<hr/>
		<div class="control-group">
			<label class="control-label" for="password">{$LANG.clientareapassword}</label>
			<div class="controls">
				<input type="password" name="password" id="password" class="span3"/>
				<span class="help-inline"></span>
			</div>
			<script type="text/javascript">
				{literal}
				$(function() {
					$('#password').keyup(function() {
						$(this).parent().parent().removeClass('warning error success');
						$(this).next().html("");
						if($(this).val().length == 0) return;
						var pwstrength = passwordStrength($(this).val());
						if(pwstrength > 75) {
							$(this).parent().parent().addClass("success");
							$(this).next().html("{/literal}{$LANG.pwstrengthstrong}{literal}");
						} else if (pwstrength > 30) {
							$(this).parent().parent().addClass("warning");
							$(this).next().html("{/literal}{$LANG.pwstrengthmoderate}{literal}");
						} else {
							$(this).parent().parent().addClass("error");
							$(this).next().html("{/literal}{$LANG.pwstrengthweak}{literal}");
						}
						$('#password2').keyup();
					});
				});
				{/literal}
			</script>
		</div>
		<div class="control-group">
			<label class="control-label" for="password2">{$LANG.clientareaconfirmpassword}</label>
			<div class="controls">
				<input type="password" name="password2" id="password2" class="span3"/>
				<span class="help-inline"></span>
			</div>
			<script type="text/javascript">
				{literal}
				$(function() {
					$('#password2').keyup(function() {
						$(this).parent().parent().removeClass('error success');
						if($(this).val().length < 1) return;
						if($('#password').val() != $(this).val()) {
							$(this).parent().parent().addClass('error');
							$(this).next().html("{/literal}{$LANG.clientareaerrorpasswordnotmatch}{literal}");
						} else {
							$(this).parent().parent().addClass('success');
							$(this).next().html("");
						}
					});
				});
				{/literal}
			</script>
		</div>
		{$LANG.subaccountpermissions}
		<div class="row">
			<div class="span6">
				<div class="control-group">
					<div class="controls">
						<label class="checkbox">
							<input type="checkbox" name="permissions[]" value="profile"{if in_array('profile',$permissions)} checked="checked"{/if}/>
							{$LANG.subaccountpermsprofile}
						</label>
					</div>
					<div class="controls">
						<label class="checkbox">
							<input type="checkbox" name="permissions[]" id="permproducts" value="products"{if in_array('products',$permissions)} checked="checked"{/if}/>
							{$LANG.subaccountpermsproducts}
						</label>
					</div>
					<div class="controls">
						<label class="checkbox">
							<input type="checkbox" name="permissions[]" id="permdomains" value="domains"{if in_array('domains',$permissions)} checked="checked"{/if}/>
							{$LANG.subaccountpermsdomains}
						</label>
					</div>
					<div class="controls">
						<label class="checkbox">
							<input type="checkbox" name="permissions[]" id="perminvoices" value="invoices"{if in_array('invoices',$permissions)} checked="checked"{/if}/>
							{$LANG.subaccountpermsinvoices}
						</label>
					</div>
					<div class="controls">
						<label class="checkbox">
							<input type="checkbox" name="permissions[]" id="permaffiliates" value="affiliates"{if in_array('affiliates',$permissions)} checked="checked"{/if}/>
							{$LANG.subaccountpermsaffiliates}
						</label>
					</div>
					<div class="controls">
						<label class="checkbox">
							<input type="checkbox" name="permissions[]" id="permorders" value="orders"{if in_array('orders',$permissions)} checked="checked"{/if}/>
							{$LANG.subaccountpermsorders}
						</label>
					</div>
				</div>
			</div>
			<div class="span6">
				<div class="control-group">
					<div class="controls">
						<label class="checkbox">
							<input type="checkbox" name="permissions[]" id="permcontacts" value="contacts"{if in_array('contacts',$permissions)} checked="checked"{/if}/>
							{$LANG.subaccountpermscontacts}
						</label>
					</div>
					<div class="controls">
						<label class="checkbox">
							<input type="checkbox" name="permissions[]" id="permmanageproducts" value="manageproducts"{if in_array('manageproducts',$permissions)} checked="checked"{/if}/>
							{$LANG.subaccountpermsmanageproducts}
						</label>
					</div>
					<div class="controls">
						<label class="checkbox">
							<input type="checkbox" name="permissions[]" id="permmanagedomains" value="managedomains"{if in_array('managedomains',$permissions)} checked="checked"{/if}/>
							{$LANG.subaccountpermsmanagedomains}
						</label>
					</div>
					<div class="controls">
						<label class="checkbox">
							<input type="checkbox" name="permissions[]" id="permtickets" value="tickets"{if in_array('tickets',$permissions)} checked="checked"{/if}/>
							{$LANG.subaccountpermstickets}
						</label>
					</div>
					<div class="controls">
						<label class="checkbox">
							<input type="checkbox" name="permissions[]" id="permemails" value="emails"{if in_array('emails',$permissions)} checked="checked"{/if}/>
							{$LANG.subaccountpermsemails}
						</label>
					</div>
				</div>
			</div>
		</div>
	</fieldset>

	<fieldset>
		<hr/>
		<div class="control-group">
			<label class="control-label">{$LANG.clientareacontactsemails}</label>
			<div class="controls">
				<label class="checkbox">
					<input type="checkbox" name="generalemails" id="generalemails" value="1"{if $generalemails} checked="checked"{/if}/>
					<span>{$LANG.clientareacontactsemailsgeneral}</span>
				</label>
			</div>
			<div class="controls">
				<label class="checkbox">
					<input type="checkbox" name="productemails" id="productemails" value="1"{if $productemails} checked="checked"{/if}/>
					<span>{$LANG.clientareacontactsemailsproduct}</span>
				</label>
			</div>
			<div class="controls">
				<label class="checkbox">
					<input type="checkbox" name="domainemails" id="domainemails" value="1"{if $domainemails} checked="checked"{/if}/>
					{$LANG.clientareacontactsemailsdomain}
				</label>
			</div>
			<div class="controls">
				<label class="checkbox">
					<input type="checkbox" name="invoiceemails" id="invoiceemails" value="1"{if $invoiceemails} checked="checked"{/if}/>
					{$LANG.clientareacontactsemailsinvoice}
				</label>
			</div>
			<div class="controls">
				<label class="checkbox">
					<input type="checkbox" name="supportemails" id="supportemails" value="1"{if $supportemails} checked="checked"{/if}/>
					{$LANG.clientareacontactsemailssupport}
				</label>
			</div>
		</div>
	</fieldset>

	<div class="form-actions">
		<input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}"/>
		<input class="btn" type="reset" value="{$LANG.cancel}"/>
	</div>
</form>

<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>
