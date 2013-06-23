<div class="page-header">
	<h1>{$LANG.managing} {$domain} <small>{$LANG.domaincontactinfo}</small></h1>
</div>

{if $successful}
<div class="alert alert-success fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$LANG.changessavedsuccessfully}
</div>
{/if}

{if $error}
<div class="alert alert-error fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$error}
</div>
{/if}

<form method="post" action="{$smarty.server.PHP_SELF}?action=domaincontacts" >
	<input type="hidden" name="sub" value="save"/>
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<div class="row">
	{foreach from=$contactdetails name=contactdetails key=k item=i}
		<div class="span4">
			<h2>{$k}</h2>
			<fieldset class="well">
				<label class="radio"><input type="radio" name="wc[{$k}]" value="contact" onclick="toggleContact('#{$k}')"{if $defaultns} checked="checked"{/if}/>{$LANG.domaincontactusexisting}</label>
				<label class="radio"><input type="radio" name="wc[{$k}]" value="custom" onclick="toggleCustom('#{$k}')"{if !$defaultns} checked="checked"{/if}/>{$LANG.domaincontactusecustom}</label>
				<hr/>
				<div id="{$k}choosecontact" {if !$defaultns}class="hide"{/if}>
					<label for="{$k}contact">{$LANG.domaincontactchoose}</label>
					<select name="sel[{$k}]" class="span3">
						<option value="u{$clientsdetails.userid}" selected="selected">{$LANG.domaincontactprimary}</option>
					{foreach key=num item=contact from=$contacts}
						<option value="c{$contact.id}">{$contact.name}</option>
					{/foreach}
					</select>
				</div>
				<div id="{$k}custom" {if $defaultns}class="hide"{/if}>
		{foreach from=$i key=kk item=ii}
					<label for="{$k}{$kk|replace:" ":""}">{$kk}</label>
					<input type="text" name="contactdetails[{$k}][{$kk}]" id="{$k}{$kk|replace:" ":""}" value="{$ii}" class="span3"/>
		{/foreach}
				</div>
			</fieldset>
		</div>
	{/foreach}
	</div>
	<div class="text-center">
		<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn" title="{$LANG.clientareabacklink}">{$LANG.clientareabacklink}</a>
		<input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary"/>
	</div>
</form>

<script type="text/javascript">
	{literal}
		function toggleCustom(target) { $(target+'choosecontact').hide(); $(target+'custom').fadeIn(); }
		function toggleContact(target) { $(target+'custom').hide(); $(target+'choosecontact').fadeIn(); }
	{/literal}
</script>
