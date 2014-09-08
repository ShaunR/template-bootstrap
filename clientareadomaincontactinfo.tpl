<section>
	<div class="container">
		<h1>{$LANG.managing} {$domain} <small>{$LANG.domaincontactinfo}</small></h1>
		
		{if $successful}
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$LANG.changessavedsuccessfully}
		</div>
		{/if}
		
		{if $error}
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			{$error}
		</div>
		{/if}
		
		<form method="post" action="{$smarty.server.PHP_SELF}?action=domaincontacts" >
			<input type="hidden" name="sub" value="save">
			<input type="hidden" name="domainid" value="{$domainid}">
			<div class="row">
			{foreach from=$contactdetails name=contactdetails key=k item=i}
				<div class="col-md-4">
					<h2>{$k}</h2>
					<fieldset class="well">
						<div class="radio">
							<label>
								<input type="radio" name="wc[{$k}]" value="contact" onclick="toggleContact('#{$k}')"{if $defaultns} checked="checked"{/if}> 
								{$LANG.domaincontactusexisting}
							</label>
						</div>
						<div class="radio">
							<label>
								<input type="radio" name="wc[{$k}]" value="custom" onclick="toggleCustom('#{$k}')"{if !$defaultns} checked="checked"{/if}> 
								{$LANG.domaincontactusecustom}
							</label>
						</div>
						<hr>
						<div id="{$k}choosecontact" {if !$defaultns}style="display:none"{/if}>
							<div class="form-group">
								<label for="{$k}contact">{$LANG.domaincontactchoose}</label>
								<select name="sel[{$k}]" class="form-control">
									<option value="u{$clientsdetails.userid}" selected="selected">{$LANG.domaincontactprimary}</option>
									{foreach key=num item=contact from=$contacts}
									<option value="c{$contact.id}">{$contact.name}</option>
									{/foreach}
								</select>
							</div>
						</div>
						<div id="{$k}custom" {if $defaultns}style="display:none"{/if}>
							{foreach from=$i key=kk item=ii}
							<div class="form-group">
								<label for="{$k}{$kk|replace:" ":""}">{$kk}</label>
								<input type="text" name="contactdetails[{$k}][{$kk}]" id="{$k}{$kk|replace:" ":""}" value="{$ii}" class="form-control">
							</div>
							{/foreach}
						</div>
					</fieldset>
				</div>
			{/foreach}
			</div>
			<div class="text-center form-group">
				<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-default" title="{$LANG.clientareabacklink}">{$LANG.clientareabacklink}</a>
				<button type="submit" class="btn btn-primary">{$LANG.clientareasavechanges}</button>
			</div>
		</form>
		
		<script type="text/javascript">
			{literal}
				function toggleCustom(target) { $(target+'choosecontact').hide(); $(target+'custom').fadeIn(); }
				function toggleContact(target) { $(target+'custom').hide(); $(target+'choosecontact').fadeIn(); }
			{/literal}
		</script>
	</div>
</section>
