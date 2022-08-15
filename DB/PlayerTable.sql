IF OBJECT_ID(N'[dbo].[Players]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Players];
GO

CREATE TABLE [dbo].[Players] (
    [PlayerId] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [DateOfBirth] datetime  NOT NULL,
    [Gender] varchar(10)  NOT NULL,
    [Address] varchar(100)  NULL,
    [Email] nvarchar(255)  NULL,
    [PhoneNumber] varchar(10) NULL,
    [MedicalConditions] varchar(max)  NULL,
    [EmergencyContactNumber] varchar(10)  NULL,
    [EmergencyContactRelationship] varchar(25)  NULL,
    [Allergies] varchar(max)  NULL,
    [MedicalNotes] varchar(max)  NULL,
	[CountryOfBirth] varchar(50)  NULL,
	[ParentName] varchar(20)  NULL,
    [ParentEmail] nvarchar(255)  NULL,
    [ParentPhoneNumber] varchar(10)  NULL,
	[RoleId] int NOT NULL,
    [RegistrarEmail] nvarchar(255)  NOT NULL,
    [DateRegistered] datetime NOT NULL
);

--Creating primary key on Players table
ALTER TABLE [dbo].[Players]
ADD CONSTRAINT [PK_Players]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

--Creating foreign key on Players table
ALTER TABLE [dbo].[Players]
ADD CONSTRAINT [FK_Players_PlayerRoles_RoleId]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[PlayerRoles]
        ([RoleId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO
