<div class="page-header">
	<h1>{$LANG.clientareanavdetails}</h1>
</div>

<div class="tabbable">
	<ul class="nav nav-tabs">
		<li class="active"><a href="clientarea.php?action=details">{$LANG.clientareanavdetails}</a></li>
{if $condlinks.updatecc}
		<li><a href="clientarea.php?action=creditcard">{$LANG.clientareanavccdetails}</a></li>
{/if}
		<li><a href="clientarea.php?action=contacts">{$LANG.clientareanavcontacts}</a></li>
		<li><a href="clientarea.php?action=changepw">{$LANG.clientareanavchangepw}</a></li>
		{if $condlinks.security}<li><a href="clientarea.php?action=security">{$LANG.clientareanavsecurity}</a></li>{/if}
	</ul>
</div>

{if $successful}
<div class="alert alert-success fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$LANG.changessavedsuccessfully}
</div>
{/if}

{if $errormessage}
<div class="alert alert-error fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
	<ul>
		{$errormessage}
	</ul>
</div>
{/if}

<form class="form-horizontal" method="post" action="clientarea.php">
	<input type="hidden" name="action" value="details">
	<div class="row">
		<div class="span6">
			 <div class="control-group">
				 <label class="control-label" for="firstname">{$LANG.clientareafirstname}</label>
				<div class="controls">
					 <input type="text" name="firstname" id="firstname" class="span3" value="{$clientfirstname}"{if in_array('firstname',$uneditablefields)} disabled="disabled" class="disabled"{/if} />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="lastname">{$LANG.clientarealastname}</label>
				<div class="controls">
					<input type="text" name="lastname" id="lastname" class="span3" value="{$clientlastname}"{if in_array('lastname',$uneditablefields)} disabled="disabled" class="disabled"{/if} />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="companyname">{$LANG.clientareacompanyname}</label>
				<div class="controls">
					<input type="text" name="companyname" id="companyname" class="span3" value="{$clientcompanyname}"{if in_array('companyname',$uneditablefields)} disabled="disabled" class="disabled"{/if} />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="email">{$LANG.clientareaemail}</label>
				<div class="controls">
					<input type="text" name="email" id="email" class="span3" value="{$clientemail}"{if in_array('email',$uneditablefields)} disabled="disabled" class="disabled"{/if} />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="phonenumber">{$LANG.clientareaphonenumber}</label>
				<div class="controls">
					<input type="text" name="phonenumber" id="phonenumber" class="span3" value="{$clientphonenumber}"{if in_array('phonenumber',$uneditablefields)} disabled="disabled" class="disabled"{/if} />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="paymentmethod">{$LANG.paymentmethod}</label>
				<div class="controls">
					<select name="paymentmethod" id="paymentmethod" class="span3">
						<option value="none">{$LANG.paymentmethoddefault}</option>
					{foreach from=$paymentmethods item=method}
						<option value="{$method.sysname}"{if $method.sysname eq $defaultpaymentmethod} selected="selected"{/if}>{$method.name}</option>
					{/foreach}
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="billingcontact">{$LANG.defaultbillingcontact}</label>
				<div class="controls">
					<select name="billingcid" id="billingcontact" class="span3">
						<option value="0">{$LANG.usedefaultcontact}</option>
					{foreach from=$contacts item=contact}
						<option value="{$contact.id}"{if $contact.id eq $billingcid} selected="selected"{/if}>{$contact.name}</option>
					{/foreach}
					</select>
				</div>
			</div>
		</div>
		<div class="span6">
			<div class="control-group">
				<label class="control-label" for="address1">{$LANG.clientareaaddress1}</label>
				<div class="controls">
					<input type="text" name="address1" id="address1" class="span3" value="{$clientaddress1}"{if in_array('address1',$uneditablefields)} disabled="disabled" class="disabled"{/if} />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="address2">{$LANG.clientareaaddress2}</label>
				<div class="controls">
					<input type="text" name="address2" id="address2" class="span3" value="{$clientaddress2}"{if in_array('address2',$uneditablefields)} disabled="disabled" class="disabled"{/if} />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="city">{$LANG.clientareacity}</label>
				<div class="controls">
					<input type="text" name="city" id="city" class="span3" value="{$clientcity}"{if in_array('city',$uneditablefields)} disabled="disabled" class="disabled"{/if} />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="state">{$LANG.clientareastate}</label>
				<div class="controls">
					<input type="text" name="state" id="state" class="span3" value="{$clientstate}"{if in_array('state',$uneditablefields)} disabled="disabled" class="disabled"{/if} />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="postcode">{$LANG.clientareapostcode}</label>
				<div class="controls">
					<input type="text" name="postcode" id="postcode" class="span3" value="{$clientpostcode}"{if in_array('postcode',$uneditablefields)} disabled="disabled" class="disabled"{/if} />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="country">{$LANG.clientareacountry}</label>
				<div class="controls">
					{$clientcountriesdropdown}
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="emailoptout">{$LANG.emailoptout}</label>
				<div class="controls">
					<label class="checkbox" for="emailoptout">
						<input type="checkbox" value="1" name="emailoptout" id="emailoptout"{if $emailoptout} checked="checked"{/if}/>
						{$LANG.emailoptoutdesc}
					</label>
				</div>
			</div>
		</div>
	</div>
{if $customfields}
	<hr/>
	<div class="row">
		<div class="span6">
	{foreach from=$customfields key=num item=customfield}
			<div class="control-group">
				<label class="control-label" for="customfield{$customfield.id}">{$customfield.name}</label>
				<div class="controls">
					{$customfield.input} <span class="help-inline">{$customfield.description}</span>
				</div>
			</div>
	{/foreach}
		</div>
	</div>
{/if}
	<div class="form-actions">
		<input class="btn btn-primary" type="submit" name="save" value="{$LANG.clientareasavechanges}"/>
		<input class="btn" type="reset" value="{$LANG.cancel}">
	</div>
</form>

{literal}
<script type="text/javascript">
   $(function() {
      // Make custom field inputs the correct size
      $('input[type=text]').addClass('span3');
		$('select').addClass('span3');
	});
</script>
{/literal}

<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>
