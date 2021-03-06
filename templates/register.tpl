<div class="row" style="background:#fff;">
	<div class="col-lg-5"
		 style="height:577px;border:1px solid #EDEDED;border-right:0;background: url(/images/register.png) 50% 50% no-repeat"></div>

	<div class="col-lg-7">
<div class="row">
	<div class="{register_window:spansize}">
		<div class="well well-lg">
			<div class="alert alert-danger" id="register-error-notify" <!-- IF error -->style="display:block"<!-- ELSE -->style="display: none;"<!-- ENDIF error -->>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<strong>[[error:registration-error]]</strong>
				<p>{error}</p>
			</div>
			<form class="form-horizontal" role="form" action="{config.relative_path}/register" method="post">
				<div class="form-group">
					<label for="email" class="col-lg-2 control-label">[[register:email_address]]</label>
					<div class="col-lg-9">
						<div class="input-group">
							<input class="form-control" type="text" value="{email}" name="email" id="email" readonly autocorrect="off" autocapitalize="off" />
							<span class="input-group-addon">
								<span id="email-notify"><i class="fa fa-circle-o"></i></span>
							</span>
						</div>
						<span class="help-block">[[register:help.email]]</span>
					</div>
				</div>
				<div class="form-group">
					<label for="username" class="col-lg-2 control-label">[[register:username]]</label>
					<div class="col-lg-9">
						<div class="input-group">
							<input class="form-control" type="text" value="{username}" name="username" id="username" readonly autocorrect="off" autocapitalize="off" />
							<span class="input-group-addon">
								<span id="username-notify"><i class="fa fa-circle-o"></i></span>
							</span>
						</div>
						<span class="help-block">[[register:help.username_restrictions, {minimumUsernameLength}, {maximumUsernameLength}]]</span>
					</div>
				</div>
				<div class="form-group">
					<label for="password" class="col-lg-2 control-label">[[register:password]]</label>
					<div class="col-lg-9">
						<div class="input-group">
							<input class="form-control" type="password" placeholder="[[register:password_placeholder]]" name="password" id="password" />
							<span class="input-group-addon">
								<span id="password-notify"><i class="fa fa-circle-o"></i></span>
							</span>
						</div>
						<span class="help-block">[[register:help.minimum_password_length, {minimumPasswordLength}]]</span>
					</div>
				</div>
				<div class="form-group">
					<label for="password-confirm" class="col-lg-2 control-label">[[register:confirm_password]]</label>
					<div class="col-lg-9">
						<div class="input-group">
							<input class="form-control" type="password" placeholder="[[register:confirm_password_placeholder]]" name="password-confirm" id="password-confirm" />
							<span class="input-group-addon">
								<span id="password-confirm-notify"><i class="fa fa-circle-o"></i></span>
							</span>
						</div>
					</div>
				</div>

				<!-- BEGIN regFormEntry -->
				<div class="form-group">
					<label for="register-{regFormEntry.styleName}" class="col-lg-2 control-label">{regFormEntry.label}</label>
					<div id="register-{regFormEntry.styleName}" class="col-lg-9">
						{regFormEntry.html}
					</div>
				</div>
				<!-- END regFormEntry -->

				<!-- IF termsOfUse -->
				<div class="form-group">
					<label class="col-lg-2 control-label">&nbsp;</label>
					<div class="col-lg-9">
						<hr />
						<strong>[[register:terms_of_use]]</strong>
						<textarea readonly class="form-control" rows=6>{termsOfUse}</textarea>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="agree-terms" id="agree-terms"> [[register:agree_to_terms_of_use]]
							</label>
						</div>
					</div>
				</div>
				<!-- ENDIF termsOfUse -->
				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-9">
						<hr />
						<button class="btn btn-primary btn-lg btn-block" id="register" type="submit">[[register:register_now_button]]</button>
					</div>
				</div>
				<input id="referrer" type="hidden" name="referrer" value="" />
			</form>
		</div>
	</div>

	<!-- IF alternate_logins -->
	<div class="col-md-6">
		<div class="well well-lg">
			<h4>[[register:alternative_registration]]</h4>
			<ul class="alt-logins">
				<!-- BEGIN authentication -->
				<li class="{authentication.name}"><a rel="nofollow" target="_top" href="{config.relative_path}{authentication.url}"><i class="fa {authentication.icon} fa-3x"></i></i></a></li>
				<!-- END authentication -->
			</ul>
		</div>
	</div>
	<!-- ENDIF alternate_logins -->
</div>
</div>
</div>
