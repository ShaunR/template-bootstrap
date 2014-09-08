<section>
	<div class="container">
		<h1>{$LANG.managing} {$domain}</h1>
		
		{if $result}
		<div class="alert alert-info alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
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
						<div class="col-md-4">
							<h2>{$LANG.domainregisternsreg}</h2>
							<p>{$LANG.domainregisternsexplanation}</p>
						</div>
						<div class="col-md-8">
							<form method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns#tab-create" class="form-horizontal margin-top">
								<input type="hidden" name="sub" value="register">
								<input type="hidden" name="domainid" value="{$domainid}">
								<div class="form-group">
									<label class="col-md-4 control-label" for="createns">{$LANG.domainregisternsns}</label>
									<div class="col-md-6">
										<div class="input-group">
											<input type="text" name="ns" id="createns" class="form-control">
											<span class="input-group-addon">.{$domain}</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-4 control-label" for="createip">{$LANG.domainregisternsip}</label>
									<div class="col-md-6">
										<input type="text" name="ipaddress" id="createip" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-8 col-md-offset-4">
										<a href="clientarea.php?action=domaindetails&amp;id={$domainid}" class="btn btn-default" title="{$LANG.clientareabacklink}">{$LANG.clientareabacklink}</a>
										<button class="btn btn-primary">{$LANG.clientareasavechanges}</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab-modify">
					<div class="row">
						<div class="col-md-4">
							<h2>{$LANG.domainregisternsmod}</h2>
							<p>{$LANG.domainregisternsexplanation}</p>
						</div>
						<div class="col-md-8">
							<form method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns#tab-modify" class="form-horizontal margin-top">
								<input type="hidden" name="sub" value="modify">
								<input type="hidden" name="domainid" value="{$domainid}">
								<div class="form-group">
									<label class="col-md-4 control-label" for="modifyns">{$LANG.domainregisternsns}</label>
									<div class="col-md-6">
										<div class="input-group">
											<input type="text" name="ns" id="modifyns" class="form-control">
											<span class="input-group-addon">.{$domain}</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-4 control-label" for="modifyoldip">{$LANG.domainregisternscurrentip}</label>
									<div class="col-md-6">
										<input type="text" name="currentipaddress" id="modifyoldip" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-4 control-label" for="modifynewip">{$LANG.domainregisternsnewip}</label>
									<div class="col-md-6">
										<input type="text" name="newipaddress" id="modifynewip" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-8 col-md-offset-4">
										<a href="clientarea.php?action=domaindetails&amp;id={$domainid}" class="btn btn-default" title="{$LANG.clientareabacklink}">{$LANG.clientareabacklink}</a>
										<button class="btn btn-primary">{$LANG.clientareasavechanges}</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab-delete">
					<div class="row">
						<div class="col-md-4">
							<h2>{$LANG.domainregisternsdel}</h2>
							<p>{$LANG.domainregisternsexplanation}</p>
						</div>
						<div class="col-md-8">
							<form method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns#tab-delete" class="form-horizontal margin-top">
								<input type="hidden" name="sub" value="delete">
								<input type="hidden" name="domainid" value="{$domainid}">
								<div class="form-group">
									<label class="col-md-4 control-label" for="deletens">{$LANG.domainregisternsns}</label>
									<div class="col-md-6">
										<div class="input-group">
											<input type="text" name="ns" id="deletens" class="form-control">
											<span class="input-group-addon">.{$domain}</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-8 col-md-offset-4">
										<a href="clientarea.php?action=domaindetails&amp;id={$domainid}" class="btn btn-default" title="{$LANG.clientareabacklink}">{$LANG.clientareabacklink}</a>
										<button class="btn btn-primary">{$LANG.clientareasavechanges}</button>
									</div>
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
	</div>
</section>
