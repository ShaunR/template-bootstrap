{foreach key=num item=customfield from=$customfields}
<div class="form-group">
	<label for="customfield{$customfield.id}">{$customfield.name}</label>
	{$customfield.input} {$customfield.description}
</div>
{/foreach}

