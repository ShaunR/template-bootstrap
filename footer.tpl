		</div>
		<div id="whmcsfooter" class="container muted">
			<hr/>
			<div class="pull-right">Copyright &copy; {$smarty.now|date_format:"%Y"} {$companyname}. All Rights Reserved.</div>
			{if $langchange}<div id="languagechooser">{$setlanguage}</div>{/if}
		</div>
		{$footeroutput}
	</body>
</html>
