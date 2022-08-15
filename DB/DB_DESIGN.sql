
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/08/2022 09:41:28
-- Generated from EDMX file: C:\Users\mikel\source\repos\RoryLinnane-Evolve\CascadersBasketballReg\CascadersBasketballRegAPI\DBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CascadersRegDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AspNetRoleClaims_AspNetRoles_RoleId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetRoleClaims] DROP CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserClaims_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserLogins_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetRoles_RoleId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserTokens_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserTokens] DROP CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AspNetRoleClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoleClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserTokens]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserTokens];
GO
IF OBJECT_ID(N'[dbo].[Players]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Players];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'C__EFMigrationsHistory'
CREATE TABLE [dbo].[C__EFMigrationsHistory] (
    [MigrationId] nvarchar(150)  NOT NULL,
    [ProductVersion] nvarchar(32)  NOT NULL
);
GO

-- Creating table 'AspNetRoleClaims'
CREATE TABLE [dbo].[AspNetRoleClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RoleId] nvarchar(450)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(450)  NOT NULL,
    [Name] nvarchar(256)  NULL,
    [NormalizedName] nvarchar(256)  NULL,
    [ConcurrencyStamp] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(450)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [ProviderDisplayName] nvarchar(max)  NULL,
    [UserId] nvarchar(450)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(450)  NOT NULL,
    [UserName] nvarchar(256)  NULL,
    [NormalizedUserName] nvarchar(256)  NULL,
    [Email] nvarchar(256)  NULL,
    [NormalizedEmail] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [ConcurrencyStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEnd] datetimeoffset  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL
);
GO

-- Creating table 'AspNetUserTokens'
CREATE TABLE [dbo].[AspNetUserTokens] (
    [UserId] nvarchar(450)  NOT NULL,
    [LoginProvider] nvarchar(128)  NOT NULL,
    [Name] nvarchar(128)  NOT NULL,
    [Value] nvarchar(max)  NULL
);
GO



-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO


--Creating table 'Players'
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

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [AspNetRoles_Id] nvarchar(450)  NOT NULL,
    [AspNetUsers_Id] nvarchar(450)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------


-- Creating primary key on [Id] in table 'AspNetRoleClaims'
ALTER TABLE [dbo].[AspNetRoleClaims]
ADD CONSTRAINT [PK_AspNetRoleClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [UserId], [LoginProvider], [Name] in table 'AspNetUserTokens'
ALTER TABLE [dbo].[AspNetUserTokens]
ADD CONSTRAINT [PK_AspNetUserTokens]
    PRIMARY KEY CLUSTERED ([UserId], [LoginProvider], [Name] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([AspNetRoles_Id], [AspNetUsers_Id] ASC);
GO

-- Creating primary key on [Id] in table 'Players'
ALTER TABLE [dbo].[Players]
ADD CONSTRAINT [PK_Players]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [RoleId] in table 'AspNetRoleClaims'
ALTER TABLE [dbo].[AspNetRoleClaims]
ADD CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetRoleClaims_AspNetRoles_RoleId'
CREATE INDEX [IX_FK_AspNetRoleClaims_AspNetRoles_RoleId]
ON [dbo].[AspNetRoleClaims]
    ([RoleId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserClaims_AspNetUsers_UserId'
CREATE INDEX [IX_FK_AspNetUserClaims_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserLogins_AspNetUsers_UserId'
CREATE INDEX [IX_FK_AspNetUserLogins_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserTokens'
ALTER TABLE [dbo].[AspNetUserTokens]
ADD CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRole]
    FOREIGN KEY ([AspNetRoles_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUser]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUser]
ON [dbo].[AspNetUserRoles]
    ([AspNetUsers_Id]);
GO

-- Creating foreign key on [RoleId] in table 'Players'
ALTER TABLE [dbo].[Players]
ADD CONSTRAINT [FK_Players_PlayerRoles_RoleId]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[PlayerRoles]
        ([RoleId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------