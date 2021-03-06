<cfoutput>
CREATE TABLE [dbo].[sp#variables.config.getPluginID()#_answers] (
	[id] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[questionidfk] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[answer] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[rank] [int] NOT NULL 
) ON [PRIMARY]

CREATE TABLE [dbo].[sp#variables.config.getPluginID()#_questions] (
	[id] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[surveyidfk] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[question] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[questiontypeidfk] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[rank] [int] NOT NULL ,
	[required] [bit] NOT NULL 
) ON [PRIMARY]

CREATE TABLE [dbo].[sp#variables.config.getPluginID()#_questiontypes] (
	[id] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[handlerroot] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]

CREATE TABLE [dbo].[sp#variables.config.getPluginID()#_results] (
	[owneridfk] [nvarchar] (320) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[questionidfk] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[answeridfk] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[truefalse] [bit] NULL ,
	[textbox] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[textboxmulti] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[other] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [itemidfk] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [dbo].[sp#variables.config.getPluginID()#_survey_emailaddresses] (
	[surveyidfk] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[emailaddress] [nvarchar] (320) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]

CREATE TABLE [dbo].[sp#variables.config.getPluginID()#_survey_results] (
	[surveyidfk] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ownerid] [nvarchar] (320) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[completed] [datetime] NOT NULL 
) ON [PRIMARY]

CREATE TABLE [dbo].[sp#variables.config.getPluginID()#_surveys] (
	[id] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[active] [bit] NOT NULL ,
	[datebegin] [datetime] NULL ,
	[dateend] [datetime] NULL ,
	[resultmailto] [nvarchar] (320) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[surveypassword] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[thankyoumsg] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [useridfk] [nvarchar] (35) NOT NULL,
  [templateidfk] [nvarchar] (35) default NULL,
  [allowembed] [bit] default NULL,
  [showinpubliclist] [bit] default NULL

) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [dbo].[sp#variables.config.getPluginID()#_templates] (
  [header] [ntext] NOT NULL,
  [id] [nvarchar] (35) NOT NULL,
  [footer] [ntext] NOT NULL,
  [useridfk] [nvarchar] (35) NOT NULL,
  [name] [nvarchar] (255) NOT NULL,
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [dbo].[sp#variables.config.getPluginID()#_users] (
	[username] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[password] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  	[isadmin] [bit] default NULL,
  	[id] [nvarchar] (35) default NULL
) ON [PRIMARY] 

;

ALTER TABLE [dbo].[sp#variables.config.getPluginID()#_templates] WITH NOCHECK ADD 
	CONSTRAINT [sp#variables.config.getPluginID()#_PK_templates] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 

ALTER TABLE [dbo].[sp#variables.config.getPluginID()#_answers] WITH NOCHECK ADD 
	CONSTRAINT [sp#variables.config.getPluginID()#_PK_answers] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 

ALTER TABLE [dbo].[sp#variables.config.getPluginID()#_questions] WITH NOCHECK ADD 
	CONSTRAINT [sp#variables.config.getPluginID()#_PK_questions] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 

ALTER TABLE [dbo].[sp#variables.config.getPluginID()#_surveys] WITH NOCHECK ADD 
	CONSTRAINT [sp#variables.config.getPluginID()#_PK_conferences] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 

INSERT sp#variables.config.getPluginID()#_questiontypes(id,name,handlerroot) VALUES('EB630C1D-D60E-C291-376C5DC8D421E540','True/False','truefalse')
INSERT sp#variables.config.getPluginID()#_questiontypes(id,name,handlerroot) VALUES('1208782D-D3B9-F6D4-969C76BE28A42B81','Yes/No','yesno')
INSERT sp#variables.config.getPluginID()#_questiontypes(id,name,handlerroot) VALUES('196A44E0-B9D4-AB9B-11975561F1F54D71','Multiple Choice (Single Selection)','multiplechoice')
INSERT sp#variables.config.getPluginID()#_questiontypes(id,name,handlerroot) VALUES('1E950757-C4F2-A935-A25143E9658EF0A4','Multiple Choice (Multi Selection)','multiplechoicemulti')
INSERT sp#variables.config.getPluginID()#_questiontypes(id,name,handlerroot) VALUES('1E9D2DE3-B675-8035-C217485FC0AB0504','Multiple Choice (Multi Selection) with Other','multiplechoicemultiother')
INSERT sp#variables.config.getPluginID()#_questiontypes(id,name,handlerroot) VALUES('1E9D6956-A402-C7A8-438A5980CB09D174','Multiple Choice (Single Selection) with Other','multiplechoiceother')
INSERT sp#variables.config.getPluginID()#_questiontypes(id,name,handlerroot) VALUES('1E9F94A2-F891-24EB-0B958132B3E90F4D','Text Box (Single)','textbox')
INSERT sp#variables.config.getPluginID()#_questiontypes(id,name,handlerroot) VALUES('1E9FBB54-F2D2-64FE-CC53AD6C2B7F32C2','Text Box (Multi)','textboxmulti')
INSERT sp#variables.config.getPluginID()#_questiontypes(id,name,handlerroot) VALUES('1EB9DDE1-C9C4-302C-3B98D7C3FEFD49E6','Matrix','matrix')
INSERT INTO sp#variables.config.getPluginID()#_users(username, password,isadmin,id)
  VALUES('admin', '21232F297A57A5A743894A0E4A801FC3',1,'7DFC0843-99A6-B280-667D443F86BC2FEA')

</cfoutput>