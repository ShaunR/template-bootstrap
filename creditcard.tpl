<section>
	<div class="container">
		<div class="page-header">
			<h1>{$LANG.creditcard}</h1>
		</div>
		
		<div class="alert alert-warning text-center">
			<h3 class="alert-heading">Paying Invoice #{$invoiceid}</h3>
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
			<input type="hidden" name="action" value="submit">
			<input type="hidden" name="invoiceid" value="{$invoiceid}">
		
			{if $errormessage}
			<div class="alert alert-danger">
				<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
				<ul>
					{$errormessage}
				</ul>
			</div>
		{/if}
		
			<div class="row">
				<div class="col-md-6">
					<div class="page-header">
						<h2>{$LANG.creditcardyourinfo}</h2>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="firstname">{$LANG.clientareafirstname}</label>
						<div class="col-md-8">
							<input type="text" name="firstname" id="firstname" value="{$firstname}"{if in_array('firstname',$uneditablefields)} disabled="disabled" class="form-control disabled"{else} class="form-control"{/if}>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="lastname">{$LANG.clientarealastname}</label>
						<div class="col-md-8">
							<input type="text" name="lastname" id="lastname" value="{$lastname}"{if in_array('lastname',$uneditablefields)} disabled="disabled" class="disabled form-control"{else} class="form-control"{/if}>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="address1">{$LANG.clientareaaddress1}</label>
						<div class="col-md-8">
							<input type="text" name="address1" id="address1" value="{$address1}"{if in_array('address1',$uneditablefields)} disabled="disabled" class="disabled form-control"{else} class="form-control"{/if}>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="address2">{$LANG.clientareaaddress2}</label>
						<div class="col-md-8">
							<input type="text" name="address2" id="address2" value="{$address2}"{if in_array('address2',$uneditablefields)} disabled="disabled" class="disabled form-control"{else} class="form-control"{/if}>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="city">{$LANG.clientareacity}</label>
						<div class="col-md-8">
							<input type="text" name="city" id="city" value="{$city}"{if in_array('city',$uneditablefields)} disabled="disabled" class="disabled form-control"{else} class="form-control"{/if}>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="state">{$LANG.clientareastate}</label>
						<div class="col-md-8">
							<input type="text" name="state" id="state" value="{$state}"{if in_array('state',$uneditablefields)} disabled="disabled" class="disabled form-control"{else} class="form-control"{/if}>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="postcode">{$LANG.clientareapostcode}</label>
						<div class="col-md-8">
							<input type="text" name="postcode" id="postcode" value="{$postcode}"{if in_array('postcode',$uneditablefields)} disabled="disabled" class="disabled form-control"{else} class="form-control"{/if}>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="country">{$LANG.clientareacountry}</label>
						<div class="col-md-8">
							{$countriesdropdown}
							{literal}<script type="text/javascript">$("#country").addClass("form-control");</script>{/literal}
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="phonenumber">{$LANG.clientareaphonenumber}</label>
						<div class="col-md-8">
							<input type="text" name="phonenumber" id="phonenumber" value="{$phonenumber}"{if in_array('phonenumber',$uneditablefields)} disabled="disabled" class="disabled form-control"{else} class="form-control"{/if}>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="page-header">
						<h2>{$LANG.creditcarddetails}</h2>
					</div>
					<div class="well well-sm">
						<div class="radio">
							<label>
								<input type="radio" name="ccinfo" value="useexisting" {if $cardnum} checked="checked"{else} disabled="disabled"{/if}> 
								{$LANG.creditcarduseexisting}{if $cardnum} ({$cardnum}){/if}
							</label>
						</div>
						<div class="radio">
							<label for="ccinfo">
								<input type="radio" name="ccinfo" id="ccinfo" value="new" {if !$cardnum || $ccinfo eq "new"} checked="checked"{/if}> 
								{$LANG.creditcardenternewcard}
							</label>
						</div>
					</div>
					<fieldset name="useexistingfields" id="useexistingfields">
						{if $cardnum}
						<div class="form-group">
							<label class="col-md-4 control-label" for="cccvv2">{$LANG.creditcardcvvnumber}</label>
							<div class="col-md-2">
								<input type="text" name="cccvv2" id="cccvv2" class="form-control" value="{$cccvv}" autocomplete="off">
							</div>
							<div class="col-md-6">
								<span class="help-block"><a href="images/ccv.gif" onclick="$('#cvv2-help').modal();return false;">{$LANG.creditcardcvvwhere}</a></span>
							</div>
						</div>
						{/if}
					</fieldset>
					<fieldset name="usenewfields" id="usenewfields">
						<div class="form-group">
							<label class="col-md-4 control-label" for="cctype">{$LANG.creditcardcardtype}</label>
							<div class="col-md-8">
								<select name="cctype" id="cctype" class="newccinfo form-control">
									{foreach from=$acceptedcctypes item=cardtype}
									<option{if $cctype eq $cardtype} selected{/if}>{$cardtype}</option>
									{/foreach}
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="ccnumber">{$LANG.creditcardcardnumber}</label>
							<div class="col-md-8">
								<input type="text" name="ccnumber" id="ccnumber" value="{$ccnumber}" autocomplete="off" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="ccexpirymonth">{$LANG.creditcardcardexpires}</label>
							<div class="col-md-8">
								<div class="input-group">
									<select name="ccexpirymonth" id="ccexpirymonth" class="form-control">
										{foreach from=$months item=month}
										<option{if $ccexpirymonth eq $month} selected="selected"{/if}>{$month}</option>
										{/foreach}
									</select> 
									<span class="input-group-addon"> / </span>
									<select name="ccexpiryyear" class="form-control">
										{foreach from=$expiryyears item=year}
										<option{if $ccexpiryyear eq $year} selected="selected"{/if}>{$year}</option>
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
									<select name="ccstartmonth"  id="ccstartmonth" class="form-control">
										{foreach from=$months item=month}
										<option>{$month}</option>{/foreach}
									</select>
									<span class="input-group-addon"> / </span>
									<select name="ccstartyear" id="ccstartmonth" class="form-control">
										{foreach from=$years item=year}
											<option>{$year}</option>
										{/foreach}
									</select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="ccissuenum">{$LANG.creditcardcardissuenum}</label>
							<div class="col-md-3">
								<input type="text" name="ccissuenum" id="ccissuenum" maxlength="3" value="{$ccissuenum}" class="form-control">
							</div>
						</div>
						{/if}
						<div class="form-group">
							<label class="col-md-4 control-label" for="cccvv">{$LANG.creditcardcvvnumber}</label>
							<div class="col-md-3">
								<input type="text" name="cccvv" id="cccvv" size="5" value="{$cccvv}" autocomplete="off" class="form-control">
							</div>
							<div class="col-md-5">
								<div class="help-block"><a href="images/ccv.gif" onclick="$('#cvv2-help').modal();return false;">{$LANG.creditcardcvvwhere}</a></div>
							</div>
						</div>
						{if $shownostore}
						<div class="form-group">
							<label class="col-md-4 control-label" for="nostore"></label>
							<div class="col-md-8">
								<div class="checkbox">
									<label>
										<input type="checkbox" name="nostore" id="nostore"> 
										{$LANG.creditcardnostore}
									</label>
								</div>
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
			<div class="text-center alert alert-warning">
				<img src="images/padlock.gif" alt="Secure" style="vertical-align:text-bottom"> {$LANG.creditcardsecuritynotice}
			</div>
			<div class="text-center form-group">
				<button class="btn btn-primary" type="submit" onclick="$('#modalpleasewait').modal();">{$LANG.ordercontinuebutton}</button>
			</div>
		</form>
		
		<div class="modal fade" id="modalpleasewait">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header text-center">
						<img src="images/loadingsml.gif" alt="{$LANG.pleasewait}" style="vertical-align:baseline;">
						<span class="lead">{$LANG.pleasewait}</span>
					</div>
				</div>
			</div>
		</div>
		
		<div id="cvv2-help" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">{$LANG.creditcardcvvnumber}, {$LANG.creditcardcvvwhere}</h4>
					</div>
					<div class="modal-body text-center">
						<img src="images/ccv.gif" alt="cvv2 image">
					</div>
				</div>
			</div>
		</div>
		
		{/if}
	</div>
</section>
<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>
<script type="text/javascript" src="includes/jscript/creditcard.js"></script>
<script type="text/javascript">
	$(function() {
		$('#country').on('change', function() { $('#stateselect').addClass('form-control'); });
	});
</script>
