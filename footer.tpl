		<hr />
        </div>
		<div id="whmcsfooter" class="container">
			<div class="pull-right">           
 <table align="center" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="left">
  			{if $langchange}<div id="languagechooser">{$setlanguage}</div>{/if}
	</td>
    <td align="center">
    </td>
    <td align="right"> {$companyname} &copy; {$smarty.now|date_format:"%Y"} All Rights Reserved
  </tr>
</table>    
            </div>
  
		{$footeroutput} 
	</div>
	</body>
</html>  