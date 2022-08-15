SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditTrail](
	[AuditTrailId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[ClientId] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[DateTime] [datetime] NULL,
	[AuditCode] [int] NULL,
	[Annotation] [nvarchar](100) NULL,
 CONSTRAINT [PK_AuditTrail] PRIMARY KEY CLUSTERED 
(
	[AuditTrailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommsLog]    Script Date: 08/08/2022 10:35:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommsLog](
	[CommsLogId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[CommsDate] [datetime] NULL,
	[CommsStatusId] [int] NULL,
	[CommsType] [int] NULL,
	[CommsTo] [nvarchar](500) NULL,
	[CommsCopy] [nvarchar](500) NULL,
	[CommsContent] [nvarchar](4000) NULL,
 CONSTRAINT [PK_CommsLog] PRIMARY KEY CLUSTERED 
(
	[CommsLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 08/08/2022 10:35:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [int] NOT NULL,
	[CustomerId] [int] NULL,
	[Client] [int] NULL,
	[PaymentTypeId] [int] NULL,
	[PaymentDate] [datetime] NULL,
	[Amount] [money] NULL,
	[PaymentReference] [nvarchar](500) NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO