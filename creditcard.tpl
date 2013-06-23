<div class="page-header">
	<h1>{$LANG.creditcard}</h1>
</div>

<div class="alert alert-warning text-center">
	<h2 class="alert-heading">Paying Invoice #{$invoiceid}</h2>
	Balance Due: <strong>{$balance}</strong>
</div>

{if $remotecode}

<div id="submitfrm" class="text-center">
{$remotecode}
<iframe name="3dauth" width="90%" height="600" scrolling="auto" src="about:blank" style="border:1px solid #fff;"></iframe>
</div>

{literal}
<script language="javascript">
setTimeout ( "autoForward()" , 1000 );
function autoForward() {
   var submitForm = $("#submitfrm").find("form");
    submitForm.submit();
}
</script>
{/literal}

{else}

<form method="post" action="creditcard.php" class="form-horizontal">
	<input type="hidden" name="action" value="submit"/>
	<input type="hidden" name="invoiceid" value="{$invoiceid}"/>

	{if $errormessage}
	<div class="alert alert-error">
		<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
		<ul>
			{$errormessage}
		</ul>
	</div>
{/if}

	<div class="row">
		<div class="span6">
			<div class="page-header">
				<h2>{$LANG.creditcardyourinfo}</h2>
			</div>
			<div class="control-group">
				<label class="control-label" for="firstname">{$LANG.clientareafirstname}</label>
				<div class="controls">
					<input type="text" name="firstname" id="firstname" value="{$firstname}"{if in_array('firstname',$uneditablefields)} disabled="disabled" class="disabled"{/if}/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="lastname">{$LANG.clientarealastname}</label>
				<div class="controls">
					<input type="text" name="lastname" id="lastname" value="{$lastname}"{if in_array('lastname',$uneditablefields)} disabled="disabled" class="disabled span4"{/if}/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="address1">{$LANG.clientareaaddress1}</label>
				<div class="controls">
					<input type="text" name="address1" id="address1" value="{$address1}"{if in_array('address1',$uneditablefields)} disabled="disabled" class="disabled"{/if}/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="address2">{$LANG.clientareaaddress2}</label>
				<div class="controls">
					<input type="text" name="address2" id="address2" value="{$address2}"{if in_array('address2',$uneditablefields)} disabled="disabled" class="disabled"{/if}/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="city">{$LANG.clientareacity}</label>
				<div class="controls">
					<input type="text" name="city" id="city" value="{$city}"{if in_array('city',$uneditablefields)} disabled="disabled" class="disabled"{/if}/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="state">{$LANG.clientareastate}</label>
				<div class="controls">
					<input type="text" name="state" id="state" value="{$state}"{if in_array('state',$uneditablefields)} disabled="disabled" class="disabled"{/if}/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="postcode">{$LANG.clientareapostcode}</label>
				<div class="controls">
					<input type="text" name="postcode" id="postcode" value="{$postcode}"{if in_array('postcode',$uneditablefields)} disabled="disabled" class="disabled"{/if}/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="country">{$LANG.clientareacountry}</label>
				<div class="controls">
					{$countriesdropdown}
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="phonenumber">{$LANG.clientareaphonenumber}</label>
				<div class="controls">
					<input type="text" name="phonenumber" id="phonenumber" value="{$phonenumber}"{if in_array('phonenumber',$uneditablefields)} disabled="disabled" class="disabled"{/if}/>
				</div>
			</div>
		</div>
		<div class="span6">
			<div class="page-header">
				<h2>{$LANG.creditcarddetails}</h2>
			</div>
			<div class="well well-small">
				<label class="radio"><input type="radio" name="ccinfo" value="useexisting" {if $cardnum} checked="checked"{else} disabled="disabled"{/if}/> {$LANG.creditcarduseexisting}{if $cardnum} ({$cardnum}){/if}</label>
				<label for="ccinfo" class="radio"><input type="radio" name="ccinfo" id="ccinfo" value="new" {if !$cardnum || $ccinfo eq "new"} checked="checked"{/if}/> {$LANG.creditcardenternewcard}</label>
			</div>
			<fieldset name="useexistingfields" id="useexistingfields">
				{if $cardnum}
				<div class="control-group">
					<label class="control-label" for="cccvv2">{$LANG.creditcardcvvnumber}</label>
					<div class="controls">
						<input type="text" name="cccvv2" id="cccvv2" class="span1" value="{$cccvv}" autocomplete="off"/>
						<span class="help-inline"><a href="images/ccv.gif" onclick="$('#cvv2-help').modal();return false;">{$LANG.creditcardcvvwhere}</a></span>
					</div>
				</div>
				{/if}
			</fieldset>
			<fieldset name="usenewfields" id="usenewfields">
				<div class="control-group">
					<label class="control-label" for="cctype">{$LANG.creditcardcardtype}</label>
					<div class="controls">
						<select name="cctype" id="cctype" class="newccinfo">
						{foreach from=$acceptedcctypes item=cardtype}
							<option{if $cctype eq $cardtype} selected{/if}/>{$cardtype}</option>
						{/foreach}
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="ccnumber">{$LANG.creditcardcardnumber}</label>
					<div class="controls">
						<input type="text" name="ccnumber" id="ccnumber" value="{$ccnumber}" autocomplete="off"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="ccexpirymonth">{$LANG.creditcardcardexpires}</label>
					<div class="controls">
						<select name="ccexpirymonth" id="ccexpirymonth">
						{foreach from=$months item=month}
							<option{if $ccexpirymonth eq $month} selected="selected"{/if}>{$month}</option>
						{/foreach}
						</select> 
						/ 
						<select name="ccexpiryyear">
						{foreach from=$expiryyears item=year}
							<option{if $ccexpiryyear eq $year} selected="selected"{/if}>{$year}</option>
						{/foreach}
						</select>
					</div>
				</div>
				{if $showccissuestart}
				<div class="control-group">
					<label class="control-label" for="ccstartmonth">{$LANG.creditcardcardstart}</label>
					<div class="controls">
						<select name="ccstartmonth"  id="ccstartmonth">
							{foreach from=$months item=month}
							<option>{$month}</option>{/foreach}
						</select>
						/ 
						<select name="ccstartyear" id="ccstartmonth">
							{foreach from=$years item=year}
								<option>{$year}</option>
							{/foreach}
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="ccissuenum">{$LANG.creditcardcardissuenum}</label>
					<div class="controls">
						<input type="text" name="ccissuenum" id="ccissuenum" maxlength="3" value="{$ccissuenum}" class="span1"/>
					</div>
				</div>
				{/if}
				<div class="control-group">
					<label class="control-label" for="cccvv">{$LANG.creditcardcvvnumber}</label>
					<div class="controls">
						<input type="text" name="cccvv" id="cccvv" size="5" value="{$cccvv}" autocomplete="off" class="span1"/>
						<span class="help-inline"><a href="images/ccv.gif" onclick="$('#cvv2-help').modal();return false;">{$LANG.creditcardcvvwhere}</a></span>
					</div>
				</div>
				{if $shownostore}
				<div class="control-group">
					<label class="control-label" for="nostore"></label>
					<div class="controls">
						<label class="checkbox"><input type="checkbox" name="nostore" id="nostore"/> {$LANG.creditcardnostore}</label>
					</div>
				</div>
				{/if}
			</fieldset>
			<script type="text/javascript">
				{literal}
				$(function() {
					$('input[name=ccinfo]').click(function() {
						if($(this).val() == 'useexisting') {
							$('#usenewfields').hide();
							$('#useexistingfields').fadeIn();
						} else {
							$('#useexistingfields').hide();
							$('#usenewfields').fadeIn();
						}
					});
					$('input[name=ccinfo]:checked').click();
				});
				{/literal}
			</script>
	    </div>
	</div>
	<div class="text-center marginbottom">
		<p class="marginbottom"><img src="images/padlock.gif" alt="Secure" class="valigntextbottom"/> {$LANG.creditcardsecuritynotice}</p>
		<input class="btn btn-large btn-primary" type="submit" value="{$LANG.ordercontinuebutton}" onclick="$('#modalpleasewait').modal();"/>
	</div>
</form>

<div class="modal hide fade in" id="modalpleasewait">
	<div class="modal-header text-center">
		<h3><img src="images/loadingsml.gif" alt="{$LANG.pleasewait}" class="valignbaseline"/> {$LANG.pleasewait}</h3>
	</div>
</div>

<div id="cvv2-help" class="modal fade in hide">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">&times;</button>
		<h3>{$LANG.creditcardcvvnumber}, {$LANG.creditcardcvvwhere}</h3>
	</div>
	<div class="modal-body text-center">
		<img src="images/ccv.gif" alt="cvv2 image"/>
	</div>
</div>

{/if}
