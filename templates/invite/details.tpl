<div class="topic" id="invite-detail">
    <ol class="breadcrumb">
        <!-- BEGIN breadcrumbs -->
        <li itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb" <!-- IF @last -->class="active"<!-- ENDIF @last -->>
        <!-- IF !@last --><a href="{breadcrumbs.url}" itemprop="url"><!-- ENDIF !@last -->
			<span itemprop="title">
				{breadcrumbs.text}
				<!-- IF @last -->
				<!-- IF !feeds:disableRSS -->
				<!-- IF rssFeedUrl --><a target="_blank" href="{rssFeedUrl}"><i class="fa fa-rss-square"></i></a><!-- ENDIF rssFeedUrl --><!-- ENDIF !feeds:disableRSS -->
				<!-- ENDIF @last -->
			</span>
        <!-- IF !@last --></a><!-- ENDIF !@last -->
        </li>
        <!-- END breadcrumbs -->
    </ol>

    <ul component="invite" id="post-container" class="posts" data-iid="{iid}">
        <li class="post-row <!-- IF deleted -->deleted<!-- ENDIF deleted -->"
            data-uid="{uid}" data-username="{user.username}" data-userslug="{user.userslug}" data-timestamp="{timestamp}" data-votes="{invitecount}" itemscope itemtype="http://schema.org/Comment">
            <a component="invite/anchor" name="{index}"></a>

            <meta itemprop="datePublished" content="{relativeTime}">
            <meta itemprop="dateModified" content="{relativeEditTime}">

            <div class="topic-item">
                <div class="topic-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="topic-profile-pic hidden-xs text-center">
                                <a href="<!-- IF user.userslug -->{config.relative_path}/user/{user.userslug}<!-- ELSE -->#<!-- ENDIF user.userslug -->">
                                    <img src="{user.picture}" alt="{user.username}" class="profile-image user-img" title="{user.username}">
                                </a>
                                <small class="username" title="{user.username}"><a href="<!-- IF user.userslug -->{config.relative_path}/user/{user.userslug}<!-- ELSE -->#<!-- ENDIF user.userslug -->">{user.username}</a></small>

                                <!-- IF user.banned -->
                                <div class="text-center">
                                    <span class="label label-danger">[[user:banned]]</span>
                                </div>
                                <!-- ENDIF user.banned -->
                                <!-- IF user.deleted -->
                                <div class="text-center">
                                    <span class="label label-danger">已删除</span>
                                </div>
                                <!-- ENDIF user.deleted -->
                            </div>
                            <div class="invite-text">
                                <div class="invite-user">
                                    <span class="invite-username-text">[[invite:detail.username]]</span><span component="invite/username" class="invite-username" itemprop="name">{username}</span>
                                    <!-- IF isSelf -->
                                    <span class="invite-email-text">[[invite:detail.email]]</span><span component="invite/email" class="invite-email" itemprop="email">{email}</span>
                                    <!-- ENDIF isSelf -->
                                </div>
                                <hr>
                                <div class="invite-reason" component="invite/reason" >
                                    <span>[[invite:detail.reason]]</span>
                                    <div component="invite/content" class="post-content" itemprop="text">{content}</div>
                                </div>
                                <hr>

                                <!-- IF !invited -->
                                <!-- IF !invitedByMe -->
                                <div class="invite-upvote">
                                    <button component="invite/upvote" class="btn btn-primary<!-- IF joined--> btn-success active<!-- ELSE --><!-- IF invited--> btn-danger<!-- ENDIF invited--><!-- ENDIF joined-->" type="button">[[invite:detail.upvote]]</button>
                                    <hr>
                                </div>
                                <!-- ENDIF !invitedByMe -->
                                <!-- ENDIF !invited -->

                                <div class="invite-course" component="invite/reason" >
                                    <span>[[invite:detail.invite_course]]</span>
                                </div>
                                <ol component="invite/course" class="course-list small-text">
                                    <li>{createdTime} {user.username} 提名 {username} 进入社区</li>
                                    <!-- IF !invited -->
                                    <li>到目前共获得 <span component="invite/vote-count">{inviteCount}</span> 票支持</li>
                                    <!-- ELSE -->
                                    <li>{invitedTime} 对 {username} 的提名已获得 {inviteCount} 票支持，达到邀请票数，邀请邮件已经发出</li>
                                    <!-- ENDIF !invited -->
                                    <!-- IF joined -->
                                    <li class="small-text joined">{username} 已在某时接受邀请重生于社区</li>
                                    <!-- ELSE -->
                                    <!-- IF notJoined -->
                                    <li>{invitedTime} 发给 {username} 的邀请，在{expiredTime}内未注册进来，本次邀请失败</li>
                                    <!-- ENDIF notJoined -->
                                    <!-- ENDIF joined -->
                                    <!-- IF inviterDeleted -->
                                    <li>{deletedTime} {username} 被删除离开社区</li>
                                    <!-- ENDIF inviterDeleted -->
                                    <!-- IF user.deleted -->
                                    <li>提名人退出社区了</li>
                                    <!-- ENDIF user.deleted -->
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- IF !hideFooter -->
                <div class="topic-footer">
                    <div class="row">
                        <span class="post-tools">
                            <!-- IF !isSelf -->
                            <!-- IF user.userslug -->
                            <!-- IF loggedIn -->
                            <!-- IF !config.disableChat -->
                            <button component="invite/chat" class="btn btn-sm btn-link chat" type="button" title="[[topic:chat]]"><i
                                    class="fa fa-comment"></i><span class="hidden-xs-inline"> [[topic:chat]]</span></button>
                            <!-- ENDIF !config.disableChat -->
                            <!-- ENDIF loggedIn -->
                            <!-- ENDIF user.userslug -->
                            <!-- ENDIF !isSelf -->

                            <!-- IF canControl -->
                            <!-- IF !invited -->
                            <!-- IF isSelf -->
                                <button component="invite/edit" class="btn btn-sm btn-link edit" type="button" title="[[topic:edit]]"><i
                                        class="fa fa-pencil"></i><span class="hidden-xs-inline"> [[topic:edit]]</span></button>
                                <button component="invite/delete" class="btn btn-sm btn-link delete" type="button" title="[[topic:delete]]"><i
                                        class="fa fa-trash-o"></i><span class="hidden-xs-inline"> [[topic:delete]]</span></button>
                            <!-- ENDIF isSelf -->
                            <!-- ENDIF !invited -->
                            <!-- ENDIF canControl -->
                        </span>
                    </div>
                </div>
                <!-- ENDIF !hideFooter -->
            </div>
        </li>
    </ul>
</div>

<div widget-area="footer" class="col-xs-12"></div>

<input type="hidden" template-variable="invite_id" value="{iid}" />
<input type="hidden" template-variable="invite_slug" value="{slug}" />
<input type="hidden" template-variable="currentPage" value="{currentPage}" />
<input type="hidden" template-variable="locked" template-type="boolean" value="{locked}" />
<input type="hidden" template-variable="deleted" template-type="boolean" value="{deleted}" />
<input type="hidden" template-variable="pinned" template-type="boolean" value="{pinned}" />
<input type="hidden" template-variable="invited" template-type="boolean" value="{invited}" />
<input type="hidden" template-variable="invite_name" value="{username}" />
<input type="hidden" template-variable="invitecount" value="{invitecount}" />
<input type="hidden" template-variable="viewcount" value="{viewcount}" />
