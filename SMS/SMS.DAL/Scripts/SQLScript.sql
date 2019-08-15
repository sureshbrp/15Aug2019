
/****** Object:  Table [dbo].[Users]    Script Date: 8/15/2019 2:15:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [nvarchar](400) NOT NULL,
	[RoleID] [int] NOT NULL,
	[IsLocked] [bit] NOT NULL,
	[CreatedByUserID] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ModifiedByUserID] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsLocked]  DEFAULT ((0)) FOR [IsLocked]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO


/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 8/15/2019 1:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[CreateUser] 
(
	@UserName varchar(50),
	@Password varchar(200),
	@RoleID int,
	@CreatedByUserID int
)
as

insert into Users(
					UserName, 
					Password, 
					RoleID, 
					CreatedByUserID, 
					CreatedOn
				)
values
				(
					@UserName,
					@Password,
					@RoleID,
					@CreatedByUserID,
					getdate()
				)
select UserID, UserName, RoleID from Users where UserName=@UserName

GO