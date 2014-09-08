<section class="margin-top margin-bottom">
	<div class="container">
		{if $affiliatesystemenabled}
		<div class="row">
			<div class="col-md-5">
				<h1>{$LANG.affiliatesactivate}</h1>
				<p class="lead text-muted">{$LANG.affiliatesignuptitle}</p>

				<form method="post" action="affiliates.php" class="">
					<input type="hidden" name="activate" value="true">
					<button class="btn btn-success btn-lg">{$LANG.affiliatesactivate}</button>
				</form>
			</div>
			<div class="col-md-7">
				<div class="well wells-sm">
					<p class="lead">{$LANG.affiliatesignupintro}</p>
					<ul class="fa-ul">
						<li><span class="fa fa-li fa-check"></span> {$LANG.affiliatesignupinfo1}</li>
						<li><span class="fa fa-li fa-check"></span> {$LANG.affiliatesignupinfo2}</li>
						<li><span class="fa fa-li fa-check"></span> {$LANG.affiliatesignupinfo3}</li>
					</ul>
				</div>
			</div>
		</div>
		{else}
		<h1>{$LANG.affiliatestitle}</h1>
		<div class="alert alert-warning">{$LANG.affiliatesdisabled}</div>
		{/if}
	</div>
</section>
