USE [QPNativeWebDB]
GO
/****** 对象:  Table [admin]    脚本日期: 04/15/2011 16:43:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [admin](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[classcode] [nvarchar](100) NULL,
	[classname] [nvarchar](100) NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** 对象:  Table [GameFeedbackInfo]    脚本日期: 04/15/2011 16:43:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GameFeedbackInfo](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[FeedbackTitle] [nvarchar](512) NOT NULL,
	[FeedbackContent] [nvarchar](4000) NOT NULL,
	[Accounts] [nvarchar](31) NOT NULL,
	[FeedbackDate] [datetime] NOT NULL CONSTRAINT [DF_GameFeedbackInfo_FeedbackDate]  DEFAULT (getdate()),
	[ClientIP] [nvarchar](15) NOT NULL CONSTRAINT [DF_GameFeedbackInfo_ClientIP]  DEFAULT (N'0.0.0.0'),
	[ViewCount] [int] NOT NULL CONSTRAINT [DF_GameFeedbackInfo_ViewCount]  DEFAULT ((0)),
	[RevertUserID] [int] NOT NULL CONSTRAINT [DF_GameFeedbackInfo_RevertUserID]  DEFAULT ((0)),
	[RevertContent] [nvarchar](4000) NOT NULL CONSTRAINT [DF_GameFeedbackInfo_RevertContent]  DEFAULT (''),
	[RevertDate] [datetime] NULL,
	[Nullity] [tinyint] NOT NULL CONSTRAINT [DF_GameFeedbackInfo_Nullity]  DEFAULT ((0)),
 CONSTRAINT [PK_GameFeedbackInfo] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反馈标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameFeedbackInfo', @level2type=N'COLUMN',@level2name=N'FeedbackID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反馈标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameFeedbackInfo', @level2type=N'COLUMN',@level2name=N'FeedbackTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反馈内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameFeedbackInfo', @level2type=N'COLUMN',@level2name=N'FeedbackContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏帐号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameFeedbackInfo', @level2type=N'COLUMN',@level2name=N'Accounts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提交时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameFeedbackInfo', @level2type=N'COLUMN',@level2name=N'FeedbackDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameFeedbackInfo', @level2type=N'COLUMN',@level2name=N'ViewCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameFeedbackInfo', @level2type=N'COLUMN',@level2name=N'RevertUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameFeedbackInfo', @level2type=N'COLUMN',@level2name=N'RevertContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameFeedbackInfo', @level2type=N'COLUMN',@level2name=N'RevertDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁用标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameFeedbackInfo', @level2type=N'COLUMN',@level2name=N'Nullity'


/****** 对象:  Table [GameIssueInfo]    脚本日期: 04/15/2011 16:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GameIssueInfo](
	[IssueID] [int] IDENTITY(1,1) NOT NULL,
	[IssueTitle] [nvarchar](512) NOT NULL,
	[IssueContent] [ntext] NOT NULL,
	[Nullity] [tinyint] NOT NULL CONSTRAINT [DF_GameIssueInfo_Nullity]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_GameIssueInfo_CollectDate]  DEFAULT (getdate()),
	[ModifyDate] [datetime] NOT NULL CONSTRAINT [DF_GameIssueInfo_ModifyDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_GameIssueInfo] PRIMARY KEY CLUSTERED 
(
	[IssueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'问题标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameIssueInfo', @level2type=N'COLUMN',@level2name=N'IssueID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'问题标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameIssueInfo', @level2type=N'COLUMN',@level2name=N'IssueTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'问题内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameIssueInfo', @level2type=N'COLUMN',@level2name=N'IssueContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否禁止' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameIssueInfo', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新增日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameIssueInfo', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameIssueInfo', @level2type=N'COLUMN',@level2name=N'ModifyDate'


/****** 对象:  Table [GameMatchInfo]    脚本日期: 04/15/2011 16:44:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GameMatchInfo](
	[MatchID] [int] IDENTITY(1,1) NOT NULL,
	[MatchTitle] [nvarchar](512) NOT NULL,
	[MatchSummary] [nvarchar](512) NOT NULL,
	[MatchContent] [ntext] NOT NULL,
	[ApplyBeginDate] [datetime] NOT NULL,
	[ApplyEndDate] [datetime] NOT NULL,
	[MatchStatus] [int] NOT NULL CONSTRAINT [DF_GameMatchInfo_MatchStatus]  DEFAULT ((0)),
	[Nullity] [tinyint] NOT NULL CONSTRAINT [DF_GameMatchInfo_Nullity]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_GameMatchInfo_CollectDate]  DEFAULT (getdate()),
	[ModifyDate] [datetime] NOT NULL CONSTRAINT [DF_GameMatchInfo_ModifyDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_GameMatchInfo] PRIMARY KEY CLUSTERED 
(
	[MatchID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchInfo', @level2type=N'COLUMN',@level2name=N'MatchID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchInfo', @level2type=N'COLUMN',@level2name=N'MatchTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛摘要' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchInfo', @level2type=N'COLUMN',@level2name=N'MatchSummary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchInfo', @level2type=N'COLUMN',@level2name=N'MatchContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报名开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchInfo', @level2type=N'COLUMN',@level2name=N'ApplyBeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报名截止时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchInfo', @level2type=N'COLUMN',@level2name=N'ApplyEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赛事状态(0:未开始,1:进行中,2:结束)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchInfo', @level2type=N'COLUMN',@level2name=N'MatchStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁用状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchInfo', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新增日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchInfo', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchInfo', @level2type=N'COLUMN',@level2name=N'ModifyDate'

/****** 对象:  Table [GameMatchUserInfo]    脚本日期: 04/15/2011 16:44:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GameMatchUserInfo](
	[MatchID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Accounts] [nvarchar](31) NOT NULL,
	[GameID] [int] NOT NULL,
	[Compellation] [nvarchar](16) NOT NULL,
	[Gender] [tinyint] NOT NULL,
	[PassportID] [nvarchar](32) NOT NULL,
	[MobilePhone] [nvarchar](16) NOT NULL,
	[EMail] [nvarchar](32) NOT NULL,
	[QQ] [nvarchar](16) NOT NULL,
	[DwellingPlace] [nvarchar](128) NOT NULL,
	[PostalCode] [nvarchar](8) NOT NULL,
	[Nullity] [tinyint] NOT NULL CONSTRAINT [DF_GameMatchUserInfo_Nullity]  DEFAULT ((0)),
	[ClientIP] [nvarchar](15) NOT NULL CONSTRAINT [DF_GameMatchUserInfo_ClientIP]  DEFAULT (N'0.0.0.0'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_GameMatchUserInfo_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_GameMatchUserInfo] PRIMARY KEY CLUSTERED 
(
	[MatchID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赛事标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchUserInfo', @level2type=N'COLUMN',@level2name=N'MatchID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchUserInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户帐号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchUserInfo', @level2type=N'COLUMN',@level2name=N'Accounts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchUserInfo', @level2type=N'COLUMN',@level2name=N'GameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchUserInfo', @level2type=N'COLUMN',@level2name=N'Compellation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchUserInfo', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchUserInfo', @level2type=N'COLUMN',@level2name=N'PassportID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchUserInfo', @level2type=N'COLUMN',@level2name=N'MobilePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchUserInfo', @level2type=N'COLUMN',@level2name=N'EMail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchUserInfo', @level2type=N'COLUMN',@level2name=N'QQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详细地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchUserInfo', @level2type=N'COLUMN',@level2name=N'DwellingPlace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮编' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchUserInfo', @level2type=N'COLUMN',@level2name=N'PostalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁用状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchUserInfo', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报名地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchUserInfo', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收集日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameMatchUserInfo', @level2type=N'COLUMN',@level2name=N'CollectDate'


/****** 对象:  Table [GameRulesInfo]    脚本日期: 05/18/2011 16:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GameRulesInfo](
	[KindID] [int] NOT NULL,
	[KindName] [nvarchar](32) NOT NULL,
	[ImgRuleUrl] [nvarchar](512) NOT NULL,
	[HelpIntro] [nvarchar](4000) NOT NULL,
	[HelpRule] [nvarchar](max) NOT NULL,
	[HelpGrade] [nvarchar](4000) NOT NULL,
	[JoinIntro] [tinyint] NOT NULL CONSTRAINT [DF_GameRulesInfo_JoinIntro]  DEFAULT ((0)),
	[Nullity] [tinyint] NOT NULL CONSTRAINT [DF_GameRulesInfo_Nullity]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_GameRulesInfo_CollectDate]  DEFAULT (getdate()),
	[ModifyDate] [datetime] NOT NULL CONSTRAINT [DF_GameRulesInfo_ModifyDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_GameRulesInfo_1] PRIMARY KEY CLUSTERED 
(
	[KindID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRulesInfo', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRulesInfo', @level2type=N'COLUMN',@level2name=N'KindName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏截图' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRulesInfo', @level2type=N'COLUMN',@level2name=N'ImgRuleUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRulesInfo', @level2type=N'COLUMN',@level2name=N'HelpIntro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规则介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRulesInfo', @level2type=N'COLUMN',@level2name=N'HelpRule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRulesInfo', @level2type=N'COLUMN',@level2name=N'HelpGrade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'加入推荐' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRulesInfo', @level2type=N'COLUMN',@level2name=N'JoinIntro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'冻结' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRulesInfo', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新增日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRulesInfo', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRulesInfo', @level2type=N'COLUMN',@level2name=N'ModifyDate'
/****** 对象:  Table [MobileInfo]    脚本日期: 04/15/2011 16:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MobileInfo](
	[MobileID] [int] IDENTITY(1,1) NOT NULL,
	[MobileType] [nvarchar](20) NOT NULL,
	[MobileSerial] [nvarchar](15) NULL,
	[MobileModel] [nvarchar](30) NOT NULL,
	[Size] [nvarchar](15) NOT NULL CONSTRAINT [DF_MobileInfo_Size]  DEFAULT (N'5.2英寸'),
	[Resolution] [nchar](20) NOT NULL,
	[Screen] [nchar](10) NOT NULL,
	[OperatingSystem] [nvarchar](20) NOT NULL CONSTRAINT [DF_MobileInfo_OperatingSystem]  DEFAULT (N'Android'),
	[IsHorizontal] [tinyint] NOT NULL CONSTRAINT [DF_MobileInfo_IsHorizontal]  DEFAULT ((0)),
	[Remark] [nvarchar](250) NOT NULL CONSTRAINT [DF_MobileInfo_Remark]  DEFAULT (''),
	[DownloadUrl] [nvarchar](200) NULL,
 CONSTRAINT [PK_MobileInfo] PRIMARY KEY CLUSTERED 
(
	[MobileID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileInfo', @level2type=N'COLUMN',@level2name=N'MobileID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileInfo', @level2type=N'COLUMN',@level2name=N'MobileType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileInfo', @level2type=N'COLUMN',@level2name=N'MobileModel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'尺寸' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileInfo', @level2type=N'COLUMN',@level2name=N'Size'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分辨率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileInfo', @level2type=N'COLUMN',@level2name=N'Resolution'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'屏幕比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileInfo', @level2type=N'COLUMN',@level2name=N'Screen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作系统' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileInfo', @level2type=N'COLUMN',@level2name=N'OperatingSystem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否横屏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileInfo', @level2type=N'COLUMN',@level2name=N'IsHorizontal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileInfo', @level2type=N'COLUMN',@level2name=N'Remark'

/****** 对象:  Table [News]    脚本日期: 04/15/2011 16:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[PopID] [int] NOT NULL CONSTRAINT [DF_News_PopID]  DEFAULT ((0)),
	[Subject] [nvarchar](64) NOT NULL CONSTRAINT [DF_News_Subject]  DEFAULT (N''),
	[Subject1] [nvarchar](64) NOT NULL CONSTRAINT [DF_News_Subject1]  DEFAULT (N''),
	[OnTop] [tinyint] NOT NULL CONSTRAINT [DF_News_IsTop]  DEFAULT ((0)),
	[OnTopAll] [tinyint] NOT NULL CONSTRAINT [DF_News_IsTopAll]  DEFAULT ((0)),
	[IsElite] [tinyint] NOT NULL CONSTRAINT [DF_News_Elite]  DEFAULT ((0)),
	[IsHot] [tinyint] NOT NULL CONSTRAINT [DF_News_IsHot]  DEFAULT ((0)),
	[IsLock] [tinyint] NOT NULL CONSTRAINT [DF_News_IsLock]  DEFAULT ((1)),
	[IsDelete] [tinyint] NOT NULL CONSTRAINT [DF_News_IsDelete]  DEFAULT ((0)),
	[IsLinks] [tinyint] NOT NULL CONSTRAINT [DF_News_IsLinks]  DEFAULT ((0)),
	[LinkUrl] [nvarchar](256) NOT NULL CONSTRAINT [DF_News_LinkUrl]  DEFAULT (N''),
	[Body] [ntext] NOT NULL CONSTRAINT [DF_News_Body]  DEFAULT (''),
	[FormattedBody] [ntext] NOT NULL CONSTRAINT [DF_News_FormattedBody]  DEFAULT (N''),
	[HighLight] [varchar](512) NOT NULL CONSTRAINT [DF_News_SubjectColor]  DEFAULT (N''),
	[ClassID] [tinyint] NOT NULL CONSTRAINT [DF_News_Type]  DEFAULT ((1)),
	[UserID] [int] NOT NULL,
	[IssueIP] [nchar](15) NOT NULL CONSTRAINT [DF_News_IPAddress]  DEFAULT (N'000.000.000.000'),
	[LastModifyIP] [nchar](15) NOT NULL CONSTRAINT [DF_News_LastUpdateIP]  DEFAULT ('000.000.000.000'),
	[IssueDate] [datetime] NOT NULL CONSTRAINT [DF_News_IssueDate]  DEFAULT (getdate()),
	[LastModifyDate] [datetime] NOT NULL CONSTRAINT [DF_News_BullentinDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公告标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'NewsID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'弹出窗口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'PopID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻主标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'Subject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻副标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'Subject1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'置顶标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'OnTop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总置顶标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'OnTopAll'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'精华标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'IsElite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'热点标识 (0, 1　热点)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'IsHot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'锁定标识(0 锁定 1 发布)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'IsLock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'IsDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外部链接标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'IsLinks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外部链接地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'LinkUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公告内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'Body'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'带格式公告内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'FormattedBody'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'HighLight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻类别 (新闻 1; 公告 2)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布人标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'IssueIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'LastModifyIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'IssueDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'LastModifyDate'


/****** 对象:  Table [Notice]    脚本日期: 04/15/2011 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Notice](
	[NoticeID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](64) NOT NULL CONSTRAINT [DF_News_PoppuWin_PopTitle]  DEFAULT (N''),
	[IsLink] [tinyint] NOT NULL CONSTRAINT [DF_WebsiteNewsPopup_IsLink]  DEFAULT ((0)),
	[LinkUrl] [varchar](256) NOT NULL CONSTRAINT [DF_WebsiteNewsPopup_PopUrl]  DEFAULT (N''),
	[Body] [nvarchar](max) NOT NULL CONSTRAINT [DF_WebsiteNewsPopup_PopContent]  DEFAULT (N''),
	[Location] [varchar](128) NOT NULL CONSTRAINT [DF_News_PoppuWin_PopLocation]  DEFAULT (''),
	[Width] [int] NOT NULL CONSTRAINT [DF_News_PoppuWin_Width]  DEFAULT ((0)),
	[Height] [int] NOT NULL CONSTRAINT [DF_News_PoppuWin_Height]  DEFAULT ((0)),
	[StartDate] [datetime] NOT NULL CONSTRAINT [DF_WebsiteNewsPopup_StartDate]  DEFAULT (getdate()),
	[OverDate] [datetime] NOT NULL CONSTRAINT [DF_News_PoppuWin_OverDate]  DEFAULT (getdate()),
	[Nullity] [tinyint] NOT NULL CONSTRAINT [DF_News_PoppuWin_Nullity]  DEFAULT ((0)),
 CONSTRAINT [PK_News_PopWindows] PRIMARY KEY CLUSTERED 
(
	[NoticeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'窗口标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'NoticeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'窗口标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'Subject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外部链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'IsLink'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'窗口地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'LinkUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'窗口内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'Body'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'弹出位置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'Location'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'窗口宽度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'Width'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'窗口高度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'Height'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'OverDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'无效标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'Nullity'

