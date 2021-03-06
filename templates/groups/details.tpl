<div component="groups/container" class="group-detail details row">
	<div class="col-xs-12" component="groups/cover" style="background-image: url({group.cover:url}); background-position: {group.cover:position};">
		<div class="change">[[groups:cover-change]] <i class="fa fa-fw fa-pencil-square-o"></i></div>
		<div class="save">[[groups:cover-save]] <i class="fa fa-fw fa-floppy-o"></i></div>
		<div class="indicator">[[groups:cover-saving]] <i class="fa fa-fw fa-refresh fa-spin"></i></div>
		<div class="instructions">[[groups:cover-instructions]]</div>
	</div>
	<div class="col-lg-5 col-xs-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-list-ul"></i> [[groups:details.title]]
					<!-- IF group.private --><span class="label label-info">[[groups:details.private]]</span><!-- ENDIF group.private -->
					<!-- IF group.hidden --><span class="label label-info">[[groups:details.hidden]]</span>&nbsp;<!-- ENDIF group.hidden -->
					<!-- IF group.supportTopic --><span class="label label-info">[[groups:details.support_topic]]</span>&nbsp;<!-- ENDIF group.supportTopic -->
				</h3>
			</div>
			<div class="panel-body">
				<h1>{group.name}</h1>
				<p>{group.descriptionParsed}</p>
				<!-- IF loggedIn -->
				<div class="pull-right">
					{function.membershipBtn, group}
				</div>
				<!-- ENDIF loggedIn -->
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-users"></i> [[groups:details.members]]
					<!-- IF group.isOwner -->
					<!-- IF group.hidden -->
					<a class="label label-info pull-right" href="#" data-ajaxify="false" data-action="add-user" style="color: #fff;">添加用户</a>
					<!-- ENDIF group.hidden -->
					<!-- ENDIF group.isOwner -->

				</h3>
			</div>
			<div class="panel-body">
				<table component="groups/members" class="table table-striped table-hover">
					<!-- BEGIN members -->
					<tr data-uid="{group.members.uid}">
						<td>
							<a href="{config.relative_path}/user/{group.members.userslug}"><img src="{group.members.picture}" /></a>
						</td>
						<td class="member-name">
							<a href="{config.relative_path}/user/{group.members.userslug}">{group.members.username}</a> <i title="[[groups:owner]]" class="fa fa-star text-warning <!-- IF !group.members.isOwner -->invisible<!-- ENDIF !group.members.isOwner -->"></i>
						</td>
						<!-- IF group.isOwner -->
						<td>
							<div class="btn-group pull-right">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									More <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li>
										<a href="#" data-ajaxify="false" data-action="toggleOwnership">
											[[groups:details.grant]]
										</a>
									</li>
									<li>
										<a href="#" data-ajaxify="false" data-action="kick">
											[[groups:details.kick]]
										</a>
									</li>
								</ul>
							</div>
						</td>
						<!-- ENDIF group.isOwner -->
					</tr>
					<!-- END members -->
				</table>
			</div>
		</div>
		<!-- IF group.isOwner -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-clock-o"></i> [[groups:details.pending]]</h3>
			</div>
			<div class="panel-body">
				<table component="groups/members" class="table table-striped table-hover">
					<!-- BEGIN pending -->
					<tr data-uid="{group.pending.uid}">
						<td>
							<a href="{config.relative_path}/user/{group.pending.userslug}"><img src="{group.pending.picture}" /></a>
						</td>
						<td class="member-name">
							<a href="{config.relative_path}/user/{group.pending.userslug}">{group.pending.username}</a>
						</td>
						<td>
							<div class="btn-group pull-right">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									More <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#" data-ajaxify="false" data-action="accept">[[groups:pending.accept]]</a></li>
									<li><a href="#" data-ajaxify="false" data-action="reject">[[groups:pending.reject]]</a></li>
								</ul>
							</div>
						</td>
					</tr>
					<!-- END pending -->
				</table>
			</div>
		</div>
		<!-- ENDIF group.isOwner -->
		<div widget-area="left"></div>
	</div>
	<div class="col-lg-7 col-xs-12">
		<!-- IF group.isOwner -->
		<div class="panel panel-default">
			<div class="panel-heading pointer" data-toggle="collapse" data-target=".options">
				<h3 class="panel-title">
					<i class="fa fa-caret-down pull-right"></i>
					<i class="fa fa-cogs"></i> [[groups:details.owner_options]]
				</h3>
			</div>

			<div class="panel-body options collapse">
				<form component="groups/settings" role="form">
					<div class="form-group">
						<label for="name">[[groups:details.group_name]]</label>
						<input class="form-control" name="name" id="name" type="text" value="{group.name}" />
					</div>
					<div class="form-group">
						<label for="name">[[groups:details.description]]</label>
						<textarea class="form-control" name="description" id="description" type="text">{group.description}</textarea>
					</div>
					<div class="form-group">
						<label for="userTitle">[[groups:details.badge_text]]</label>
						<input component="groups/userTitleOption" class="form-control" name="userTitle" id="userTitle" type="text" value="{group.userTitle}"<!-- IF !userTitleEnabled --> disabled<!-- ENDIF !userTitleEnabled --> />
					</div>
					<div class="form-group">
						<label>[[groups:details.badge_preview]]</label><br />
						<span class="label<!-- IF !userTitleEnabled --> hide<!-- ENDIF !userTitleEnabled -->" style="background-color: {group.labelColor}"><i class="fa {group.icon} icon"></i> <!-- IF group.userTitle -->{group.userTitle}<!-- ELSE -->{group.name}<!-- ENDIF group.userTitle --></span>

						<button component="groups/userTitleOption" type="button" class="btn btn-default btn-sm" data-action="icon-select"<!-- IF !userTitleEnabled --> disabled<!-- ENDIF !userTitleEnabled -->>[[groups:details.change_icon]]</button>
						<button component="groups/userTitleOption" type="button" class="btn btn-default btn-sm" data-action="color-select"<!-- IF !userTitleEnabled --> disabled<!-- ENDIF !userTitleEnabled -->>[[groups:details.change_colour]]</button>
						<input type="hidden" name="labelColor" value="<!-- IF group.labelColor -->{group.labelColor}<!-- ENDIF group.labelColor -->" />
						<input type="hidden" name="icon" value="<!-- IF group.icon -->{group.icon}<!-- ENDIF group.icon -->" />
						<div id="icons" style="display:none;">
							<div class="icon-container">
								<div class="row fa-icons">
									<i class="fa fa-doesnt-exist"></i>
									<!-- IMPORT partials/fontawesome.tpl -->
								</div>
							</div>
						</div>
					</div>
					<hr />
					<div class="checkbox">
						<label>
							<input name="userTitleEnabled" type="checkbox"<!-- IF group.userTitleEnabled --> checked<!-- ENDIF group.userTitleEnabled-->> <strong>[[groups:details.userTitleEnabled]]</strong>
						</label>
					</div>
					<div class="checkbox">
						<label>
							<input name="private" type="checkbox"<!-- IF group.private --> checked<!-- ENDIF group.private-->> <strong>[[groups:details.private]]</strong>
							<p class="help-block">
								[[groups:details.private_help]]
							</p>
						</label>
					</div>
					<div class="checkbox">
						<label>
							<input name="hidden" type="checkbox"<!-- IF group.hidden --> checked<!-- ENDIF group.hidden-->> <strong>[[groups:details.hidden]]</strong>
							<p class="help-block">
								[[groups:details.hidden_help]]
							</p>
						</label>
					</div>
					<div class="checkbox">
						<label>
							<input name="supportTopic" type="checkbox"<!-- IF group.supportTopic --> checked<!-- ENDIF group.supportTopic-->> <strong>[[groups:details.support_topic]]</strong>
							<p class="help-block">
								[[groups:details.support_topic_help]]
							</p>
						</label>
					</div>

					<button class="btn btn-link btn-xs pull-right" type="button" data-action="delete">Delete Group</button>
					<button class="btn btn-primary" type="button" data-action="update">Save</button>
				</form>
			</div>
		</div>
		<!-- ENDIF group.isOwner -->
		<!-- IF group.supportTopic -->
		<div class="panel topic-list panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-cogs"></i> 主题列表
					<!-- IF group.isMember -->
					<a class="label label-info pull-right" href="#" data-ajaxify="false" data-action="new-topic" style="color: #fff;">新主题</a>
					<!-- ENDIF group.isMember -->
				</h3>
			</div>

			<div class="panel-body">
				<table class="table table-striped table-hover">
					<!-- BEGIN posts -->
					<tr data-uid="{posts.user.uid}" data-tid="{posts.tid}" data-record="{posts.record}">
						<td>
							<a href="{config.relative_path}/user/{posts.user.userslug}"><img style="width: 32px;" src="{posts.user.picture}" /></a>
						</td>
						<td style="vertical-align: middle;">
							<!-- IF posts.record -->
							<i title="播放第一个语音" class="fa fa-play" data-action="play-record"></i>
							<i title="播放所有语音" class="fa fa-forward" data-action="all-record"></i>
							<i title="暂停" class="fa fa-pause" data-action="pause-record"></i>
							<i title="停止" class="fa fa-stop" data-action="stop-record"></i>
							<!-- ENDIF posts.record -->
							<a href="{config.relative_path}/topic/{posts.slug}">{posts.title}</a>
						</td>
						<td style="vertical-align: middle;">
							<div class="pull-right">
								<span>字数: </span><span style="padding-right:4px;">{posts.contentLen}</span>
								<span>浏览: </span><span style="padding-right:4px;">{posts.viewcount}</span>
								<span>回复: </span><span>{posts.postcount}</span>
							</div>
						</td>
					</tr>
					<!-- END posts -->
				</table>
			</div>
		</div>
		<!-- ELSE -->
		<div>
			<!-- IF !posts.length -->
			<div class="alert alert-info">[[groups:details.has_no_posts]]</div>
			<!-- ENDIF !posts.length -->
			<!-- IMPORT partials/posts_list.tpl -->
		</div>
		<!-- ENDIF group.supportTopic -->
		<div widget-area="right"></div>
	</div>
</div>

<!-- IMPORT partials/variables/groups/details.tpl -->
