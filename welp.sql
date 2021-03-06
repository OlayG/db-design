USE [Welp]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 7/22/2016 5:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminBuisnessID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[AdminBuisnessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Businesses]    Script Date: 7/22/2016 5:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Businesses](
	[BusinessID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NOT NULL,
	[BusinessName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Businesses] PRIMARY KEY CLUSTERED 
(
	[BusinessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BusinessLocations]    Script Date: 7/22/2016 5:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessLocations](
	[BusinessAddressID] [int] IDENTITY(1,1) NOT NULL,
	[BuisnessID] [int] NOT NULL,
	[OwnersID] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PhoneNum] [nvarchar](50) NOT NULL,
	[HoursOfOperation] [nvarchar](50) NOT NULL,
	[MenuURL] [nvarchar](max) NULL,
 CONSTRAINT [PK_BusinessLocations] PRIMARY KEY CLUSTERED 
(
	[BusinessAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Owners]    Script Date: 7/22/2016 5:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owners](
	[OwnersID] [int] IDENTITY(1,1) NOT NULL,
	[AdminBuisnessID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_Owners] PRIMARY KEY CLUSTERED 
(
	[OwnersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 7/22/2016 5:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessAddressID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[TextReview] [nvarchar](250) NULL,
	[StarRatingID] [int] NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types]    Script Date: 7/22/2016 5:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/22/2016 5:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[UserEmail] [nvarchar](50) NOT NULL,
	[UserZipcode] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Businesses]  WITH CHECK ADD  CONSTRAINT [FK_Businesses_Types] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Types] ([TypeId])
GO
ALTER TABLE [dbo].[Businesses] CHECK CONSTRAINT [FK_Businesses_Types]
GO
ALTER TABLE [dbo].[BusinessLocations]  WITH CHECK ADD  CONSTRAINT [FK_BusinessLocations_Businesses] FOREIGN KEY([BuisnessID])
REFERENCES [dbo].[Businesses] ([BusinessID])
GO
ALTER TABLE [dbo].[BusinessLocations] CHECK CONSTRAINT [FK_BusinessLocations_Businesses]
GO
ALTER TABLE [dbo].[BusinessLocations]  WITH CHECK ADD  CONSTRAINT [FK_BusinessLocations_BusinessLocations] FOREIGN KEY([BusinessAddressID])
REFERENCES [dbo].[BusinessLocations] ([BusinessAddressID])
GO
ALTER TABLE [dbo].[BusinessLocations] CHECK CONSTRAINT [FK_BusinessLocations_BusinessLocations]
GO
ALTER TABLE [dbo].[BusinessLocations]  WITH CHECK ADD  CONSTRAINT [FK_BusinessLocations_Owners] FOREIGN KEY([OwnersID])
REFERENCES [dbo].[Owners] ([OwnersID])
GO
ALTER TABLE [dbo].[BusinessLocations] CHECK CONSTRAINT [FK_BusinessLocations_Owners]
GO
ALTER TABLE [dbo].[Owners]  WITH CHECK ADD  CONSTRAINT [FK_Owners_Admins] FOREIGN KEY([AdminBuisnessID])
REFERENCES [dbo].[Admins] ([AdminBuisnessID])
GO
ALTER TABLE [dbo].[Owners] CHECK CONSTRAINT [FK_Owners_Admins]
GO
ALTER TABLE [dbo].[Owners]  WITH CHECK ADD  CONSTRAINT [FK_Owners_Owners] FOREIGN KEY([OwnersID])
REFERENCES [dbo].[Owners] ([OwnersID])
GO
ALTER TABLE [dbo].[Owners] CHECK CONSTRAINT [FK_Owners_Owners]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_BusinessLocations] FOREIGN KEY([BusinessAddressID])
REFERENCES [dbo].[BusinessLocations] ([BusinessAddressID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_BusinessLocations]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Users]
GO
ALTER TABLE [dbo].[Types]  WITH CHECK ADD  CONSTRAINT [FK_Types_Types] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Types] ([TypeId])
GO
ALTER TABLE [dbo].[Types] CHECK CONSTRAINT [FK_Types_Types]
GO
