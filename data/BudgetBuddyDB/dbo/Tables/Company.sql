CREATE TABLE [dbo].[Company] (
    [IdCompany]    INT           IDENTITY (1, 1) NOT NULL,
    [Name]         VARCHAR (255) NOT NULL,
    [Trading]      VARCHAR (255) NULL,
    [Document]     VARCHAR (15)  NOT NULL,
    [RegisterDate] DATETIME      NOT NULL,
    [Active]       BIT           NOT NULL,
    CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED ([IdCompany] ASC)
);

