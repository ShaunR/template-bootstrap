<section>
	<div class="container">
		<h1>{$LANG.sslconfsslcertificate}</h1>
		
		{if !$status}
			<p>{$LANG.sslinvalidlink}</p>
			<input type="button" value="{$LANG.clientareabacklink}" class="btn btn-default" onclick="history.go(-1)">
		{else}
		
		{if $errormessage}
		<div class="alert alert-danger">
			<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
			<ul>
				{$errormessage}
			</ul>
		</div>
		{/if}
		
		<div class="page-header">
			<h2>{$LANG.sslcertinfo}</h2>
		</div>
		
		<ul class="thumbnails">
			<li class="col-md-6">
				<h4>{$LANG.sslcerttype}:</h4>
				{$certtype}
			</li>
			<li class="col-md-6">
				<h4>{$LANG.sslorderdate}:</h4>
				{$date}
			</li>
		{if $domain}
			<li class="col-md-6">
				<h4>{$LANG.domainname}:</h4>
				{$domain}
			</li>
		{/if}
			<li class="col-md-6">
				<h4>{$LANG.orderprice}:</h4>
				{$price}
			</li>
			<li class="col-md-6">
				<h4>{$LANG.sslstatus}:</h4>
				{$status}
			</li>
			{foreach from=$displaydata key=displaydataname item=displaydatavalue}
			<li class="col-md-6">
				<h4>{$displaydataname}:</h4>
				{$displaydatavalue}
			</li>
			{/foreach}
		</ul>
		
		{if $status eq "Awaiting Configuration"}
		
		<div class="page-header">
			<h2>{$LANG.sslserverinfo}</h2>
		</div>
		
		<p>{$LANG.sslserverinfodetails}</p>
		
		<form method="post" action="configuressl.php?cert={$cert}&amp;step=2" class="form-horizontal">
			<div class="control-group">
				<label class="control-label" for="servertype">{$LANG.sslservertype}</label>
				<div class="controls">
					<select name="servertype" id="servertype">
						<option value="" selected>{$LANG.pleasechooseone}</option>
					{foreach from=$webservertypes key=webservertypeid item=webservertype}
						<option value="{$webservertypeid}"{if $servertype eq $webservertypeid} selected="selected"{/if}>{$webservertype}</option>
					{/foreach}
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="csr">{$LANG.sslcsr}</label>
				<div class="controls">
					<textarea name="csr" id="csr" rows="7" class="col-md-6">-----BEGIN CERTIFICATE REQUEST-----
		
		-----END CERTIFICATE REQUEST-----</textarea>
				</div>
			</div>
		
		{foreach from=$additionalfields key=heading item=fields}
			<h3>{$heading}</h3>
			{foreach from=$fields item=vals}
			<div class="control-group">
				<label class="control-label">{$vals.name}</label>
				<div class="controls">
					{$vals.input}
					<span class="inline-help">{$vals.description}</span>
				</div>
			</div>
			{/foreach}
		{/foreach}
		
			<div class="page-header">
				<h2>{$LANG.ssladmininfo}</h2>
			</div>
		
			<p>{$LANG.ssladmininfodetails}</p>
			
			<div class="control-group">
				<label class="control-label" for="firstname">{$LANG.clientareafirstname}</label>
				<div class="controls">
					<input type="text" name="firstname" id="firstname" value="{$firstname}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="lastname">{$LANG.clientarealastname}</label>
				<div class="controls">
					<input type="text" name="lastname" id="lastname" value="{$lastname}">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="orgname">{$LANG.organizationname}</label>
				<div class="controls">
					<input type="text" name="orgname" id="orgname" value="{$orgname}" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="jobtitle">{$LANG.jobtitle}</label>
				<div class="controls">
					<input type="text" name="jobtitle" id="jobtitle" value="{$jobtitle}" /> &nbsp; {$LANG.jobtitlereqforcompany}
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="email">{$LANG.clientareaemail}</label>
				<div class="controls">
					<input type="text" name="email" id="email" value="{$email}" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="address1">{$LANG.clientareaaddress1}</label>
				<div class="controls">
					<input type="text" name="address1" id="address1" value="{$address1}" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="address2">{$LANG.clientareaaddress2}</label>
				<div class="controls">
					<input type="text" name="address2" id="address2" value="{$address2}" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="city">{$LANG.clientareacity}</label>
				<div class="controls">
					<input type="text" name="city" id="city" value="{$city}" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="state">{$LANG.clientareastate}</label>
				<div class="controls">
					<input type="text" name="state" id="state" value="{$state}" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="postcode">{$LANG.clientareapostcode}</label>
				<div class="controls">
					<input type="text" name="postcode" id="postcode" value="{$postcode}" />
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
					<input type="text" name="phonenumber" id="phonenumber" value="{$phonenumber}" />
				</div>
			</div>
		
			<div class="form-actions">
				<input type="submit" value="{$LANG.ordercontinuebutton}" class="btn btn-primary">
			</div>
		</form>
		
		{else}
		
		<form method="post" action="clientarea.php">
			<input type="hidden" name="action" value="productdetails">
			<input type="hidden" name="id" value="{$serviceid}">
			<input type="submit" value="{$LANG.invoicesbacktoclientarea}" class="btn btn-default">
		 </form>
		
		{/if}
		{/if}
	</div>
</section>
