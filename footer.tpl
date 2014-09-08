		<footer id="whmcs-footer">
			<div class="container">
				{if $langchange}
				<div id="languagechooser" class="margin-bottom text-center">{$setlanguage}</div>
				{/if}
				<p class="text-center text-muted">Copyright &copy; {$smarty.now|date_format:"%Y"} {$companyname}. All Rights Reserved.</p>
				</div>
			</div>
		</footer>
		{$footeroutput}
	</body>
</html>
