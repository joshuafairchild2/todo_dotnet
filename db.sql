USE [ToDoList]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/30/2017 2:50:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Items]    Script Date: 7/30/2017 2:50:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (1, N'Home')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2, N'Work')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (3, N'Personal')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([ItemId], [Description], [CategoryId]) VALUES (1, N'Mop the floor', 1)
INSERT [dbo].[Items] ([ItemId], [Description], [CategoryId]) VALUES (2, N'Find recipes', 1)
INSERT [dbo].[Items] ([ItemId], [Description], [CategoryId]) VALUES (3, N'Learn .NET', 2)
INSERT [dbo].[Items] ([ItemId], [Description], [CategoryId]) VALUES (5, N'Make to do list', 2)
INSERT [dbo].[Items] ([ItemId], [Description], [CategoryId]) VALUES (6, N'Write novel', 3)
INSERT [dbo].[Items] ([ItemId], [Description], [CategoryId]) VALUES (7, N'Learn to dance', 3)
SET IDENTITY_INSERT [dbo].[Items] OFF
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Categories]
GO
