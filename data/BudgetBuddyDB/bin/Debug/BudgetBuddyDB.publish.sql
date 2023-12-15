/*
Script de implantação para 68_dev

Este código foi gerado por uma ferramenta.
As alterações feitas nesse arquivo poderão causar comportamento incorreto e serão perdidas se
o código for gerado novamente.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "68_dev"
:setvar DefaultFilePrefix "68_dev"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detecta o modo SQLCMD e desabilita a execução do script se o modo SQLCMD não tiver suporte.
Para reabilitar o script após habilitar o modo SQLCMD, execute o comando a seguir:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'O modo SQLCMD deve ser habilitado para executar esse script com êxito.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE,
                DISABLE_BROKER 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'Criando Tipo de Tabela definido pelo usuário [dbo].[CompanyType]...';


GO
CREATE TYPE [dbo].[CompanyType] AS TABLE (
    [Name]    VARCHAR (255) NOT NULL,
    [Trading] VARCHAR (255) NULL,
    [CNPJ]    VARCHAR (15)  NOT NULL);


GO
PRINT N'Criando Tabela [dbo].[Company]...';


GO
CREATE TABLE [dbo].[Company] (
    [IdCompany]    INT           IDENTITY (1, 1) NOT NULL,
    [Name]         VARCHAR (255) NOT NULL,
    [Trading]      VARCHAR (255) NULL,
    [Document]     VARCHAR (15)  NOT NULL,
    [RegisterDate] DATETIME      NOT NULL,
    [Active]       BIT           NOT NULL,
    CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED ([IdCompany] ASC)
);


GO
PRINT N'Criando Procedimento [dbo].[DeleteCompanyByDocument]...';


GO
-- =============================================
-- Author:		Lucas AUGUSTO
-- =============================================
CREATE PROCEDURE DeleteCompanyByDocument 
	@Document VARCHAR(255)
AS
BEGIN
	UPDATE Company SET Active = 0
	WHERE Document = @Document
END
GO
PRINT N'Criando Procedimento [dbo].[ExistsCompanyDocument]...';


GO
-- =============================================
-- Author:		Lucas AUGUSTO
-- Create date: 2023-10-10
-- =============================================
CREATE PROCEDURE [dbo].[ExistsCompanyDocument]
	@Document varchar(15)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 1 FROM Company WITH(NOLOCK) WHERE Document = @Document
END
GO
PRINT N'Criando Procedimento [dbo].[GetCompanyByDocument]...';


GO
-- =============================================
-- Author:		Lucas AUGUSTO
-- Create date: 2023-10-12
-- =============================================
CREATE PROCEDURE [dbo].[GetCompanyByDocument]
	@Document VARCHAR(15)
AS
BEGIN
	SELECT * FROM Company WITH(NOLOCK)
	WHERE Active = 1
	AND
	Document = @Document
END
GO
PRINT N'Criando Procedimento [dbo].[InsCompany]...';


GO
-- =============================================
-- Author:		Lucas AUGUSTO
-- Create date: 2023-10-10
-- =============================================
CREATE PROCEDURE [dbo].[InsCompany]
	@IdCompany int
	, @Name varchar(255)
	, @Trading varchar(255)
	, @Document varchar(15)
AS
BEGIN
	IF (@IdCompany = 0)
	BEGIN
		INSERT INTO Company VALUES
		(
			@Name
			, @Trading
			, @Document
			, GETDATE()
			, 1
		)
	END	
	ELSE
	BEGIN
		UPDATE Company SET Name = @Name, Trading = @Trading, Document = @Document
		WHERE IdCompany = @IdCompany
	END
END
GO
PRINT N'Criando Procedimento [dbo].[ListAllCompany]...';


GO
-- =============================================
-- Author:		Lucas AUGUSTO
-- Create date: 2023-10-12
-- =============================================
CREATE PROCEDURE [dbo].[ListAllCompany]
	@PageNumber INT = 1,
	@RowsPerPage INT = NULL,
	@Name VARCHAR(255) = NULL,
	@Trading VARCHAR(255) = NULL,
	@RemainingPages INT = 0 OUTPUT,
	@TotalItems INT = 0 OUTPUT
AS
BEGIN
	SELECT 
		*
	INTO #Company
	FROM Company WITH(NOLOCK)
	WHERE Active = 1
	AND Name = ISNULL(@Name, Name)
	AND Trading = ISNULL(@Trading, Trading)

	IF @RowsPerPage IS NOT NULL
	BEGIN
		DECLARE @TotalRows INT;
		SELECT @TotalRows = COUNT(*) FROM #Company;
		SET @RemainingPages = CEILING((@TotalRows - COALESCE(@PageNumber,1) * @RowsPerPage) / CAST(@RowsPerPage AS FLOAT));
	END
	ELSE
	BEGIN
		SET @RemainingPages = 0
	END

	SELECT @TotalItems = COUNT(*) FROM #Company;

	SELECT * FROM #Company
	ORDER BY Document
	OFFSET (COALESCE(@PageNumber,1) - 1) * COALESCE(@RowsPerPage,0) ROWS
	FETCH NEXT COALESCE(@RowsPerPage,2147483647) ROWS ONLY;
	
END
GO
PRINT N'Atualização concluída.';


GO
