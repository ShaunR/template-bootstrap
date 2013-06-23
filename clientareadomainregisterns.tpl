<div class="page-header">
	<h1>{$LANG.managing} {$domain}</h1>
</div>

{if $result}
<div class="alert alert-info fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$result}
</div>
{/if}

<div class="tabbable">
	<ul class="nav nav-tabs" id="nameservertabs">
		<li class="active"><a href="#tab-create" data-toggle="tab" title="{$LANG.domainregisternsreg}">{$LANG.domainregisternsreg}</a></li>
		<li><a href="#tab-modify" data-toggle="tab" title="{$LANG.domainregisternsmod}">{$LANG.domainregisternsmod}</a></li>
		<li><a href="#tab-delete" data-toggle="tab" title="{$LANG.domainregisternsdel}">{$LANG.domainregisternsdel}</a></li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane active" id="tab-create">
			<div class="row">
				<div class="span4">
					<h2>{$LANG.domainregisternsreg}</h2>
					<p>{$LANG.domainregisternsexplanation}</p>
				</div>
				<div class="span8">
					<form method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns#tab-create" class="form-horizontal">
						<input type="hidden" name="sub" value="register"/>
						<input type="hidden" name="domainid" value="{$domainid}"/>
						<div class="control-group">
							<label class="control-label" for="createns">{$LANG.domainregisternsns}</label>
							<div class="controls">
								<input type="text" name="ns" id="createns" class="span2"/> . {$domain}
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="createip">{$LANG.domainregisternsip}</label>
							<div class="controls">
								<input type="text" name="ipaddress" id="createip" class="span2"/>
							</div>
						</div>
						<div class="form-actions">
							<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn" title="{$LANG.clientareabacklink}">{$LANG.clientareabacklink}</a>
							<button class="btn btn-primary">{$LANG.clientareasavechanges}</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="tab-pane" id="tab-modify">
			<div class="row">
				<div class="span4">
					<h2>{$LANG.domainregisternsmod}</h2>
					<p>{$LANG.domainregisternsexplanation}</p>
				</div>
				<div class="span8">
					<form method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns#tab-modify" class="form-horizontal">
						<input type="hidden" name="sub" value="modify"/>
						<input type="hidden" name="domainid" value="{$domainid}"/>
						<div class="control-group">
							<label class="control-label" for="modifyns">{$LANG.domainregisternsns}</label>
							<div class="controls">
								<input type="text" name="ns" id="modifyns" class="span2"/> . {$domain}
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="modifyoldip">{$LANG.domainregisternscurrentip}</label>
							<div class="controls">
								<input type="text" name="currentipaddress" id="modifyoldip" class="span2"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="modifynewip">{$LANG.domainregisternsnewip}</label>
							<div class="controls">
								<input type="text" name="newipaddress" id="modifyoldip" class="span2"/>
							</div>
						</div>
						<div class="form-actions">
							<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn" title="{$LANG.clientareabacklink}">{$LANG.clientareabacklink}</a>
							<button class="btn btn-primary">{$LANG.clientareasavechanges}</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="tab-pane" id="tab-delete">
			<div class="row">
				<div class="span4">
					<h2>{$LANG.domainregisternsdel}</h2>
					<p>{$LANG.domainregisternsexplanation}</p>
				</div>
				<div class="span8">
					<form method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns#tab-delete" class="form-horizontal">
						<input type="hidden" name="sub" value="delete"/>
						<input type="hidden" name="domainid" value="{$domainid}"/>
						<div class="control-group">
							<label class="control-label" for="deletens">{$LANG.domainregisternsns}</label>
							<div class="controls">
								<input type="text" name="ns" id="deletens" class="span2"/> . {$domain}
							</div>
						</div>
						<div class="form-actions">
							<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn" title="{$LANG.clientareabacklink}">{$LANG.clientareabacklink}</a>
							<button class="btn btn-primary">{$LANG.clientareasavechanges}</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

{literal}
<script type="text/javascript">
   $(function() {
      if(window.location.hash != "") { $('.tabbable > .nav-tabs > li > a[href="'+window.location.hash+'"]').tab('show'); }
   });
</script>
{/literal}
